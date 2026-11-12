# LFI coverage and conventions

The catalog currently contains **43 individual LFI records**, plus two explicitly marked **family records**. Together with the classical, intuitionistic, modal, and non-LFI boundary records, the full atlas has 92 records and 168 documented relationships, including its epistemic, dynamic and description-logic branches.

There is no finite list of “all LFIs”: the defining conditions admit open-ended families and further constructions. This catalog maps the main propositional mbC branch, the named propagation extensions below, the finite Cn family and the historical C1+ presentation, J3/LFI1, P1, and three replacement-enriched systems. It also represents the entire Cn hierarchy and the 8192-member three-valued parameter space symbolically. It does **not** claim coverage of every named LFI, every first-order/modal/fuzzy LFI, or every axiom combination.

The main references are the authors’ [revised 2007 handbook chapter](https://www.cle.unicamp.br/eprints/index.php/CLE_e-Prints/en/article/download/1048/870), [swap-structure treatment](https://arxiv.org/abs/1708.08499), [RNmatrix treatment](https://arxiv.org/abs/2011.10151v2), and [replacement-enriched LFIs](https://arxiv.org/abs/2003.09522v4). Every added record and edge cites its own supporting source; section, definition, and theorem locators appear in metadata.

## Naming and language

- **Ciw** is the user-confirmed alias for **mbCciw = mbC + (ciw)**. It does not include (cf) implicitly.
- **Ci = mbC + (ci) + (cf)**. **mCi** instead adds (ci) and the entire indexed schema (cc)n for n >= 0. They are separate records.
- **Cila is not LFI1/J3.** Cila adds (cl) to Cia; LFI1 adds (cj1)–(cj3) to Cie.
- **The n = 1 case of Cn and Cila have different signatures.** The former abbreviates consistency; the latter has a primitive connective. A `parameter_case` edge states the conservative-expansion claim only for n = 1, following the handbook's Theorem 110 and Remark 109. The analogous language distinction remains for C1+ and Cilo, connected by `conservative_extension`.
- **Cmin is not an LFI.** It is a boundary calculus and shared propositional base for every finite Cn, explicitly excluded by the app's “LFIs only” filter.
- Extension edges need not be proper or immediate covers. This is not a Hasse diagram. Cross-language and family claims have separate relation types.

## Individual records

`extends = presentation.Base."Hilbert"` inherits all base axiom schemata **and rules**. Definitions below are presentation definitions; redundant axioms may be derivable. The app shows inherited schemata with provenance, and the compiler rejects unresolved references, incompatible signatures, and inheritance cycles.

| Record | Presentation definition | Source locator |
| --- | --- | --- |
| mbC | CPL+ + (Ax10) + (bc1) | Definitions 28, 42 and 54; Theorems 56 and 61 |
| J3 | Historical formulation; see linked equivalence and matrix fragment | See record bibliography |
| LFI1 | Cie + (cj1) + (cj2) + (cj3) | Theorem 127; bullet A abbreviates not circle A |
| mbCciw | mbC + (ciw) | Swap structures, Definition 8.1 |
| mbCci | mbC + (ci) | Swap structures, Definition 8.9 |
| mbCcl | mbC + (cl) | Sections 3 and 4.1 |
| bC | mbC + (cf) | Definition 100 |
| mbCe | mbC + (ce) | Definition 100 |
| bCe | bC + (ce) | Definition 100 |
| mCi | mbC + (ci) + (ccn) | Definition 75 |
| mCie | mCi + (ce) | Definition 100 |
| Ci | mbCci + (cf) | Theorem 102 |
| Cie | Ci + (ce) | Definition 100 |
| Cil | Ci + (cl) | Definition 105 |
| Cile | Cil + (ce) | Definition 105 |
| Cia | Ci + (ca1) + (ca2) + (ca3) | Definition 108(i) |
| Cila | Cia + (cl) | Definition 108(ii); Remark 109 and Theorem 110 |
| Cilae | Cila + (ce) | Definition 108(ii) |
| Cida | Cia + (cd) | Definition 108(ii) |
| Cidae | Cida + (ce) | Definition 108(ii) |
| Ciba | Cia + (cb) | Definition 108(ii) |
| Cibae | Ciba + (ce) | Definition 108(ii) |
| Cio | Ci + (co1) + (co2) + (co3) | Definition 114(i) |
| Cilo | Cio + (cl) | Definition 114(ii) |
| Cioe | Cio + (ce) | Section 7, discussion of further systems |
| Ciboe | Cio + (cb) + (ce) | Footnote 17, Section 7; suffixes (cb), (ce) |
| Cl | bC + (cl) | Remark 111 |
| Cla | Cl + (ca1) + (ca2) + (ca3) | Remark 111 |
| P1 | Ci + (cz_not) + (cz_and) + (cz_or) + (cz_implies) + (cz_circle) | Theorem 127 |
| C1Plus | Cmin + the fixed n = 1 Cn schemata + disjunctive propagation of the defined consistency formula | Definition 114(ii) |
| RmbC | mbC + global replacement for negation and consistency | Definitions 2.5–2.6 |
| RbC | RmbC + cf | Example 3.9 |
| RCi | RbC + ci | Example 3.10 |

## Epistemic and dynamic LFI1 additions

Ten further records extend the LFI1 branch: KLFI1, KB4LFI1, S5LFI1, PALFI1,
AMLFI1, AMLFI1K, AMLFI1KB4, UMLFI1, UMLFI1K and UMLFI1KB4. They retain
LFI tags and explicit three-valued semantics. PALFI1 contains two corresponding
presentations; UMLFI1 replaces the atom-preservation reduction with a postcondition
reduction. See [dynamic LFI1 coverage](DYNAMIC_LFI_COVERAGE.md) for precise frame
variants, strong equivalence, rule restrictions and primary-source locators.

## Core schema keys

Formulas are encoded directly as LaTeX in the DSL, with JSON-style escaped backslashes.

| Key | Role |
| --- | --- |
| Ax1–Ax9 | Positive classical propositional logic |
| Ax10 | Excluded middle |
| bc1 | Gentle explosion, conditional on consistency |
| ciw | A formula is consistent or contradictory |
| ci | Inconsistency implies contradiction |
| cf / ce | Double-negation elimination / introduction |
| ccn | Consistency of every iterated negation of a consistency statement; n >= 0 |
| cl / cd | Consistency from negation of a contradiction, in the two ordered forms |
| cb | Either order of negated contradiction suffices |
| ca1–ca3 | Propagate consistency when both inputs are consistent |
| co1–co3 | Propagate consistency when at least one input is consistent |
| cj1–cj3 | LFI1's inconsistency-propagation schemata; bullet abbreviates negated consistency |
| cz_not, cz_and, cz_or, cz_implies, cz_circle | P1: every compound formula is consistent |

RmbC, RbC, and RCi retain **theorem-level** replacement rules. The displayed premise includes the turnstile to make the global requirement visible. Treating them as unrestricted local rules would define a different consequence relation. The DSL is descriptive and has no proof executor.

## Family records

- **Cn:** a schema for every integer n >= 1. Its metadata defines iterated well-behavedness using the explicit recursion in the 2021 RNmatrix paper, Section 5.2. Cons_n is a metalinguistic abbreviation, not a primitive connective. This single entry replaces all previously materialized C1–C10 records. Its Hilbert presentation inherits Cmin and adds the four n-indexed schema groups. Parameter-case edges to Cila and C1Plus apply only at n = 1. The hierarchy order C(n+1) strictly below C(n) is a property of the family; the graph has no self-edge. The compiler does not instantiate arbitrary n.
- **8Kb / EightKb:** all 8192 parameterized three-valued matrices from handbook Definition 129. There are 13 independent binary output choices: 3 for conjunction, 5 for disjunction, 4 for implication, and 1 for negation. Consistency and inconsistency tables are fixed. The array in each table cell denotes a **globally chosen parameter**, not an occurrence-by-occurrence nondeterministic choice. LFI1 and P1 are linked as members; every member extends Cia after the stated signature adjustments.

The grammar now accepts array-valued mapping inputs, for example `["B", "T"] -> ["B", "T"]`, so binary tables can be represented without inventing compound string keys.

## Limits

Most newly added individual records have complete **inherited Hilbert schemata**, including explicitly indexed schemata where applicable. The non-LFI seed and the historical J3 record remain representative sketches. Semantic coverage includes mbC's bivaluation constraints, existing unary fragments, the 8Kb family table, and the explicit three-valued Kripke/update definitions in the new LFI1 branch. No other missing matrix is implied. Structural validation does not prove paraconsistency, strictness, completeness, or language equivalence. Sources are editorial provenance.

## Finite da Costa records and Cω

Cn is the sole finite-hierarchy record, covering every fixed positive finite n.
Its metadata defines A^0, the recursion A^(k+1) = not(A^k and not A^k), and Cons_n
as the conjunction of the first n iterates. These abbreviate formulas in the
original four-connective signature. Cω is not obtained by substituting omega for n.

C1Plus remains separate. It inherits Cmin and explicitly includes the n = 1
schemata before adding disjunctive propagation, so removing C1 does not change its
fixed presentation. The former finite-member generator has been removed.

**Cω / Comega** has Ax1–Ax8, Ax10, cf, and modus ponens. It omits Ax9; adding Ax9 produces Cmin. It is explicitly tagged Non-LFI, and there is no finite-family instance edge from Cn to Comega. Its properties distinguish it from the true deductive limit CLim. The source is the handbook's Definition 40 and discussion before Definition 28.
