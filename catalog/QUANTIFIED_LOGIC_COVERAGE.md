# Quantified-logic coverage

The **Quantified** browsing family contains six records. The shared
**Quantified** tag supports searching; **First-order**, **Second-order**,
**Monadic**, **Henkin** and **LFI** distinguish their scopes.

| Record | Quantifier range | Selected convention |
| --- | --- | --- |
| FOL | Individuals | Classical first-order logic with identity and total functions |
| MSO | Individuals and all subsets of their domain | Full monadic second-order logic over arbitrary structures |
| SO | Individuals and all relations of each positive finite arity | Full relational second-order semantics |
| SOHenkin | Individuals and admissible relations | Same language as SO, with comprehension and choice closure |
| QmbC | Individuals | Equality-free quantified mbC, with legal swap valuations |
| QLFI1 | Individuals | Equality-free QLFI1-circle; deterministic three-valued structures |

All individual domains are nonempty. Domain sizes are unrestricted. No record is
limited to finite structures. MSO restricts **quantified relation variables** to
unary predicates; fixed vocabulary predicates can have any finite arity. In
particular this is not a monadic restriction on the first-order vocabulary.
MSO1/MSO2 graph encodings, weak MSO, arithmetic theories and higher type orders
are not separate entries in this addition.

SO uses all subsets of U^n for each relation arity n. SOHenkin uses admissible
collections G_n, closed under full impredicative comprehension with parameters
and satisfying the second-order choice schemata of the cited convention. Simply
choosing arbitrary nonempty collections is insufficient for this Henkin record.
SO has no effective sound and complete calculus for full validity in general.
SOHenkin admits complete calculi for its different semantics. Both encoded
presentations remain representative sketches.

Quantifiers are recorded as unary formula constructors with a bound-variable
parameter. Equality takes two **terms**, not two formulas. Second-order relation
application and arbitrary predicate/function arities are metasyntax documented
in each record. The compiler does not check sorts, free variables, capture-free
substitution, comprehension closure or inference-rule freshness conditions.

FOL, MSO and the SO records define local consequence for open formulas using
the same assignment for premises and conclusion. QmbC and QLFI1 follow their
source's **global** convention: every assignment satisfies each premise before
requiring every assignment to satisfy the conclusion. Their quantifier rules
therefore do not impose an additional freshness condition on all premises.
All these conventions agree with ordinary model consequence when restricted
to sentences. Graph links from propositional logics explicitly translate atoms
to fresh unary predicates at a fixed constant, avoiding an identification of
propositional consequence with unrestricted open-formula generalization.
The CPL → FOL edge is a conservative language expansion: adding first-order
resources preserves and reflects consequence in the identified propositional
fragment. It therefore participates in the graph's extension layers.

QLFI1 names the consistency-language QLFI1-circle formulation. Its truth values
0, 1/2 and 1 are separate from its individual domain U; 1/2 and 1 are designated.
Universal and existential quantifiers take infimum and supremum in the order
0 < 1/2 < 1. QLFI1 inherits QmbC's Hilbert presentation and adds five
propositional schemata and the two quantifier-negation dualities. Retaining the
inherited variants axiom is harmless; it is redundant in QLFI1. Standard equality
is a separate extension and is not silently included. QmbC's semantics block is
explicitly a sketch: substitution coherence and variant invariance from the
source are essential beyond the displayed first-coordinate equations.

Primary locators: the [Open Logic Text](https://builds.openlogicproject.org/open-logic-complete.pdf),
Chapters 15–16 and Definition 16.11; Väänänen's
[second-order logic entry](https://plato.stanford.edu/archives/sum2025/entries/logic-higher-order/),
full and Henkin semantics; the [MSO lecture notes](https://arxiv.org/abs/2301.10519),
Section 3 (a string specialization, not an unrestricted decidability claim); and
[Coniglio, Figallo-Orellano and Golzio](https://arxiv.org/abs/1912.10277v1),
Definitions 5.4, 6.9, 12.1, 12.9, 12.14 and Section 14. Catalog tests check
structure and regression boundaries; they do not prove the cited theorems.
