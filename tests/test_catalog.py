import copy
import unittest
from pathlib import Path

from logicdsl import compile_dsl, compile_file
from logicdsl.catalog import validate_catalog

CATALOG = Path(__file__).parents[1] / "catalog" / "atlas.dsl"


class CatalogTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(CATALOG)

    def test_seed_is_valid_and_equivalence_has_scope_and_provenance(self):
        self.assertEqual(validate_catalog(self.document), [])
        relation = next(r for r in self.document["relations"] if r["relation_type"] == "equivalence")
        self.assertEqual((relation["parent"], relation["child"]), ("J3", "LFI1"))
        self.assertIn("language", relation["description"])
        self.assertTrue(relation["references"])

    def test_compiles_empty_arrays_without_null_placeholders(self):
        document = compile_dsl('''logic Empty {
            metadata { name = "Empty" family = "Test" aliases = [] tags = [] references = [] }
            signature {}
            presentation "Empty" { type = "Test" rule unit { premise = [] conclusion = "A" } }
            semantics "Empty" { type = "Test" domain = [] designated = [] }
        }''')
        logic = document["logics"][0]
        for field in ("aliases", "tags", "references"):
            self.assertEqual(logic["metadata"][field], [])
        self.assertEqual(logic["semantics"][0]["domain"], [])
        self.assertEqual(logic["semantics"][0]["designated"], [])
        self.assertEqual(logic["presentations"][0]["rules"][0]["premises"], [])

    def test_compiles_properties_authors_and_sources(self):
        logic = next(l for l in self.document["logics"] if l["logic_id"] == "J3")
        self.assertEqual(logic["metadata"]["year"], 1970)
        self.assertEqual(logic["metadata"]["properties"]["explosion"], "Not valid")
        self.assertEqual(len(logic["metadata"]["authors"]), 2)
        self.assertTrue(all(source["url"].startswith("https://") for source in self.document["sources"]))

    def test_rejects_duplicate_ids_and_dangling_relations(self):
        document = copy.deepcopy(self.document)
        document["logics"].append(document["logics"][0])
        document["relations"][0]["child"] = "Missing"
        errors = validate_catalog(document)
        self.assertIn("Duplicate logic identifier: CPL", errors)
        self.assertTrue(any("unknown logic Missing" in error for error in errors))

    def test_rejects_dangling_sources_and_invalid_designation(self):
        document = copy.deepcopy(self.document)
        document["logics"][0]["metadata"]["references"] = ["Missing"]
        document["logics"][0]["semantics"][0]["designated"] = ["Missing"]
        errors = validate_catalog(document)
        self.assertTrue(any("unknown source Missing" in error for error in errors))
        self.assertTrue(any("designated values" in error for error in errors))

    def test_rejects_unresolved_adequacy_and_undeclared_operator(self):
        document = compile_file(Path(__file__).parents[1] / "examples" / "classical.dsl")
        document["logics"][0]["adequacy"][0]["syntax_reference"] = "Missing"
        document["logics"][0]["signature"].pop("not")
        errors = validate_catalog(document)
        self.assertTrue(any("unresolved syntax_reference" in error for error in errors))
        self.assertTrue(any("undeclared operator not" in error for error in errors))


if __name__ == "__main__":
    unittest.main()
