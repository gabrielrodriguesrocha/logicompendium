from pathlib import Path
import re
import unittest

from logicdsl import compile_file
from logicdsl.catalog import validate_catalog

CATALOG = Path(__file__).parents[1] / "catalog" / "atlas.dsl"


class DaCostaHierarchyTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(CATALOG)
        cls.logics = {record["logic_id"]: record for record in cls.document["logics"]}

    def test_omega_is_not_an_lfi_or_a_finite_family_instance(self):
        omega = self.logics["Comega"]
        self.assertIn("C_omega", omega["metadata"]["aliases"])
        self.assertNotIn("LFI", omega["metadata"]["tags"])
        self.assertEqual(omega["metadata"]["properties"]["lfi"], "No")
        ids = {axiom["id"] for axiom in omega["presentations"][0]["axioms"]}
        self.assertEqual(ids, {f"Ax{i}" for i in range(1, 9)} | {"Ax10", "cf"})
        self.assertNotIn("circle", omega["signature"])
        self.assertFalse(any(r["parent"] == "Cn" and r["child"] == "Comega" for r in self.document["relations"]))

    def test_cmin_adds_classical_positivity_to_omega(self):
        presentation = self.logics["Cmin"]["presentations"][0]
        self.assertEqual(presentation["extends"], {"logic_id": "Comega", "presentation_name": "Hilbert"})
        self.assertEqual([a["id"] for a in presentation["axioms"]], ["Ax9"])
        self.assertTrue(any(r["parent"] == "Comega" and r["child"] == "Cmin" and r["relation_type"] == "extension" for r in self.document["relations"]))

    def test_only_one_record_represents_all_positive_finite_parameters(self):
        self.assertEqual(validate_catalog(self.document), [])
        self.assertFalse(any(re.fullmatch(r"C\d+", identifier) for identifier in self.logics))
        record = self.logics["Cn"]
        properties = record["metadata"]["properties"]
        self.assertEqual(properties["record_kind"], "Family")
        self.assertIn("finite integer >= 1", properties["parameter"])
        self.assertIn("omega is excluded", properties["parameter"])
        self.assertIn(r"C_{n+1}\subsetneq C_n", properties["hierarchy_order"])
        self.assertIn(r"\bigwedge_{k=1}^{n}A^k", properties["consistency"])
        self.assertNotIn("circle", record["signature"])

    def test_family_presentation_keeps_n_as_a_fixed_schema_parameter(self):
        presentation = self.logics["Cn"]["presentations"][0]
        self.assertEqual(presentation["extends"], {"logic_id": "Cmin", "presentation_name": "Hilbert"})
        self.assertEqual({a["id"] for a in presentation["axioms"]}, {"bc_n", "ca_n_1", "ca_n_2", "ca_n_3"})
        for axiom in presentation["axioms"]:
            self.assertIn(r"\operatorname{Cons}_n", axiom["formula"])
        self.assertTrue(any(r["parent"] == "Cmin" and r["child"] == "Cn" and r["relation_type"] == "family_extension" for r in self.document["relations"]))

    def test_n_one_extensions_are_scoped_and_keep_fixed_presentations(self):
        relations = [r for r in self.document["relations"] if r["parent"] == "Cn"]
        self.assertEqual({r["child"] for r in relations}, {"Cila", "C1Plus"})
        for relation in relations:
            self.assertEqual(relation["relation_type"], "parameter_case")
            self.assertIn("n = 1 only", relation["description"])
        plus = self.logics["C1Plus"]["presentations"][0]
        self.assertEqual(plus["extends"], {"logic_id": "Cmin", "presentation_name": "Hilbert"})
        self.assertEqual({a["id"] for a in plus["axioms"]}, {"bc1", "ca1", "ca2", "ca3", "co1", "co2", "co3"})
        self.assertFalse(any(r["parent"] == r["child"] == "Cn" for r in self.document["relations"]))


if __name__ == "__main__":
    unittest.main()
