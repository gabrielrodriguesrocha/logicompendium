# Dynamic and epistemic coverage

This is a curated starting map, not an exhaustive classification. All records live
in `atlas.dsl` and cite primary books, papers or reports in the app's bibliography.
Names such as EAL have several conventions in the literature; the explicit
language and model class in each record determine its meaning here.

| Branch | DSL identifiers | Scope |
| --- | --- | --- |
| Individual knowledge | EpistemicK, EpistemicT, EpistemicS4, EpistemicS5 | Fixed finite agent set; arbitrary, reflexive, reflexive/transitive, and equivalence relations |
| Group knowledge | EpistemicCommon, EpistemicDistributed, EpistemicCD | S5 plus common knowledge, distributed knowledge, or both |
| Belief | KD45 | Serial, transitive, Euclidean agent relations; no factivity |
| Program dynamics | TestFreePDL, PDL, CPDL, DPDL | Regular programs; tests; converse; atomic determinism |
| Public information | PAL, PALCommon, APAL | S5 announcements; common knowledge; quantification over static epistemic announcements |
| Epistemic actions | EAL, EALCommon | Finite S5 action models, product updates, no factual postconditions; optionally common knowledge |
| Framework | DEL | Open-ended family record, not an additional fixed calculus |

## Languages and presentations

The DSL stores formulas and semantic clauses as strings. It does not parse typed
program terms, agent indices, group indices, or action models. These are explicit
metasyntactic conventions in the records' properties. Signatures give formula
arities: `knows(1)` represents K_i; `program_box(1)` is indexed by a program;
`announce(2)` takes an announcement and a continuation; `action_box(1)` is indexed
by a pointed action model. Group modalities are unary, indexed by nonempty groups.

Individual knowledge and KD45 records encode the usual Hilbert schemata, including
classical tautology substitution, distribution, MP and theorem-level necessitation.
T, S4 and S5 inherit their bases. Group and dynamic records have representative
presentations: semantic definitions are given, but complete proof systems are not
claimed. Group induction, all interaction principles and APAL's infinitary proof
principles are not fully encoded. Compilation checks structure and references.

Formulas, relational forcing clauses and indexed signature symbols render with
LaTeX/KaTeX. Compact graph names include EL+C, PAL+C and EAL+C.

## Relationship conventions

- **Extension:** strengthen a logic in the same language, such as epistemic T
  over K or atomic-deterministic DPDL over PDL.
- **Conservative expansion:** add vocabulary with its canonical interpretation,
  preserving validity in the original language, such as tests or common knowledge.
- **Embedding:** translate a language, such as a box to one fixed agent's knowledge
  operator, or public announcements to single-event action models.
- **Reduction translation:** eliminate PAL or finite EAL updates into static
  epistemic formulas without common knowledge. This does not determine graph layers.
- **Family member:** place a system within DEL without comparing logical strength.

Common knowledge uses reflexive transitive closure of the union of group
relations; distributed knowledge uses their intersection. Everyone-knows is a
defined conjunction. Updated common knowledge is evaluated in the updated model;
no naive reduction to ordinary static common knowledge is asserted.

DPDL requires atomic programs to be partial functions. Compound choice and
iteration may have multiple results. Tests are partial identities, and the
test-free fragment excludes them from its syntax. CPDL reverses program relations.

PAL and action-update boxes are true when their preconditions fail. Truthful
announcements may change the truth of their own epistemic content. EAL uses S5
world and event relations; non-S5 deception and belief revision action models are
outside this coverage. APAL ranges over announcement-free individual epistemic
formulas, not over APAL itself.

Temporal epistemic logics, DEL with factual assignments, first-order dynamic
logic, dynamic doxastic belief revision and group announcement logics remain
future additions.


## Paraconsistent dynamic branch

The LFI1-based systems are cataloged separately under **Paraconsistent**, with
cross-cutting epistemic/dynamic tags and DEL membership links. See
[dynamic LFI1 coverage](DYNAMIC_LFI_COVERAGE.md) for their three-valued admission
conditions, strong-equivalence reductions and factual updates. The classical
systems above keep their existing semantics.
