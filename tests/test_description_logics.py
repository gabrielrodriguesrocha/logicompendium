"""Catalog regressions for DL language boundaries and structural restrictions."""
import unittest
from pathlib import Path

from logicdsl import compile_file
from logicdsl.catalog import validate_catalog


class DescriptionLogicTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(Path(__file__).parents[1] / "catalog/atlas.dsl")
        cls.records = {r["logic_id"]: r for r in cls.document["logics"]}

    def test_records_have_scope_and_provenance(self):
        self.assertEqual(validate_catalog(self.document), [])
        records = [r for r in self.records.values() if r["metadata"]["family"] == "Description"]
        self.assertEqual(len(records), 18)
        for record in records:
            self.assertTrue(record["metadata"]["references"])
            self.assertNotIn("LFI", record["metadata"]["tags"])
        self.assertEqual(self.records["DLFamily"]["metadata"]["properties"]["record_kind"], "Family")
        self.assertEqual(self.records["DLFamily"]["presentations"], [])

    def test_positive_and_universal_fragments_remain_distinct(self):
        el = self.records["EL"]["signature"]
        self.assertIn("role_exists", el)
        self.assertNotIn("role_forall", el)
        self.assertNotIn("concept_complement", el)
        self.assertNotIn("concept_bottom", el)
        self.assertEqual(set(self.records["ELBottom"]["signature"]) - set(el), {"concept_bottom"})
        fl = self.records["FL0"]["signature"]
        self.assertIn("role_forall", fl)
        self.assertNotIn("role_exists", fl)
        self.assertNotIn("concept_bottom", fl)

    def test_qualified_and_unqualified_counting_have_different_arities(self):
        unqualified = self.records["ALCN"]["signature"]
        qualified = self.records["ALCQ"]["signature"]
        self.assertEqual(unqualified["min_number"], 0)
        self.assertEqual(qualified["min_qualified"], 1)
        self.assertNotIn("min_qualified", unqualified)
        self.assertNotIn("nominal", self.records["SHIQ"]["signature"])
        self.assertIn("nominal", self.records["SHOIQ"]["signature"])
        self.assertIn("max_number", self.records["SHOIN"]["signature"])

    def test_sroiq_includes_structural_restrictions_and_set_semantics(self):
        record = self.records["SROIQ"]
        semantics = record["semantics"][0]
        restrictions = {r["id"]: r["expression"] for r in semantics["restrictions"]}
        self.assertIn("regular-role-hierarchy", restrictions["regularity"])
        for feature in ["Counting", "Self", "Irreflexive", "asymmetric", "disjoint"]:
            self.assertIn(feature, restrictions["simplicity"])
        self.assertIn("non-simple", restrictions["universal_role"])
        self.assertIn("does not decide", restrictions["compiler_scope"])
        clauses = {c["id"]: c["condition"] for c in semantics["forcing"]}
        self.assertIn(r"\cap", clauses["role_asymmetry"])
        self.assertIn(r"\varnothing", clauses["role_asymmetry"])
        self.assertIn("negative_role_assertion", clauses)
        self.assertIn(r"\in r^{\mathcal I}", clauses["self_restriction"])
        self.assertIn(r"\times", clauses["universal_role"])
        self.assertIn("not an alias", record["metadata"]["properties"]["owl_relationship"])

    def test_language_expansions_and_local_modal_embeddings_have_scope(self):
        relations = self.document["relations"]
        for pair in [("SHOIN", "SHOIQ"), ("SHOIQ", "SROIQ"), ("ALCN", "ALCQ")]:
            relation = next(r for r in relations if (r["parent"], r["child"]) == pair)
            self.assertEqual(relation["relation_type"], "language_extension")
        for parent in ["K", "EpistemicK"]:
            relation = next(r for r in relations if (r["parent"], r["child"]) == (parent, "ALC"))
            self.assertEqual(relation["relation_type"], "embedding")
            self.assertIn("local", relation["description"])
            self.assertIn("TBox", relation["description"])

    def test_el_plus_plus_variant_does_not_claim_unrestricted_sroiq_inclusion(self):
        record = self.records["ELPlusPlusObject"]
        self.assertIn("2005", record["metadata"]["description"])
        self.assertIn("omitted", record["metadata"]["properties"]["variant_scope"])
        self.assertFalse(any(r["parent"] == "ELPlusPlusObject" and r["child"] == "SROIQ"
                             for r in self.document["relations"]))
        self.assertNotIn("universal_role", record["signature"])


if __name__ == "__main__":
    unittest.main()
