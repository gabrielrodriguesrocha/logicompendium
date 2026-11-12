"""Regression checks for sourced definitions and language scope in the catalog."""
import unittest
from pathlib import Path
from logicdsl import compile_file
from logicdsl.catalog import validate_catalog


class DynamicEpistemicTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(Path(__file__).parents[1] / "catalog/atlas.dsl")
        cls.records = {r["logic_id"]: r for r in cls.document["logics"]}

    def test_new_branches_are_valid_and_cited(self):
        self.assertEqual(validate_catalog(self.document), [])
        records = [r for r in self.records.values() if r["metadata"]["family"] in
                   {"Epistemic", "Doxastic", "Dynamic", "Dynamic epistemic"}]
        self.assertEqual(len(records), 18)
        for record in records:
            self.assertTrue(record["metadata"]["references"])
            self.assertNotIn("LFI", record["metadata"]["tags"])
        self.assertEqual(self.records["DEL"]["metadata"]["properties"]["record_kind"], "Family")
        self.assertEqual(self.records["DEL"]["presentations"], [])

    def test_group_knowledge_keeps_union_closure_and_intersection_distinct(self):
        clauses = {c["id"]: c["condition"] for c in
                   self.records["EpistemicCD"]["semantics"][0]["forcing"]}
        self.assertIn(r"(\bigcup_{i\in G}R_i)^*", clauses["common"])
        self.assertIn(r"\bigcap_{i\in G}R_i", clauses["distributed"])
        self.assertNotIn(r"\bigcup", clauses["distributed"])

    def test_dynamic_language_and_atomic_determinism_are_explicit(self):
        pdl = self.records["PDL"]
        self.assertIn("Two sorts", pdl["metadata"]["properties"]["program_syntax"])
        self.assertEqual(pdl["signature"]["program_box"], 1)
        schema = self.records["DPDL"]["presentations"][0]["axioms"][0]
        self.assertEqual(schema["formula"], r"\langle a\rangle\varphi\to[a]\varphi")
        self.assertIn("atomic a only", schema["desc"].lower())
        self.assertNotIn(r"\varphi?", self.records["TestFreePDL"]["metadata"]["properties"]["program_syntax"])

    def test_update_preconditions_and_action_models_are_qualified(self):
        pal = self.records["PAL"]
        clause = next(c["condition"] for c in pal["semantics"][0]["forcing"] if c["id"] == "announcement")
        self.assertIn(r"\Rightarrow", clause)
        self.assertEqual(pal["signature"]["announce"], 2)
        restrictions = " ".join(r["expression"] for r in self.records["EAL"]["semantics"][0]["restrictions"])
        self.assertIn("equivalence relation", restrictions)
        self.assertIn("no factual postconditions", restrictions)
        apal = self.records["APAL"]["metadata"]["properties"]
        self.assertIn("announcement-free", apal["quantifier_range"])
        self.assertIn("not over APAL", apal["quantifier_range"])

    def test_reductions_do_not_claim_equivalence_with_common_knowledge(self):
        classical_ids = {r["logic_id"] for r in self.document["logics"] if r["metadata"]["family"] == "Dynamic epistemic"}
        reductions = [r for r in self.document["relations"] if r["relation_type"] == "reduction" and r["parent"] in classical_ids]
        self.assertEqual({(r["parent"], r["child"]) for r in reductions},
                         {("PAL", "EpistemicS5"), ("EAL", "EpistemicS5")})
        for identifier in ["PDL", "CPDL", "DPDL", "PAL", "PALCommon", "EAL", "EALCommon", "APAL"]:
            self.assertEqual(self.records[identifier]["presentations"][0]["type"], "Sketch")


if __name__ == "__main__":
    unittest.main()
