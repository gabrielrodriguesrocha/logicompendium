from pathlib import Path
import unittest

from lark.exceptions import UnexpectedInput

from logicdsl import LogicCompiler, compile_dsl, compile_file


EXAMPLES = Path(__file__).parents[1] / "examples"


class LogicCompilerTests(unittest.TestCase):
    def setUp(self):
        self.compiler = LogicCompiler()

    def test_compiles_minimal_logic(self):
        result = self.compiler.compile(
            'logic Tiny { metadata { name = "Tiny" family = "Test" } signature {} }'
        )

        self.assertEqual(result["logics"][0]["logic_id"], "Tiny")
        self.assertEqual(result["logics"][0]["metadata"]["aliases"], [])
        self.assertEqual(result["relations"], [])

    def test_all_examples_compile(self):
        for path in sorted(EXAMPLES.glob("*.dsl")):
            with self.subTest(example=path.name):
                result = compile_file(path)
                self.assertGreaterEqual(len(result["logics"]), 1)

    def test_compiles_semantic_domain_and_operator_mappings(self):
        result = compile_file(EXAMPLES / "classical.dsl")
        semantics = result["logics"][0]["semantics"][0]

        self.assertEqual(semantics["domain"], ["false_value", "true_value"])
        self.assertEqual(semantics["designated"], ["true_value"])
        self.assertEqual(
            semantics["operator_mappings"][0]["mappings"][0],
            {"from": "false_value", "to": "true_value"},
        )

    def test_compiles_annotated_alias_and_theorem_fields(self):
        result = compile_file(EXAMPLES / "lfi.dsl")
        logic = result["logics"][0]
        theorem = logic["adequacy"][0]["theorems"][0]

        self.assertEqual(
            logic["metadata"]["aliases"][1],
            {"name": "LFI1", "author": "Carnielli, Marcos and de Amo", "year": 2000},
        )
        self.assertEqual(theorem["status"], "proven")
        self.assertEqual(result["relations"][0]["parent"], "ClassicalProp")

    def test_compiles_restrictions_forcing_and_boolean(self):
        result = compile_file(EXAMPLES / "modal_k.dsl")
        logic = result["logics"][0]
        semantics = logic["semantics"][0]
        theorem = logic["adequacy"][0]["theorems"][0]

        self.assertEqual(semantics["restrictions"][0]["id"], "arbitrary_frame")
        self.assertEqual(semantics["forcing"][0]["id"], "box_clause")
        self.assertIs(theorem["finitizable"], False)

    def test_comments_are_ignored(self):
        result = compile_dsl(
            '// document comment\n'
            'logic Tiny { metadata { name = "Tiny" family = "Test" } signature {} }'
        )

        self.assertEqual(result["logics"][0]["logic_id"], "Tiny")

    def test_invalid_source_raises_parse_error(self):
        with self.assertRaises(UnexpectedInput):
            self.compiler.compile('logic Broken { metadata { name = "Missing family" } }')


if __name__ == "__main__":
    unittest.main()
