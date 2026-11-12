"""Quantified-language, consequence and three-valued quantifier regressions."""
import itertools
from pathlib import Path
import unittest

from logicdsl import compile_file
from logicdsl.catalog import validate_catalog


class QuantifiedLogicTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = compile_file(Path(__file__).parents[1] / 'catalog/atlas.dsl')
        cls.records = {r['logic_id']: r for r in cls.document['logics']}

    def test_languages_keep_individual_set_and_relation_binders_distinct(self):
        self.assertEqual(validate_catalog(self.document), [])
        for identifier in ['FOL', 'SO', 'MSO', 'SOHenkin', 'QmbC', 'QLFI1']:
            record = self.records[identifier]
            self.assertEqual(record['metadata']['family'], 'Quantified')
            self.assertEqual(record['signature']['forall'], 1)
            self.assertEqual(record['signature']['exists'], 1)
            self.assertTrue(record['metadata']['references'])
            self.assertEqual('equals' in record['signature'], identifier not in ['QmbC', 'QLFI1'])
        self.assertNotIn('forall_relation', self.records['FOL']['signature'])
        self.assertNotIn('forall_relation', self.records['MSO']['signature'])
        self.assertIn('forall_set', self.records['MSO']['signature'])
        self.assertEqual(self.records['SO']['signature'], self.records['SOHenkin']['signature'])
        self.assertIn('Only second-order variables',
                      self.records['MSO']['metadata']['properties']['quantifier_range'])

    def test_full_and_henkin_semantics_are_not_conflated(self):
        full = self.records['SO']['semantics'][0]
        henkin = self.records['SOHenkin']['semantics'][0]
        full_clauses = {c['id']: c['condition'] for c in full['forcing']}
        henkin_clauses = {c['id']: c['condition'] for c in henkin['forcing']}
        self.assertIn(r'\mathcal P(U^n)', full_clauses['relation_universal'])
        self.assertIn('G_n', henkin_clauses['relation_universal'])
        self.assertNotIn(r'\mathcal P(U^n)', henkin_clauses['relation_universal'])
        restrictions = {r['id']: r['expression'] for r in henkin['restrictions']}
        self.assertIn('impredicative comprehension', restrictions['admissible_relations'])
        self.assertIn('choice', restrictions['admissible_relations'])
        relation = next(r for r in self.document['relations']
                        if (r['parent'], r['child']) == ('SOHenkin', 'SO'))
        self.assertEqual(relation['relation_type'], 'extension')
        self.assertEqual(self.records['SO']['presentations'][0]['type'], 'Sketch')

    def test_quantifier_rules_preserve_freshness_and_global_consequence_scope(self):
        for identifier in ['QmbC', 'QLFI1']:
            self.assertNotIn('equals', self.records[identifier]['signature'])
            self.assertIn('Global consequence', self.records[identifier]['metadata']['properties']['consequence_scope'])
        presentation = self.records['QmbC']['presentations'][0]
        self.assertEqual(presentation['extends']['logic_id'], 'mbC')
        rules = {r['id']: r for r in presentation['rules']}
        self.assertIn(r'x\notin\operatorname{FV}(B)', rules['exists_in']['premises'])
        self.assertIn(r'x\notin\operatorname{FV}(A)', rules['forall_in']['premises'])
        self.assertIn('free for x', presentation['axioms'][0]['desc'])
        qlfi = self.records['QLFI1']['presentations'][0]
        self.assertEqual(qlfi['extends']['logic_id'], 'QmbC')
        self.assertIn(r'\neg\forall x\,A\leftrightarrow\exists x\,\neg A',
                      [a['formula'] for a in qlfi['axioms']])
        semantics = self.records['QmbC']['semantics'][0]
        self.assertIn('Sketch', semantics['type'])
        self.assertIn('substitution coherence',
                      next(r['expression'] for r in semantics['restrictions'] if r['id'] == 'valuation_coherence'))

    def test_qlfi_matrix_supports_quantifier_duality_and_gentle_explosion(self):
        semantics = self.records['QLFI1']['semantics'][0]
        values = ['0', '1/2', '1']
        rank = {value: index for index, value in enumerate(values)}
        tables = {m['operator']: m['mappings'] for m in semantics['operator_mappings']}
        for op, table in tables.items():
            arity = self.records['QLFI1']['signature'][op]
            actual = {tuple(row['from']) if isinstance(row['from'], list) else (row['from'],)
                      for row in table}
            self.assertEqual(actual, set(itertools.product(values, repeat=arity)))
            self.assertEqual(len(table), 3 ** arity)
        neg = {row['from']: row['to'] for row in tables['not']}
        circle = {row['from']: row['to'] for row in tables['circle']}
        designated = set(semantics['designated'])
        conjunction = {tuple(row['from']): row['to'] for row in tables['and']}
        disjunction = {tuple(row['from']): row['to'] for row in tables['or']}
        # Every possible nonempty set of instance values can occur over a
        # nonempty domain. Min/max quantifiers must commute dually with negation.
        for size in range(1, 4):
            for instances in itertools.combinations(values, size):
                universal = min(instances, key=rank.get)
                existential = max(instances, key=rank.get)
                self.assertEqual(neg[universal], max(map(neg.get, instances), key=rank.get))
                self.assertEqual(neg[existential], min(map(neg.get, instances), key=rank.get))
                self.assertIn(disjunction[universal, neg[universal]], designated)
        for a, b in itertools.product(values, repeat=2):
            self.assertEqual(conjunction[a, b], min([a, b], key=rank.get))
            self.assertEqual(disjunction[a, b], max([a, b], key=rank.get))
            self.assertFalse(all(v in designated for v in [a, neg[a], circle[a]]))
        self.assertIn('1/2', designated)
        self.assertIn(neg['1/2'], designated)
        self.assertNotIn('0', designated)
        clauses = {c['id']: c['condition'] for c in semantics['forcing']}
        self.assertIn(r'\inf', clauses['universal'])
        self.assertIn(r'\sup', clauses['existential'])

    def test_propositional_links_use_closed_atom_translations(self):
        for parent, child in [('CPL', 'FOL'), ('mbC', 'QmbC'), ('LFI1', 'QLFI1')]:
            relation = next(r for r in self.document['relations']
                            if (r['parent'], r['child']) == (parent, child))
            expected_type = 'conservative_extension' if parent == 'CPL' else 'embedding'
            self.assertEqual(relation['relation_type'], expected_type)
            self.assertIn('constant', relation['description'])
        self.assertFalse(any(r['relation_type'] == 'equivalence'
                             and {r['parent'], r['child']} == {'FOL', 'SO'}
                             for r in self.document['relations']))


if __name__ == '__main__':
    unittest.main()
