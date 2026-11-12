# Logicompendium

An interactive compendium of formal logics and their relationships.

A static web application for browsing the relationships, definitions, aliases and sources of classical and non-classical logics. The catalog is compiled at build time with this project's Lark DSL compiler, with a D3.js relationship map and bundled KaTeX for LaTeX formulas. No frontend package installation or JavaScript build step is required. The published site needs no backend or Python runtime.

## Build and preview

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python app.py
```

`app.py` builds `dist/` and serves only those static files. Open [Logicompendium](http://127.0.0.1:8000). Use `--port 8080` to select another port. The server binds only to the loopback interface. Stop it with Ctrl+C.

To build without starting a server:

```sh
.venv/bin/python -m scripts.build_site
python3 -m http.server 8000 --bind 127.0.0.1 --directory dist
```

Publish the contents of `dist/` to any static host. Asset and catalog paths are relative, so GitHub Pages project URLs work without a custom base URL.

## GitHub Pages

The workflow in `.github/workflows/pages.yml` tests and builds the catalog, then deploys `dist/` on pushes to `main` or a manual run. If your default branch has another name, update the workflow's branch filter. In the repository's **Settings → Pages**, set **Source** to **GitHub Actions** before running the workflow.

Python and Lark are used only during the build. The generated site contains HTML, CSS, JavaScript, fonts and `catalog.json`; it has no API endpoints or browser compiler. Catalog changes are made in `catalog/atlas.dsl` and published by rebuilding. Old browser drafts are not loaded.

## Explore

- **Relationship map:** select a system for a preview; double-click or press Enter for full details. Drag to pan, scroll or use buttons to zoom. Focus a system's immediate connections, filter families, and toggle edge types. Click an edge to read its scope and citations.
- **Logic catalog:** search by identifier, name, alias, author, description, or tag. For example, `J_3` and `J₃` both find the J₃ record. Select two to four systems for comparison.
- **Logic filters:** choose **Family → Modal** to show just the modal category, or use **Only** beside any sidebar family. Combine family selections with a tag (such as **Normal modal**, **Knowledge**, or **LFI**), record kind (individual systems or families/frameworks), and search. Tags describe overlapping classifications; the family selector uses each record's primary browsing category. Filters apply to both the map and catalog. **Clear all filters** restores all records and relationship types.
- **System details:** inspect annotated names, signatures, logical properties, encoded matrix fragments, presentations, adequacy claims, and references.
- **Bibliography:** follow the literature used by the records and relationships.
- **Export JSON:** download the published catalog.

Keyboard shortcuts: `1`–`3` switch views, `/` focuses search, and Escape closes dialogs.

## LaTeX formulas

Formulas render with locally bundled [KaTeX](https://katex.org/docs/api), including accessible MathML. Axiom formulas and formal statements accept LaTeX directly, and rules render as inference fractions. Signatures and matrix entries also use mathematical typesetting. Legacy `A implies B` and `A → B` notation remains supported.

The DSL uses JSON-style strings, so double each LaTeX backslash:

```text
axiom distribution {
  formula = "\\Box(A \\to B) \\to (\\Box A \\to \\Box B)"
}
```

In descriptions, properties, restrictions, and forcing clauses, delimit mathematical expressions with `$...$`, `$$...$$`, `\\(...\\)`, or `\\[...\\]` (again, double backslashes inside DSL strings). Invalid or unsupported formulas display their escaped source instead of preventing the record from opening. KaTeX's trusted HTML/link commands are disabled. The bundled version is 0.19.1; its MIT license is in `web/vendor/katex/LICENSE`. No network access is needed for formula rendering.

## Catalog coverage

The current `catalog/atlas.dsl` seed contains **101 records, 179 relationships and 33 bibliographic sources** across eleven browsing categories. These are **97 individual systems or explicitly scoped fragments** and **four family/framework records**: Cn, 8Kb, DEL and description logics. The LFI subset contains 47 individual systems. Counts change when the catalog is updated and rebuilt.

| Branch | Included systems and scope | Details |
| --- | --- | --- |
| Classical, intuitionistic, modal and many-valued | CPL, IPC, K/T/S4/S5, FDE and K3 | Inspect each record's presentation and references |
| Quantified | FOL, full SO and MSO, Henkin SO, QmbC and QLFI1 | [Quantified-logic coverage](catalog/QUANTIFIED_LOGIC_COVERAGE.md) |
| Evidence and truth | FDE, BLE (Nelson’s N4), LET_J and the original bullet-equipped LET_F | [Evidence-logic coverage](catalog/EVIDENCE_LOGIC_COVERAGE.md) |
| Paraconsistent and LFI | mbC extensions, Ci/Cila variants, J3/LFI1, P1, replacement-enriched LFIs, da Costa’s finite Cn family, Cω, and the symbolic 8Kb family | [LFI coverage](catalog/LFI_COVERAGE.md) |
| Paraconsistent epistemic and dynamic | KLFI1, KB4LFI1, S5LFI1, PALFI1, action-model and factual-update variants | [Dynamic LFI1 coverage](catalog/DYNAMIC_LFI_COVERAGE.md) |
| Epistemic and doxastic | Multi-agent K/T/S4/S5, common/distributed knowledge, and KD45 belief | [Epistemic and dynamic coverage](catalog/DYNAMIC_EPISTEMIC_COVERAGE.md) |
| Dynamic and dynamic epistemic | PDL and variants, PAL, finite S5 action-model logic, common-knowledge variants, APAL and the DEL framework | [Epistemic and dynamic coverage](catalog/DYNAMIC_EPISTEMIC_COVERAGE.md) |
| Description | EL variants, FL0, ALC extensions, S/SH/SHI, SHIQ, SHOIN, SHOIQ, SROIQ and a family record | [Description-logic coverage](catalog/DESCRIPTION_LOGIC_COVERAGE.md) |

J₃ and LFI1 have separate historical records connected by an equivalence up to a change of language. Cila remains a separate system. **Ciw** is an alias for **mbCciw = mbC + (ciw)**. Each naming or relationship claim has its own scope and citations in the catalog.

Coverage is curated and open-ended. Many LFI, individual epistemic and dynamic LFI1 records encode inherited Hilbert schemata; the classical group/dynamic and description-logic branches use explicitly representative presentations. Some original entries contain only schema or matrix fragments. Unspecified mappings and properties remain unspecified. Theorem statuses and property values are sourced editorial claims. The compiler validates structure and references; it does not establish mathematical claims or perform proof search.

The primary family field controls browsing categories; tags express overlapping classifications. For example, FDE is many-valued, paraconsistent and paracomplete. Family/framework records are marked separately from individual systems. **LFIs only** selects records with an explicit LFI tag, including the new paraconsistent epistemic and dynamic systems. Turn it off to include the classical epistemic/dynamic branches, description logics and non-LFI boundary records.

The original `examples/` files remain compiler fixtures and are not merged into the atlas. Their cross-language inclusion sketches require independent review.

## Reading relationships

Every edge has a direction, scope note and source, available by clicking it.

| Relationship | Meaning |
| --- | --- |
| Extension | Add principles in the stated language; arrows run from weaker to stronger |
| Conservative expansion | Expand the language while preserving old-language validity or consequence as stated |
| Language expansion | Add constructors or ontology forms, particularly in the description-logic branch |
| Embedding | Translate one language into another under the stated model and vocabulary conditions |
| Equivalence | Identify systems under the stated language translation |
| Reduction translation | Eliminate update syntax into a static language within the stated scope |
| Family member | Membership in a family or framework, without a strength comparison |
| Every member extends | A qualified extension claim about every member of a family |
| Parameter case | A relationship applying only to the parameter value stated in its scope note |

The graph arranges declared extension and language-expansion edges into layers. Position does not establish a strength comparison between arbitrary nodes. The map is not a Hasse diagram; it does not infer missing relations, compute transitive closure or prove strictness. Translation and membership edges do not determine layers.

The renderer uses **D3.js 7.9.0** for keyed SVG joins, node/edge events, panning,
wheel/touch zoom and the zoom/Fit controls. Selection and filtering update the
existing SVG; selecting a node preserves the camera and keyboard focus. The
deterministic layout still follows the catalog's explicitly recorded relations.
D3's unmodified distribution and ISC license are bundled under `web/vendor/d3/`,
so graph rendering requires no CDN connection at runtime.

## Extend the DSL

The original syntax and JSON output remain compatible. The atlas adds optional metadata and relationship fields plus top-level bibliographic sources:

```text
source paper {
  title = "A paper about a logic"
  url = "https://example.org/paper"
  authors = ["Author"]
  year = 2026
}

