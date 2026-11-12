# Description-logic coverage

The seed contains 17 description-logic records and one umbrella family record.
This is a curated constructor and ontology map, not an exhaustive DL taxonomy.
Definitions and relations cite primary literature and W3C specifications in
`atlas.dsl`. All entries are available in the map, catalog, comparison view and DSL
workspace through the **Description** family filter.

| Records | Available language features |
| --- | --- |
| FL0 | Top, intersection, universal restriction; no bottom in this convention |
| EL, ELBottom | Top, intersection, existential restriction; optionally bottom |
| ELPlusPlusObject | The 2005 EL++ fragment without concrete domains: bottom, nominals, role chains |
| ALC | Boolean concepts, existential and universal restrictions |
| ALCI, ALCO | ALC plus inverse roles or nominals, respectively |
| ALCN, ALCQ | Unqualified or qualified number restrictions |
| ALCQI | Qualified counting plus inverse roles; alias ALCIQ |
| DL_S, SH, SHI | ALC plus declared transitivity; then role hierarchies; then inverses |
| SHIQ | SHI plus qualified counting on simple roles |
| SHOIN | SHI plus nominals and unqualified counting on simple roles |
| SHOIQ | SHI plus nominals and qualified counting on simple roles |
| SROIQ | SHOIQ plus regular role chains, Self, universal role, and additional RBox/ABox forms |
| DLFamily | Description-logics umbrella, not a fixed calculus |

## Constructor and semantic conventions

Concepts denote subsets of a nonempty domain, roles denote binary relations, and
individuals denote domain elements. Models use open-world semantics without the
unique-name assumption. Nominals are singleton concepts; two different names need
not denote different elements. Number restrictions count distinct domain elements,
not names or assertions. Unqualified restrictions count all role successors;
qualified restrictions count only successors in the qualifier concept. A universal
restriction does not assert that any successor exists.

Signatures record constructor arities, with sorts and parameters documented in
metadata. Intersection has two concept arguments; existential and universal
restrictions have one concept argument and a role parameter. Inverse takes a role
argument. Qualified number restrictions have one concept argument, indexed by a
role and a nonnegative integer; unqualified restrictions have no concept argument.
Nominals, Self and the universal role have arity zero with their stated parameters.
These constructors render with LaTeX in the application.

The current DSL stores these typed grammars and semantic equations as strings;
it does not parse DL terms or enforce their sorts. Every individual record has
set-interpretation clauses for its constructors, general concept inclusion and
positive ABox assertions. RBox clauses appear only in records that support them.
Illustrative subsumption transitivity is a valid inference, not a complete
calculus. No sample ontology constraint is presented as a universally valid axiom.

## SROIQ and OWL

SROIQ includes regular complex role inclusions, nominals, inverse roles, qualified
counting, local reflexivity (Self), and the universal role. Its semantics also
records positive and negative role assertions, equality and inequality, role
inclusions, transitivity, reflexivity, irreflexivity, symmetry, asymmetry and
disjointness. These forms are subject to the cited global syntax restrictions.

The RBox must satisfy regularity, with only the permitted recursive chain forms.
Counting and Self require simple roles; irreflexivity, asymmetry and role
disjointness also require simple roles in the recorded convention. Non-simplicity
propagates from transitivity and nontrivial chains through inverses and inclusions.
The universal role is non-simple here, following OWL 2. The source definitions,
not the informal summary, specify the exact regularity and simplicity conditions.
The compiler does not check these conditions or perform ontology reasoning.

SROIQ is the object-logic foundation for OWL 2 DL, not an alias for the full OWL 2
language. Datatypes, keys and punning receive separate treatment in OWL 2. Likewise,
the datatype-free SHOIN record is not the complete OWL 1 DL language.

The EL++ record explicitly selects the object fragment of the 2005 paper. It
does not claim to cover concrete domains or every later language called EL++.
Its arbitrary role chains are not subject to SROIQ regularity, so the atlas does
not assert an unrestricted embedding of this whole fragment into SROIQ.

## Relations

**Language expansion** arrows identify available constructor and ontology syntax
inclusions, sometimes using explicit abbreviations. For example, ALCN counting is
translated into ALCQ using top as qualifier. S → SH adds the ability to state role
inclusions; it does not impose every role inclusion in every ontology. These
arrows therefore have their own label and style, distinct from extensions that
add valid axioms in a fixed language.

The links from modal K and multi-agent K to ALC describe local truth and concept
satisfiability with empty TBox, RBox and ABox. The multimodal comparison fixes a
role for each agent. General TBox inclusions constrain every domain element and
must not be identified with local modal consequence.

DL-Lite families, OWL profiles, datatype extensions and nonclassical description
logics remain future additions. Complexity annotations are omitted rather than
giving an unqualified bound without fixing the reasoning task and ontology form.
