# Dynamic extensions of LFI1

This branch follows Rafael Ongaratto and Hans van Ditmarsch's
[The Dynamic Turn in Paraconsistency, arXiv v1 (2026)](https://arxiv.org/abs/2607.19906v1)
and Rafael Ongaratto's
[The Dynamics of Imperfect Reasoning: Change, Paraconsistency and Knowledge (2025)](https://doi.org/10.1007/s11787-025-00397-z).
The catalog keeps these records in **Paraconsistent**, with **LFI** and
**Epistemic** tags; dynamic records also have **Dynamic epistemic** tags and
membership links from DEL. They therefore appear with **LFIs only** enabled.

| DSL identifier | Presentation and model scope | 2026 source location |
| --- | --- | --- |
| KLFI1 | LFI1 plus K, K1–K3 and theorem-level necessitation; arbitrary agent relations | Definitions 25–27 |
| KB4LFI1 | B/4 and their dual schemata; symmetric and transitive relations | Definitions 27 and 31 |
| S5LFI1 | T/4/5 and their dual schemata; equivalence relations | Definitions 27 and 31 |
| AMLFI1 | S5 action-model updates preserving atoms; AM1–AM5 and RE | Definitions 33–35 |
| AMLFI1K, AMLFI1KB4 | The corresponding K and KB4 action-model variants | Section 3.3, p. 19 |
| PALFI1 | Public announcements; two corresponding presentations in one record | Section 4 |
| UMLFI1 | S5 updates with factual change; UM1 replaces AM1 | Definitions 53–55 |
| UMLFI1K, UMLFI1KB4 | The corresponding K and KB4 factual-update variants | Section 5.1, p. 25 |

The suffixed K/KB4 dynamic identifiers are catalog labels for variants discussed
in the paper, rather than claims that the authors assigned these exact names.
Unqualified AMLFI1 and UMLFI1 use the S5 base.

## Propositional and modal conventions

The matrix uses values 0, 1/2 and 1, with 1/2 and 1 designated. Tables are explicit
in each record. The original LFI1 value labels F, B and T correspond to 0, 1/2
and 1 here. The inconsistency operator bullet returns 1 precisely on 1/2.
The inherited LFI1 record uses primitive consistency, so KLFI1 supplies a strong
definitional bridge between bullet and negated consistency. The paper's primitive
basis and defined operations are documented separately from this catalog signature.

Strong equivalence is the conjunction of the biconditional and the biconditional
between negations. Designated strong equivalence means equal values. Ordinary
biconditional designation alone does not justify replacement. The record exposes
this distinction, along with the strong-negation and modal-dual abbreviations.

Knowledge takes the infimum of accessible values in the order 0 < 1/2 < 1;
the empty infimum is 1. The modal presentations retain K1–K3 and the dual frame
axioms specified alongside the ordinary frame schemata. They do not reuse the
classical epistemic K/T/S4/S5 presentations.

## Dynamic syntax and execution

Announcements take two formula arguments. For action and update operators,
signature arity 1 counts only the continuation relative to a specified pointed
model. Preconditions and postconditions carry additional formula parameters.
The paper's discussion on p. 13 explains the variable-arity syntax. The current
DSL documents that structure but does not parse, type-check or execute models.

Finite action models use the same frame class as their world models. Execution
keeps world-event pairs with designated preconditions; a failed precondition gives
the update box value 1. Action models preserve atomic values. Factual-update
postconditions are evaluated in the old world, with identity outside finite support.
UMLFI1 consequently inherits its static base directly, not AMLFI1's AM1 schema.
The embedding from an action system to its factual-update counterpart explicitly
uses identity postconditions.

MP may use hypotheses. Necessitation and RE are restricted to theorem premises.
Atomic reduction axioms retain their restriction to atoms; no unrestricted
uniform substitution rule is added. The source's metatheorems are recorded as
claims from the literature, not results checked by the compiler.

## One public-announcement logic, two presentations

PALFI1 has these presentations:

- **Hilbert:** the 2026 PA1–PA5 schemata and explicit theorem-level RE.
- **Composition (2025 comparison):** PA1–PA5 and the composition schema, without
  explicit RE, reconstructed from the comparison in 2026 Section 4.

PALFI1C is an alias for the comparison notation used in 2026, not another semantic
logic record. Lemmas 50–51 and Theorem 52 establish the presentations'
correspondence. The 2025 publisher page supplies metadata and the abstract; its
subscription-only full text was not independently transcribed. The reconstruction
is labeled in both presentation type and metadata.

The new systems do not include common/distributed knowledge operators, arbitrary
announcement quantification, or a claim that classical PAL is equivalent to
PALFI1. No KD-based dynamic variant is added: the paper's Section 3.3 warns that
serial frames need not remain serial after restrictions.
