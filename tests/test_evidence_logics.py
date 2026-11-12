"""Regression checks for evidence-logical language and matrix boundaries."""
import itertools
from pathlib import Path
import unittest

from logicdsl import compile_file
from logicdsl.catalog import validate_catalog


class EvidenceLogicTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(Path(__file__).parents[1] / 'catalog/atlas.dsl')
        cls.records = {r['logic_id']: r for r in cls.document['logics']}

    def test_fde_matrix_preserves_independent_positive_and_negative_evidence(self):
        semantics = self.records['FDE']['semantics'][0]
        tables = {m['operator']: m['mappings'] for m in semantics['operator_mappings']}
        states = {'T': (1, 0), 'F': (0, 1), 'B': (1, 1), 'N': (0, 0)}
        self.assertEqual(set(semantics['domain']), set(states))
        self.assertEqual(set(semantics['designated']), {'T', 'B'})
        for op, table in tables.items():
            arity = self.records['FDE']['signature'][op]
            inputs = {tuple(row['from']) if isinstance(row['from'], list) else (row['from'],)
                      for row in table}
            self.assertEqual(inputs, set(itertools.product(states, repeat=arity)))
            self.assertEqual(len(table), 4 ** arity)
            for row in table:
                args = row['from'] if isinstance(row['from'], list) else [row['from']]
                positive, negative = zip(*(states[value] for value in args))
                expected = ((negative[0], positive[0]) if op == 'not' else
                            (all(positive), any(negative)) if op == 'and' else
                            (any(positive), all(negative)))
                self.assertEqual(states[row['to']], expected)
        negation = {row['from']: row['to'] for row in tables['not']}
        disjunction = {tuple(row['from']): row['to'] for row in tables['or']}
        # Missing evidence refutes excluded middle; conflicting evidence permits
        # designated contradictory premises alongside an undesignated conclusion.
        self.assertNotIn(disjunction['N', negation['N']], semantics['designated'])
        self.assertIn('B', semantics['designated'])
        self.assertIn(negation['B'], semantics['designated'])
        self.assertNotIn('F', semantics['designated'])

    def test_let_languages_and_filter_membership_remain_distinct(self):
        self.assertEqual(validate_catalog(self.document), [])
        base = {'not', 'and', 'or'}
        for identifier, extra in [('BLE', {'implies'}), ('LET_J', {'implies', 'circle'}),
                                  ('LET_F', {'circle', 'bullet'})]:
            record = self.records[identifier]
            self.assertEqual(set(record['signature']), base | extra)
            self.assertIn('Evidence', record['metadata']['tags'])
            self.assertTrue(record['metadata']['references'])
            self.assertEqual('LFI' in record['metadata']['tags'], identifier != 'BLE')
        self.assertNotIn('LFI', self.records['FDE']['metadata']['tags'])
        self.assertIn('N4', self.records['BLE']['metadata']['aliases'])
        self.assertIn(r'\neg\circ A', self.records['LET_F']['metadata']['properties']['variant_scope'])

    def test_bivaluations_keep_global_implication_and_one_way_classicality(self):
        for identifier in ['BLE', 'LET_J', 'LET_F']:
            semantics = self.records[identifier]['semantics'][0]
            self.assertEqual(semantics['type'], 'NonTruthFunctionalBivaluations')
            self.assertEqual(semantics['operator_mappings'], [])
            clauses = {r['id']: r['expression'] for r in semantics['restrictions']}
            self.assertEqual('valuation_condition' in clauses, identifier != 'LET_F')
            if identifier != 'BLE':
                self.assertIn('converse is not required', clauses['classicality'])
            if identifier == 'LET_F':
                self.assertEqual(clauses['non_classicality'],
                                 'v(bullet A) = 1 iff v(circle A) = 0')
        presentation = self.records['LET_J']['presentations'][0]
        self.assertEqual(presentation['extends']['logic_id'], 'BLE')
        self.assertEqual(presentation['type'], 'Sketch')

    def test_relationships_state_language_scope_without_equating_lets(self):
        evidence_ids = {'FDE', 'BLE', 'LET_J', 'LET_F'}
        relations = [r for r in self.document['relations']
                     if r['parent'] in evidence_ids and r['child'] in evidence_ids]
        self.assertEqual({(r['parent'], r['child']) for r in relations},
                         {('FDE', 'BLE'), ('FDE', 'LET_F'), ('BLE', 'LET_J')})
        for relation in relations:
            self.assertEqual(relation['relation_type'], 'conservative_extension')
            self.assertTrue(relation['references'])
            self.assertTrue(relation['description'])


if __name__ == '__main__':
    unittest.main()
