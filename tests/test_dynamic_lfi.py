"""Source-based regressions for the three-valued dynamic LFI1 branch."""
from pathlib import Path
import unittest

from logicdsl import compile_file
from logicdsl.catalog import validate_catalog


class DynamicLFI1Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(Path(__file__).parents[1] / "catalog" / "atlas.dsl")
        cls.records = {r["logic_id"]: r for r in cls.document["logics"]}
        cls.ids = {"KLFI1", "KB4LFI1", "S5LFI1", "PALFI1", "AMLFI1", "AMLFI1K",
                   "AMLFI1KB4", "UMLFI1", "UMLFI1K", "UMLFI1KB4"}
        cls.tables = {
            table["operator"]: {tuple(row["from"]) if isinstance(row["from"], list) else row["from"]: row["to"]
                                for row in table["mappings"]}
            for table in cls.records["KLFI1"]["semantics"][0]["operator_mappings"]
        }

    def test_records_are_distinct_cited_lfi_members(self):
        self.assertEqual(validate_catalog(self.document), [])
        self.assertTrue(self.ids.issubset(self.records))
        for identifier in self.ids:
            record = self.records[identifier]
            self.assertIn("LFI", record["metadata"]["tags"])
            self.assertIn("lfi_dynamic_turn", record["metadata"]["references"])
            self.assertEqual(record["semantics"][0]["designated"], ["1/2", "1"])
        self.assertIn("lfi_imperfect_reasoning", self.records["PALFI1"]["metadata"]["references"])

    def test_nonclassical_modal_base_keeps_extra_and_dual_axioms(self):
        axioms = lambda id: {a["id"] for a in self.records[id]["presentations"][0]["axioms"]}
        self.assertEqual(axioms("KLFI1"), {"bullet_definition", "K", "K1", "K2", "K3"})
        self.assertEqual(axioms("KB4LFI1"), {"B", "B_dual", "four", "four_dual"})
        self.assertEqual(axioms("S5LFI1"), {"T", "T_dual", "four", "four_dual", "five", "five_dual"})
        self.assertEqual(self.records["KLFI1"]["presentations"][0]["extends"]["logic_id"], "LFI1")

    def test_strong_equivalence_is_value_equality_not_just_designation(self):
        conjunction = lambda a, b: self.tables["and"][(a, b)]
        implication = lambda a, b: self.tables["implies"][(a, b)]
        equivalence = lambda a, b: conjunction(implication(a, b), implication(b, a))
        strong = lambda a, b: conjunction(equivalence(a, b), equivalence(self.tables["not"][a], self.tables["not"][b]))
        for a in ("0", "1/2", "1"):
            for b in ("0", "1/2", "1"):
                self.assertEqual(strong(a, b) in {"1/2", "1"}, a == b)
            self.assertEqual(self.tables["bullet"][a], self.tables["not"][self.tables["circle"][a]])
        self.assertIn(equivalence("1", "1/2"), {"1/2", "1"})
        self.assertEqual(strong("1", "1/2"), "0")

    def test_bullet_announcement_and_vacuity_use_both_designated_values(self):
        for pre in ("0", "1/2", "1"):
            for atom in ("0", "1/2", "1"):
                update = lambda value: value if pre in {"1/2", "1"} else "1"
                left = update(self.tables["bullet"][atom])
                right = self.tables["implies"][(pre, self.tables["bullet"][update(atom)])]
                self.assertEqual(left, right)
        forcing = {f["id"]: f["condition"] for f in self.records["PALFI1"]["semantics"][0]["forcing"]}
        self.assertIn(r"\in D", forcing["announcement_domain"])
        self.assertIn(r"\vartheta_w(\alpha)=0", forcing["announcement_box"])

    def test_factual_updates_replace_rather_than_inherit_atom_preservation(self):
        for suffix, static in [("", "S5LFI1"), ("K", "KLFI1"), ("KB4", "KB4LFI1")]:
            am = self.records["AMLFI1" + suffix]["presentations"][0]
            um = self.records["UMLFI1" + suffix]["presentations"][0]
            self.assertEqual(am["extends"]["logic_id"], static)
            self.assertEqual(um["extends"]["logic_id"], static)
            self.assertEqual({a["id"] for a in am["axioms"]}, {"AM1", "AM2", "AM3", "AM4", "AM5"})
            self.assertEqual({a["id"] for a in um["axioms"]}, {"UM1", "AM2", "AM3", "AM4", "AM5"})
            um1 = next(a for a in um["axioms"] if a["id"] == "UM1")
            self.assertIn(r"\operatorname{post}(e)(p)", um1["formula"])
        # A successful update setting p false cannot satisfy the old AM1 equation
        # when p previously had the contradictory value.
        self.assertNotEqual(self.tables["implies"][("1", "0")], self.tables["implies"][("1", "1/2")])

    def test_one_public_logic_has_re_and_composition_presentations(self):
        self.assertNotIn("PALFI1C", self.records)
        public = self.records["PALFI1"]
        self.assertIn("PALFI1C", public["metadata"]["aliases"])
        self.assertEqual(len(public["presentations"]), 2)
        re_presentation, composition = public["presentations"]
        self.assertEqual({a["id"] for a in re_presentation["axioms"]}, {"PA1", "PA2", "PA3", "PA4", "PA5"})
        self.assertEqual([r["id"] for r in re_presentation["rules"]], ["RE"])
        self.assertIn("PA_composition", {a["id"] for a in composition["axioms"]})
        self.assertEqual(composition["rules"], [])
        self.assertIn("reconstructed", public["metadata"]["properties"]["presentation_provenance"])

    def test_replacement_and_necessitation_remain_theorem_level(self):
        for identifier in self.ids:
            for presentation in self.records[identifier]["presentations"]:
                for rule in presentation["rules"]:
                    self.assertIn(rule["id"], {"Nec", "RE"})
                    self.assertTrue(all(p.startswith(r"\vdash") for p in rule["premises"]))
                    self.assertTrue(rule["conclusion"].startswith(r"\vdash"))
                for axiom in presentation["axioms"]:
                    if axiom["id"].startswith(("AM", "UM", "PA")):
                        self.assertIn(r"\equiv", axiom["formula"])

    def test_frame_variants_and_identity_postcondition_embeddings_are_scoped(self):
        relations = self.document["relations"]
        for suffix in ("", "K", "KB4"):
            am, um = "AMLFI1" + suffix, "UMLFI1" + suffix
            self.assertEqual(self.records[am]["metadata"]["properties"]["frames"], self.records[um]["metadata"]["properties"]["frames"])
            embedding = next(r for r in relations if (r["parent"], r["child"]) == (am, um))
            self.assertEqual(embedding["relation_type"], "embedding")
            self.assertIn("identity postconditions", embedding["description"])
        self.assertFalse(any(r["parent"] == "PAL" and r["child"] == "PALFI1" and r["relation_type"] == "equivalence" for r in relations))


if __name__ == "__main__":
    unittest.main()