logic Example {
  metadata {
    name = "Example logic"
    family = "Paraconsistent"
    aliases = ["E" { author = "Author", year = 2026 }]
    desc = "Describe the system and the scope of the record."
    authors = ["Author"]
    year = 2026
    tags = ["LFI", "Three-valued"]
    properties { explosion = "Not valid" }
    references = ["paper"]
  }
  signature { operator not(1) }
}
```

Relationships retain the existing syntax:

```text
relation {
  type = "extension"
  parent = Base
  child = Stronger
  desc = "Specify the common language and the added principles."
  status = "Literature-backed"
  references = ["paper"]
}
```

Both endpoints must be declared in the compiled catalog. Additional relation type strings are accepted. Add metadata fields in the order shown: name, family, optional aliases, then optional extended fields. All legacy examples compile without modification.

## Architecture and checks

- `logicdsl/syntax.py`, `logicdsl/compiler.py`: grammar and JSON-compatible intermediate representation.
- `logicdsl/catalog.py`: catalog integrity validation (identifiers, citations, relation endpoints, adequacy references, designated-value membership, and presentation inheritance with compatible signatures and no cycles).
- `scripts/build_site.py`: compiles and validates the DSL, copies public assets, and writes `dist/catalog.json`.
- `app.py`: builds the static site and previews `dist/` with a standard-library HTTP server.
- `.github/workflows/pages.yml`: tests, builds and deploys the site to GitHub Pages.
- `web/graph.mjs`: D3 SVG renderer, keyed joins, graph interactions and zoom/Fit camera.
- `web/catalog.mjs`: presentation resolution and relation-aware layout.
- `web/`: native JavaScript, CSS, and bundled D3/KaTeX. Fonts optionally load from Google Fonts, with system fallbacks.
- `catalog/atlas.dsl`: editable source of truth for the seed atlas.
- `catalog/*_COVERAGE.md`: branch definitions, naming conventions and coverage limits.

```sh
.venv/bin/python -m unittest discover -v
node --check web/app.js
node --check web/graph.mjs
node --test tests/test_*.mjs
.venv/bin/python compiler.py catalog/atlas.dsl
```

The Python and Node suites cover legacy compilation, metadata and catalog integrity, inherited presentations, LFI definitions, the 8192-member parameter space, finite Cn parameterization and scoped n = 1 relationships, epistemic/update scope, strong-equivalence and factual-update distinctions for LFI1, description-logic constructors and SROIQ restrictions, graph layout and geometry, LaTeX rendering, local vendor assets, static builds and serving from a project subpath. These catalog checks do not prove completeness, decidability or other mathematical claims.

An optional browser integration check uses Playwright and Chromium. With those
installed and the app running, run:

```sh
node scripts/check_graph_browser.mjs http://127.0.0.1:8000/
```

It checks rendering with external requests blocked, SVG identity across updates,
selection, keyboard and double-click details, zoom/pan/Fit, relationship filters,
empty results, navigation and a mobile viewport. `LOGIC_ATLAS_PLAYWRIGHT_MODULE`
can select an existing Playwright installation; `LOGIC_ATLAS_BROWSER_EXECUTABLE`
can select an installed Chromium/Chrome executable. These are optional test tools,
not application dependencies.

`compiler.py` prints the compiled JSON; the static site build additionally runs integrity validation. Browsing and JSON export run entirely in the browser.

## Inherited presentations

The LFI catalog encodes axiom schemata once, then builds extensions explicitly:

```text
presentation "Hilbert" {
  type = "Hilbert"
  extends = presentation.mbC."Hilbert"
  axiom ciw { formula = "\\circ A \\lor (A \\land \\neg A)" }
}
```

The reference inherits both axioms and rules. Cross-logic references are validated as a DAG and must preserve the base signature. This is structural inheritance, not automatic theorem proving. The app expands inherited schemata on demand and labels their origins. “LFIs only” filters the catalog by explicit LFI tags; family records remain visibly distinguished from individual systems.

## da Costa's hierarchy

**Cn**, displayed as Cₙ and searchable as `C_n`, is the single record for all
finite integers **n >= 1**. C1 through C10 are no longer separate nodes. Its
Hilbert presentation inherits Cmin and adds the n-indexed gentle-explosion and
consistency-propagation schemata. The metadata defines the consistency iterates
and their finite conjunction. Fixing n selects one calculus; the compiler does
not quantify over n inside formulas or instantiate members automatically.

The property **hierarchy order** states that C(n+1) is weaker than C(n), without
adding a misleading self-edge to the consolidated family node. Parameter-case
edges to Cila and C1Plus explicitly apply **only at n = 1**. C1Plus remains a
separate extension with its own fixed n = 1 presentation over Cmin.

**Comega**, searchable as `C_omega` or `Cω`, remains a separate non-LFI record.
It is positive intuitionistic logic plus excluded middle and double-negation
elimination. Adding Ax9 yields Cmin. It is not the deductive limit of the finite
hierarchy; the handbook distinguishes that limit as CLim. Turn off **LFIs only**
to include Cω in the view.

The former finite-member generation script has been removed. The source of truth
for every positive finite n is the parameterized `Cn` record in `catalog/atlas.dsl`.
Formula powers and Cons_n are metalinguistic abbreviations over the original
signature, not additional primitive connectives.

## Epistemic and dynamic branches

The atlas also includes multi-agent epistemic K/T/S4/S5, common and distributed
knowledge, KD45 belief, PDL and its test-free/converse/atomic-deterministic variants,
public announcements (PAL), finite S5 action models (EAL), common-knowledge
variants, and arbitrary public announcements (APAL). DEL is a framework record.

This branch comprises 18 records and 32 cited relationships. Family filters and compact graph labels make these branches browsable. Reduction translations are distinguished from extensions and embeddings. Indexed signature symbols and relational semantics render with LaTeX.

See [coverage and conventions](catalog/DYNAMIC_EPISTEMIC_COVERAGE.md) for exact
language choices, semantic restrictions and presentation scope. Indexed operators,
programs and action models remain documented metasyntax in the existing DSL;
compilation does not parse them or prove logical claims. Group and dynamic
presentations are explicitly representative fragments.

## Paraconsistent epistemic and dynamic logics

The [2026 dynamic-turn paper](https://arxiv.org/abs/2607.19906v1) and
[2025 public-announcement paper](https://doi.org/10.1007/s11787-025-00397-z)
add ten LFI1-based records: KLFI1, KB4LFI1, S5LFI1, PALFI1, AMLFI1,
AMLFI1K, AMLFI1KB4, UMLFI1, UMLFI1K and UMLFI1KB4. They are in the
**Paraconsistent** browsing family and remain visible with **LFIs only** enabled.
Search their identifiers or the **Dynamic epistemic** tag.

PALFI1 has two corresponding presentations, rather than duplicate semantic
records. The 2025 composition presentation is explicitly reconstructed from the
2026 comparison. Action models preserve atomic values; factual updates use
postconditions. Reductions use **strong equivalence** and theorem-level
replacement, with matching K, KB4 or S5 world/event frames.

See [dynamic LFI1 coverage](catalog/DYNAMIC_LFI_COVERAGE.md) for source locators,
notation, presentation provenance and restrictions on substitution and rules.

## Description logics

The **Description** family adds 17 systems and one umbrella record: FL0, EL,
EL with bottom, the 2005 EL++ object fragment, ALC, ALCI, ALCO, ALCN, ALCQ,
ALCQI, S, SH, SHI, SHIQ, SHOIN, SHOIQ and SROIQ. Search for `SROIQ` or filter by **Description**. The DSL identifiers for S and the two EL variants are `DL_S`, `ELBottom` and `ELPlusPlusObject`.

Constructor signatures and set-interpretation equations render with LaTeX.
**Language expansion** edges distinguish constructor/ontology inclusions from
axiomatic extensions. Links to modal K describe local concept semantics, with
explicit qualifications about TBoxes and ontology entailment.

SROIQ records regularity and simple-role restrictions, Self, nominals, inverses,
qualified counting, the universal role and role/assertion semantics. It also
explains its relationship to OWL 2 DL. These are catalog definitions; the compiler
has no DL parser or reasoner and does not enforce ontology-level restrictions.
See [description-logic coverage](catalog/DESCRIPTION_LOGIC_COVERAGE.md) for variants,
constructor arities, semantic conventions and remaining scope.

## Loading catalog updates

Edit `catalog/atlas.dsl` and rebuild with `.venv/bin/python -m scripts.build_site`, or restart `app.py`. On GitHub Pages, push the changes to the deployment branch and wait for the workflow to finish. Reload the site to load the new catalog. The site has no browser editing or applied-catalog storage.

## References

Logicompendium acknowledges two inspirations for its name and relationship map:

- **Paulus Pergulensis, [*Compendium logicae*](https://purl.pt/32313), Venice, 1498.** The historical compendium, digitized by the Biblioteca Nacional de Portugal, is a reference behind the name **Logicompendium**, a portmanteau of “logic” and “compendium.” Bibliographic details are also available in the [Biblissima record](https://portail.biblissima.fr/fr/ark%3A/43093/idatabfb40201ff77284bee6e6bc270363197f06ae1cd).
- **Fulya Horozal, Michael Kohlhase, Florian Rabe, and Kristina Sojakova, [*Towards an Atlas of Formal Logics*](https://kwarc.info/people/frabe/Research/HKRS_latinlf_10.pdf).** The LATIN (Logic Atlas and Integrator) project's interconnected representation of logics and translations is an inspiration for this project's relationship map. Its use of “Logic Atlas” also motivated adopting a distinct name here.

Sources supporting individual logic definitions, presentations, and relationships are recorded in `catalog/atlas.dsl` and exposed in the application's bibliography and detail views.
