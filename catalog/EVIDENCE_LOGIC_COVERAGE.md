# Evidence and truth coverage

The **Evidence** tag groups FDE, BLE, LET_J and LET_F. FDE retains its
**Many-valued** browsing family; the other three use **Paraconsistent**.
Only LET_J and LET_F carry the **LET**, **LFI** and **LFU** tags. BLE and FDE
provide their evidence-preserving bases without a classicality operator.

| Record | Primitive connectives | Scope |
| --- | --- | --- |
| FDE | Negation, conjunction, disjunction | Full four-valued matrix; independent positive and negative evidence |
| BLE | FDE language plus implication | Basic logic of evidence, equivalent to Nelson's N4; constructive implication |
| LET_J | BLE language plus circle | Classicality restores explosion and excluded middle for its argument |
| LET_F | FDE language plus circle and bullet | Original classicality/non-classicality language without implication |

FDE's values T, F, B and N correspond to evidence pairs (1,0), (0,1), (1,1)
and (0,0). T and B are designated. The new entries instead encode
non-truth-functional bivaluations: 0/1 express absence/presence of evidence.
They are not classical two-valued truth tables. BLE and LET_J retain the global
valuation condition for constructive implication from Definitions 2–3 of
Carnielli and Rodrigues, in addition to the local clauses.

Classicality is one-way: circle A requires exactly one of A and its negation to
hold, but that condition alone does not establish circle A. In the selected
LET_F formulation, bullet A is complementary to circle A at the valuation level.
It is **not** an abbreviation for negated circle A. The circle-only presentation
in the [2024 normalization paper](https://arxiv.org/html/2405.20932v1)
adds conditions on negated classicality formulas;
this catalog does not merge that presentation with the original bullet language.

The graph records conservative expansions FDE → BLE, BLE → LET_J and
FDE → LET_F, each with its language scope and references. No direct strength or
equivalence edge between LET_J and LET_F is asserted. Representative inference
rules are explicitly sketches, not complete natural deduction calculi; in
particular the DSL does not implement assumption discharge or proof search.

Definitions cite [Carnielli and Rodrigues (2017)](https://doi.org/10.1007/s11229-017-1621-7),
Sections 3–4 (online-first year; journal volume appeared in 2019), and
[Rodrigues, Bueno-Soler and Carnielli (2020)](https://doi.org/10.1007/s11229-020-02571-w)
(online-first year). LET_F's precise language and valuation clauses also cite
[Carnielli, Frade and Rodrigues (2024)](https://arxiv.org/abs/2412.10588v1),
Section 2, Definitions 1–2. The latter's Example 3 explains why bullet cannot be
identified with negated circle. Catalog checks validate structure and regression
boundaries; they do not prove the cited mathematical results.
