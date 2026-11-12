import copy
import math
from pathlib import Path
import unittest

from logicdsl import compile_file
from logicdsl.catalog import validate_catalog


class LFITaxonomyTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(Path(__file__).parents[1] / "catalog" / "atlas.dsl")
        cls.logics = {logic["logic_id"]: logic for logic in cls.document["logics"]}

    def effective_axioms(self, logic_id):
        presentation = self.logics[logic_id]["presentations"][0]
        def resolve(p):
            base = p.get("extends")
            inherited = []
            if base:
                ancestor = next(p for p in self.logics[base["logic_id"]]["presentations"] if p["presentation_name"] == base["presentation_name"])
                inherited = resolve(ancestor)
            return inherited + p["axioms"]
        return {axiom["id"]: axiom["formula"] for axiom in resolve(presentation)}

    def test_core_definitions_and_alias_are_distinct(self):
        self.assertEqual(validate_catalog(self.document), [])
        self.assertIn("Ciw", self.logics["mbCciw"]["metadata"]["aliases"])
        base = self.effective_axioms("mbC")
        self.assertEqual(len(base), 11)
        self.assertEqual(set(self.effective_axioms("Ci")), set(base) | {"ci", "cf"})
        self.assertEqual(set(self.effective_axioms("mCi")), set(base) | {"ci", "ccn"})
        self.assertEqual(set(self.effective_axioms("Cila")), set(base) | {"ci", "cf", "cl", "ca1", "ca2", "ca3"})
        self.assertEqual(set(self.effective_axioms("LFI1")), set(base) | {"ci", "cf", "ce", "cj1", "cj2", "cj3"})
        self.assertNotIn("Cila", self.logics["LFI1"]["metadata"]["aliases"])

    def test_historical_language_relationship_is_conservative(self):
        self.assertNotIn("circle", self.logics["Cn"]["signature"])
        self.assertIn("circle", self.logics["Cila"]["signature"])
        relations = [r for r in self.document["relations"] if r["parent"] == "Cn" and r["child"] == "Cila"]
        self.assertEqual([r["relation_type"] for r in relations], ["parameter_case"])
        self.assertIn("n = 1 only", relations[0]["description"])
        self.assertIn("conservatively", relations[0]["description"])
        self.assertNotIn("LFI", self.logics["Cmin"]["metadata"]["tags"])

    def test_family_parameters_cover_exactly_8192_matrices(self):
        family = self.logics["EightKb"]
        self.assertEqual(family["metadata"]["properties"]["record_kind"], "Family")
        semantic = family["semantics"][0]
        self.assertEqual(semantic["type"], "ParameterizedMatrices")
        choices = []
        for operator in semantic["operator_mappings"]:
            arity = family["signature"][operator["operator"]]
            self.assertEqual(len(operator["mappings"]), 3 ** arity)
            for pair in operator["mappings"]:
                inputs = pair["from"] if isinstance(pair["from"], list) else [pair["from"]]
                self.assertEqual(len(inputs), arity)
                self.assertTrue(all(value in semantic["domain"] for value in inputs))
                outputs = pair["to"] if isinstance(pair["to"], list) else [pair["to"]]
                self.assertTrue(all(value in semantic["domain"] for value in outputs))
                choices.append(len(outputs))
        self.assertEqual(math.prod(choices), 8192)

    def test_global_replacement_keeps_theorem_premises(self):
        presentation = self.logics["RmbC"]["presentations"][0]
        self.assertEqual(presentation["type"], "HilbertWithGlobalRules")
        self.assertEqual(len(presentation["rules"]), 2)
        for rule in presentation["rules"]:
            self.assertTrue(rule["premises"][0].startswith("\\vdash"))
            self.assertTrue(rule["conclusion"].startswith("\\vdash"))

    def test_unknown_and_cyclic_inheritance_are_rejected(self):
        document = copy.deepcopy(self.document)
        target = next(l for l in document["logics"] if l["logic_id"] == "mbCciw")
        target["presentations"][0]["extends"]["presentation_name"] = "Missing"
        self.assertTrue(any("unresolved base presentation" in error for error in validate_catalog(document)))
        target["presentations"][0]["extends"] = {"logic_id": "mbCciw", "presentation_name": "Hilbert"}
        self.assertTrue(any("cyclic presentation inheritance" in error for error in validate_catalog(document)))

    def test_inherited_signature_cannot_silently_drop_consistency(self):
        document = copy.deepcopy(self.document)
        target = next(l for l in document["logics"] if l["logic_id"] == "Ci")
        del target["signature"]["circle"]
        self.assertTrue(any("inherited signature is incompatible" in error for error in validate_catalog(document)))


if __name__ == "__main__":
    unittest.main()
