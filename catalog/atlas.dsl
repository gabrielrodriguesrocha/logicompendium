// Logicompendium · curated introductory catalog
// Entries are representative sketches, not complete axiomatizations.
// Arrows follow the explicit relation descriptions; position is not logical strength.

source taxonomy {
  title = "A Taxonomy of C-systems"
  url = "https://arxiv.org/abs/math/0108036"
  authors = ["Walter A. Carnielli","João Marcos"]
  year = 2001
}

source twist {
  title = "Twist-Valued Models for Three-valued Paraconsistent Set Theory"
  url = "https://arxiv.org/abs/1911.11833"
  authors = ["Walter Carnielli","Marcelo E. Coniglio"]
  year = 2021
}

source databases {
  title = "Formal Inconsistency and Evolutionary Databases"
  url = "https://doi.org/10.12775/llp.2000.008"
  authors = ["Walter A. Carnielli","João Marcos","Sandra de Amo"]
  year = 2000
}

source many {
  title = "K3, L3, LP, RM3, A3, FDE: How to Make Many-Valued Logics Work for You"
  url = "https://arxiv.org/abs/1711.05816"
  authors = ["Allen P. Hazen","Francis Jeffry Pelletier"]
  year = 2017
}

source modal {
  title = "Modal Logic"
  url = "https://plato.stanford.edu/entries/logic-modal/"
  authors = ["James W. Garson"]
  year = 2023
}

source intuitionistic {
  title = "Classical logic and intuitionistic logic: equivalent formulations in natural deduction, Gödel-Kolmogorov-Glivenko translation"
  url = "https://arxiv.org/abs/1602.07608"
  authors = ["Richard Moot","Christian Retoré"]
  year = 2016
}

source gmt {
  title = "15-816 Modal Logic, Lecture 14: Reconciling Intuitionistic and Classical Logic"
  url = "https://www.cs.cmu.edu/~fp/courses/15816-s10/lectures/14-reconcil.html"
  authors = ["Frank Pfenning"]
  year = 2010
}

source lfi_handbook {
  title = "Logics of Formal Inconsistency (revised 2007 handbook chapter)"
  url = "https://www.cle.unicamp.br/eprints/index.php/CLE_e-Prints/en/article/download/1048/870"
  authors = ["Walter Carnielli", "Marcelo E. Coniglio", "João Marcos"]
  year = 2007
}
source lfi_swap {
  title = "Non-deterministic algebraization of logics by swap structures"
  url = "https://arxiv.org/abs/1708.08499"
  authors = ["Marcelo E. Coniglio", "Aldo Figallo-Orellano", "Ana Claudia Golzio"]
  year = 2017
}
source lfi_replacement {
  title = "Logics of Formal Inconsistency enriched with replacement: an algebraic and modal account"
  url = "https://arxiv.org/abs/2003.09522v4"
  authors = ["Walter Carnielli", "Marcelo E. Coniglio", "David Fuenmayor"]
  year = 2021
}
source lfi_rnmatrix {
  title = "A simple decision procedure for da Costa's Cn logics by Restricted Nmatrix semantics"
  url = "https://arxiv.org/abs/2011.10151v2"
  authors = ["Marcelo E. Coniglio", "Guilherme V. Toledo"]
  year = 2021
}

source let_epistemic {
  title = "An epistemic approach to paraconsistency: a logic of evidence and truth"
  url = "https://doi.org/10.1007/s11229-017-1621-7"
  authors = ["Walter Carnielli", "Abilio Rodrigues"]
  year = 2017
}
source let_measuring {
  title = "Measuring evidence: a probabilistic approach to an extension of Belnap–Dunn logic"
  url = "https://doi.org/10.1007/s11229-020-02571-w"
  authors = ["Abilio Rodrigues", "Juliana Bueno-Soler", "Walter Carnielli"]
  year = 2020
}
source let_tableaux {
  title = "Analytic proofs for logics of evidence and truth"
  url = "https://arxiv.org/abs/2412.10588v1"
  authors = ["Walter Carnielli", "Lorenzzo Frade", "Abilio Rodrigues"]
  year = 2024
}

logic CPL {
  metadata {
    name = "Classical propositional logic"
    family = "Classical"
    aliases = ["CL", "Boolean logic"]
    desc = "The familiar two-valued setting. Every proposition is true or false, and contradictions entail every formula."
    tags = ["Two-valued","Explosive"]
    properties { explosion = "Valid" excluded_middle = "Valid" double_negation = "Valid" }
    references = ["many"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
  }
  presentation "Representative schema" {
    type = "Sketch"
    axiom schema { desc = "Illustrative schema only; this is not a complete axiomatization." formula = "A \\lor  \\neg A" }
  }
  semantics "Matrix fragment" {
    type = "ValuationMatrix"
    domain = ["F","T"]
    designated = ["T"]
    operator_mapping not { "F" -> "T" "T" -> "F" }
  }
}

logic IPC {
  metadata {
    name = "Intuitionistic propositional logic"
    family = "Intuitionistic"
    aliases = ["IPL", "Heyting logic"]
    desc = "Connectives express constructive justification. Excluded middle and double-negation elimination are not generally derivable."
    tags = ["Constructive","Kripke"]
    properties { explosion = "Valid" excluded_middle = "Not valid" double_negation = "Not valid" }
    references = ["intuitionistic","gmt"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
  }
  presentation "Representative schema" {
    type = "Sketch"
    axiom schema { desc = "Illustrative schema only; this is not a complete axiomatization." formula = "A \\to  (B \\to  A)" }
  }
  semantics "Frame sketch" {
    type = "RelationalSemantics"
    restriction frames { expression = "R is a preorder; atomic forcing persists along R." }
  }
}

logic K {
  metadata {
    name = "Normal modal logic K"
    family = "Modal"
    aliases = ["Modal K"]
    desc = "The basic normal modal system, with a necessity operator and no constraints on accessibility."
    tags = ["Normal modal","Kripke"]
    properties { explosion = "Valid" excluded_middle = "Valid" frames = "Arbitrary" }
    references = ["modal"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator box(1)
  }
  presentation "Representative schema" {
    type = "Sketch"
    axiom schema { desc = "Illustrative schema only; this is not a complete axiomatization." formula = "\\Box (A \\to  B) \\to  (\\Box A \\to  \\Box B)" }
  }
  semantics "Frame sketch" {
    type = "RelationalSemantics"
    restriction frames { expression = "R is an arbitrary binary relation on worlds." }
  }
}

logic T {
  metadata {
    name = "Reflexive modal logic T"
    family = "Modal"
    aliases = ["M"]
    desc = "Adds the principle that what is necessary is true at the current world."
    tags = ["Normal modal","Reflexive"]
    properties { explosion = "Valid" excluded_middle = "Valid" frames = "Reflexive" }
    references = ["modal"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator box(1)
  }
  presentation "Representative schema" {
    type = "Sketch"
    axiom schema { desc = "Illustrative schema only; this is not a complete axiomatization." formula = "\\Box A \\to  A" }
  }
  semantics "Frame sketch" {
    type = "RelationalSemantics"
    restriction frames { expression = "R is reflexive: every world accesses itself." }
  }
}

logic S4 {
  metadata {
    name = "Modal logic S4"
    family = "Modal"
    aliases = []
    desc = "A normal modal system in which necessity is both truthful and positively introspective."
    tags = ["Normal modal","Transitive"]
    properties { explosion = "Valid" excluded_middle = "Valid" frames = "Reflexive and transitive" }
    references = ["modal","gmt"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator box(1)
  }
  presentation "Representative schema" {
    type = "Sketch"
    axiom schema { desc = "Illustrative schema only; this is not a complete axiomatization." formula = "\\Box A \\to  \\Box \\Box A" }
  }
  semantics "Frame sketch" {
    type = "RelationalSemantics"
    restriction frames { expression = "R is reflexive and transitive." }
  }
}

logic S5 {
  metadata {
    name = "Modal logic S5"
    family = "Modal"
    aliases = []
    desc = "Necessity is evaluated over equivalence classes of mutually accessible possible worlds."
    tags = ["Normal modal","Equivalence frames"]
    properties { explosion = "Valid" excluded_middle = "Valid" frames = "Equivalence relation" }
    references = ["modal"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator box(1)
  }
  presentation "Representative schema" {
    type = "Sketch"
    axiom schema { desc = "Illustrative schema only; this is not a complete axiomatization." formula = "\\Diamond A \\to  \\Box \\Diamond A" }
  }
  semantics "Frame sketch" {
    type = "RelationalSemantics"
    restriction frames { expression = "R is an equivalence relation." }
  }
}

logic FDE {
  metadata {
    name = "First-degree entailment"
    family = "Many-valued"
    aliases = ["Belnap–Dunn logic", "Belnap-Dunn logic", "BD", "First degree entailment"]
    desc = "Four information states accommodate truth, falsity, both, and neither. Neither explosion nor excluded middle holds in general."
    tags = ["Paraconsistent","Paracomplete","Four-valued","Evidence"]
    properties { explosion = "Not valid" excluded_middle = "Not valid" double_negation = "Valid" }
    references = ["many", "let_tableaux"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
  }
  semantics "Four-valued matrix" {
    type = "ValuationMatrix"
    domain = ["F","N","B","T"]
    designated = ["B","T"]
    restriction information_states { expression = "T = (1,0), F = (0,1), B = (1,1), N = (0,0); coordinates record positive and negative evidence. Consequence preserves designation." }
    operator_mapping and {
      ["F", "F"] -> "F"
      ["F", "N"] -> "F"
      ["F", "B"] -> "F"
      ["F", "T"] -> "F"
      ["N", "F"] -> "F"
      ["N", "N"] -> "N"
      ["N", "B"] -> "F"
      ["N", "T"] -> "N"
      ["B", "F"] -> "F"
      ["B", "N"] -> "F"
      ["B", "B"] -> "B"
      ["B", "T"] -> "B"
      ["T", "F"] -> "F"
      ["T", "N"] -> "N"
      ["T", "B"] -> "B"
      ["T", "T"] -> "T"
    }
    operator_mapping or {
      ["F", "F"] -> "F"
      ["F", "N"] -> "N"
      ["F", "B"] -> "B"
      ["F", "T"] -> "T"
      ["N", "F"] -> "N"
      ["N", "N"] -> "N"
      ["N", "B"] -> "T"
      ["N", "T"] -> "T"
      ["B", "F"] -> "B"
      ["B", "N"] -> "T"
      ["B", "B"] -> "B"
      ["B", "T"] -> "T"
      ["T", "F"] -> "T"
      ["T", "N"] -> "T"
      ["T", "B"] -> "T"
      ["T", "T"] -> "T"
    }
    operator_mapping not { "F" -> "T" "N" -> "N" "B" -> "B" "T" -> "F" }
  }
}

logic K3 {
  metadata {
    name = "Strong Kleene logic"
    family = "Many-valued"
    aliases = ["K₃", "Kleene K3"]
    desc = "A third truth value represents an undetermined proposition. Only true is designated."
    tags = ["Paracomplete","Three-valued"]
    properties { explosion = "Valid" excluded_middle = "Not valid" double_negation = "Valid" }
    references = ["many"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
  }
  semantics "Matrix fragment" {
    type = "ValuationMatrix"
    domain = ["F","N","T"]
    designated = ["T"]
    operator_mapping not { "F" -> "T" "N" -> "N" "T" -> "F" }
  }
}

logic LP {
  metadata {
    name = "Logic of paradox"
    family = "Paraconsistent"
    aliases = ["Priest’s LP"]
    desc = "Allows a proposition to be both true and false without making every conclusion follow."
    tags = ["Paraconsistent","Three-valued"]
    properties { explosion = "Not valid" excluded_middle = "Valid" double_negation = "Valid" }
    references = ["many"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
  }
  semantics "Matrix fragment" {
    type = "ValuationMatrix"
    domain = ["F","B","T"]
    designated = ["B","T"]
    operator_mapping not { "F" -> "T" "B" -> "B" "T" -> "F" }
  }
}

logic mbC {
  metadata {
    name = "Basic logic of formal inconsistency"
    family = "Paraconsistent"
    aliases = []
    desc = "Positive classical schemata, excluded middle, and gentle explosion; the root of the propositional LFI branch."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Complete Hilbert schemata"
      definition = "CPL+ + (Ax10) + (bc1)"
      double_negation_elimination = "Not valid"
      source_location = "Definitions 28, 42 and 54; Theorems 56 and 61"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    axiom Ax1 { formula = "A \\to (B \\to A)" }
    axiom Ax2 { formula = "(A \\to B) \\to ((A \\to (B \\to C)) \\to (A \\to C))" }
    axiom Ax3 { formula = "A \\to (B \\to (A \\land B))" }
    axiom Ax4 { formula = "(A \\land B) \\to A" }
    axiom Ax5 { formula = "(A \\land B) \\to B" }
    axiom Ax6 { formula = "A \\to (A \\lor B)" }
    axiom Ax7 { formula = "B \\to (A \\lor B)" }
    axiom Ax8 { formula = "(A \\to C) \\to ((B \\to C) \\to ((A \\lor B) \\to C))" }
    axiom Ax9 { formula = "A \\lor (A \\to B)" }
    axiom Ax10 { formula = "A \\lor \\neg A" }
    axiom bc1 { formula = "\\circ A \\to (A \\to (\\neg A \\to B))" }
    rule modus_ponens { premise = ["A", "A \\to B"] conclusion = "B" }
  }
  semantics "Bivaluations" {
    type = "NonTruthFunctionalBivaluations"
    domain = ["0", "1"]
    designated = ["1"]
    restriction conjunction { expression = "v(A and B) = 1 iff v(A) = 1 and v(B) = 1" }
    restriction disjunction { expression = "v(A or B) = 1 iff v(A) = 1 or v(B) = 1" }
    restriction implication { expression = "v(A implies B) = 1 iff v(A) = 0 or v(B) = 1" }
    restriction negation { expression = "v(not A) = 0 implies v(A) = 1" }
    restriction consistency { expression = "v(circle A) = 1 implies v(A) = 0 or v(not A) = 0" }
  }
}


logic J3 {
  metadata {
    name = "D’Ottaviano–da Costa logic"
    family = "Paraconsistent"
    aliases = ["J_3" { author = "I. M. L. D’Ottaviano and N. C. A. da Costa", year = 1970 }, "J₃"]
    desc = "A three-valued paraconsistent system. Related formulations include LFI1; the correspondence requires an appropriate translation of the extra connectives."
    authors = ["I. M. L. D’Ottaviano","N. C. A. da Costa"]
    year = 1970
    tags = ["LFI","Three-valued"]
    properties { explosion = "Not valid" excluded_middle = "Valid" double_negation = "Valid" }
    references = ["twist","taxonomy"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator nabla(1)
  }
  semantics "Matrix fragment" {
    type = "ValuationMatrix"
    domain = ["F","B","T"]
    designated = ["B","T"]
    operator_mapping not { "F" -> "T" "B" -> "B" "T" -> "F" }
    operator_mapping nabla { "F" -> "F" "B" -> "T" "T" -> "T" }
  }
}

logic LFI1 {
  metadata {
    name = "Logic of formal inconsistency 1"
    family = "Paraconsistent"
    aliases = ["LFI1" { author = "W. A. Carnielli, J. Marcos and S. de Amo", year = 2000 }]
    desc = "An LFI formulation of the three-valued system associated with J₃. Its explicit consistency operator separates inconsistent from consistent truth values."
    authors = ["Walter A. Carnielli","João Marcos","Sandra de Amo"]
    year = 2000
    tags = ["LFI","Three-valued"]
    properties { record_kind = "Logic" axiomatization = "Inherited Hilbert schemata" definition = "Cie + (cj1) + (cj2) + (cj3)" source_location = "Theorem 127; bullet A abbreviates not circle A"  explosion = "Not valid" excluded_middle = "Valid" double_negation = "Valid" gentle_explosion = "Valid with $\\circ A$" }
    references = ["databases","twist","lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cie."Hilbert"
    axiom cj1 { formula = "\\neg\\circ(A\\land B)\\leftrightarrow ((\\neg\\circ A\\land B)\\lor(\\neg\\circ B\\land A))" }
    axiom cj2 { formula = "\\neg\\circ(A\\lor B)\\leftrightarrow ((\\neg\\circ A\\land\\neg B)\\lor(\\neg\\circ B\\land\\neg A))" }
    axiom cj3 { formula = "\\neg\\circ(A\\to B)\\leftrightarrow(A\\land\\neg\\circ B)" }
  }
  semantics "Matrix fragment" {
    type = "ValuationMatrix"
    domain = ["F","B","T"]
    designated = ["B","T"]
    operator_mapping not { "F" -> "T" "B" -> "B" "T" -> "F" }
    operator_mapping circle { "F" -> "T" "B" -> "F" "T" -> "T" }
  }
}

relation {
  type = "extension"
  parent = FDE
  child = K3
  desc = "Restrict the four-valued matrix to {F, N, T}, in the shared ∧, ∨, ¬ language."
  status = "Literature-backed"
  references = ["many"]
}

relation {
  type = "extension"
  parent = FDE
  child = LP
  desc = "Restrict the four-valued matrix to {F, B, T}, in the shared ∧, ∨, ¬ language."
  status = "Literature-backed"
  references = ["many"]
}

relation {
  type = "extension"
  parent = K3
  child = CPL
  desc = "Restrict to classical valuations, in the shared ∧, ∨, ¬ language. Direction: weaker to stronger consequence."
  status = "Literature-backed"
  references = ["many"]
}

relation {
  type = "extension"
  parent = LP
  child = CPL
  desc = "Restrict to classical valuations, in the shared ∧, ∨, ¬ language. LP and CPL share tautologies here but differ in consequence."
  status = "Literature-backed"
  references = ["many"]
}

relation {
  type = "extension"
  parent = IPC
  child = CPL
  desc = "Add excluded middle to intuitionistic propositional logic, in the shared propositional language."
  status = "Literature-backed"
  references = ["intuitionistic"]
}

relation {
  type = "extension"
  parent = K
  child = T
  desc = "Add axiom T: $\\Box A \\to  A$. Direction: base system to axiomatic extension."
  status = "Literature-backed"
  references = ["modal"]
}

relation {
  type = "extension"
  parent = T
  child = S4
  desc = "Add axiom 4: $\\Box A \\to  \\Box \\Box A$."
  status = "Literature-backed"
  references = ["modal"]
}

relation {
  type = "extension"
  parent = S4
  child = S5
  desc = "Add axiom 5: $\\Diamond A \\to  \\Box \\Diamond A$."
  status = "Literature-backed"
  references = ["modal"]
}

relation {
  type = "embedding"
  parent = IPC
  child = S4
  desc = "Gödel–McKinsey–Tarski translation: IPC proves A iff S4 proves its modal translation. This is an embedding, not an identity of languages."
  status = "Literature-backed"
  references = ["gmt"]
}

relation {
  type = "embedding"
  parent = CPL
  child = IPC
  desc = "Double-negation translation preserves and reflects provability. This does not identify classical and intuitionistic consequence in the original language."
  status = "Literature-backed"
  references = ["intuitionistic"]
}

relation {
  type = "equivalence"
  parent = J3
  child = LFI1
  desc = "Equivalent up to definable changes of language; the J₃ and LFI1 extra connectives differ. These nodes retain their separate historical formulations."
  status = "Literature-backed"
  references = ["twist"]
}


// LFIs: axiomatic extensions. The base presentation is inherited, not copied.

logic mbCciw {
  metadata {
    name = "mbC with weak inconsistency principle"
    family = "Paraconsistent"
    aliases = ["Ciw", "mbC(ciw)"]
    desc = "mbCciw extends mbC by (ciw). Ciw is the project’s agreed search alias; the canonical identifier is mbCciw."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbC + (ciw)"
      source_location = "Swap structures, Definition 8.1"
    }
    references = ["lfi_swap"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mbC."Hilbert"
    axiom ciw { formula = "\\circ A \\lor (A \\land \\neg A)" }
  }
}

logic mbCci {
  metadata {
    name = "mbC with explicit inconsistency"
    family = "Paraconsistent"
    aliases = ["mbC(ci)"]
    desc = "mbCci extends mbC by (ci)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbC + (ci)"
      source_location = "Swap structures, Definition 8.9"
    }
    references = ["lfi_swap"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mbC."Hilbert"
    axiom ci { formula = "\\neg\\circ A \\to (A \\land \\neg A)" }
  }
}

logic mbCcl {
  metadata {
    name = "mbC with consistency from non-contradiction"
    family = "Paraconsistent"
    aliases = ["mbC(cl)"]
    desc = "mbCcl extends mbC by (cl)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbC + (cl)"
      source_location = "Sections 3 and 4.1"
    }
    references = ["lfi_rnmatrix"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mbC."Hilbert"
    axiom cl { formula = "\\neg(A \\land \\neg A) \\to \\circ A" }
  }
}

logic bC {
  metadata {
    name = "Basic C-system"
    family = "Paraconsistent"
    aliases = []
    desc = "bC extends mbC by (cf)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbC + (cf)"
      source_location = "Definition 100"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mbC."Hilbert"
    axiom cf { formula = "\\neg\\neg A \\to A" }
  }
}

logic mbCe {
  metadata {
    name = "mbC with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "mbCe extends mbC by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbC + (ce)"
      source_location = "Definition 100"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mbC."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic bCe {
  metadata {
    name = "bC with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "bCe extends bC by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "bC + (ce)"
      source_location = "Definition 100"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.bC."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic mCi {
  metadata {
    name = "Minimal inconsistency system"
    family = "Paraconsistent"
    aliases = []
    desc = "mCi extends mbC by (ci), (ccn). The (cc)n schema ranges over every natural n >= 0; this is stronger than merely adding (ci)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbC + (ci) + (ccn)"
      source_location = "Definition 75"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mbC."Hilbert"
    axiom ci { formula = "\\neg\\circ A \\to (A \\land \\neg A)" }
    axiom ccn { desc = "For every natural n >= 0; neg^n denotes iterated negation, not an additional connective." formula = "\\circ(\\neg^{n}(\\circ A))\\quad(n\\geq 0)" }
  }
}

logic mCie {
  metadata {
    name = "mCi with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "mCie extends mCi by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mCi + (ce)"
      source_location = "Definition 100"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mCi."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Ci {
  metadata {
    name = "Logic Ci"
    family = "Paraconsistent"
    aliases = []
    desc = "Ci extends mbCci by (cf)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbCci + (cf)"
      source_location = "Theorem 102"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.mbCci."Hilbert"
    axiom cf { formula = "\\neg\\neg A \\to A" }
  }
}

logic Cie {
  metadata {
    name = "Involutive extension of Ci"
    family = "Paraconsistent"
    aliases = []
    desc = "Cie extends Ci by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Ci + (ce)"
      source_location = "Definition 100"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Ci."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Cil {
  metadata {
    name = "Ci with consistency from non-contradiction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cil extends Ci by (cl)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Ci + (cl)"
      source_location = "Definition 105"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Ci."Hilbert"
    axiom cl { formula = "\\neg(A \\land \\neg A) \\to \\circ A" }
  }
}

logic Cile {
  metadata {
    name = "Cil with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cile extends Cil by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cil + (ce)"
      source_location = "Definition 105"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cil."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Cia {
  metadata {
    name = "Ci with conjunctive consistency propagation"
    family = "Paraconsistent"
    aliases = []
    desc = "Cia extends Ci by (ca1), (ca2), (ca3)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Ci + (ca1) + (ca2) + (ca3)"
      source_location = "Definition 108(i)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Ci."Hilbert"
    axiom ca1 { formula = "(\\circ A \\land \\circ B) \\to \\circ(A \\land B)" }
    axiom ca2 { formula = "(\\circ A \\land \\circ B) \\to \\circ(A \\lor B)" }
    axiom ca3 { formula = "(\\circ A \\land \\circ B) \\to \\circ(A \\to B)" }
  }
}

logic Cila {
  metadata {
    name = "Cila: propagation and non-contradiction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cila extends Cia by (cl). Its original-language fragment is C1; primitive consistency is not interchangeable with its abbreviation in arbitrary contexts."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cia + (cl)"
      source_location = "Definition 108(ii); Remark 109 and Theorem 110"
    }
    references = ["lfi_handbook", "lfi_rnmatrix"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cia."Hilbert"
    axiom cl { formula = "\\neg(A \\land \\neg A) \\to \\circ A" }
  }
}

logic Cilae {
  metadata {
    name = "Cila with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cilae extends Cila by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cila + (ce)"
      source_location = "Definition 108(ii)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cila."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Cida {
  metadata {
    name = "Cia with reversed non-contradiction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cida extends Cia by (cd)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cia + (cd)"
      source_location = "Definition 108(ii)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cia."Hilbert"
    axiom cd { formula = "\\neg(\\neg A \\land A) \\to \\circ A" }
  }
}

logic Cidae {
  metadata {
    name = "Cida with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cidae extends Cida by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cida + (ce)"
      source_location = "Definition 108(ii)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cida."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Ciba {
  metadata {
    name = "Cia with both orders of non-contradiction"
    family = "Paraconsistent"
    aliases = []
    desc = "Ciba extends Cia by (cb)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cia + (cb)"
      source_location = "Definition 108(ii)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cia."Hilbert"
    axiom cb { formula = "(\\neg(A \\land \\neg A) \\lor \\neg(\\neg A \\land A)) \\to \\circ A" }
  }
}

logic Cibae {
  metadata {
    name = "Ciba with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cibae extends Ciba by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Ciba + (ce)"
      source_location = "Definition 108(ii)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Ciba."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Cio {
  metadata {
    name = "Ci with disjunctive consistency propagation"
    family = "Paraconsistent"
    aliases = []
    desc = "Cio extends Ci by (co1), (co2), (co3)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Ci + (co1) + (co2) + (co3)"
      source_location = "Definition 114(i)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Ci."Hilbert"
    axiom co1 { formula = "(\\circ A \\lor \\circ B) \\to \\circ(A \\land B)" }
    axiom co2 { formula = "(\\circ A \\lor \\circ B) \\to \\circ(A \\lor B)" }
    axiom co3 { formula = "(\\circ A \\lor \\circ B) \\to \\circ(A \\to B)" }
  }
}

logic Cilo {
  metadata {
    name = "Cio with consistency from non-contradiction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cilo extends Cio by (cl)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cio + (cl)"
      source_location = "Definition 114(ii)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cio."Hilbert"
    axiom cl { formula = "\\neg(A \\land \\neg A) \\to \\circ A" }
  }
}

logic Cioe {
  metadata {
    name = "Cio with double-negation introduction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cioe extends Cio by (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cio + (ce)"
      source_location = "Section 7, discussion of further systems"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cio."Hilbert"
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Ciboe {
  metadata {
    name = "Disjunctive propagation with both orders and involution"
    family = "Paraconsistent"
    aliases = []
    desc = "Ciboe extends Cio by (cb), (ce)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cio + (cb) + (ce)"
      source_location = "Footnote 17, Section 7; suffixes (cb), (ce)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cio."Hilbert"
    axiom cb { formula = "(\\neg(A \\land \\neg A) \\lor \\neg(\\neg A \\land A)) \\to \\circ A" }
    axiom ce { formula = "A \\to \\neg\\neg A" }
  }
}

logic Cl {
  metadata {
    name = "bC with consistency from non-contradiction"
    family = "Paraconsistent"
    aliases = []
    desc = "Cl extends bC by (cl)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "bC + (cl)"
      source_location = "Remark 111"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.bC."Hilbert"
    axiom cl { formula = "\\neg(A \\land \\neg A) \\to \\circ A" }
  }
}

logic Cla {
  metadata {
    name = "Cl with conjunctive consistency propagation"
    family = "Paraconsistent"
    aliases = []
    desc = "Cla extends Cl by (ca1), (ca2), (ca3)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Cl + (ca1) + (ca2) + (ca3)"
      source_location = "Remark 111"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cl."Hilbert"
    axiom ca1 { formula = "(\\circ A \\land \\circ B) \\to \\circ(A \\land B)" }
    axiom ca2 { formula = "(\\circ A \\land \\circ B) \\to \\circ(A \\lor B)" }
    axiom ca3 { formula = "(\\circ A \\land \\circ B) \\to \\circ(A \\to B)" }
  }
}

logic P1 {
  metadata {
    name = "Sette’s three-valued LFI"
    family = "Paraconsistent"
    aliases = ["Sette P1"]
    desc = "P1 extends Ci by (cz_not), (cz_and), (cz_or), (cz_implies), (cz_circle)."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "Ci + (cz_not) + (cz_and) + (cz_or) + (cz_implies) + (cz_circle)"
      source_location = "Theorem 127"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Ci."Hilbert"
    axiom cz_not { formula = "\\circ(\\neg A)" }
    axiom cz_and { formula = "\\circ(A\\land B)" }
    axiom cz_or { formula = "\\circ(A\\lor B)" }
    axiom cz_implies { formula = "\\circ(A\\to B)" }
    axiom cz_circle { formula = "\\circ(\\circ A)" }
  }
}

logic Comega {
  metadata {
    name = "da Costa’s logic Cω"
    family = "Paraconsistent"
    aliases = ["C_omega", "Cω", "C_ω", "C_{omega}", "Cω (da Costa)"]
    desc = "Positive intuitionistic logic plus excluded middle and double-negation elimination. Cω is weaker than Cmin, is not an LFI, and is not the deductive limit of the finite Cn hierarchy. The genuine deductive limit is a different logic, CLim."
    authors = ["Newton C. A. da Costa"]
    tags = ["Non-LFI", "da Costa hierarchy", "Boundary", "Hilbert"]
    properties {
      record_kind = "Logic"
      lfi = "No"
      explosion = "Not valid"
      excluded_middle = "Valid"
      double_negation_elimination = "Valid"
      definition = "IPL+ + excluded middle + double-negation elimination"
      axiomatization = "Complete Hilbert schemata"
      deductive_limit = "Not the deductive limit of the finite Cn hierarchy"
      source_location = "Handbook Definition 40; discussion preceding Definition 28"
    }
    references = ["lfi_handbook"]
  }
  signature { operator not(1) operator and(2) operator or(2) operator implies(2) }
  presentation "Hilbert" {
    type = "Hilbert"
    axiom Ax1 { formula = "A \\to (B \\to A)" }
    axiom Ax2 { formula = "(A \\to B) \\to ((A \\to (B \\to C)) \\to (A \\to C))" }
    axiom Ax3 { formula = "A \\to (B \\to (A \\land B))" }
    axiom Ax4 { formula = "(A \\land B) \\to A" }
    axiom Ax5 { formula = "(A \\land B) \\to B" }
    axiom Ax6 { formula = "A \\to (A \\lor B)" }
    axiom Ax7 { formula = "B \\to (A \\lor B)" }
    axiom Ax8 { formula = "(A \\to C) \\to ((B \\to C) \\to ((A \\lor B) \\to C))" }
    axiom Ax10 { formula = "A \\lor \\neg A" }
    axiom cf { formula = "\\neg\\neg A \\to A" }
    rule modus_ponens { premise = ["A", "A \\to B"] conclusion = "B" }
  }
}

logic Cmin {
  metadata {
    name = "Minimal C-system boundary (not an LFI)"
    family = "Paraconsistent"
    aliases = ["C_min"]
    desc = "Positive classical logic plus excluded middle and double-negation elimination. This boundary calculus is not an LFI; C1 and the Cn family extend it by consistency-controlled schemata."
    tags = ["Non-LFI", "da Costa hierarchy", "Boundary", "Hilbert"]
    properties { record_kind = "Logic" lfi = "No" explosion = "Not valid" excluded_middle = "Valid" definition = "PI + (cf)" source_location = "Definitions 36 and 40; Theorem 39" }
    references = ["lfi_handbook"]
  }
  signature { operator not(1) operator and(2) operator or(2) operator implies(2) }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Comega."Hilbert"
    axiom Ax9 { formula = "A \\lor (A \\to B)" }
  }
}
logic C1Plus {
  metadata {
    name = "da Costa–Béziau logic C₁⁺"
    family = "Paraconsistent"
    aliases = ["C_1+", "C₁⁺", "Cilo without primitive consistency"]
    desc = "The original-signature version of Cilo. This separate extension of the n = 1 case of Cn adds disjunctive propagation. Its presentation explicitly fixes n = 1; it does not inherit the whole parameterized family."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\neg(A\\land\\neg A)$"
      axiomatization = "Hilbert schemata"
      source_location = "Definition 114(ii)"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cmin."Hilbert"
    axiom bc1 { formula = "\\neg(A\\land\\neg A) \\to (A \\to (\\neg A \\to B))" }
    axiom ca1 { formula = "(\\neg(A\\land\\neg A) \\land \\neg(B\\land\\neg B)) \\to \\neg((A\\land B)\\land\\neg (A\\land B))" }
    axiom ca2 { formula = "(\\neg(A\\land\\neg A) \\land \\neg(B\\land\\neg B)) \\to \\neg((A\\lor B)\\land\\neg (A\\lor B))" }
    axiom ca3 { formula = "(\\neg(A\\land\\neg A) \\land \\neg(B\\land\\neg B)) \\to \\neg((A\\to B)\\land\\neg (A\\to B))" }
    axiom co1 { formula = "(\\neg(A\\land\\neg A) \\lor \\neg(B\\land\\neg B)) \\to \\neg((A\\land B)\\land\\neg (A\\land B))" }
    axiom co2 { formula = "(\\neg(A\\land\\neg A) \\lor \\neg(B\\land\\neg B)) \\to \\neg((A\\lor B)\\land\\neg (A\\lor B))" }
    axiom co3 { formula = "(\\neg(A\\land\\neg A) \\lor \\neg(B\\land\\neg B)) \\to \\neg((A\\to B)\\land\\neg (A\\to B))" }
  }
}

logic RmbC {
  metadata {
    name = "Replacement-enriched mbC"
    family = "Paraconsistent"
    aliases = []
    desc = "Adds global replacement rules for negation and consistency. Their premises must be theorems; they cannot be applied to arbitrary hypotheses."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "mbC + global replacement for negation and consistency"
      replacement = "Valid"
      consequence = "Local consequence; global rules require theorem premises"
      source_location = "Definitions 2.5–2.6"
    }
    references = ["lfi_replacement"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.mbC."Hilbert"
    rule global_replacement_not { premise = ["\\vdash (A\\leftrightarrow B)"] conclusion = "\\vdash (\\neg A\\leftrightarrow\\neg B)" }
    rule global_replacement_circle { premise = ["\\vdash (A\\leftrightarrow B)"] conclusion = "\\vdash (\\circ A\\leftrightarrow\\circ B)" }
  }
}

logic RbC {
  metadata {
    name = "Replacement-enriched bC"
    family = "Paraconsistent"
    aliases = []
    desc = "RmbC plus cf. Global replacement remains theorem-level."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "RmbC + cf"
      replacement = "Valid"
      consequence = "Local consequence; global rules require theorem premises"
      source_location = "Example 3.9"
    }
    references = ["lfi_replacement"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.RmbC."Hilbert"
    axiom cf { formula = "\\neg\\neg A \\to A" }
  }
}

logic RCi {
  metadata {
    name = "Replacement-enriched Ci"
    family = "Paraconsistent"
    aliases = []
    desc = "RbC plus ci. Global replacement remains theorem-level."
    tags = ["LFI", "Consistency", "Hilbert"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Inherited Hilbert schemata"
      definition = "RbC + ci"
      replacement = "Valid"
      consequence = "Local consequence; global rules require theorem premises"
      source_location = "Example 3.10"
    }
    references = ["lfi_replacement"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.RbC."Hilbert"
    axiom ci { formula = "\\neg\\circ A \\to (A \\land \\neg A)" }
  }
}

logic Cn {
  metadata {
    name = "da Costa’s Cₙ hierarchy"
    family = "Paraconsistent"
    aliases = ["C_n", "Cₙ", "C_{n}", "finite da Costa hierarchy"]
    desc = "A single catalog entry for da Costa’s finite hierarchy: fix any integer n >= 1 to obtain the corresponding calculus. C₁ through C₁₀ and all higher finite cases are covered here. Cω is separate. The original signature has no primitive consistency symbol."
    tags = ["LFI", "da Costa hierarchy", "LFI family", "Hilbert"]
    properties {
      record_kind = "Family"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\operatorname{Cons}_n(A)$"
      axiomatization = "Hilbert schemata for each fixed finite n, with Cmin inherited. The parameter is fixed for a calculus; it is not quantified inside formulas."
      parameter = "n is any finite integer >= 1; n = omega is excluded"
      hierarchy_order = "$C_{n+1}\\subsetneq C_n$ for every finite $n\\geq 1$; increasing n weakens the logic in the common signature."
      n_one_relationships = "For n = 1 only: Cila is a conservative expansion by primitive consistency, and C1Plus adds disjunctive propagation. The parameter-case edges do not assert these claims for arbitrary n."
      cardinality = "Countably infinite"
      consistency = "$A^0=A$; $A^1=\\neg(A\\land\\neg A)$; $A^{k+1}=\\neg(A^k\\land\\neg A^k)$; $\\operatorname{Cons}_n(A)=\\bigwedge_{k=1}^{n}A^k$"
      source_location = "Definition 28; 2021 RNmatrix paper, Section 5.2"
    }
    references = ["lfi_handbook", "lfi_rnmatrix"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
  }
  presentation "Hilbert" {
    type = "Hilbert"
    extends = presentation.Cmin."Hilbert"
    axiom bc_n { formula = "\\operatorname{Cons}_n(A)\\to(A\\to(\\neg A\\to B))" }
    axiom ca_n_1 { formula = "(\\operatorname{Cons}_n(A)\\land\\operatorname{Cons}_n(B))\\to\\operatorname{Cons}_n(A \\land B)" }
    axiom ca_n_2 { formula = "(\\operatorname{Cons}_n(A)\\land\\operatorname{Cons}_n(B))\\to\\operatorname{Cons}_n(A \\lor B)" }
    axiom ca_n_3 { formula = "(\\operatorname{Cons}_n(A)\\land\\operatorname{Cons}_n(B))\\to\\operatorname{Cons}_n(A \\to B)" }
  }
}

logic EightKb {
  metadata {
    name = "8Kb: three-valued LFI family"
    family = "Paraconsistent"
    aliases = ["8Kb", "8192 LFIs", "8K"]
    desc = "A family of 8192 matrices. Choose one allowed output per table cell once for the entire matrix; the choices are independent. The arrays encode family parameters, not a nondeterministic semantics for one logic."
    tags = ["LFI", "LFI family", "Hilbert"]
    properties {
      record_kind = "Family"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ A$"
      axiomatization = "Parameterized matrices"
      cardinality = "8192 = 2^13"
      parameter = "13 binary choices fixed globally; not valuation-by-valuation choices"
      source_location = "Definition 129; Theorems 130–131"
    }
    references = ["lfi_handbook"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
  }
  semantics "Three-valued matrix parameter space" {
    type = "ParameterizedMatrices"
    domain = ["F", "B", "T"]
    designated = ["B", "T"]
    operator_mapping not { "F" -> "T" "B" -> ["B", "T"] "T" -> "F" }
    operator_mapping circle { "F" -> "T" "B" -> "F" "T" -> "T" }
    operator_mapping bullet { "F" -> "F" "B" -> "T" "T" -> "F" }
    operator_mapping and {
      ["F", "F"] -> "F"
      ["F", "B"] -> "F"
      ["F", "T"] -> "F"
      ["B", "F"] -> "F"
      ["B", "B"] -> ["B", "T"]
      ["B", "T"] -> ["B", "T"]
      ["T", "F"] -> "F"
      ["T", "B"] -> ["B", "T"]
      ["T", "T"] -> "T"
    }
    operator_mapping or {
      ["F", "F"] -> "F"
      ["F", "B"] -> ["B", "T"]
      ["F", "T"] -> "T"
      ["B", "F"] -> ["B", "T"]
      ["B", "B"] -> ["B", "T"]
      ["B", "T"] -> ["B", "T"]
      ["T", "F"] -> "T"
      ["T", "B"] -> ["B", "T"]
      ["T", "T"] -> "T"
    }
    operator_mapping implies {
      ["F", "F"] -> "T"
      ["F", "B"] -> ["B", "T"]
      ["F", "T"] -> "T"
      ["B", "F"] -> "F"
      ["B", "B"] -> ["B", "T"]
      ["B", "T"] -> ["B", "T"]
      ["T", "F"] -> "F"
      ["T", "B"] -> ["B", "T"]
      ["T", "T"] -> "T"
    }
  }
}

relation {
  type = "extension"
  parent = mbC
  child = mbCciw
  desc = "Add (ciw): $\\circ A \\lor (A \\land \\neg A)$. Swap structures, Definition 8.1. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_swap"]
}

relation {
  type = "extension"
  parent = mbC
  child = mbCci
  desc = "Add (ci): $\\neg\\circ A \\to (A \\land \\neg A)$. Swap structures, Definition 8.9. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_swap"]
}

relation {
  type = "extension"
  parent = mbC
  child = mbCcl
  desc = "Add (cl): $\\neg(A \\land \\neg A) \\to \\circ A$. Section 2. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_rnmatrix"]
}

relation {
  type = "extension"
  parent = mbC
  child = bC
  desc = "Add (cf): $\\neg\\neg A \\to A$. Definition 100. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbC
  child = mbCe
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 100. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = bC
  child = bCe
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 100. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbC
  child = mCi
  desc = "Add (ci): $\\neg\\circ A \\to (A \\land \\neg A)$, (ccn): $\\circ(\\neg^{n}(\\circ A))\\quad(n\\geq 0)$. Definition 75. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mCi
  child = mCie
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 100. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbCci
  child = Ci
  desc = "Add (cf): $\\neg\\neg A \\to A$. Theorem 102. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Ci
  child = Cie
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 100. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Ci
  child = Cil
  desc = "Add (cl): $\\neg(A \\land \\neg A) \\to \\circ A$. Definition 105. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cil
  child = Cile
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 105. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Ci
  child = Cia
  desc = "Add (ca1): $(\\circ A \\land \\circ B) \\to \\circ(A \\land B)$, (ca2): $(\\circ A \\land \\circ B) \\to \\circ(A \\lor B)$, (ca3): $(\\circ A \\land \\circ B) \\to \\circ(A \\to B)$. Definition 108(i). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cia
  child = Cila
  desc = "Add (cl): $\\neg(A \\land \\neg A) \\to \\circ A$. Definition 108(ii); Remark 109 and Theorem 110. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook", "lfi_rnmatrix"]
}

relation {
  type = "extension"
  parent = Cila
  child = Cilae
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 108(ii). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cia
  child = Cida
  desc = "Add (cd): $\\neg(\\neg A \\land A) \\to \\circ A$. Definition 108(ii). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cida
  child = Cidae
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 108(ii). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cia
  child = Ciba
  desc = "Add (cb): $(\\neg(A \\land \\neg A) \\lor \\neg(\\neg A \\land A)) \\to \\circ A$. Definition 108(ii). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Ciba
  child = Cibae
  desc = "Add (ce): $A \\to \\neg\\neg A$. Definition 108(ii). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Ci
  child = Cio
  desc = "Add (co1): $(\\circ A \\lor \\circ B) \\to \\circ(A \\land B)$, (co2): $(\\circ A \\lor \\circ B) \\to \\circ(A \\lor B)$, (co3): $(\\circ A \\lor \\circ B) \\to \\circ(A \\to B)$. Definition 114(i). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cio
  child = Cilo
  desc = "Add (cl): $\\neg(A \\land \\neg A) \\to \\circ A$. Definition 114(ii). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cio
  child = Cioe
  desc = "Add (ce): $A \\to \\neg\\neg A$. Section 7, discussion of further systems. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cio
  child = Ciboe
  desc = "Add (cb): $(\\neg(A \\land \\neg A) \\lor \\neg(\\neg A \\land A)) \\to \\circ A$, (ce): $A \\to \\neg\\neg A$. Footnote 17, Section 7; suffixes (cb), (ce). All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = bC
  child = Cl
  desc = "Add (cl): $\\neg(A \\land \\neg A) \\to \\circ A$. Remark 111. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cl
  child = Cla
  desc = "Add (ca1): $(\\circ A \\land \\circ B) \\to \\circ(A \\land B)$, (ca2): $(\\circ A \\land \\circ B) \\to \\circ(A \\lor B)$, (ca3): $(\\circ A \\land \\circ B) \\to \\circ(A \\to B)$. Remark 111. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Ci
  child = P1
  desc = "Add (cz_not): $\\circ(\\neg A)$, (cz_and): $\\circ(A\\land B)$, (cz_or): $\\circ(A\\lor B)$, (cz_implies): $\\circ(A\\to B)$, (cz_circle): $\\circ(\\circ A)$. Theorem 127. All inherited axioms and rules remain in force."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbCciw
  child = mbCci
  desc = "Add (ci). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_swap"]
}

relation {
  type = "extension"
  parent = mCi
  child = Ci
  desc = "Add (cf). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = bC
  child = Ci
  desc = "Add (ci). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbCe
  child = bCe
  desc = "Add (cf). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mCie
  child = Cie
  desc = "Add (cf). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = bCe
  child = Cie
  desc = "Add (ci). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cil
  child = Cila
  desc = "Add (ca1), (ca2), (ca3). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cile
  child = Cilae
  desc = "Add (ca1), (ca2), (ca3). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cia
  child = Cio
  desc = "Add (co1), (co2), (co3). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cila
  child = Cilo
  desc = "Add (co1), (co2), (co3). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbCcl
  child = Cil
  desc = "Add (ci), (cf). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbCcl
  child = Cl
  desc = "Add (cf). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cla
  child = Cila
  desc = "Add (ci). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cila
  child = Ciba
  desc = "Add (cb). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cilae
  child = Cibae
  desc = "Add (cb). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cida
  child = Ciba
  desc = "Add (cb). Axiomatizations may contain redundant schemata; this edge is not a claim of a Hasse cover."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = Cie
  child = LFI1
  desc = "Add inconsistency-propagation schemata (cj1)–(cj3), with bullet A defined as not circle A. Handbook Theorem 127."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "parameter_case"
  parent = Cn
  child = C1Plus
  desc = "For n = 1 only: C1Plus extends the n = 1 member of Cn by disjunctive propagation of the defined consistency abbreviation. This is not a family-wide claim. Definition 114."
  status = "Literature-backed; n = 1 only"
  references = ["lfi_handbook"]
}

relation {
  type = "parameter_case"
  parent = Cn
  child = Cila
  desc = "For n = 1 only: Cila conservatively expands the n = 1 member of Cn by primitive consistency. Theorem 110 preserves and reflects consequence on the original signature; Remark 109 warns that substituting the consistency abbreviation is not generally equivalence in arbitrary contexts. No corresponding claim is made here for every finite n."
  status = "Literature-backed; n = 1 only"
  references = ["lfi_handbook"]
}

relation {
  type = "conservative_extension"
  parent = C1Plus
  child = Cilo
  desc = "Cilo conservatively expands its original-signature presentation C1+ by primitive consistency. Definition 114 and the translation construction of Theorem 106."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "extension"
  parent = mbC
  child = RmbC
  desc = "Add theorem-level replacement for negation and consistency; replacement rules have global premises. Definitions 2.5–2.6."
  status = "Literature-backed"
  references = ["lfi_replacement"]
}

relation {
  type = "extension"
  parent = RmbC
  child = RbC
  desc = "Add cf; global replacement remains theorem-level. Example 3.9."
  status = "Literature-backed"
  references = ["lfi_replacement"]
}

relation {
  type = "extension"
  parent = RbC
  child = RCi
  desc = "Add ci; global replacement remains theorem-level. Example 3.10."
  status = "Literature-backed"
  references = ["lfi_replacement"]
}

relation {
  type = "extension"
  parent = bC
  child = RbC
  desc = "Add the two theorem-level replacement rules. Example 3.9."
  status = "Literature-backed"
  references = ["lfi_replacement"]
}

relation {
  type = "extension"
  parent = Ci
  child = RCi
  desc = "Add the two theorem-level replacement rules. Example 3.10."
  status = "Literature-backed"
  references = ["lfi_replacement"]
}


relation {
  type = "instance"
  parent = EightKb
  child = LFI1
  desc = "LFI1 is a member of the 8Kb matrix family. Section 5.3."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "instance"
  parent = EightKb
  child = P1
  desc = "P1 is a member of the 8Kb matrix family. Section 5.3."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

relation {
  type = "family_extension"
  parent = Cia
  child = EightKb
  desc = "Every member of 8Kb axiomatically extends Cia, after the stated signature adjustments. This is a universal family claim, not inclusion between two individual logics. Theorem 130."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}


relation {
  type = "extension"
  parent = Comega
  child = Cmin
  desc = "Add (Ax9), positive classicality: $A \\lor (A \\to B)$. Cω has positive intuitionistic logic as its base; Cmin has positive classical logic. Both are non-LFI boundary systems. Handbook Definition 40."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}
relation {
  type = "family_extension"
  parent = Cmin
  child = Cn
  desc = "Every finite Cn, n >= 1, extends Cmin. This is a family-wide inclusion, not an identification of Cω with the deductive limit. Handbook Definitions 28 and 40."
  status = "Literature-backed"
  references = ["lfi_handbook"]
}

// Epistemic, program-dynamic and dynamic epistemic systems.
// Indexed operators and program sorts below are documented metasyntax.

source epistemic_intro {
  title = "An Introduction to Logics of Knowledge and Belief"
  url = "https://arxiv.org/abs/1503.00806"
  authors = ["Hans van Ditmarsch", "Joseph Y. Halpern", "Wiebe van der Hoek", "Barteld Kooi"]
  year = 2015
}

source epistemic_guide {
  title = "A guide to completeness and complexity for modal logics of knowledge and belief"
  url = "https://doi.org/10.1016/0004-3702(92)90049-4"
  authors = ["Joseph Y. Halpern", "Yoram Moses"]
  year = 1992
}

source dynamic_logic {
  title = "Dynamic Logic"
  url = "https://doi.org/10.7551/mitpress/2516.001.0001"
  authors = ["David Harel", "Dexter Kozen", "Jerzy Tiuryn"]
  year = 2000
}

source pdl_fischer_ladner {
  title = "Propositional dynamic logic of regular programs"
  url = "https://doi.org/10.1016/0022-0000(79)90046-1"
  authors = ["Michael J. Fischer", "Richard E. Ladner"]
  year = 1979
}

source bms_actions {
  title = "The Logic of Public Announcements, Common Knowledge, and Private Suspicions (SEN-R9922)"
  url = "https://ir.cwi.nl/pub/4497/04497D.pdf"
  authors = ["Alexandru Baltag", "Lawrence S. Moss", "Slawomir Solecki"]
  year = 1999
}

source apal {
  title = "Knowable as known after an announcement"
  url = "https://www.cambridge.org/core/journals/review-of-symbolic-logic/article/abs/knowable-as-known-after-an-announcement/DB575914EEF37C98652C369925B72770"
  authors = ["Philippe Balbiani", "Alexandru Baltag", "Hans van Ditmarsch", "Andreas Herzig", "Tomohiro Hoshi", "Tiago de Lima"]
  year = 2008
}

logic EpistemicK {
  metadata {
    name = "Multi-agent epistemic K"
    family = "Epistemic"
    aliases = ["K_I", "multi-agent K"]
    desc = "Independent normal modalities for several agents; arbitrary accessibility relations need not make knowledge factive."
    tags = ["Knowledge", "Multi-agent"]
    properties { axiomatization = "Classical tautology schemata, K, modus ponens and theorem-level necessitation for each agent." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
  }
  presentation "Schemata" {
    type = "Hilbert schemata"
    axiom tautologies { desc = "All classical tautology schemata with arbitrary formula substitution." formula = "\\theta[\\varphi_1/p_1,\\ldots,\\varphi_n/p_n]\\quad(\\theta\\in\\operatorname{Taut}_{\\mathrm{CPL}})" }
    axiom K { desc = "Normal distribution for each agent." formula = "K_i(\\varphi\\to\\psi)\\to(K_i\\varphi\\to K_i\\psi)" }
    rule MP { premise = ["\\varphi", "\\varphi\\to\\psi"] conclusion = "\\psi" }
    rule necessitation { premise = ["\\vdash\\varphi"] conclusion = "\\vdash K_i\\varphi" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Nonempty W; arbitrary R_i subset W x W; classical propositional valuation." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

logic EpistemicT {
  metadata {
    name = "Multi-agent epistemic T"
    family = "Epistemic"
    aliases = []
    desc = "Multi-agent normal epistemic logic. Each R_i is reflexive."
    tags = ["Knowledge", "Multi-agent"]
    properties { axiomatization = "Inherited normal epistemic Hilbert schemata plus the displayed agent-wise axiom." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
  }
  presentation "Schemata" {
    type = "Hilbert schemata"
    extends = presentation.EpistemicK."Schemata"
    axiom T { desc = "Factivity." formula = "K_i\\varphi\\to\\varphi" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Each R_i is reflexive." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

relation {
  type = "extension"
  parent = EpistemicK
  child = EpistemicT
  desc = "Same indexed epistemic language; add the displayed axiom for every agent."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

logic EpistemicS4 {
  metadata {
    name = "Multi-agent epistemic S4"
    family = "Epistemic"
    aliases = []
    desc = "Multi-agent normal epistemic logic. Each R_i is reflexive and transitive."
    tags = ["Knowledge", "Multi-agent"]
    properties { axiomatization = "Inherited normal epistemic Hilbert schemata plus the displayed agent-wise axiom." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
  }
  presentation "Schemata" {
    type = "Hilbert schemata"
    extends = presentation.EpistemicT."Schemata"
    axiom four { desc = "Positive introspection." formula = "K_i\\varphi\\to K_iK_i\\varphi" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Each R_i is reflexive and transitive." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

relation {
  type = "extension"
  parent = EpistemicT
  child = EpistemicS4
  desc = "Same indexed epistemic language; add the displayed axiom for every agent."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

logic EpistemicS5 {
  metadata {
    name = "Multi-agent epistemic S5"
    family = "Epistemic"
    aliases = ["EL", "S5_I"]
    desc = "Multi-agent normal epistemic logic. Each R_i is an equivalence relation."
    tags = ["Knowledge", "Multi-agent"]
    properties { axiomatization = "Inherited normal epistemic Hilbert schemata plus the displayed agent-wise axiom." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
  }
  presentation "Schemata" {
    type = "Hilbert schemata"
    extends = presentation.EpistemicS4."Schemata"
    axiom five { desc = "Negative introspection." formula = "\\neg K_i\\varphi\\to K_i\\neg K_i\\varphi" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Each R_i is an equivalence relation." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

relation {
  type = "extension"
  parent = EpistemicS4
  child = EpistemicS5
  desc = "Same indexed epistemic language; add the displayed axiom for every agent."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

logic EpistemicCommon {
  metadata {
    name = "Epistemic logic with common knowledge"
    family = "Epistemic"
    aliases = ["EL+C"]
    desc = "S5 knowledge extended with group modalities. Common knowledge uses reachability through any finite chain; distributed knowledge pools the information of a group."
    tags = ["Knowledge", "Group knowledge"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." everyone = "$E_G\\varphi:=\\bigwedge_{i\\in G}K_i\\varphi$." scope = "S5 frames. Group interaction and induction principles are not fully axiomatized here." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator common(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.EpistemicS5."Schemata"
    axiom fixpoint { desc = "E_G psi abbreviates the conjunction of K_i psi over i in G." formula = "C_G\\varphi\\leftrightarrow(\\varphi\\land E_G C_G\\varphi)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Every R_i is an equivalence relation; common uses reflexive transitive closure, distributed uses intersection." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing common { condition = "$M,w\\models C_G\\varphi\\iff\\forall v\\,\\bigl(w(\\bigcup_{i\\in G}R_i)^*v\\Rightarrow M,v\\models\\varphi\\bigr)$" }
  }
}

relation {
  type = "conservative_extension"
  parent = EpistemicS5
  child = EpistemicCommon
  desc = "Adds group-indexed modalities with their stipulated semantics; validity of formulas in the original S5 epistemic language is preserved."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

logic EpistemicDistributed {
  metadata {
    name = "Epistemic logic with distributed knowledge"
    family = "Epistemic"
    aliases = ["EL+D"]
    desc = "S5 knowledge extended with group modalities. Common knowledge uses reachability through any finite chain; distributed knowledge pools the information of a group."
    tags = ["Knowledge", "Group knowledge"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." everyone = "$E_G\\varphi:=\\bigwedge_{i\\in G}K_i\\varphi$." scope = "S5 frames. Group interaction and induction principles are not fully axiomatized here." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator distributed(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.EpistemicS5."Schemata"
    axiom singleton { desc = "A singleton group has its individual knowledge." formula = "D_{\\{i\\}}\\varphi\\leftrightarrow K_i\\varphi" }
    axiom monotonicity { desc = "Pooling more agents can add information." formula = "D_G\\varphi\\to D_H\\varphi\\quad(G\\subseteq H)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Every R_i is an equivalence relation; common uses reflexive transitive closure, distributed uses intersection." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing distributed { condition = "$M,w\\models D_G\\varphi\\iff\\forall v\\,\\bigl(w(\\bigcap_{i\\in G}R_i)v\\Rightarrow M,v\\models\\varphi\\bigr)$" }
  }
}

relation {
  type = "conservative_extension"
  parent = EpistemicS5
  child = EpistemicDistributed
  desc = "Adds group-indexed modalities with their stipulated semantics; validity of formulas in the original S5 epistemic language is preserved."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

logic EpistemicCD {
  metadata {
    name = "Epistemic logic with common and distributed knowledge"
    family = "Epistemic"
    aliases = ["EL+C+D"]
    desc = "S5 knowledge extended with group modalities. Common knowledge uses reachability through any finite chain; distributed knowledge pools the information of a group."
    tags = ["Knowledge", "Group knowledge"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." everyone = "$E_G\\varphi:=\\bigwedge_{i\\in G}K_i\\varphi$." scope = "S5 frames. Group interaction and induction principles are not fully axiomatized here." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator common(1)
    operator distributed(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.EpistemicS5."Schemata"
    axiom fixpoint { desc = "E_G psi abbreviates the conjunction of K_i psi over i in G." formula = "C_G\\varphi\\leftrightarrow(\\varphi\\land E_G C_G\\varphi)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Every R_i is an equivalence relation; common uses reflexive transitive closure, distributed uses intersection." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing common { condition = "$M,w\\models C_G\\varphi\\iff\\forall v\\,\\bigl(w(\\bigcup_{i\\in G}R_i)^*v\\Rightarrow M,v\\models\\varphi\\bigr)$" }
    forcing distributed { condition = "$M,w\\models D_G\\varphi\\iff\\forall v\\,\\bigl(w(\\bigcap_{i\\in G}R_i)v\\Rightarrow M,v\\models\\varphi\\bigr)$" }
  }
}

relation {
  type = "conservative_extension"
  parent = EpistemicS5
  child = EpistemicCD
  desc = "Adds group-indexed modalities with their stipulated semantics; validity of formulas in the original S5 epistemic language is preserved."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

relation {
  type = "conservative_extension"
  parent = EpistemicCommon
  child = EpistemicCD
  desc = "Adds the other group modality over the same S5 models."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

relation {
  type = "conservative_extension"
  parent = EpistemicDistributed
  child = EpistemicCD
  desc = "Adds the other group modality over the same S5 models."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

logic KD45 {
  metadata {
    name = "Multi-agent doxastic KD45"
    family = "Doxastic"
    aliases = ["KD45_I", "belief logic"]
    desc = "Consistent, introspective belief. Beliefs may be false: factivity is not assumed."
    tags = ["Belief", "Multi-agent"]
    properties { axiomatization = "Classical tautology schemata, normal K for belief, D, 4, 5, MP and theorem-level belief necessitation." index_convention = "B_i is indexed by a fixed finite agent set I." }
    references = ["epistemic_intro", "epistemic_guide"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator believes(1)
  }
  presentation "Schemata" {
    type = "Hilbert schemata"
    axiom tautologies { desc = "All classical tautology schemata with arbitrary formula substitution." formula = "\\theta[\\varphi_1/p_1,\\ldots,\\varphi_n/p_n]\\quad(\\theta\\in\\operatorname{Taut}_{\\mathrm{CPL}})" }
    axiom K { desc = "Normal distribution for each agent." formula = "B_i(\\varphi\\to\\psi)\\to(B_i\\varphi\\to B_i\\psi)" }
    axiom D { desc = "Consistent belief." formula = "B_i\\varphi\\to\\neg B_i\\neg\\varphi" }
    axiom four { desc = "Positive introspection." formula = "B_i\\varphi\\to B_iB_i\\varphi" }
    axiom five { desc = "Negative introspection." formula = "\\neg B_i\\varphi\\to B_i\\neg B_i\\varphi" }
    rule MP { premise = ["\\varphi", "\\varphi\\to\\psi"] conclusion = "\\psi" }
    rule necessitation { premise = ["\\vdash\\varphi"] conclusion = "\\vdash B_i\\varphi" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction frames { expression = "Each R_i is serial, transitive and Euclidean; reflexivity is not required." }
    forcing belief { condition = "$M,w\\models B_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

relation {
  type = "embedding"
  parent = K
  child = EpistemicK
  desc = "Fix one agent i_0 and translate every box to K_{i_0}. This embeds the single-agent modal language, not an equivalence with the full multi-agent language."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

relation {
  type = "embedding"
  parent = T
  child = EpistemicT
  desc = "Fix one agent i_0 and translate every box to K_{i_0}. This embeds the single-agent modal language, not an equivalence with the full multi-agent language."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

relation {
  type = "embedding"
  parent = S4
  child = EpistemicS4
  desc = "Fix one agent i_0 and translate every box to K_{i_0}. This embeds the single-agent modal language, not an equivalence with the full multi-agent language."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

relation {
  type = "embedding"
  parent = S5
  child = EpistemicS5
  desc = "Fix one agent i_0 and translate every box to K_{i_0}. This embeds the single-agent modal language, not an equivalence with the full multi-agent language."
  status = "Literature-backed; scope specified"
  references = ["epistemic_intro", "epistemic_guide"]
}

logic TestFreePDL {
  metadata {
    name = "Test-free propositional dynamic logic"
    family = "Dynamic"
    aliases = ["PDL0", "test-free PDL"]
    desc = "The regular-program fragment with sequencing, choice and iteration, excluding tests."
    tags = ["Programs", "Iteration"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." program_syntax = "Two sorts: formulas and programs. Programs: $\\alpha ::= a\\mid\\alpha;\\beta\\mid\\alpha\\cup\\beta\\mid\\alpha^*$. The unary program_box denotes $[\\alpha]$ for a program parameter. The DSL stores these conventions and formula strings; it does not parse a program AST." scope = "Tests are excluded from program syntax. This fragment is less expressive than full PDL." }
    references = ["dynamic_logic", "pdl_fischer_ladner"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator program_box(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    axiom normal { desc = "Normal program modalities." formula = "[\\alpha](\\varphi\\to\\psi)\\to([\\alpha]\\varphi\\to[\\alpha]\\psi)" }
    axiom sequence { desc = "Sequential composition." formula = "[\\alpha;\\beta]\\varphi\\leftrightarrow[\\alpha][\\beta]\\varphi" }
    axiom choice { desc = "Nondeterministic choice." formula = "[\\alpha\\cup\\beta]\\varphi\\leftrightarrow([\\alpha]\\varphi\\land[\\beta]\\varphi)" }
    axiom unfold { desc = "Zero or more iterations." formula = "[\\alpha^*]\\varphi\\leftrightarrow(\\varphi\\land[\\alpha][\\alpha^*]\\varphi)" }
    axiom induction { desc = "Iteration induction." formula = "[\\alpha^*](\\varphi\\to[\\alpha]\\varphi)\\to(\\varphi\\to[\\alpha^*]\\varphi)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction program_relations { expression = "$R_{\\alpha;\\beta}=R_\\alpha;R_\\beta$, $R_{\\alpha\\cup\\beta}=R_\\alpha\\cup R_\\beta$, $R_{\\alpha^*}=(R_\\alpha)^*$. Classical valuations; arbitrary binary relations for atomic programs." }
    forcing box { condition = "$M,w\\models[\\alpha]\\varphi\\iff\\forall v\\,(wR_\\alpha v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

logic PDL {
  metadata {
    name = "Propositional dynamic logic"
    family = "Dynamic"
    aliases = ["regular PDL"]
    desc = "Reason about all possible terminating executions of regular programs, including state tests."
    tags = ["Programs", "Iteration", "Tests"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." program_syntax = "Two sorts: formulas and programs. Programs: $\\alpha ::= a\\mid\\alpha;\\beta\\mid\\alpha\\cup\\beta\\mid\\alpha^*\\mid\\varphi?$. The unary program_box denotes $[\\alpha]$ for a program parameter. The DSL stores these conventions and formula strings; it does not parse a program AST." diamond = "$\\langle\\alpha\\rangle\\varphi:=\\neg[\\alpha]\\neg\\varphi$." }
    references = ["dynamic_logic", "pdl_fischer_ladner"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator program_box(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.TestFreePDL."Schemata"
    axiom test { desc = "Testing psi leaves the state unchanged when psi holds." formula = "[\\psi?]\\varphi\\leftrightarrow(\\psi\\to\\varphi)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction program_relations { expression = "$R_{\\alpha;\\beta}=R_\\alpha;R_\\beta$, $R_{\\alpha\\cup\\beta}=R_\\alpha\\cup R_\\beta$, $R_{\\alpha^*}=(R_\\alpha)^*$. Classical valuations; arbitrary binary relations for atomic programs." }
    restriction tests { expression = "$R_{\\psi?}=\\{(w,w):M,w\\models\\psi\\}$." }
    forcing box { condition = "$M,w\\models[\\alpha]\\varphi\\iff\\forall v\\,(wR_\\alpha v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

logic CPDL {
  metadata {
    name = "Converse propositional dynamic logic"
    family = "Dynamic"
    aliases = ["converse PDL"]
    desc = "PDL with a program converse constructor, allowing relations to be traversed backwards."
    tags = ["Programs", "Converse"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." program_syntax = "Two sorts: formulas and programs. Programs: $\\alpha ::= a\\mid\\alpha;\\beta\\mid\\alpha\\cup\\beta\\mid\\alpha^*\\mid\\varphi?$. The unary program_box denotes $[\\alpha]$ for a program parameter. The DSL stores these conventions and formula strings; it does not parse a program AST. Also allow converse of any program." }
    references = ["dynamic_logic", "pdl_fischer_ladner"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator program_box(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.PDL."Schemata"
    axiom converse_one { desc = "Converse reverses every transition." formula = "\\varphi\\to[\\alpha]\\langle\\alpha^{-1}\\rangle\\varphi" }
    axiom converse_two { desc = "The reverse transition returns along the original relation." formula = "\\varphi\\to[\\alpha^{-1}]\\langle\\alpha\\rangle\\varphi" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction program_relations { expression = "$R_{\\alpha;\\beta}=R_\\alpha;R_\\beta$, $R_{\\alpha\\cup\\beta}=R_\\alpha\\cup R_\\beta$, $R_{\\alpha^*}=(R_\\alpha)^*$. Classical valuations; arbitrary binary relations for atomic programs." }
    restriction converse { expression = "$R_{\\alpha^{-1}}=\\{(v,w):(w,v)\\in R_\\alpha\\}$. Tests retain their PDL interpretation." }
    forcing box { condition = "$M,w\\models[\\alpha]\\varphi\\iff\\forall v\\,(wR_\\alpha v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

logic DPDL {
  metadata {
    name = "Deterministic propositional dynamic logic"
    family = "Dynamic"
    aliases = ["deterministic PDL"]
    desc = "PDL restricted to models where atomic programs are partial functions. Choice and iteration may still have multiple outcomes."
    tags = ["Programs", "Atomic determinism"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." program_syntax = "Two sorts: formulas and programs. Programs: $\\alpha ::= a\\mid\\alpha;\\beta\\mid\\alpha\\cup\\beta\\mid\\alpha^*\\mid\\varphi?$. The unary program_box denotes $[\\alpha]$ for a program parameter. The DSL stores these conventions and formula strings; it does not parse a program AST." determinism_scope = "Only atomic programs a are deterministic; this does not require every compound program to be deterministic." }
    references = ["dynamic_logic", "pdl_fischer_ladner"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator program_box(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.PDL."Schemata"
    axiom atomic_determinism { desc = "For atomic a only; partial execution need not terminate." formula = "\\langle a\\rangle\\varphi\\to[a]\\varphi" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction program_relations { expression = "$R_{\\alpha;\\beta}=R_\\alpha;R_\\beta$, $R_{\\alpha\\cup\\beta}=R_\\alpha\\cup R_\\beta$, $R_{\\alpha^*}=(R_\\alpha)^*$. Classical valuations; arbitrary binary relations for atomic programs." }
    restriction atomic_functions { expression = "Each atomic R_a is a partial function. Tests retain their PDL interpretation." }
    forcing box { condition = "$M,w\\models[\\alpha]\\varphi\\iff\\forall v\\,(wR_\\alpha v\\Rightarrow M,v\\models\\varphi)$" }
  }
}

relation {
  type = "conservative_extension"
  parent = TestFreePDL
  child = PDL
  desc = "Adds tests to the program language; each model of the test-free language has its canonical test interpretation."
  status = "Literature-backed; scope specified"
  references = ["dynamic_logic", "pdl_fischer_ladner"]
}

relation {
  type = "conservative_extension"
  parent = PDL
  child = CPDL
  desc = "Adds program converse with the inverse-relation interpretation, preserving PDL validity."
  status = "Literature-backed; scope specified"
  references = ["dynamic_logic", "pdl_fischer_ladner"]
}

relation {
  type = "extension"
  parent = PDL
  child = DPDL
  desc = "Same PDL language; restrict only atomic program relations to partial functions, adding validities."
  status = "Literature-backed; scope specified"
  references = ["dynamic_logic", "pdl_fischer_ladner"]
}

relation {
  type = "embedding"
  parent = K
  child = TestFreePDL
  desc = "Map the single modal box to the modality of one fixed atomic program; its relation remains arbitrary."
  status = "Literature-backed; scope specified"
  references = ["dynamic_logic", "pdl_fischer_ladner"]
}

logic PAL {
  metadata {
    name = "Public announcement logic"
    family = "Dynamic epistemic"
    aliases = ["public announcement logic"]
    desc = "S5 epistemic logic with truthful public model restrictions. A failed announcement precondition makes the update box true; announcements need not preserve the truth of their own content."
    tags = ["Knowledge", "Public announcements"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." index_convention = "Fix a finite agent set I with at least two agents. The unary operator knows is the indexed family K_i, i in I. Nonempty groups G are subsets of I. Indices are metasyntax, not extra formula arguments." operator_convention = "announce has formula arity 2: $[!\\psi]\\varphi$." scope = "Reduction schemata shown; update composition and a full proof system are not encoded." }
    references = ["bms_actions"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator announce(2)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.EpistemicS5."Schemata"
    axiom atom { desc = "Only atomic propositions p." formula = "[!\\psi]p\\leftrightarrow(\\psi\\to p)" }
    axiom negation { desc = "The update box is vacuously true when its precondition fails." formula = "[!\\psi]\\neg\\varphi\\leftrightarrow(\\psi\\to\\neg[!\\psi]\\varphi)" }
    axiom conjunction { desc = "Conjunction reduction." formula = "[!\\psi](\\varphi\\land\\chi)\\leftrightarrow([!\\psi]\\varphi\\land[!\\psi]\\chi)" }
    axiom knowledge { desc = "Knowledge in the restricted model." formula = "[!\\psi]K_i\\varphi\\leftrightarrow(\\psi\\to K_i[!\\psi]\\varphi)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction restriction { expression = "$M|\\psi$ restricts worlds, every agent relation and the valuation to worlds satisfying $\\psi$ in M. All base relations are equivalences." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing announcement { condition = "$M,w\\models[!\\psi]\\varphi\\iff(M,w\\models\\psi\\Rightarrow M|\\psi,w\\models\\varphi)$" }
  }
}

logic PALCommon {
  metadata {
    name = "Public announcement logic with common knowledge"
    family = "Dynamic epistemic"
    aliases = ["PAL+C"]
    desc = "Public restrictions and common knowledge computed in the resulting model."
    tags = ["Knowledge", "Public announcements", "Common knowledge"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." scope = "No naive reduction of updated common knowledge to ordinary static common knowledge is asserted. Representative presentation only." }
    references = ["bms_actions"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator announce(2)
    operator common(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.PAL."Schemata"
    axiom fixpoint { desc = "E_G psi abbreviates the conjunction of K_i psi over i in G." formula = "C_G\\varphi\\leftrightarrow(\\varphi\\land E_G C_G\\varphi)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction restriction { expression = "$M|\\psi$ restricts worlds, every agent relation and the valuation to worlds satisfying $\\psi$ in M. All base relations are equivalences." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing announcement { condition = "$M,w\\models[!\\psi]\\varphi\\iff(M,w\\models\\psi\\Rightarrow M|\\psi,w\\models\\varphi)$" }
    forcing common { condition = "$M,w\\models C_G\\varphi\\iff\\forall v\\,\\bigl(w(\\bigcup_{i\\in G}R_i)^*v\\Rightarrow M,v\\models\\varphi\\bigr)$" }
  }
}

logic EAL {
  metadata {
    name = "Epistemic action logic (S5 action models)"
    family = "Dynamic epistemic"
    aliases = ["action model logic", "AML", "S5 action logic"]
    desc = "Finite action-model product updates represent private information and uncertainty about which event took place."
    tags = ["Knowledge", "Action models", "Product update"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." operator_convention = "action_box is unary in a formula, indexed by a finite pointed action model $(\\mathcal A,e)$." scope = "S5 world and event relations; no factual postconditions. These conventions exclude action models for deception using non-S5 belief relations." }
    references = ["bms_actions"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator action_box(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.EpistemicS5."Schemata"
    axiom atomic_update { desc = "Atomic p; no factual change." formula = "[\\mathcal A,e]p\\leftrightarrow(\\operatorname{pre}(e)\\to p)" }
    axiom knowledge_update { desc = "Finite conjunction over events accessible to agent i." formula = "[\\mathcal A,e]K_i\\varphi\\leftrightarrow\\left(\\operatorname{pre}(e)\\to\\bigwedge_{f:eS_i f}K_i[\\mathcal A,f]\\varphi\\right)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction events { expression = "Finite action model A=(E,(S_i),pre), with each S_i an equivalence relation. Preconditions are finite, well-founded formulas; there are no factual postconditions." }
    restriction worlds { expression = "$W^{\\otimes}=\\{(w,e):M,w\\models\\operatorname{pre}(e)\\}$. The product valuation inherits each atom from w." }
    restriction accessibility { expression = "$(w,e)R_i^{\\otimes}(v,f)$ iff $wR_i v$ and $eS_i f$. World relations are S5 equivalences." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing product_update { condition = "$M,w\\models[\\mathcal A,e]\\varphi\\iff(M,w\\models\\operatorname{pre}(e)\\Rightarrow M\\otimes\\mathcal A,(w,e)\\models\\varphi)$" }
  }
}

logic EALCommon {
  metadata {
    name = "Epistemic action logic with common knowledge"
    family = "Dynamic epistemic"
    aliases = ["EAL+C", "AML+C"]
    desc = "S5 product updates with common knowledge evaluated through reachability in the product model."
    tags = ["Knowledge", "Action models", "Common knowledge"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." scope = "Representative presentation; no reduction to ordinary static common knowledge is claimed." }
    references = ["bms_actions"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator action_box(1)
    operator common(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.EAL."Schemata"
    axiom fixpoint { desc = "E_G psi abbreviates the conjunction of K_i psi over i in G." formula = "C_G\\varphi\\leftrightarrow(\\varphi\\land E_G C_G\\varphi)" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction events { expression = "Finite action model A=(E,(S_i),pre), with each S_i an equivalence relation. Preconditions are finite, well-founded formulas; there are no factual postconditions." }
    restriction worlds { expression = "$W^{\\otimes}=\\{(w,e):M,w\\models\\operatorname{pre}(e)\\}$. The product valuation inherits each atom from w." }
    restriction accessibility { expression = "$(w,e)R_i^{\\otimes}(v,f)$ iff $wR_i v$ and $eS_i f$. World relations are S5 equivalences." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing product_update { condition = "$M,w\\models[\\mathcal A,e]\\varphi\\iff(M,w\\models\\operatorname{pre}(e)\\Rightarrow M\\otimes\\mathcal A,(w,e)\\models\\varphi)$" }
    forcing common { condition = "$M,w\\models C_G\\varphi\\iff\\forall v\\,\\bigl(w(\\bigcup_{i\\in G}R_i)^*v\\Rightarrow M,v\\models\\varphi\\bigr)$" }
  }
}

logic APAL {
  metadata {
    name = "Arbitrary public announcement logic"
    family = "Dynamic epistemic"
    aliases = ["arbitrary announcement logic"]
    desc = "PAL extended with quantification over all truthful announcements expressible in the static epistemic language."
    tags = ["Knowledge", "Public announcements", "Announcement quantification"]
    properties { axiomatization = "Representative schemata; no completeness claim for the encoded presentation." quantifier_range = "Announcements range over announcement-free epistemic formulas with individual K_i only, over the fixed propositional vocabulary; not over APAL formulas." scope = "One instance schema is shown. The infinitary proof principles of complete APAL calculi are not encoded." }
    references = ["apal"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator knows(1)
    operator announce(2)
    operator arbitrary_announce(1)
  }
  presentation "Schemata" {
    type = "Sketch"
    extends = presentation.PAL."Schemata"
    axiom instance { desc = "Every permitted epistemic announcement is an instance." formula = "[\\forall!]\\varphi\\to[!\\psi]\\varphi\\quad(\\psi\\in\\mathcal L_{\\mathrm{EL}})" }
  }
  semantics "Relational semantics" {
    type = "Kripke"
    restriction restriction { expression = "$M|\\psi$ restricts worlds, every agent relation and the valuation to worlds satisfying $\\psi$ in M. All base relations are equivalences." }
    forcing knowledge { condition = "$M,w\\models K_i\\varphi\\iff\\forall v\\,(wR_i v\\Rightarrow M,v\\models\\varphi)$" }
    forcing announcement { condition = "$M,w\\models[!\\psi]\\varphi\\iff(M,w\\models\\psi\\Rightarrow M|\\psi,w\\models\\varphi)$" }
    forcing arbitrary { condition = "$M,w\\models[\\forall!]\\varphi\\iff\\forall\\psi\\in\\mathcal L_{\\mathrm{EL}}\\;M,w\\models[!\\psi]\\varphi$" }
  }
}

logic DEL {
  metadata {
    name = "Dynamic epistemic logic framework"
    family = "Dynamic epistemic"
    aliases = ["dynamic epistemic logic"]
    desc = "An umbrella for logics of information change, with public announcements and epistemic actions among its instances. This record denotes a framework, not one fixed calculus."
    tags = ["Information change", "Framework"]
    properties { axiomatization = "Not applicable to an umbrella framework." record_kind = "Family" scope = "Open-ended framework. Listed members use the explicit model and language conventions in their own records." }
    references = ["bms_actions"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
  }
}

relation {
  type = "conservative_extension"
  parent = EpistemicS5
  child = PAL
  desc = "Canonical expansion over the same S5 epistemic base models; old-language validity is preserved. Read the child record for update syntax and group conventions."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "conservative_extension"
  parent = EpistemicCommon
  child = PALCommon
  desc = "Canonical expansion over the same S5 epistemic base models; old-language validity is preserved. Read the child record for update syntax and group conventions."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "conservative_extension"
  parent = PAL
  child = PALCommon
  desc = "Canonical expansion over the same S5 epistemic base models; old-language validity is preserved. Read the child record for update syntax and group conventions."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "conservative_extension"
  parent = EpistemicS5
  child = EAL
  desc = "Canonical expansion over the same S5 epistemic base models; old-language validity is preserved. Read the child record for update syntax and group conventions."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "conservative_extension"
  parent = EpistemicCommon
  child = EALCommon
  desc = "Canonical expansion over the same S5 epistemic base models; old-language validity is preserved. Read the child record for update syntax and group conventions."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "conservative_extension"
  parent = EAL
  child = EALCommon
  desc = "Canonical expansion over the same S5 epistemic base models; old-language validity is preserved. Read the child record for update syntax and group conventions."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "conservative_extension"
  parent = PAL
  child = APAL
  desc = "Canonical expansion over the same S5 epistemic base models; old-language validity is preserved. Read the child record for update syntax and group conventions."
  status = "Literature-backed; scope specified"
  references = ["apal"]
}

relation {
  type = "embedding"
  parent = PAL
  child = EAL
  desc = "Translate each public announcement into a one-event action model: all agents have the reflexive event relation and its precondition is the announced formula. Preserve common knowledge when present."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "embedding"
  parent = PALCommon
  child = EALCommon
  desc = "Translate each public announcement into a one-event action model: all agents have the reflexive event relation and its precondition is the announced formula. Preserve common knowledge when present."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "reduction"
  parent = PAL
  child = EpistemicS5
  desc = "Without common knowledge, eliminate finite updates by the standard reduction translation into static S5 epistemic formulas. This relates expressivity via translation; it is not a same-language extension."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "reduction"
  parent = EAL
  child = EpistemicS5
  desc = "Without common knowledge, eliminate finite updates by the standard reduction translation into static S5 epistemic formulas. This relates expressivity via translation; it is not a same-language extension."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "instance"
  parent = DEL
  child = PAL
  desc = "A framework member under the specific language and S5 semantics recorded here. Membership is not a logical-strength comparison."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "instance"
  parent = DEL
  child = PALCommon
  desc = "A framework member under the specific language and S5 semantics recorded here. Membership is not a logical-strength comparison."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "instance"
  parent = DEL
  child = EAL
  desc = "A framework member under the specific language and S5 semantics recorded here. Membership is not a logical-strength comparison."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "instance"
  parent = DEL
  child = EALCommon
  desc = "A framework member under the specific language and S5 semantics recorded here. Membership is not a logical-strength comparison."
  status = "Literature-backed; scope specified"
  references = ["bms_actions"]
}

relation {
  type = "instance"
  parent = DEL
  child = APAL
  desc = "A framework member under the specific language and S5 semantics recorded here. Membership is not a logical-strength comparison."
  status = "Literature-backed; scope specified"
  references = ["apal"]
}


// Description logics: constructor languages and ontology syntax.
// Formula strings document typed metasyntax; this is not a DL reasoner.

source dl_primer {
  title = "A Description Logic Primer (version 1.2)"
  url = "https://arxiv.org/abs/1201.4089v3"
  authors = ["Markus Krötzsch", "František Simančík", "Ian Horrocks"]
  year = 2013
}

source dl_sroiq {
  title = "The Even More Irresistible SROIQ"
  url = "https://www.cs.ox.ac.uk/people/ian.horrocks/Publications/download/2006/HoKS06a.pdf"
  authors = ["Ian Horrocks", "Oliver Kutz", "Ulrike Sattler"]
  year = 2006
}

source dl_el {
  title = "Pushing the EL Envelope"
  url = "https://www.informatik.uni-leipzig.de/kr/research/papers/2005/BaaderBrandtLutz-IJCAI-05.pdf"
  authors = ["Franz Baader", "Sebastian Brandt", "Carsten Lutz"]
  year = 2005
}

source dl_shiq {
  title = "Reasoning with Individuals for the Description Logic SHIQ"
  url = "https://arxiv.org/abs/cs/0005017"
  authors = ["Ian Horrocks", "Ulrike Sattler", "Stephan Tobies"]
  year = 2000
}

source owl2_structure {
  title = "OWL 2 Web Ontology Language Structural Specification and Functional-Style Syntax (Second Edition)"
  url = "https://www.w3.org/TR/2012/REC-owl2-syntax-20121211/"
  authors = ["Boris Motik", "Peter F. Patel-Schneider", "Bijan Parsia"]
  year = 2012
}

source owl2_semantics {
  title = "OWL 2 Web Ontology Language Direct Semantics (Second Edition)"
  url = "https://www.w3.org/TR/2012/REC-owl2-direct-semantics-20121211/"
  authors = ["Boris Motik", "Peter F. Patel-Schneider", "Bernardo Cuenca Grau"]
  year = 2012
}

source dl_modal {
  title = "Automated Reasoning in Modal and Description Logics via SAT Encoding: the Case Study of K(m)/ALC-Satisfiability"
  url = "https://arxiv.org/abs/1401.3463"
  authors = ["Roberto Sebastiani", "Michele Vescovi"]
  year = 2009
}

logic DLFamily {
  metadata {
    name = "Description logics"
    family = "Description"
    aliases = ["DL", "description logics"]
    desc = "A family of languages for describing concepts, relations and named individuals. This umbrella record does not specify one fixed calculus."
    tags = ["Description logic", "Ontologies", "Framework"]
    properties {
      record_kind = "Family"
      scope = "Open-ended family of concept/role/individual knowledge-representation languages. Individual members specify their constructors and ontology syntax."
    }
    references = ["dl_primer"]
  }
  signature {
  }
}

logic FL0 {
  metadata {
    name = "Description logic FL₀"
    family = "Description"
    aliases = ["FL_0", "FL₀"]
    desc = "Conjunction and universal value restrictions, using the convention with top and no bottom. No existential restriction or concept negation."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "Top, intersection, universal restriction"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid C\\sqcap D\\mid\\forall r.C$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "GCIs and positive ABox assertions; no RBox. Bottom is excluded in this FL0 convention."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_el"]
  }
  signature {
    operator concept_top(0)
    operator concept_intersection(2)
    operator role_forall(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic EL {
  metadata {
    name = "Description logic EL"
    family = "Description"
    aliases = ["𝓔𝓛"]
    desc = "A positive concept language with conjunction and existential role restrictions; no complement, disjunction or universal restriction."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "Top, intersection, existential restriction"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid C\\sqcap D\\mid\\exists r.C$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_el", "dl_primer"]
  }
  signature {
    operator concept_top(0)
    operator concept_intersection(2)
    operator role_exists(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic ELBottom {
  metadata {
    name = "Description logic EL with bottom"
    family = "Description"
    aliases = ["EL_bot", "EL⊥", "EL_bottom"]
    desc = "EL extended with an empty concept, making disjointness and unsatisfiable concepts expressible."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "EL plus bottom"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid C\\sqcap D\\mid\\exists r.C$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_el"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator role_exists(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic ELPlusPlusObject {
  metadata {
    name = "EL++ object fragment (2005 constructors)"
    family = "Description"
    aliases = ["EL++ object fragment", "EL++ without concrete domains"]
    desc = "The concrete-domain-free fragment of the 2005 EL++ language: positive concepts, bottom, nominals and role-chain inclusions."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "EL with bottom, nominals and role-chain axioms"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\{a\\}\\mid C\\sqcap D\\mid\\exists r.C$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "GCIs, positive ABox assertions and arbitrary finite role-chain inclusions in the 2005 concrete-domain-free EL++ fragment."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
      variant_scope = "Concrete domains from the full EL++ paper are omitted. No inverse roles, universal restriction, Self or universal role are added in this recorded 2005 fragment."
      role_regularity = "No SROIQ regularity condition is imposed on this EL++ object fragment. No unrestricted embedding into SROIQ is asserted."
    }
    references = ["dl_el"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator role_exists(1)
    operator nominal(0)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing nominal { condition = "$\\{a\\}^{\\mathcal I}=\\{a^{\\mathcal I}\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing role_inclusion { condition = "$\\mathcal I\\models r\\sqsubseteq s\\iff r^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
    forcing role_chain { condition = "$\\mathcal I\\models r_1\\circ\\cdots\\circ r_k\\sqsubseteq s\\iff r_1^{\\mathcal I}\\circ\\cdots\\circ r_k^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
  }
}

logic ALC {
  metadata {
    name = "Description logic ALC"
    family = "Description"
    aliases = ["𝓐𝓛𝓒"]
    desc = "Boolean concept operations with existential and universal role restrictions. The basic bridge between description logics and normal multimodal logic."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "Boolean concepts and existential/universal restrictions"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_primer"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic ALCI {
  metadata {
    name = "Description logic ALCI"
    family = "Description"
    aliases = []
    desc = "ALC with inverse roles, so concepts can refer to predecessors as well as successors."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC plus inverse roles"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Roles may be atomic or inverse $r^{-}$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_primer"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator inverse_role(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing inverse_role { condition = "$(r^{-})^{\\mathcal I}=\\{(y,x)\\mid(x,y)\\in r^{\\mathcal I}\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic ALCO {
  metadata {
    name = "Description logic ALCO"
    family = "Description"
    aliases = []
    desc = "ALC with singleton concepts for named individuals; concept negation can also express absence from a nominal."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC plus nominals"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also $\\{a\\}$ is a concept."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_primer"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator nominal(0)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing nominal { condition = "$\\{a\\}^{\\mathcal I}=\\{a^{\\mathcal I}\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic ALCN {
  metadata {
    name = "Description logic ALCN"
    family = "Description"
    aliases = []
    desc = "ALC with unqualified at-least and at-most restrictions, counting all distinct role successors."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC plus unqualified number restrictions"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also $(\\geq n\\,r)$ and $(\\leq n\\,r)$; $n\\in\\mathbb N$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_primer", "dl_shiq"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator min_number(0)
    operator max_number(0)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing min_number { condition = "$(\\mathord{\\geq}n\\,r)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I}\\}\\geq n\\}$" }
    forcing max_number { condition = "$(\\mathord{\\leq}n\\,r)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I}\\}\\leq n\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic ALCQ {
  metadata {
    name = "Description logic ALCQ"
    family = "Description"
    aliases = []
    desc = "ALC with qualified cardinality restrictions that count only successors satisfying the qualifying concept."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC plus qualified number restrictions"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also $(\\geq n\\,r.C)$ and $(\\leq n\\,r.C)$; $n\\in\\mathbb N$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_primer"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator min_qualified(1)
    operator max_qualified(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing min_qualified { condition = "$(\\mathord{\\geq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\geq n\\}$" }
    forcing max_qualified { condition = "$(\\mathord{\\leq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\leq n\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic ALCQI {
  metadata {
    name = "Description logic ALCQI"
    family = "Description"
    aliases = ["ALCIQ"]
    desc = "Qualified number restrictions together with inverse roles, without transitivity or role hierarchies."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC plus inverse roles and qualified number restrictions"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also inverse roles and $(\\geq n\\,r.C)$, $(\\leq n\\,r.C)$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_primer"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator inverse_role(1)
    operator min_qualified(1)
    operator max_qualified(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing inverse_role { condition = "$(r^{-})^{\\mathcal I}=\\{(y,x)\\mid(x,y)\\in r^{\\mathcal I}\\}$" }
    forcing min_qualified { condition = "$(\\mathord{\\geq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\geq n\\}$" }
    forcing max_qualified { condition = "$(\\mathord{\\leq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\leq n\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
  }
}

logic DL_S {
  metadata {
    name = "Description logic S"
    family = "Description"
    aliases = ["S", "ALC with transitive roles"]
    desc = "ALC with declarations of transitive roles. Transitivity is an ontology-level choice rather than a condition imposed on every role."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC plus transitive role declarations"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_primer", "dl_shiq"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    restriction transitivity { expression = "Only roles explicitly declared transitive must be transitive; other roles remain unrestricted." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing transitive_role { condition = "$\\mathcal I\\models\\operatorname{Trans}(r)\\iff r^{\\mathcal I}\\circ r^{\\mathcal I}\\subseteq r^{\\mathcal I}$" }
  }
}

logic SH {
  metadata {
    name = "Description logic SH"
    family = "Description"
    aliases = []
    desc = "S with role inclusion hierarchies; inclusion constrains how one role relation sits inside another."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC, transitivity and role hierarchies"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_shiq", "dl_sroiq"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    restriction transitivity { expression = "Only roles explicitly declared transitive must be transitive; other roles remain unrestricted." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing transitive_role { condition = "$\\mathcal I\\models\\operatorname{Trans}(r)\\iff r^{\\mathcal I}\\circ r^{\\mathcal I}\\subseteq r^{\\mathcal I}$" }
    forcing role_inclusion { condition = "$\\mathcal I\\models r\\sqsubseteq s\\iff r^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
  }
}

logic SHI {
  metadata {
    name = "Description logic SHI"
    family = "Description"
    aliases = []
    desc = "SH with inverse roles; role inclusions also induce the corresponding inclusions between inverses."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "ALC, transitivity, hierarchies and inverse roles"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Roles may be inverse."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_shiq", "dl_sroiq"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator inverse_role(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    restriction transitivity { expression = "Only roles explicitly declared transitive must be transitive; other roles remain unrestricted." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing inverse_role { condition = "$(r^{-})^{\\mathcal I}=\\{(y,x)\\mid(x,y)\\in r^{\\mathcal I}\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing transitive_role { condition = "$\\mathcal I\\models\\operatorname{Trans}(r)\\iff r^{\\mathcal I}\\circ r^{\\mathcal I}\\subseteq r^{\\mathcal I}$" }
    forcing role_inclusion { condition = "$\\mathcal I\\models r\\sqsubseteq s\\iff r^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
  }
}

logic SHIQ {
  metadata {
    name = "Description logic SHIQ"
    family = "Description"
    aliases = []
    desc = "SHI with qualified number restrictions on simple roles. Transitive roles and roles with transitive subroles cannot be used for counting."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "SHI plus qualified counting"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also inverse roles and qualified number restrictions on simple roles."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_shiq"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator inverse_role(1)
    operator min_qualified(1)
    operator max_qualified(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    restriction transitivity { expression = "Only roles explicitly declared transitive must be transitive; other roles remain unrestricted." }
    restriction simple_roles { expression = "Number restrictions may use only simple roles: no transitive subrole, including effects of inverse roles and the role hierarchy. Arbitrary restrictions on transitive roles are excluded." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing inverse_role { condition = "$(r^{-})^{\\mathcal I}=\\{(y,x)\\mid(x,y)\\in r^{\\mathcal I}\\}$" }
    forcing min_qualified { condition = "$(\\mathord{\\geq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\geq n\\}$" }
    forcing max_qualified { condition = "$(\\mathord{\\leq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\leq n\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing transitive_role { condition = "$\\mathcal I\\models\\operatorname{Trans}(r)\\iff r^{\\mathcal I}\\circ r^{\\mathcal I}\\subseteq r^{\\mathcal I}$" }
    forcing role_inclusion { condition = "$\\mathcal I\\models r\\sqsubseteq s\\iff r^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
  }
}

logic SHOIN {
  metadata {
    name = "Description logic SHOIN"
    family = "Description"
    aliases = []
    desc = "SHI with nominals and unqualified number restrictions on simple roles. A description-logic foundation for the object portion of OWL 1 DL."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "SHI plus nominals and unqualified counting"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also inverse roles, nominals and unqualified number restrictions on simple roles."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
      owl_relationship = "SHOIN is a logical foundation for OWL 1 DL; the datatype-free record is not the full OWL language."
    }
    references = ["dl_sroiq", "owl2_semantics"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator inverse_role(1)
    operator nominal(0)
    operator min_number(0)
    operator max_number(0)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    restriction transitivity { expression = "Only roles explicitly declared transitive must be transitive; other roles remain unrestricted." }
    restriction simple_roles { expression = "Number restrictions may use only simple roles: no transitive subrole, including effects of inverse roles and the role hierarchy. Arbitrary restrictions on transitive roles are excluded." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing inverse_role { condition = "$(r^{-})^{\\mathcal I}=\\{(y,x)\\mid(x,y)\\in r^{\\mathcal I}\\}$" }
    forcing nominal { condition = "$\\{a\\}^{\\mathcal I}=\\{a^{\\mathcal I}\\}$" }
    forcing min_number { condition = "$(\\mathord{\\geq}n\\,r)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I}\\}\\geq n\\}$" }
    forcing max_number { condition = "$(\\mathord{\\leq}n\\,r)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I}\\}\\leq n\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing transitive_role { condition = "$\\mathcal I\\models\\operatorname{Trans}(r)\\iff r^{\\mathcal I}\\circ r^{\\mathcal I}\\subseteq r^{\\mathcal I}$" }
    forcing role_inclusion { condition = "$\\mathcal I\\models r\\sqsubseteq s\\iff r^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
  }
}

logic SHOIQ {
  metadata {
    name = "Description logic SHOIQ"
    family = "Description"
    aliases = []
    desc = "SHIQ with nominals, or SHOIN with qualified rather than unqualified counting. Number restrictions remain confined to simple roles."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "SHI plus nominals and qualified counting"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also inverse roles, nominals and qualified number restrictions on simple roles."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "General concept inclusions (TBox), concept and positive role assertions (ABox); RBox axioms only where specified. No datatypes or concrete domains."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
    }
    references = ["dl_sroiq"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator inverse_role(1)
    operator nominal(0)
    operator min_qualified(1)
    operator max_qualified(1)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    restriction transitivity { expression = "Only roles explicitly declared transitive must be transitive; other roles remain unrestricted." }
    restriction simple_roles { expression = "Number restrictions may use only simple roles: no transitive subrole, including effects of inverse roles and the role hierarchy. Arbitrary restrictions on transitive roles are excluded." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing inverse_role { condition = "$(r^{-})^{\\mathcal I}=\\{(y,x)\\mid(x,y)\\in r^{\\mathcal I}\\}$" }
    forcing nominal { condition = "$\\{a\\}^{\\mathcal I}=\\{a^{\\mathcal I}\\}$" }
    forcing min_qualified { condition = "$(\\mathord{\\geq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\geq n\\}$" }
    forcing max_qualified { condition = "$(\\mathord{\\leq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\leq n\\}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing transitive_role { condition = "$\\mathcal I\\models\\operatorname{Trans}(r)\\iff r^{\\mathcal I}\\circ r^{\\mathcal I}\\subseteq r^{\\mathcal I}$" }
    forcing role_inclusion { condition = "$\\mathcal I\\models r\\sqsubseteq s\\iff r^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
  }
}

logic SROIQ {
  metadata {
    name = "Description logic SROIQ"
    family = "Description"
    aliases = ["𝓢𝓡𝓞𝓘𝓠"]
    desc = "An expressive ontology logic combining Boolean concepts, regular complex role inclusions, nominals, inverse roles, qualified counting and local reflexivity."
    tags = ["Description logic", "Ontologies"]
    properties {
      record_kind = "Logic"
      constructors = "SHOIQ plus regular role chains, Self, universal role and additional RBox/ABox forms"
      concept_syntax = "$C,D ::= A\\mid\\top\\mid\\bot\\mid\\neg C\\mid C\\sqcap D\\mid C\\sqcup D\\mid\\exists r.C\\mid\\forall r.C$. Also inverse and universal roles, nominals, qualified counting and $\\exists r.\\mathsf{Self}$."
      signature_convention = "Concept constructors take concept arguments; role_exists/role_forall are unary, indexed by r. inverse_role takes a role argument. Number bounds n, role indices and nominal individuals are parameters; min/max_number, nominal and self_restriction have no concept arguments. The DSL does not parse or type-check these terms."
      interpretation = "$\\mathcal I=(\\Delta^{\\mathcal I},\\cdot^{\\mathcal I})$ has a nonempty domain; concepts are subsets, roles are binary relations, individuals denote domain elements."
      knowledge_assumptions = "Open-world semantics; no unique-name assumption. Missing assertions do not imply negative assertions; different names may denote the same individual."
      ontology_scope = "TBox GCIs; regular RBox role inclusions/chains and transitivity, reflexivity, irreflexivity, symmetry, asymmetry and disjointness; ABox concept and positive/negative role assertions, equality and inequality."
      presentation_scope = "Illustrative valid inference only; constructor and ontology semantics are given below. No complete calculus or implemented DL reasoner is claimed."
      owl_relationship = "SROIQ supplies the object-logic foundation of OWL 2 DL. OWL 2 additionally defines datatypes, keys and punning; this record is not an alias for the complete OWL 2 language."
      global_restrictions = "Regular role hierarchy; simple roles for number restrictions, Self, irreflexivity, asymmetry and disjointness. U is non-simple in the convention used here."
      decidability = "Decidable under the stated global syntactic restrictions; these are cataloged conditions, not implemented validation."
    }
    references = ["dl_sroiq", "dl_primer", "owl2_structure", "owl2_semantics"]
  }
  signature {
    operator concept_top(0)
    operator concept_bottom(0)
    operator concept_intersection(2)
    operator concept_union(2)
    operator concept_complement(1)
    operator role_exists(1)
    operator role_forall(1)
    operator inverse_role(1)
    operator nominal(0)
    operator min_qualified(1)
    operator max_qualified(1)
    operator self_restriction(0)
    operator universal_role(0)
  }
  presentation "Illustrative inference" {
    type = "Sketch"
    rule subsumption_transitivity {
      premise = ["\\mathcal T\\models C\\sqsubseteq D", "\\mathcal T\\models D\\sqsubseteq E"]
      conclusion = "\\mathcal T\\models C\\sqsubseteq E"
    }
  }
  semantics "Set interpretation" {
    type = "DescriptionLogicInterpretation"
    restriction domain { expression = "The domain is nonempty. Atomic concepts denote arbitrary subsets; atomic roles denote arbitrary binary relations except for declared RBox constraints. Individual names need not denote distinct elements." }
    restriction regularity { expression = "The RBox must satisfy the regular-role-hierarchy condition of Horrocks, Kutz and Sattler (2006), Definition 2: an inverse-compatible strict role order permits only the prescribed recursive chain forms. Arbitrary cyclic role-chain axioms are excluded. This is a global condition, not just a check on one axiom." }
    restriction simplicity { expression = "Counting and Self use only simple roles. Irreflexive, asymmetric and disjoint-role declarations also use only simple roles. Non-simplicity starts with transitive roles and superroles of nontrivial chains, and propagates through inverses and role inclusions. See the cited definitions for exact closure rules." }
    restriction universal_role { expression = "Use the OWL-compatible convention that U is non-simple; U denotes all domain pairs, and cannot occur in counting or Self." }
    restriction parameters { expression = "n is a non-negative integer. Nominals denote exactly one domain element. Distinct individual names need not denote distinct elements." }
    restriction compiler_scope { expression = "The current DSL records these restrictions as metadata; its validator does not decide role regularity, role simplicity, ontology consistency or entailment." }
    forcing concept_top { condition = "$\\top^{\\mathcal I}=\\Delta^{\\mathcal I}$" }
    forcing concept_bottom { condition = "$\\bot^{\\mathcal I}=\\varnothing$" }
    forcing concept_intersection { condition = "$(C\\sqcap D)^{\\mathcal I}=C^{\\mathcal I}\\cap D^{\\mathcal I}$" }
    forcing concept_union { condition = "$(C\\sqcup D)^{\\mathcal I}=C^{\\mathcal I}\\cup D^{\\mathcal I}$" }
    forcing concept_complement { condition = "$(\\neg C)^{\\mathcal I}=\\Delta^{\\mathcal I}\\setminus C^{\\mathcal I}$" }
    forcing role_exists { condition = "$(\\exists r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\exists y\\,((x,y)\\in r^{\\mathcal I}\\land y\\in C^{\\mathcal I})\\}$" }
    forcing role_forall { condition = "$(\\forall r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\forall y\\,((x,y)\\in r^{\\mathcal I}\\Rightarrow y\\in C^{\\mathcal I})\\}$" }
    forcing inverse_role { condition = "$(r^{-})^{\\mathcal I}=\\{(y,x)\\mid(x,y)\\in r^{\\mathcal I}\\}$" }
    forcing nominal { condition = "$\\{a\\}^{\\mathcal I}=\\{a^{\\mathcal I}\\}$" }
    forcing min_qualified { condition = "$(\\mathord{\\geq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\geq n\\}$" }
    forcing max_qualified { condition = "$(\\mathord{\\leq}n\\,r.C)^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid\\#\\{y:(x,y)\\in r^{\\mathcal I},\\ y\\in C^{\\mathcal I}\\}\\leq n\\}$" }
    forcing self_restriction { condition = "$(\\exists r.\\mathsf{Self})^{\\mathcal I}=\\{x\\in\\Delta^{\\mathcal I}\\mid(x,x)\\in r^{\\mathcal I}\\}$" }
    forcing universal_role { condition = "$U^{\\mathcal I}=\\Delta^{\\mathcal I}\\times\\Delta^{\\mathcal I}$" }
    forcing gci { condition = "$\\mathcal I\\models C\\sqsubseteq D\\iff C^{\\mathcal I}\\subseteq D^{\\mathcal I}$" }
    forcing concept_assertion { condition = "$\\mathcal I\\models C(a)\\iff a^{\\mathcal I}\\in C^{\\mathcal I}$" }
    forcing role_assertion { condition = "$\\mathcal I\\models r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\in r^{\\mathcal I}$" }
    forcing role_inclusion { condition = "$\\mathcal I\\models r\\sqsubseteq s\\iff r^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
    forcing transitive_role { condition = "$\\mathcal I\\models\\operatorname{Trans}(r)\\iff r^{\\mathcal I}\\circ r^{\\mathcal I}\\subseteq r^{\\mathcal I}$" }
    forcing role_chain { condition = "$\\mathcal I\\models r_1\\circ\\cdots\\circ r_k\\sqsubseteq s\\iff r_1^{\\mathcal I}\\circ\\cdots\\circ r_k^{\\mathcal I}\\subseteq s^{\\mathcal I}$" }
    forcing role_reflexivity { condition = "$\\mathcal I\\models\\operatorname{Ref}(r)\\iff\\forall x\\in\\Delta^{\\mathcal I}\\;(x,x)\\in r^{\\mathcal I}$" }
    forcing role_irreflexivity { condition = "$\\mathcal I\\models\\operatorname{Irr}(r)\\iff\\forall x\\in\\Delta^{\\mathcal I}\\;(x,x)\\notin r^{\\mathcal I}$" }
    forcing role_symmetry { condition = "$\\mathcal I\\models\\operatorname{Sym}(r)\\iff(r^{-})^{\\mathcal I}=r^{\\mathcal I}$" }
    forcing role_asymmetry { condition = "$\\mathcal I\\models\\operatorname{Asy}(r)\\iff r^{\\mathcal I}\\cap(r^{-})^{\\mathcal I}=\\varnothing$" }
    forcing role_disjointness { condition = "$\\mathcal I\\models\\operatorname{Dis}(r,s)\\iff r^{\\mathcal I}\\cap s^{\\mathcal I}=\\varnothing$" }
    forcing negative_role_assertion { condition = "$\\mathcal I\\models\\neg r(a,b)\\iff(a^{\\mathcal I},b^{\\mathcal I})\\notin r^{\\mathcal I}$" }
    forcing individual_equality { condition = "$\\mathcal I\\models a\\approx b\\iff a^{\\mathcal I}=b^{\\mathcal I}$" }
    forcing individual_inequality { condition = "$\\mathcal I\\models a\\not\\approx b\\iff a^{\\mathcal I}\\ne b^{\\mathcal I}$" }
  }
}

relation {
  type = "language_extension"
  parent = FL0
  child = ALC
  desc = "Add Boolean concept operations and existential restrictions to the chosen top-only FL0 syntax. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_el", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = EL
  child = ELBottom
  desc = "Add bottom; keep the positive existential concept language. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_el", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ELBottom
  child = ALC
  desc = "Add complement, union and universal restriction. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_el", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ELBottom
  child = ELPlusPlusObject
  desc = "Add nominals and role-chain axioms of the 2005 EL++ object fragment; no concrete domains. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_el", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALC
  child = ALCI
  desc = "Add inverse-role expressions. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALC
  child = ALCO
  desc = "Add singleton nominal concepts. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALC
  child = ALCN
  desc = "Add unqualified at-least/at-most restrictions. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALCN
  child = ALCQ
  desc = "Translate unqualified counting $(\\geq n\\,r)$ and $(\\leq n\\,r)$ using qualifier $\\top$; add arbitrary qualifying concepts. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALCQ
  child = ALCQI
  desc = "Add inverse-role expressions. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALCI
  child = ALCQI
  desc = "Add qualified counting. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALC
  child = DL_S
  desc = "Add the ability to declare chosen roles transitive; other roles remain arbitrary. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = DL_S
  child = SH
  desc = "Add role inclusion axioms. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = SH
  child = SHI
  desc = "Add inverse-role expressions. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALCI
  child = SHI
  desc = "Add transitivity declarations and role inclusion axioms. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = SHI
  child = SHIQ
  desc = "Add qualified counting on simple roles. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALCQI
  child = SHIQ
  desc = "Add role hierarchies and transitivity declarations; original counting remains legal when no transitive subroles are introduced. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = SHI
  child = SHOIN
  desc = "Add nominals and unqualified counting on simple roles. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = ALCO
  child = SHOIN
  desc = "Add inverses, transitivity, hierarchies and simple-role unqualified counting. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = SHIQ
  child = SHOIQ
  desc = "Add nominals; preserve the simple-role restriction on counting. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = SHOIN
  child = SHOIQ
  desc = "Allow arbitrary qualifying concepts in counting; unqualified counting is the case with qualifier $\\top$. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "language_extension"
  parent = SHOIQ
  child = SROIQ
  desc = "Add regular complex role inclusions, Self, the universal role and additional role/assertion forms, subject to global restrictions. This compares available language and ontology forms, not logical strength by adding universally valid axioms."
  status = "Literature-backed; scope specified"
  references = ["dl_sroiq", "dl_shiq", "dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = FL0
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = EL
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ELBottom
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ELPlusPlusObject
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ALC
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ALCI
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ALCO
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ALCN
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ALCQ
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = ALCQI
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = DL_S
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = SH
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = SHI
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = SHIQ
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = SHOIN
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = SHOIQ
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "instance"
  parent = DLFamily
  child = SROIQ
  desc = "A member of the description-logic family under the explicit constructor, interpretation and ontology conventions in its own record."
  status = "Literature-backed; scope specified"
  references = ["dl_primer"]
}

relation {
  type = "embedding"
  parent = K
  child = ALC
  desc = "Local modal formulas translate to concepts: $\\Box\\varphi$ becomes $\\forall r.C_\\varphi$ for one fixed role r, with Boolean operators translated pointwise. This preserves local truth and satisfiability with empty TBox, RBox and ABox; no identification of arbitrary ontology entailment with local modal consequence is claimed."
  status = "Literature-backed; scope specified"
  references = ["dl_modal"]
}

relation {
  type = "embedding"
  parent = EpistemicK
  child = ALC
  desc = "For a fixed finite agent set, assign each $K_i$ a distinct role $r_i$ and translate $K_i\\varphi$ to $\\forall r_i.C_\\varphi$. The concept fragment on those roles has the same local model semantics; general TBox entailment has a global scope beyond this correspondence."
  status = "Literature-backed; scope specified"
  references = ["dl_modal", "epistemic_intro"]
}


// Three-valued epistemic and dynamic extensions of LFI1.
// Action-model syntax and global-rule restrictions are documented schemata.

source lfi_dynamic_turn {
  title = "The Dynamic Turn in Paraconsistency (arXiv v1)"
  url = "https://arxiv.org/abs/2607.19906v1"
  authors = ["Rafael Ongaratto", "Hans van Ditmarsch"]
  year = 2026
}

source lfi_imperfect_reasoning {
  title = "The Dynamics of Imperfect Reasoning: Change, Paraconsistency and Knowledge"
  url = "https://doi.org/10.1007/s11787-025-00397-z"
  authors = ["Rafael Ongaratto"]
  year = 2025
}

logic KLFI1 {
  metadata {
    name = "Epistemic paraconsistent logic KLFI1"
    family = "Paraconsistent"
    aliases = ["K LFI1", "K(LFI1)"]
    desc = "LFI1 with agent-indexed normal modalities and a three-valued accessibility semantics."
    tags = ["LFI", "Three-valued", "Epistemic"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Arbitrary binary agent relations."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 15, 20, 25–27; Section 2.3"
      signature_bridge = "The paper uses primitive negation, conjunction and bullet. The inherited catalog signature also declares or, implication and circle; they are interpreted by the paper’s definitions. Bullet is added with the displayed strong definitional bridge."
      abbreviations = "$\\circ\\alpha:=\\neg\\bullet\\alpha$; $\\alpha\\lor\\beta:=\\neg(\\neg\\alpha\\land\\neg\\beta)$; $\\bot:=\\alpha\\land\\neg\\alpha\\land\\circ\\alpha$; ${\\sim}\\alpha:=\\neg\\alpha\\land\\circ\\alpha$; $\\alpha\\to\\beta:={\\sim}\\alpha\\lor\\beta$."
      strong_equivalence = "$\\alpha\\leftrightarrow\\beta:=(\\alpha\\to\\beta)\\land(\\beta\\to\\alpha)$; $\\alpha\\equiv\\beta:=(\\alpha\\leftrightarrow\\beta)\\land(\\neg\\alpha\\leftrightarrow\\neg\\beta)$. Designated strong equivalence expresses equality of truth values."
      modal_dual = "$\\widehat K_i\\alpha:=\\neg K_i\\neg\\alpha$."
      axiomatization = "Inherited LFI1, a definitional bullet expansion, K/K1/K2/K3 and theorem-level necessitation."
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.LFI1."Hilbert"
    axiom bullet_definition { desc = "Definitional bridge to the existing consistency-based LFI1 record; equivalence here is strong." formula = "\\bullet\\alpha\\equiv\\neg\\circ\\alpha" }
    axiom K { desc = "Distribution." formula = "K_i(\\alpha\\to\\beta)\\to(K_i\\alpha\\to K_i\\beta)" }
    axiom K1 { desc = "Dual distribution." formula = "K_i(\\alpha\\to\\beta)\\to(\\widehat K_i\\alpha\\to\\widehat K_i\\beta)" }
    axiom K2 { desc = "Dual disjunction." formula = "\\widehat K_i(\\alpha\\lor\\beta)\\to(\\widehat K_i\\alpha\\lor\\widehat K_i\\beta)" }
    axiom K3 { desc = "Additional modal schema; ordinary classical contraposition is unavailable." formula = "(\\widehat K_i\\alpha\\to K_i\\beta)\\to K_i(\\alpha\\to\\beta)" }
    rule Nec { premise = ["\\vdash\\alpha"] conclusion = "\\vdash K_i\\alpha" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Arbitrary binary agent relations." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
  }
}

logic KB4LFI1 {
  metadata {
    name = "Epistemic paraconsistent logic KB4LFI1"
    family = "Paraconsistent"
    aliases = ["KB4(LFI1)"]
    desc = "The KB4 modal extension of KLFI1, including the dual schemata required in this paraconsistent setting."
    tags = ["LFI", "Three-valued", "Epistemic"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Symmetric and transitive agent relations (partial equivalences); reflexivity and seriality are not required."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 27 and 31, including the dual axioms on p. 11"
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.KLFI1."Hilbert"
    axiom B { desc = "Symmetry schema." formula = "\\alpha\\to K_i\\widehat K_i\\alpha" }
    axiom B_dual { desc = "Required dual of B." formula = "\\widehat K_i K_i\\alpha\\to\\alpha" }
    axiom four { desc = "Transitivity schema." formula = "K_i\\alpha\\to K_i K_i\\alpha" }
    axiom four_dual { desc = "Required dual of 4." formula = "\\widehat K_i\\widehat K_i\\alpha\\to\\widehat K_i\\alpha" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Symmetric and transitive agent relations (partial equivalences); reflexivity and seriality are not required." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
  }
}

logic S5LFI1 {
  metadata {
    name = "Epistemic paraconsistent logic S5LFI1"
    family = "Paraconsistent"
    aliases = ["S5(LFI1)"]
    desc = "The S5 modal extension of KLFI1, including the dual schemata required in this paraconsistent setting."
    tags = ["LFI", "Three-valued", "Epistemic"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Equivalence relations for every agent."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 27 and 31, including the dual axioms on p. 11"
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.KLFI1."Hilbert"
    axiom T { desc = "Factivity schema." formula = "K_i\\alpha\\to\\alpha" }
    axiom T_dual { desc = "Required dual of T." formula = "\\alpha\\to\\widehat K_i\\alpha" }
    axiom four { desc = "Positive introspection." formula = "K_i\\alpha\\to K_i K_i\\alpha" }
    axiom four_dual { desc = "Required dual of 4." formula = "\\widehat K_i\\widehat K_i\\alpha\\to\\widehat K_i\\alpha" }
    axiom five { desc = "Euclidean schema in the paper’s notation." formula = "\\widehat K_i\\alpha\\to K_i\\widehat K_i\\alpha" }
    axiom five_dual { desc = "Required dual of 5." formula = "\\widehat K_i K_i\\alpha\\to K_i\\alpha" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Equivalence relations for every agent." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
  }
}

logic AMLFI1 {
  metadata {
    name = "Action-model paraconsistent logic AMLFI1"
    family = "Paraconsistent"
    aliases = ["AMLFI1(S5)", "AM(LFI1,S5)"]
    desc = "Finite action-model updates over the S5 LFI1 base, preserving atomic valuations."
    authors = ["Rafael Ongaratto", "Hans van Ditmarsch"]
    year = 2026
    tags = ["LFI", "Three-valued", "Epistemic", "Dynamic epistemic", "Action models"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Equivalence relations for every agent."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 33–35; Theorems 36, 42–45; frame adaptations in Section 3.3 (p. 19)"
      dynamic_operator = "The arity 1 counts the continuation formula only, relative to a specified pointed finite model. Preconditions (and postconditions for factual updates) are additional formula parameters. The paper explains the full variable-arity syntax on p. 13; the DSL does not parse action-model terms."
      factual_change = "Absent: atoms keep their old values at each surviving world-event pair."
      frame_variant = "AMLFI1 denotes the S5 version in the paper."
      uniform_substitution = "Not valid as an unrestricted rule; AM1 is restricted to atomic propositions."
      metatheory = "The paper reports soundness, strong completeness, compactness and decidability via strong-equivalence reduction; these are source claims."
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
    operator lfi_action(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.S5LFI1."Hilbert"
    axiom AM1 { desc = "Atomic p only; this clause assumes no factual change." formula = "[\\mathcal U,e]p\\equiv(\\operatorname{pre}(e)\\to p)" }
    axiom AM2 { desc = "Strong reduction for negation." formula = "[\\mathcal U,e]\\neg\\alpha\\equiv(\\operatorname{pre}(e)\\to\\neg[\\mathcal U,e]\\alpha)" }
    axiom AM3 { desc = "Strong reduction for inconsistency." formula = "[\\mathcal U,e]\\bullet\\alpha\\equiv(\\operatorname{pre}(e)\\to\\bullet[\\mathcal U,e]\\alpha)" }
    axiom AM4 { desc = "Conjunction reduction." formula = "[\\mathcal U,e](\\alpha\\land\\beta)\\equiv([\\mathcal U,e]\\alpha\\land[\\mathcal U,e]\\beta)" }
    axiom AM5 { desc = "Finite conjunction over agent-accessible events." formula = "[\\mathcal U,e]K_i\\alpha\\equiv\\left(\\operatorname{pre}(e)\\to\\bigwedge_{f:eS_i f}K_i[\\mathcal U,f]\\alpha\\right)" }
    rule RE { premise = ["\\vdash\\theta\\equiv\\gamma"] conclusion = "\\vdash\\alpha\\equiv\\alpha[\\theta/\\gamma]" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Equivalence relations for every agent." }
    restriction events { expression = "A finite nonempty event domain E; event relations S_i and world relations R_i belong to the same recorded frame class. Preconditions are finite well-founded formulas." }
    restriction admission { expression = "Preconditions of value 1/2 or 1 both admit execution. A precondition of value 0 makes the update box equal to 1." }
    restriction replacement { expression = "RE applies only to theorems of strong equivalence, not to designated biconditionals under arbitrary assumptions." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
    forcing product_worlds { condition = "$W^{\\otimes}=\\{(w,e)\\in W\\times E:\\vartheta_w(\\operatorname{pre}(e))\\in D\\}$" }
    forcing product_relations { condition = "$(w,e)R_i^{\\otimes}(v,f)\\iff (w,e),(v,f)\\in W^{\\otimes}\\land wR_i v\\land eS_i f$" }
    forcing update_box { condition = "$\\vartheta_w([\\mathcal U,e]\\alpha)=\\begin{cases}\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(\\alpha)&\\vartheta_w(\\operatorname{pre}(e))\\in D\\\\1&\\vartheta_w(\\operatorname{pre}(e))=0\\end{cases}$" }
    forcing atomic_preservation { condition = "$\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(p)=\\vartheta_w(p)$" }
  }
}

logic UMLFI1 {
  metadata {
    name = "Factual-update paraconsistent logic UMLFI1"
    family = "Paraconsistent"
    aliases = ["UMLFI1(S5)", "UM(LFI1,S5)"]
    desc = "Finite updates over the S5 LFI1 base with postconditions that can change atomic truth values."
    authors = ["Rafael Ongaratto", "Hans van Ditmarsch"]
    year = 2026
    tags = ["LFI", "Three-valued", "Epistemic", "Dynamic epistemic", "Factual change"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Equivalence relations for every agent."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 53–55, Theorem 56 and the following frame-adaptation paragraph"
      dynamic_operator = "The arity 1 counts the continuation formula only, relative to a specified pointed finite model. Preconditions (and postconditions for factual updates) are additional formula parameters. The paper explains the full variable-arity syntax on p. 13; the DSL does not parse action-model terms."
      factual_change = "Postconditions are evaluated in the old world. Only finitely many atoms are changed; unspecified atoms have the identity postcondition p."
      frame_variant = "UMLFI1 denotes the S5 version in the paper."
      metatheory = "Section 5.1 transfers the action-model proof by replacing AM1 with UM1; Theorem 56 checks UM1. Compiler validation does not prove the result."
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
    operator lfi_update(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.S5LFI1."Hilbert"
    axiom UM1 { desc = "Atomic p only. Replaces AM1; the old atom-preservation schema is not inherited." formula = "[\\mathcal U,e]p\\equiv(\\operatorname{pre}(e)\\to\\operatorname{post}(e)(p))" }
    axiom AM2 { desc = "Strong reduction for negation." formula = "[\\mathcal U,e]\\neg\\alpha\\equiv(\\operatorname{pre}(e)\\to\\neg[\\mathcal U,e]\\alpha)" }
    axiom AM3 { desc = "Strong reduction for inconsistency." formula = "[\\mathcal U,e]\\bullet\\alpha\\equiv(\\operatorname{pre}(e)\\to\\bullet[\\mathcal U,e]\\alpha)" }
    axiom AM4 { desc = "Conjunction reduction." formula = "[\\mathcal U,e](\\alpha\\land\\beta)\\equiv([\\mathcal U,e]\\alpha\\land[\\mathcal U,e]\\beta)" }
    axiom AM5 { desc = "Finite conjunction over agent-accessible events." formula = "[\\mathcal U,e]K_i\\alpha\\equiv\\left(\\operatorname{pre}(e)\\to\\bigwedge_{f:eS_i f}K_i[\\mathcal U,f]\\alpha\\right)" }
    rule RE { premise = ["\\vdash\\theta\\equiv\\gamma"] conclusion = "\\vdash\\alpha\\equiv\\alpha[\\theta/\\gamma]" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Equivalence relations for every agent." }
    restriction events { expression = "A finite nonempty event domain E; event relations S_i and world relations R_i belong to the same recorded frame class. Preconditions are finite well-founded formulas." }
    restriction admission { expression = "Preconditions of value 1/2 or 1 both admit execution. A precondition of value 0 makes the update box equal to 1." }
    restriction replacement { expression = "RE applies only to theorems of strong equivalence, not to designated biconditionals under arbitrary assumptions." }
    restriction postconditions { expression = "The post map has finite support in atoms; the identity postcondition is used outside that support. Postconditions and preconditions are well-founded formulas, evaluated before execution." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
    forcing product_worlds { condition = "$W^{\\otimes}=\\{(w,e)\\in W\\times E:\\vartheta_w(\\operatorname{pre}(e))\\in D\\}$" }
    forcing product_relations { condition = "$(w,e)R_i^{\\otimes}(v,f)\\iff (w,e),(v,f)\\in W^{\\otimes}\\land wR_i v\\land eS_i f$" }
    forcing update_box { condition = "$\\vartheta_w([\\mathcal U,e]\\alpha)=\\begin{cases}\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(\\alpha)&\\vartheta_w(\\operatorname{pre}(e))\\in D\\\\1&\\vartheta_w(\\operatorname{pre}(e))=0\\end{cases}$" }
    forcing atomic_postcondition { condition = "$\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(p)=\\vartheta_w(\\operatorname{post}(e)(p))$" }
  }
}

logic AMLFI1K {
  metadata {
    name = "Action-model paraconsistent logic AMLFI1K"
    family = "Paraconsistent"
    aliases = ["AMLFI1(K)", "AM(LFI1,K)"]
    desc = "Finite action-model updates over the K LFI1 base, preserving atomic valuations."
    authors = ["Rafael Ongaratto", "Hans van Ditmarsch"]
    year = 2026
    tags = ["LFI", "Three-valued", "Epistemic", "Dynamic epistemic", "Action models"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Arbitrary binary agent relations."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 33–35; Theorems 36, 42–45; frame adaptations in Section 3.3 (p. 19)"
      dynamic_operator = "The arity 1 counts the continuation formula only, relative to a specified pointed finite model. Preconditions (and postconditions for factual updates) are additional formula parameters. The paper explains the full variable-arity syntax on p. 13; the DSL does not parse action-model terms."
      factual_change = "Absent: atoms keep their old values at each surviving world-event pair."
      frame_variant = "Catalog-qualified K variant; the paper describes this adaptation in Section 3.3 without assigning this exact identifier."
      uniform_substitution = "Not valid as an unrestricted rule; AM1 is restricted to atomic propositions."
      metatheory = "The paper reports soundness, strong completeness, compactness and decidability via strong-equivalence reduction; these are source claims."
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
    operator lfi_action(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.KLFI1."Hilbert"
    axiom AM1 { desc = "Atomic p only; this clause assumes no factual change." formula = "[\\mathcal U,e]p\\equiv(\\operatorname{pre}(e)\\to p)" }
    axiom AM2 { desc = "Strong reduction for negation." formula = "[\\mathcal U,e]\\neg\\alpha\\equiv(\\operatorname{pre}(e)\\to\\neg[\\mathcal U,e]\\alpha)" }
    axiom AM3 { desc = "Strong reduction for inconsistency." formula = "[\\mathcal U,e]\\bullet\\alpha\\equiv(\\operatorname{pre}(e)\\to\\bullet[\\mathcal U,e]\\alpha)" }
    axiom AM4 { desc = "Conjunction reduction." formula = "[\\mathcal U,e](\\alpha\\land\\beta)\\equiv([\\mathcal U,e]\\alpha\\land[\\mathcal U,e]\\beta)" }
    axiom AM5 { desc = "Finite conjunction over agent-accessible events." formula = "[\\mathcal U,e]K_i\\alpha\\equiv\\left(\\operatorname{pre}(e)\\to\\bigwedge_{f:eS_i f}K_i[\\mathcal U,f]\\alpha\\right)" }
    rule RE { premise = ["\\vdash\\theta\\equiv\\gamma"] conclusion = "\\vdash\\alpha\\equiv\\alpha[\\theta/\\gamma]" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Arbitrary binary agent relations." }
    restriction events { expression = "A finite nonempty event domain E; event relations S_i and world relations R_i belong to the same recorded frame class. Preconditions are finite well-founded formulas." }
    restriction admission { expression = "Preconditions of value 1/2 or 1 both admit execution. A precondition of value 0 makes the update box equal to 1." }
    restriction replacement { expression = "RE applies only to theorems of strong equivalence, not to designated biconditionals under arbitrary assumptions." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
    forcing product_worlds { condition = "$W^{\\otimes}=\\{(w,e)\\in W\\times E:\\vartheta_w(\\operatorname{pre}(e))\\in D\\}$" }
    forcing product_relations { condition = "$(w,e)R_i^{\\otimes}(v,f)\\iff (w,e),(v,f)\\in W^{\\otimes}\\land wR_i v\\land eS_i f$" }
    forcing update_box { condition = "$\\vartheta_w([\\mathcal U,e]\\alpha)=\\begin{cases}\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(\\alpha)&\\vartheta_w(\\operatorname{pre}(e))\\in D\\\\1&\\vartheta_w(\\operatorname{pre}(e))=0\\end{cases}$" }
    forcing atomic_preservation { condition = "$\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(p)=\\vartheta_w(p)$" }
  }
}

logic UMLFI1K {
  metadata {
    name = "Factual-update paraconsistent logic UMLFI1K"
    family = "Paraconsistent"
    aliases = ["UMLFI1(K)", "UM(LFI1,K)"]
    desc = "Finite updates over the K LFI1 base with postconditions that can change atomic truth values."
    authors = ["Rafael Ongaratto", "Hans van Ditmarsch"]
    year = 2026
    tags = ["LFI", "Three-valued", "Epistemic", "Dynamic epistemic", "Factual change"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Arbitrary binary agent relations."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 53–55, Theorem 56 and the following frame-adaptation paragraph"
      dynamic_operator = "The arity 1 counts the continuation formula only, relative to a specified pointed finite model. Preconditions (and postconditions for factual updates) are additional formula parameters. The paper explains the full variable-arity syntax on p. 13; the DSL does not parse action-model terms."
      factual_change = "Postconditions are evaluated in the old world. Only finitely many atoms are changed; unspecified atoms have the identity postcondition p."
      frame_variant = "Catalog-qualified K variant described after Definition 55; not a separately named calculus in the paper."
      metatheory = "Section 5.1 transfers the action-model proof by replacing AM1 with UM1; Theorem 56 checks UM1. Compiler validation does not prove the result."
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
    operator lfi_update(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.KLFI1."Hilbert"
    axiom UM1 { desc = "Atomic p only. Replaces AM1; the old atom-preservation schema is not inherited." formula = "[\\mathcal U,e]p\\equiv(\\operatorname{pre}(e)\\to\\operatorname{post}(e)(p))" }
    axiom AM2 { desc = "Strong reduction for negation." formula = "[\\mathcal U,e]\\neg\\alpha\\equiv(\\operatorname{pre}(e)\\to\\neg[\\mathcal U,e]\\alpha)" }
    axiom AM3 { desc = "Strong reduction for inconsistency." formula = "[\\mathcal U,e]\\bullet\\alpha\\equiv(\\operatorname{pre}(e)\\to\\bullet[\\mathcal U,e]\\alpha)" }
    axiom AM4 { desc = "Conjunction reduction." formula = "[\\mathcal U,e](\\alpha\\land\\beta)\\equiv([\\mathcal U,e]\\alpha\\land[\\mathcal U,e]\\beta)" }
    axiom AM5 { desc = "Finite conjunction over agent-accessible events." formula = "[\\mathcal U,e]K_i\\alpha\\equiv\\left(\\operatorname{pre}(e)\\to\\bigwedge_{f:eS_i f}K_i[\\mathcal U,f]\\alpha\\right)" }
    rule RE { premise = ["\\vdash\\theta\\equiv\\gamma"] conclusion = "\\vdash\\alpha\\equiv\\alpha[\\theta/\\gamma]" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Arbitrary binary agent relations." }
    restriction events { expression = "A finite nonempty event domain E; event relations S_i and world relations R_i belong to the same recorded frame class. Preconditions are finite well-founded formulas." }
    restriction admission { expression = "Preconditions of value 1/2 or 1 both admit execution. A precondition of value 0 makes the update box equal to 1." }
    restriction replacement { expression = "RE applies only to theorems of strong equivalence, not to designated biconditionals under arbitrary assumptions." }
    restriction postconditions { expression = "The post map has finite support in atoms; the identity postcondition is used outside that support. Postconditions and preconditions are well-founded formulas, evaluated before execution." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
    forcing product_worlds { condition = "$W^{\\otimes}=\\{(w,e)\\in W\\times E:\\vartheta_w(\\operatorname{pre}(e))\\in D\\}$" }
    forcing product_relations { condition = "$(w,e)R_i^{\\otimes}(v,f)\\iff (w,e),(v,f)\\in W^{\\otimes}\\land wR_i v\\land eS_i f$" }
    forcing update_box { condition = "$\\vartheta_w([\\mathcal U,e]\\alpha)=\\begin{cases}\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(\\alpha)&\\vartheta_w(\\operatorname{pre}(e))\\in D\\\\1&\\vartheta_w(\\operatorname{pre}(e))=0\\end{cases}$" }
    forcing atomic_postcondition { condition = "$\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(p)=\\vartheta_w(\\operatorname{post}(e)(p))$" }
  }
}

logic AMLFI1KB4 {
  metadata {
    name = "Action-model paraconsistent logic AMLFI1KB4"
    family = "Paraconsistent"
    aliases = ["AMLFI1(KB4)", "AM(LFI1,KB4)"]
    desc = "Finite action-model updates over the KB4 LFI1 base, preserving atomic valuations."
    authors = ["Rafael Ongaratto", "Hans van Ditmarsch"]
    year = 2026
    tags = ["LFI", "Three-valued", "Epistemic", "Dynamic epistemic", "Action models"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Symmetric and transitive agent relations (partial equivalences); reflexivity and seriality are not required."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 33–35; Theorems 36, 42–45; frame adaptations in Section 3.3 (p. 19)"
      dynamic_operator = "The arity 1 counts the continuation formula only, relative to a specified pointed finite model. Preconditions (and postconditions for factual updates) are additional formula parameters. The paper explains the full variable-arity syntax on p. 13; the DSL does not parse action-model terms."
      factual_change = "Absent: atoms keep their old values at each surviving world-event pair."
      frame_variant = "Catalog-qualified KB4 variant; the paper describes this adaptation in Section 3.3 without assigning this exact identifier."
      uniform_substitution = "Not valid as an unrestricted rule; AM1 is restricted to atomic propositions."
      metatheory = "The paper reports soundness, strong completeness, compactness and decidability via strong-equivalence reduction; these are source claims."
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
    operator lfi_action(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.KB4LFI1."Hilbert"
    axiom AM1 { desc = "Atomic p only; this clause assumes no factual change." formula = "[\\mathcal U,e]p\\equiv(\\operatorname{pre}(e)\\to p)" }
    axiom AM2 { desc = "Strong reduction for negation." formula = "[\\mathcal U,e]\\neg\\alpha\\equiv(\\operatorname{pre}(e)\\to\\neg[\\mathcal U,e]\\alpha)" }
    axiom AM3 { desc = "Strong reduction for inconsistency." formula = "[\\mathcal U,e]\\bullet\\alpha\\equiv(\\operatorname{pre}(e)\\to\\bullet[\\mathcal U,e]\\alpha)" }
    axiom AM4 { desc = "Conjunction reduction." formula = "[\\mathcal U,e](\\alpha\\land\\beta)\\equiv([\\mathcal U,e]\\alpha\\land[\\mathcal U,e]\\beta)" }
    axiom AM5 { desc = "Finite conjunction over agent-accessible events." formula = "[\\mathcal U,e]K_i\\alpha\\equiv\\left(\\operatorname{pre}(e)\\to\\bigwedge_{f:eS_i f}K_i[\\mathcal U,f]\\alpha\\right)" }
    rule RE { premise = ["\\vdash\\theta\\equiv\\gamma"] conclusion = "\\vdash\\alpha\\equiv\\alpha[\\theta/\\gamma]" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Symmetric and transitive agent relations (partial equivalences); reflexivity and seriality are not required." }
    restriction events { expression = "A finite nonempty event domain E; event relations S_i and world relations R_i belong to the same recorded frame class. Preconditions are finite well-founded formulas." }
    restriction admission { expression = "Preconditions of value 1/2 or 1 both admit execution. A precondition of value 0 makes the update box equal to 1." }
    restriction replacement { expression = "RE applies only to theorems of strong equivalence, not to designated biconditionals under arbitrary assumptions." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
    forcing product_worlds { condition = "$W^{\\otimes}=\\{(w,e)\\in W\\times E:\\vartheta_w(\\operatorname{pre}(e))\\in D\\}$" }
    forcing product_relations { condition = "$(w,e)R_i^{\\otimes}(v,f)\\iff (w,e),(v,f)\\in W^{\\otimes}\\land wR_i v\\land eS_i f$" }
    forcing update_box { condition = "$\\vartheta_w([\\mathcal U,e]\\alpha)=\\begin{cases}\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(\\alpha)&\\vartheta_w(\\operatorname{pre}(e))\\in D\\\\1&\\vartheta_w(\\operatorname{pre}(e))=0\\end{cases}$" }
    forcing atomic_preservation { condition = "$\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(p)=\\vartheta_w(p)$" }
  }
}

logic UMLFI1KB4 {
  metadata {
    name = "Factual-update paraconsistent logic UMLFI1KB4"
    family = "Paraconsistent"
    aliases = ["UMLFI1(KB4)", "UM(LFI1,KB4)"]
    desc = "Finite updates over the KB4 LFI1 base with postconditions that can change atomic truth values."
    authors = ["Rafael Ongaratto", "Hans van Ditmarsch"]
    year = 2026
    tags = ["LFI", "Three-valued", "Epistemic", "Dynamic epistemic", "Factual change"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Symmetric and transitive agent relations (partial equivalences); reflexivity and seriality are not required."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "Definitions 53–55, Theorem 56 and the following frame-adaptation paragraph"
      dynamic_operator = "The arity 1 counts the continuation formula only, relative to a specified pointed finite model. Preconditions (and postconditions for factual updates) are additional formula parameters. The paper explains the full variable-arity syntax on p. 13; the DSL does not parse action-model terms."
      factual_change = "Postconditions are evaluated in the old world. Only finitely many atoms are changed; unspecified atoms have the identity postcondition p."
      frame_variant = "Catalog-qualified KB4 variant described after Definition 55; not a separately named calculus in the paper."
      metatheory = "Section 5.1 transfers the action-model proof by replacing AM1 with UM1; Theorem 56 checks UM1. Compiler validation does not prove the result."
    }
    references = ["lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
    operator lfi_update(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.KB4LFI1."Hilbert"
    axiom UM1 { desc = "Atomic p only. Replaces AM1; the old atom-preservation schema is not inherited." formula = "[\\mathcal U,e]p\\equiv(\\operatorname{pre}(e)\\to\\operatorname{post}(e)(p))" }
    axiom AM2 { desc = "Strong reduction for negation." formula = "[\\mathcal U,e]\\neg\\alpha\\equiv(\\operatorname{pre}(e)\\to\\neg[\\mathcal U,e]\\alpha)" }
    axiom AM3 { desc = "Strong reduction for inconsistency." formula = "[\\mathcal U,e]\\bullet\\alpha\\equiv(\\operatorname{pre}(e)\\to\\bullet[\\mathcal U,e]\\alpha)" }
    axiom AM4 { desc = "Conjunction reduction." formula = "[\\mathcal U,e](\\alpha\\land\\beta)\\equiv([\\mathcal U,e]\\alpha\\land[\\mathcal U,e]\\beta)" }
    axiom AM5 { desc = "Finite conjunction over agent-accessible events." formula = "[\\mathcal U,e]K_i\\alpha\\equiv\\left(\\operatorname{pre}(e)\\to\\bigwedge_{f:eS_i f}K_i[\\mathcal U,f]\\alpha\\right)" }
    rule RE { premise = ["\\vdash\\theta\\equiv\\gamma"] conclusion = "\\vdash\\alpha\\equiv\\alpha[\\theta/\\gamma]" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Symmetric and transitive agent relations (partial equivalences); reflexivity and seriality are not required." }
    restriction events { expression = "A finite nonempty event domain E; event relations S_i and world relations R_i belong to the same recorded frame class. Preconditions are finite well-founded formulas." }
    restriction admission { expression = "Preconditions of value 1/2 or 1 both admit execution. A precondition of value 0 makes the update box equal to 1." }
    restriction replacement { expression = "RE applies only to theorems of strong equivalence, not to designated biconditionals under arbitrary assumptions." }
    restriction postconditions { expression = "The post map has finite support in atoms; the identity postcondition is used outside that support. Postconditions and preconditions are well-founded formulas, evaluated before execution." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
    forcing product_worlds { condition = "$W^{\\otimes}=\\{(w,e)\\in W\\times E:\\vartheta_w(\\operatorname{pre}(e))\\in D\\}$" }
    forcing product_relations { condition = "$(w,e)R_i^{\\otimes}(v,f)\\iff (w,e),(v,f)\\in W^{\\otimes}\\land wR_i v\\land eS_i f$" }
    forcing update_box { condition = "$\\vartheta_w([\\mathcal U,e]\\alpha)=\\begin{cases}\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(\\alpha)&\\vartheta_w(\\operatorname{pre}(e))\\in D\\\\1&\\vartheta_w(\\operatorname{pre}(e))=0\\end{cases}$" }
    forcing atomic_postcondition { condition = "$\\vartheta^{M\\otimes\\mathcal U}_{(w,e)}(p)=\\vartheta_w(\\operatorname{post}(e)(p))$" }
  }
}

logic PALFI1 {
  metadata {
    name = "Paraconsistent public announcement logic PALFI1"
    family = "Paraconsistent"
    aliases = ["PALFI1C", "PALFI1_C", "PAL(LFI1)"]
    desc = "Public announcements over S5LFI1. One logic with the two corresponding axiom presentations discussed in the linked papers."
    authors = ["Rafael Ongaratto"]
    year = 2025
    tags = ["LFI", "Three-valued", "Epistemic", "Dynamic epistemic", "Public announcements"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Valid"
      gentle_explosion = "Valid with $\\circ\\alpha$"
      truth_values = "$\\{0,\\tfrac12,1\\}$; designated $D=\\{\\tfrac12,1\\}$."
      frames = "Equivalence relations for every agent."
      propositional_basis = "LFI1 with the abbreviation conventions recorded in KLFI1."
      agents = "A fixed finite agent set; K_i and its dual are indexed schematic operators."
      rule_scope = "MP may use hypotheses. Necessitation and RE, where present, have theorem-only premises. No unrestricted uniform substitution rule is added."
      source_location = "2025 publisher metadata/abstract; 2026 Section 4, PA1–PA5, Lemmas 50–51 and Theorem 52"
      dynamic_operator = "$[\\alpha]\\beta$ has two formula arguments: the announcement and its continuation."
      announcement_admission = "Keep worlds where the announcement has value 1/2 or 1; contradictory designated information is not discarded."
      presentation_provenance = "Hilbert is the 2026 PA1–PA5 plus theorem-level RE presentation. Composition (2025 comparison) is reconstructed from 2026 Section 4 using PA1–PA5 and composition, without explicit RE; it is not an independent transcription of the subscription-only 2025 full text."
      presentation_correspondence = "Section 4, Lemmas 50–51 and Theorem 52: composition is derivable in the RE presentation and RE is admissible in the composition presentation. PALFI1C is a comparison label for the 2025 presentation, not a new semantic logic."
      uniform_substitution = "No unrestricted substitution of arbitrary formulas for atomic p in PA1."
    }
    references = ["lfi_imperfect_reasoning", "lfi_dynamic_turn"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
    operator bullet(1)
    operator knows(1)
    operator lfi_announce(2)
  }
  presentation "Hilbert" {
    type = "HilbertWithGlobalRules"
    extends = presentation.S5LFI1."Hilbert"
    axiom PA1 { desc = "Atomic p only." formula = "[\\alpha]p\\equiv(\\alpha\\to p)" }
    axiom PA2 { desc = "Strong negation-reduction schema." formula = "[\\alpha]\\neg\\beta\\equiv(\\alpha\\to\\neg[\\alpha]\\beta)" }
    axiom PA3 { desc = "Inconsistency-reduction schema." formula = "[\\alpha]\\bullet\\beta\\equiv(\\alpha\\to\\bullet[\\alpha]\\beta)" }
    axiom PA4 { desc = "Conjunction reduction." formula = "[\\alpha](\\beta\\land\\gamma)\\equiv([\\alpha]\\beta\\land[\\alpha]\\gamma)" }
    axiom PA5 { desc = "Knowledge reduction." formula = "[\\alpha]K_i\\beta\\equiv(\\alpha\\to K_i[\\alpha]\\beta)" }
    rule RE { premise = ["\\vdash\\theta\\equiv\\gamma"] conclusion = "\\vdash\\alpha\\equiv\\alpha[\\theta/\\gamma]" }
  }
  presentation "Composition (2025 comparison)" {
    type = "Comparison reconstruction"
    extends = presentation.S5LFI1."Hilbert"
    axiom PA1 { desc = "Atomic p only." formula = "[\\alpha]p\\equiv(\\alpha\\to p)" }
    axiom PA2 { desc = "Strong negation-reduction schema." formula = "[\\alpha]\\neg\\beta\\equiv(\\alpha\\to\\neg[\\alpha]\\beta)" }
    axiom PA3 { desc = "Inconsistency-reduction schema." formula = "[\\alpha]\\bullet\\beta\\equiv(\\alpha\\to\\bullet[\\alpha]\\beta)" }
    axiom PA4 { desc = "Conjunction reduction." formula = "[\\alpha](\\beta\\land\\gamma)\\equiv([\\alpha]\\beta\\land[\\alpha]\\gamma)" }
    axiom PA5 { desc = "Knowledge reduction." formula = "[\\alpha]K_i\\beta\\equiv(\\alpha\\to K_i[\\alpha]\\beta)" }
    axiom PA_composition { desc = "Composition replaces explicit RE in the compared 2025 presentation." formula = "[\\alpha][\\beta]\\gamma\\equiv[\\alpha\\land[\\alpha]\\beta]\\gamma" }
  }
  semantics "Three-valued Kripke semantics" {
    type = "ThreeValuedKripkeUpdate"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping bullet {
      "0" -> "0"
      "1/2" -> "1"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction worlds { expression = "A nonempty world set and a fixed finite agent set; each world carries an LFI1 valuation." }
    restriction frames { expression = "Equivalence relations for every agent." }
    restriction public_update { expression = "Restrict the world set, every agent relation and the valuation to the designated announcement domain; surviving atomic values are unchanged." }
    forcing knowledge { condition = "$\\vartheta_w(K_i\\alpha)=\\inf\\{\\vartheta_v(\\alpha):wR_i v\\}$" }
    forcing empty_infimum { condition = "$0<\\tfrac12<1,\\qquad\\inf\\varnothing=1$" }
    forcing consequence { condition = "$\\Gamma\\models\\alpha\\iff\\forall M,w\\;(\\vartheta_w[\\Gamma]\\subseteq D\\Rightarrow\\vartheta_w(\\alpha)\\in D)$" }
    forcing announcement_domain { condition = "$W\\!\\upharpoonright\\!\\alpha=\\{w\\in W:\\vartheta_w(\\alpha)\\in D\\}$" }
    forcing announcement_box { condition = "$\\vartheta_w([\\alpha]\\beta)=\\begin{cases}\\vartheta^{M|\\alpha}_w(\\beta)&\\vartheta_w(\\alpha)\\in D\\\\1&\\vartheta_w(\\alpha)=0\\end{cases}$" }
  }
}

relation {
  type = "conservative_extension"
  parent = LFI1
  child = KLFI1
  desc = "Add the definitional bullet bridge and agent modalities over arbitrary three-valued Kripke frames; the inherited consistency-based propositional language is preserved. Definitions 15 and 25–26."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "extension"
  parent = KLFI1
  child = KB4LFI1
  desc = "Add B, 4 and their listed dual schemata in the shared modal LFI1 language; use symmetric/transitive relations."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "extension"
  parent = KLFI1
  child = S5LFI1
  desc = "Add T, 4, 5 and their listed dual schemata in the shared modal LFI1 language; use equivalence relations."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "extension"
  parent = KB4LFI1
  child = S5LFI1
  desc = "Refine partial-equivalence frames to equivalence frames. This compares the same three-valued epistemic language, not classical S5."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "conservative_extension"
  parent = S5LFI1
  child = AMLFI1
  desc = "Extend the S5 static LFI1 language by finite action updates with world and event relations in the same frame class; reduction preserves the static fragment. Section 3.3."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "conservative_extension"
  parent = S5LFI1
  child = UMLFI1
  desc = "Extend the S5 static LFI1 language by finite-support factual updates in the same frame class. Section 5.1."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "embedding"
  parent = AMLFI1
  child = UMLFI1
  desc = "Translate each no-factual-change action into an update model with identity postconditions for every atom. Do not carry AM1 over to arbitrary factual-update models."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "reduction"
  parent = AMLFI1
  child = S5LFI1
  desc = "Eliminate finite S5 action updates using strong equivalence and theorem-level RE. Ordinary biconditional replacement and unrestricted atom substitution are not assumed."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "reduction"
  parent = UMLFI1
  child = S5LFI1
  desc = "Eliminate finite S5 factual updates using UM1, AM2–AM5 and strong-equivalence replacement. Evaluate postconditions before execution."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "instance"
  parent = DEL
  child = AMLFI1
  desc = "A three-valued paraconsistent DEL framework member under its own explicit S5 world/event frame conditions; membership asserts no classical-logic equivalence."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "instance"
  parent = DEL
  child = UMLFI1
  desc = "A three-valued paraconsistent DEL framework member under its own explicit S5 world/event frame conditions; membership asserts no classical-logic equivalence."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "conservative_extension"
  parent = KLFI1
  child = AMLFI1K
  desc = "Extend the K static LFI1 language by finite action updates with world and event relations in the same frame class; reduction preserves the static fragment. Section 3.3."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "conservative_extension"
  parent = KLFI1
  child = UMLFI1K
  desc = "Extend the K static LFI1 language by finite-support factual updates in the same frame class. Section 5.1."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "embedding"
  parent = AMLFI1K
  child = UMLFI1K
  desc = "Translate each no-factual-change action into an update model with identity postconditions for every atom. Do not carry AM1 over to arbitrary factual-update models."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "reduction"
  parent = AMLFI1K
  child = KLFI1
  desc = "Eliminate finite K action updates using strong equivalence and theorem-level RE. Ordinary biconditional replacement and unrestricted atom substitution are not assumed."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "reduction"
  parent = UMLFI1K
  child = KLFI1
  desc = "Eliminate finite K factual updates using UM1, AM2–AM5 and strong-equivalence replacement. Evaluate postconditions before execution."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "instance"
  parent = DEL
  child = AMLFI1K
  desc = "A three-valued paraconsistent DEL framework member under its own explicit K world/event frame conditions; membership asserts no classical-logic equivalence."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "instance"
  parent = DEL
  child = UMLFI1K
  desc = "A three-valued paraconsistent DEL framework member under its own explicit K world/event frame conditions; membership asserts no classical-logic equivalence."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "conservative_extension"
  parent = KB4LFI1
  child = AMLFI1KB4
  desc = "Extend the KB4 static LFI1 language by finite action updates with world and event relations in the same frame class; reduction preserves the static fragment. Section 3.3."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "conservative_extension"
  parent = KB4LFI1
  child = UMLFI1KB4
  desc = "Extend the KB4 static LFI1 language by finite-support factual updates in the same frame class. Section 5.1."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "embedding"
  parent = AMLFI1KB4
  child = UMLFI1KB4
  desc = "Translate each no-factual-change action into an update model with identity postconditions for every atom. Do not carry AM1 over to arbitrary factual-update models."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "reduction"
  parent = AMLFI1KB4
  child = KB4LFI1
  desc = "Eliminate finite KB4 action updates using strong equivalence and theorem-level RE. Ordinary biconditional replacement and unrestricted atom substitution are not assumed."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "reduction"
  parent = UMLFI1KB4
  child = KB4LFI1
  desc = "Eliminate finite KB4 factual updates using UM1, AM2–AM5 and strong-equivalence replacement. Evaluate postconditions before execution."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "instance"
  parent = DEL
  child = AMLFI1KB4
  desc = "A three-valued paraconsistent DEL framework member under its own explicit KB4 world/event frame conditions; membership asserts no classical-logic equivalence."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "instance"
  parent = DEL
  child = UMLFI1KB4
  desc = "A three-valued paraconsistent DEL framework member under its own explicit KB4 world/event frame conditions; membership asserts no classical-logic equivalence."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "conservative_extension"
  parent = S5LFI1
  child = PALFI1
  desc = "Add designated-value public announcements to S5LFI1; either corresponding presentation reduces the dynamic language to the static base."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_imperfect_reasoning", "lfi_dynamic_turn"]
}

relation {
  type = "embedding"
  parent = PALFI1
  child = AMLFI1
  desc = "Translate an announcement into a single reflexive event for every agent, with the announced formula as precondition. Admission includes the contradictory designated value 1/2."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_dynamic_turn"]
}

relation {
  type = "reduction"
  parent = PALFI1
  child = S5LFI1
  desc = "Use the strong-equivalence reductions in Section 4. The two public-announcement presentations have the correspondence established by Lemmas 50–51 and Theorem 52."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_imperfect_reasoning", "lfi_dynamic_turn"]
}

relation {
  type = "instance"
  parent = DEL
  child = PALFI1
  desc = "A paraconsistent public-announcement member of the DEL framework, with a three-valued S5LFI1 base."
  status = "Literature-backed; explicit frame and language scope"
  references = ["lfi_imperfect_reasoning", "lfi_dynamic_turn"]
}

// Evidence bases and logics of evidence and truth (original bullet-equipped LET_F).

logic BLE {
  metadata {
    name = "Basic logic of evidence"
    family = "Paraconsistent"
    aliases = ["Nelson’s N4", "N4", "N_4"]
    desc = "Evidence-preserving logic with constructive implication; equivalent to Nelson’s N4. Contradictory and missing evidence are permitted."
    authors = ["Walter Carnielli", "Abilio Rodrigues"]
    year = 2017
    tags = ["Evidence", "Paraconsistent", "Paracomplete", "Constructive"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Not valid"
      double_negation = "Valid"
      axiomatization = "Representative rules only"
      source_location = "Sections 3.1–3.3; Definitions 2–3; Fact 10"
      implication = "Constructive; positive intuitionistic fragment"
    }
    references = ["let_epistemic"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
  }
  presentation "Representative rules" {
    type = "Sketch"
    rule modus_ponens { premise = ["A", "A \\to B"] conclusion = "B" }
    rule negated_implication { premise = ["A", "\\neg B"] conclusion = "\\neg(A \\to B)" }
  }
  semantics "Bivaluations" {
    type = "NonTruthFunctionalBivaluations"
    domain = ["0", "1"]
    designated = ["1"]
    restriction interpretation { expression = "0 and 1 label absence/presence of positive evidence, not classical falsity/truth. Atomic positive and negative evidence are independent. In implication clauses s denotes a semivaluation; v denotes an admitted valuation." }
    restriction conjunction { expression = "v(A and B) = 1 iff v(A) = v(B) = 1" }
    restriction disjunction { expression = "v(A or B) = 1 iff v(A) = 1 or v(B) = 1" }
    restriction negated_conjunction { expression = "v(not (A and B)) = 1 iff v(not A) = 1 or v(not B) = 1" }
    restriction negated_disjunction { expression = "v(not (A or B)) = 1 iff v(not A) = v(not B) = 1" }
    restriction double_negation { expression = "v(not not A) = v(A)" }
    restriction implication_false { expression = "If s(A) = 1 and s(B) = 0, then s(A implies B) = 0." }
    restriction implication_true { expression = "If s(B) = 1, then s(A implies B) = 1." }
    restriction negated_implication { expression = "s(not (A implies B)) = 1 iff s(A) = s(not B) = 1" }
    restriction valuation_condition { expression = "Use semivaluations satisfying all local clauses. Additionally (Val): if s(A1 implies (... implies (An implies B))) = 0, with B not an implication, there exists a semivaluation s_prime with every s_prime(Ai) = 1 and s_prime(B) = 0 (n >= 1). Definitions 2–3; for LET_J include the classicality clause in semivaluations. This global condition is essential; the local implication clauses alone are insufficient." }
    restriction consequence { expression = "Gamma entails A iff every admitted valuation assigning 1 to all premises also assigns 1 to A." }
  }
}

logic LET_J {
  metadata {
    name = "Logic of evidence and truth LET_J"
    family = "Paraconsistent"
    aliases = ["LETJ", "LET J", "LETⱼ"]
    desc = "BLE with a classicality operator: conclusive evidence licenses explosion and excluded middle for its argument."
    authors = ["Walter Carnielli", "Abilio Rodrigues"]
    year = 2017
    tags = ["Evidence", "Paraconsistent", "Paracomplete", "LET", "LFI", "LFU", "Classicality"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Not valid"
      double_negation = "Valid"
      axiomatization = "Representative rules only"
      source_location = "Sections 4.2–4.3"
      gentle_explosion = "Valid with $\\circ A$"
      gentle_excluded_middle = "$\\circ A \\vdash A \\lor \\neg A$"
    }
    references = ["let_epistemic"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator circle(1)
  }
  presentation "Representative rules" {
    type = "Sketch"
    extends = presentation.BLE."Representative rules"
    rule gentle_explosion { premise = ["\\circ A", "A", "\\neg A"] conclusion = "B" }
    rule gentle_excluded_middle { premise = ["\\circ A"] conclusion = "A \\lor \\neg A" }
  }
  semantics "Bivaluations" {
    type = "NonTruthFunctionalBivaluations"
    domain = ["0", "1"]
    designated = ["1"]
    restriction interpretation { expression = "0 and 1 label absence/presence of positive evidence, not classical falsity/truth. Atomic positive and negative evidence are independent. In implication clauses s denotes a semivaluation; v denotes an admitted valuation." }
    restriction conjunction { expression = "v(A and B) = 1 iff v(A) = v(B) = 1" }
    restriction disjunction { expression = "v(A or B) = 1 iff v(A) = 1 or v(B) = 1" }
    restriction negated_conjunction { expression = "v(not (A and B)) = 1 iff v(not A) = 1 or v(not B) = 1" }
    restriction negated_disjunction { expression = "v(not (A or B)) = 1 iff v(not A) = v(not B) = 1" }
    restriction double_negation { expression = "v(not not A) = v(A)" }
    restriction implication_false { expression = "If s(A) = 1 and s(B) = 0, then s(A implies B) = 0." }
    restriction implication_true { expression = "If s(B) = 1, then s(A implies B) = 1." }
    restriction negated_implication { expression = "s(not (A implies B)) = 1 iff s(A) = s(not B) = 1" }
    restriction valuation_condition { expression = "Use semivaluations satisfying all local clauses. Additionally (Val): if s(A1 implies (... implies (An implies B))) = 0, with B not an implication, there exists a semivaluation s_prime with every s_prime(Ai) = 1 and s_prime(B) = 0 (n >= 1). Definitions 2–3; for LET_J include the classicality clause in semivaluations. This global condition is essential; the local implication clauses alone are insufficient." }
    restriction classicality { expression = "v(circle A) = 1 implies v(A) + v(not A) = 1; the converse is not required." }
    restriction consequence { expression = "Gamma entails A iff every admitted valuation assigning 1 to all premises also assigns 1 to A." }
  }
}

logic LET_F {
  metadata {
    name = "Logic of evidence and truth LET_F"
    family = "Paraconsistent"
    aliases = ["LETF", "LET F"]
    desc = "FDE with classicality and its dual non-classicality operator. This record uses the original language with primitive bullet and no implication."
    authors = ["Abilio Rodrigues", "Juliana Bueno-Soler", "Walter Carnielli"]
    year = 2020
    tags = ["Evidence", "Paraconsistent", "Paracomplete", "LET", "LFI", "LFU", "Classicality"]
    properties {
      record_kind = "Logic"
      explosion = "Not valid"
      excluded_middle = "Not valid"
      double_negation = "Valid"
      axiomatization = "Representative rules only"
      source_location = "Measuring evidence, Section 3; Analytic proofs, Section 2, Definitions 1–2"
      gentle_explosion = "Valid with $\\circ A$"
      gentle_excluded_middle = "$\\circ A \\vdash A \\lor \\neg A$"
      variant_scope = "Primitive $\\bullet A$ is distinct from $\\neg\\circ A$; negations of classicality formulas remain weak."
    }
    references = ["let_measuring", "let_tableaux"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator circle(1)
    operator bullet(1)
  }
  presentation "Representative rules" {
    type = "Sketch"
    rule gentle_explosion { premise = ["\\circ A", "A", "\\neg A"] conclusion = "B" }
    rule gentle_excluded_middle { premise = ["\\circ A"] conclusion = "A \\lor \\neg A" }
    rule duality_explosion { premise = ["\\circ A", "\\bullet A"] conclusion = "B" }
    axiom duality { formula = "\\circ A \\lor \\bullet A" }
  }
  semantics "Bivaluations" {
    type = "NonTruthFunctionalBivaluations"
    domain = ["0", "1"]
    designated = ["1"]
    restriction interpretation { expression = "0 and 1 label absence/presence of positive evidence, not classical falsity/truth. Atomic positive and negative evidence are independent." }
    restriction conjunction { expression = "v(A and B) = 1 iff v(A) = v(B) = 1" }
    restriction disjunction { expression = "v(A or B) = 1 iff v(A) = 1 or v(B) = 1" }
    restriction negated_conjunction { expression = "v(not (A and B)) = 1 iff v(not A) = 1 or v(not B) = 1" }
    restriction negated_disjunction { expression = "v(not (A or B)) = 1 iff v(not A) = v(not B) = 1" }
    restriction double_negation { expression = "v(not not A) = v(A)" }
    restriction classicality { expression = "v(circle A) = 1 implies v(A) + v(not A) = 1; the converse is not required." }
    restriction non_classicality { expression = "v(bullet A) = 1 iff v(circle A) = 0" }
    restriction consequence { expression = "Gamma entails A iff every admitted valuation assigning 1 to all premises also assigns 1 to A." }
  }
}

relation {
  type = "conservative_extension"
  parent = FDE
  child = BLE
  desc = "Add constructive implication; the implication-free fragment is FDE."
  status = "Literature-backed; explicit language scope"
  references = ["let_epistemic"]
}

relation {
  type = "conservative_extension"
  parent = BLE
  child = LET_J
  desc = "Add classicality with gentle explosion and gentle excluded middle; preserve consequence in the circle-free BLE language."
  status = "Literature-backed; explicit language scope"
  references = ["let_epistemic"]
}

relation {
  type = "conservative_extension"
  parent = FDE
  child = LET_F
  desc = "Add circle and bullet with the stated valuation restrictions; preserve consequence in the shared negation, conjunction and disjunction language."
  status = "Literature-backed; explicit language scope"
  references = ["let_measuring", "let_tableaux"]
}


// Quantified languages: binder arity counts the formula body, not the bound variable.

source fo_openlogic {
  title = "The Open Logic Text (complete build, revision 9620cc7)"
  url = "https://builds.openlogicproject.org/open-logic-complete.pdf"
  authors = ["Open Logic Project"]
  year = 2026
}

source so_semantics {
  title = "Second-order and Higher-order Logic (Summer 2025 edition)"
  url = "https://plato.stanford.edu/archives/sum2025/entries/logic-higher-order/"
  authors = ["Jouko Väänänen"]
  year = 2025
}

source mso_strings {
  title = "Lecture Notes on Monadic First- and Second-Order Logic on Strings"
  url = "https://arxiv.org/abs/2301.10519"
  authors = ["Dino Mandrioli", "Davide Martinenghi", "Angelo Morzenti", "Matteo Pradella", "Matteo Rossi"]
  year = 2023
}

source lfi_first_order {
  title = "First-order swap structures semantics for some Logics of Formal Inconsistency"
  url = "https://arxiv.org/abs/1912.10277v1"
  authors = ["Marcelo E. Coniglio", "Aldo Figallo-Orellano", "Ana C. Golzio"]
  year = 2019
}

logic FOL {
  metadata {
    name = "Classical first-order logic"
    family = "Quantified"
    aliases = ["FO", "First-order logic", "Predicate logic", "FOL with equality"]
    desc = "Classical quantification over individuals in arbitrary nonempty structures, with identity and total functions."
    tags = ["Quantified", "First-order", "Classical", "Equality"]
    properties {
      record_kind = "Logic"
      axiomatization = "Representative schemata only"
      signature_scope = "Quantifiers have one formula-body argument and a bound-variable parameter. Terms, predicates, equality and relation-variable application have their stated sorts. The DSL records metasyntax; it does not check binding, sorts, capture avoidance or rule side conditions."
      explosion = "Valid"
      excluded_middle = "Valid"
      double_negation = "Valid"
      equality = "Standard identity on individuals"
      quantifier_range = "Individuals only; predicates and functions are vocabulary symbols, not quantified variables."
      source_location = "Open Logic Text, Chapters 15–16; Definition 16.11"
      completeness = "An effective sound and complete calculus exists; the encoded presentation is only a sketch."
    }
    references = ["fo_openlogic"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator equals(2)
    operator forall(1)
    operator exists(1)
  }
  presentation "Representative quantifier schemata" {
    type = "Sketch"
    axiom universal_instance { desc = "t must be free for x in A; substitution replaces free occurrences only." formula = "\\forall x\\,A \\to A[t/x]" }
    axiom existential_instance { desc = "t must be free for x in A." formula = "A[t/x] \\to \\exists x\\,A" }
  }
  semantics "Tarskian structures" {
    type = "TarskianSemantics"
    restriction individual_domain { expression = "A nonempty set U; variables range over U, constants denote elements, and n-ary function symbols denote total maps U^n -> U." }
    restriction vocabulary { expression = "An arbitrary first-order vocabulary with finite predicate/function arities; terms are interpreted recursively under assignment s. Equality denotes identity." }
    forcing atomic { condition = "$M,s\\models P(t_1,\\ldots,t_n)\\iff (t_1^{M,s},\\ldots,t_n^{M,s})\\in P^M$" }
    forcing equality { condition = "$M,s\\models t=u\\iff t^{M,s}=u^{M,s}$" }
    forcing negation { condition = "$M,s\\models\\neg A\\iff M,s\\not\\models A$" }
    forcing conjunction { condition = "$M,s\\models A\\land B\\iff (M,s\\models A\\text{ and }M,s\\models B)$" }
    forcing disjunction { condition = "$M,s\\models A\\lor B\\iff (M,s\\models A\\text{ or }M,s\\models B)$" }
    forcing implication { condition = "$M,s\\models A\\to B\\iff (M,s\\not\\models A\\text{ or }M,s\\models B)$" }
    forcing universal { condition = "$M,s\\models\\forall x\\,A\\iff\\forall a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    forcing existential { condition = "$M,s\\models\\exists x\\,A\\iff\\exists a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    restriction consequence { expression = "For sentences, truth in every model of all premises. For open formulas, fix the same assignment when testing premises and conclusion (local consequence)." }
  }
}

logic MSO {
  metadata {
    name = "Monadic second-order logic"
    family = "Quantified"
    aliases = ["Monadic SO", "MSOL"]
    desc = "Full second-order quantification over subsets of the individual domain; fixed first-order predicates may have any finite arity."
    tags = ["Quantified", "Second-order", "Classical", "Equality", "Monadic"]
    properties {
      record_kind = "Logic"
      axiomatization = "Representative schemata only"
      signature_scope = "Quantifiers have one formula-body argument and a bound-variable parameter. Terms, predicates, equality and relation-variable application have their stated sorts. The DSL records metasyntax; it does not check binding, sorts, capture avoidance or rule side conditions."
      explosion = "Valid"
      excluded_middle = "Valid"
      double_negation = "Valid"
      equality = "Standard identity on individuals"
      quantifier_range = "Individuals in U and all subsets of U. Only second-order variables are restricted to unary predicates."
      variant_scope = "Full MSO over arbitrary structures; no restriction to finite models, words, trees, MSO1/MSO2 graph encodings, or weak MSO."
      source_location = "Second-order and Higher-order Logic, syntax and full semantics; string specialization in the lecture notes, Section 3"
    }
    references = ["so_semantics", "mso_strings"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator equals(2)
    operator forall(1)
    operator exists(1)
    operator forall_set(1)
    operator exists_set(1)
  }
  presentation "Representative quantifier schemata" {
    type = "Sketch"
    extends = presentation.FOL."Representative quantifier schemata"
    axiom set_instance { desc = "Y is a unary relation variable free for X in A." formula = "\\forall X\\,A\\to A[Y/X]" }
  }
  semantics "Full structures" {
    type = "FullSecondOrderSemantics"
    restriction individual_domain { expression = "A nonempty set U; variables range over U, constants denote elements, and n-ary function symbols denote total maps U^n -> U." }
    restriction vocabulary { expression = "An arbitrary first-order vocabulary with finite predicate/function arities; terms are interpreted recursively under assignment s. Equality denotes identity." }
    forcing atomic { condition = "$M,s\\models P(t_1,\\ldots,t_n)\\iff (t_1^{M,s},\\ldots,t_n^{M,s})\\in P^M$" }
    forcing equality { condition = "$M,s\\models t=u\\iff t^{M,s}=u^{M,s}$" }
    forcing negation { condition = "$M,s\\models\\neg A\\iff M,s\\not\\models A$" }
    forcing conjunction { condition = "$M,s\\models A\\land B\\iff (M,s\\models A\\text{ and }M,s\\models B)$" }
    forcing disjunction { condition = "$M,s\\models A\\lor B\\iff (M,s\\models A\\text{ or }M,s\\models B)$" }
    forcing implication { condition = "$M,s\\models A\\to B\\iff (M,s\\not\\models A\\text{ or }M,s\\models B)$" }
    forcing universal { condition = "$M,s\\models\\forall x\\,A\\iff\\forall a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    forcing existential { condition = "$M,s\\models\\exists x\\,A\\iff\\exists a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    restriction consequence { expression = "For sentences, truth in every model of all premises. For open formulas, fix the same assignment when testing premises and conclusion (local consequence)." }
    forcing set_atom { condition = "$M,s\\models X(t)\\iff t^{M,s}\\in s(X)$" }
    forcing set_universal { condition = "$M,s\\models\\forall X\\,A\\iff\\forall S\\subseteq U\\;(M,s[X\\mapsto S]\\models A)$" }
    forcing set_existential { condition = "$M,s\\models\\exists X\\,A\\iff\\exists S\\subseteq U\\;(M,s[X\\mapsto S]\\models A)$" }
  }
}

logic SO {
  metadata {
    name = "Second-order logic with full semantics"
    family = "Quantified"
    aliases = ["SOL", "Second-order logic", "Full second-order logic"]
    desc = "Classical logic allowing quantification over relations of every positive finite arity, interpreted over all such relations."
    tags = ["Quantified", "Second-order", "Classical", "Equality", "Full semantics"]
    properties {
      record_kind = "Logic"
      axiomatization = "Representative schemata only"
      signature_scope = "Quantifiers have one formula-body argument and a bound-variable parameter. Terms, predicates, equality and relation-variable application have their stated sorts. The DSL records metasyntax; it does not check binding, sorts, capture avoidance or rule side conditions."
      explosion = "Valid"
      excluded_middle = "Valid"
      double_negation = "Valid"
      equality = "Standard identity on individuals"
      quantifier_range = "Individuals in U and all subsets of U^n for each positive finite arity n."
      variant_scope = "Relational second-order syntax; relation variables take individual arguments only. Quantified function variables can be represented by total functional relations."
      completeness = "No effective sound and complete proof calculus for full semantic validity in general; the presentation is a sketch."
      source_location = "Second-order and Higher-order Logic, full semantics"
    }
    references = ["so_semantics"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator equals(2)
    operator forall(1)
    operator exists(1)
    operator forall_relation(1)
    operator exists_relation(1)
  }
  presentation "Representative quantifier schemata" {
    type = "Sketch"
    extends = presentation.FOL."Representative quantifier schemata"
    axiom relation_instance { desc = "S has the same arity as R and is free for R in A." formula = "\\forall R^n\\,A\\to A[S^n/R^n]" }
  }
  semantics "Full structures" {
    type = "FullSecondOrderSemantics"
    restriction individual_domain { expression = "A nonempty set U; variables range over U, constants denote elements, and n-ary function symbols denote total maps U^n -> U." }
    restriction vocabulary { expression = "An arbitrary first-order vocabulary with finite predicate/function arities; terms are interpreted recursively under assignment s. Equality denotes identity." }
    forcing atomic { condition = "$M,s\\models P(t_1,\\ldots,t_n)\\iff (t_1^{M,s},\\ldots,t_n^{M,s})\\in P^M$" }
    forcing equality { condition = "$M,s\\models t=u\\iff t^{M,s}=u^{M,s}$" }
    forcing negation { condition = "$M,s\\models\\neg A\\iff M,s\\not\\models A$" }
    forcing conjunction { condition = "$M,s\\models A\\land B\\iff (M,s\\models A\\text{ and }M,s\\models B)$" }
    forcing disjunction { condition = "$M,s\\models A\\lor B\\iff (M,s\\models A\\text{ or }M,s\\models B)$" }
    forcing implication { condition = "$M,s\\models A\\to B\\iff (M,s\\not\\models A\\text{ or }M,s\\models B)$" }
    forcing universal { condition = "$M,s\\models\\forall x\\,A\\iff\\forall a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    forcing existential { condition = "$M,s\\models\\exists x\\,A\\iff\\exists a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    restriction consequence { expression = "For sentences, truth in every model of all premises. For open formulas, fix the same assignment when testing premises and conclusion (local consequence)." }
    restriction relation_sorts { expression = "Each relation variable R has a fixed positive finite arity n. Assignment s(R) is an n-ary relation; no quantification over higher types." }
    forcing relation_atom { condition = "$M,s\\models R(t_1,\\ldots,t_n)\\iff (t_1^{M,s},\\ldots,t_n^{M,s})\\in s(R)$" }
    forcing relation_universal { condition = "$M,s\\models\\forall R^n\\,A\\iff\\forall S\\in \\mathcal P(U^n)\\;(M,s[R\\mapsto S]\\models A)$" }
    forcing relation_existential { condition = "$M,s\\models\\exists R^n\\,A\\iff\\exists S\\in \\mathcal P(U^n)\\;(M,s[R\\mapsto S]\\models A)$" }
  }
}

logic SOHenkin {
  metadata {
    name = "Second-order logic with Henkin semantics"
    family = "Quantified"
    aliases = ["Henkin SO", "SOL Henkin", "General second-order logic"]
    desc = "The SO language interpreted using admissible relation domains with comprehension, rather than all relations."
    tags = ["Quantified", "Second-order", "Classical", "Equality", "Henkin"]
    properties {
      record_kind = "Logic"
      axiomatization = "Representative schemata only"
      signature_scope = "Quantifiers have one formula-body argument and a bound-variable parameter. Terms, predicates, equality and relation-variable application have their stated sorts. The DSL records metasyntax; it does not check binding, sorts, capture avoidance or rule side conditions."
      explosion = "Valid"
      excluded_middle = "Valid"
      double_negation = "Valid"
      equality = "Standard identity on individuals"
      quantifier_range = "Individuals in U and admissible relations G_n contained in the powerset of U^n."
      variant_scope = "Relational Henkin models satisfying full impredicative comprehension and second-order choice schemata, following the cited convention; not arbitrary relation collections."
      completeness = "Effective complete calculi exist for the specified Henkin semantics; no complete calculus is encoded here."
      source_location = "Second-order and Higher-order Logic, general/Henkin semantics"
    }
    references = ["so_semantics"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator equals(2)
    operator forall(1)
    operator exists(1)
    operator forall_relation(1)
    operator exists_relation(1)
  }
  presentation "Representative quantifier schemata" {
    type = "Sketch"
    extends = presentation.FOL."Representative quantifier schemata"
    axiom relation_instance { desc = "S has the same arity as R and is free for R in A." formula = "\\forall R^n\\,A\\to A[S^n/R^n]" }
  }
  semantics "Henkin structures" {
    type = "HenkinSemantics"
    restriction individual_domain { expression = "A nonempty set U; variables range over U, constants denote elements, and n-ary function symbols denote total maps U^n -> U." }
    restriction vocabulary { expression = "An arbitrary first-order vocabulary with finite predicate/function arities; terms are interpreted recursively under assignment s. Equality denotes identity." }
    forcing atomic { condition = "$M,s\\models P(t_1,\\ldots,t_n)\\iff (t_1^{M,s},\\ldots,t_n^{M,s})\\in P^M$" }
    forcing equality { condition = "$M,s\\models t=u\\iff t^{M,s}=u^{M,s}$" }
    forcing negation { condition = "$M,s\\models\\neg A\\iff M,s\\not\\models A$" }
    forcing conjunction { condition = "$M,s\\models A\\land B\\iff (M,s\\models A\\text{ and }M,s\\models B)$" }
    forcing disjunction { condition = "$M,s\\models A\\lor B\\iff (M,s\\models A\\text{ or }M,s\\models B)$" }
    forcing implication { condition = "$M,s\\models A\\to B\\iff (M,s\\not\\models A\\text{ or }M,s\\models B)$" }
    forcing universal { condition = "$M,s\\models\\forall x\\,A\\iff\\forall a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    forcing existential { condition = "$M,s\\models\\exists x\\,A\\iff\\exists a\\in U\\;(M,s[x\\mapsto a]\\models A)$" }
    restriction consequence { expression = "For sentences, truth in every model of all premises. For open formulas, fix the same assignment when testing premises and conclusion (local consequence)." }
    restriction relation_sorts { expression = "Each relation variable R has a fixed positive finite arity n. Assignment s(R) is an n-ary relation; no quantification over higher types." }
    forcing relation_atom { condition = "$M,s\\models R(t_1,\\ldots,t_n)\\iff (t_1^{M,s},\\ldots,t_n^{M,s})\\in s(R)$" }
    forcing relation_universal { condition = "$M,s\\models\\forall R^n\\,A\\iff\\forall S\\in G_n\\;(M,s[R\\mapsto S]\\models A)$" }
    forcing relation_existential { condition = "$M,s\\models\\exists R^n\\,A\\iff\\exists S\\in G_n\\;(M,s[R\\mapsto S]\\models A)$" }
    restriction admissible_relations { expression = "$\\varnothing\\ne G_n\\subseteq\\mathcal P(U^n)$ for each n >= 1. Every formula-definable n-ary relation, with individual and relation parameters, belongs to G_n (full impredicative comprehension). Require the second-order choice schemata of the cited Henkin convention." }
    restriction model_scope { expression = "Full relation domains are included among Henkin models; arbitrary nonempty G_n without the required closure and choice are not admitted." }
  }
}

logic QmbC {
  metadata {
    name = "Quantified basic logic of formal inconsistency"
    family = "Quantified"
    aliases = ["QmbC without equality"]
    desc = "First-order mbC with individual quantifiers and non-deterministic swap-structure semantics."
    tags = ["Quantified", "First-order", "Paraconsistent", "LFI"]
    properties {
      record_kind = "Logic"
      axiomatization = "Inherited Hilbert schemata with stated metalinguistic side conditions"
      signature_scope = "Quantifiers have one formula-body argument and a bound-variable parameter. Terms, predicates, equality and relation-variable application have their stated sorts. The DSL records metasyntax; it does not check binding, sorts, capture avoidance or rule side conditions. Here circle is consistency; predicates have arbitrary positive finite arity."
      explosion = "Not valid"
      excluded_middle = "Valid"
      double_negation = "Not valid"
      equality = "Equality-free language; standard equality extensions are separate."
      consequence_scope = "Global consequence: all assignments satisfy each premise before requiring all assignments to satisfy the conclusion. On sentences this is ordinary model consequence."
      rule_scope = "The quantifier rules use global consequence. Their displayed freshness premises are side conditions, not object-language formulas; the compiler does not enforce them."
      source_location = "Definitions 5.4 and 6.9; the semantics block is a sketch of legal swap valuations."
      semantics_scope = "Swap-structure sketch; Definition 6.9, including substitution coherence and variant invariance, specifies the full valuation conditions."
    }
    references = ["lfi_first_order"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator forall(1)
    operator exists(1)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithSideConditions"
    extends = presentation.mbC."Hilbert"
    axiom universal_instance { desc = "t must be free for x in A; substitution replaces free occurrences only." formula = "\\forall x\\,A \\to A[t/x]" }
    axiom existential_instance { desc = "t must be free for x in A." formula = "A[t/x] \\to \\exists x\\,A" }
    axiom variants { desc = "A and B differ only by capture-avoiding bound-variable renaming or addition/deletion of vacuous quantifiers." formula = "A\\to B" }
    rule exists_in { premise = ["A\\to B", "x\\notin\\operatorname{FV}(B)"] conclusion = "\\exists x\\,A\\to B" }
    rule forall_in { premise = ["A\\to B", "x\\notin\\operatorname{FV}(A)"] conclusion = "A\\to\\forall x\\,B" }
  }
  semantics "Swap-structure sketch" {
    type = "FirstOrderSwapStructureSketch"
    restriction individual_domain { expression = "Nonempty individual domain U; arbitrary positive-arity predicates, constants, total function symbols and individual assignments. No built-in equality." }
    restriction consequence { expression = "Global consequence, as in the cited paper: for every structure (and every legal valuation in QmbC), if each premise is designated under every assignment, the conclusion is designated under every assignment. Sentences have no assignment dependence." }
    restriction swap_domain { expression = "Over a complete Boolean algebra A, use triples $(a,b,c)$ with $a\\lor b=1$ and $a\\land b\\land c=0$. A value is designated exactly when its first coordinate is 1." }
    restriction connectives { expression = "Each binary connective fixes the first output coordinate by its Boolean operation on the first input coordinates; negation fixes it to the second input coordinate and circle fixes it to the third. Other coordinates are chosen legally in the swap domain." }
    forcing universal { condition = "$v(\\forall x\\,A)_1=\\bigwedge_{a\\in U}v(A[\\bar a/x])_1$" }
    forcing existential { condition = "$v(\\exists x\\,A)_1=\\bigvee_{a\\in U}v(A[\\bar a/x])_1$" }
    restriction valuation_coherence { expression = "Predicates map tuples into the swap domain. Legal valuations must additionally obey substitution coherence and invariance under variants (Definition 6.9, clauses vi–vii). First-coordinate conditions alone are not a complete semantics. Here bar a is a diagram-language name for a." }
  }
}

logic QLFI1 {
  metadata {
    name = "Quantified LFI1 with consistency"
    family = "Quantified"
    aliases = ["QLFI1o", "QLFI1_circle", "QLFI1◦", "QLFI1∘"]
    desc = "The equality-free QLFI1-circle formulation: three-valued first-order LFI1 with consistency and dual quantifiers."
    tags = ["Quantified", "First-order", "Paraconsistent", "LFI", "Three-valued"]
    properties {
      record_kind = "Logic"
      axiomatization = "Inherited Hilbert schemata with stated metalinguistic side conditions"
      signature_scope = "Quantifiers have one formula-body argument and a bound-variable parameter. Terms, predicates, equality and relation-variable application have their stated sorts. The DSL records metasyntax; it does not check binding, sorts, capture avoidance or rule side conditions. Here circle is consistency; predicates have arbitrary positive finite arity."
      explosion = "Not valid"
      excluded_middle = "Valid"
      double_negation = "Valid"
      equality = "Equality-free language; standard equality extensions are separate."
      consequence_scope = "Global consequence: all assignments satisfy each premise before requiring all assignments to satisfy the conclusion. On sentences this is ordinary model consequence."
      rule_scope = "The quantifier rules use global consequence. Their displayed freshness premises are side conditions, not object-language formulas; the compiler does not enforce them."
      source_location = "Definitions 12.1, 12.9 and 12.14; Section 14, three-valued structures."
      variant_scope = "QLFI1 denotes the consistency-language QLFI1-circle of the cited paper. Standard equality is an additional extension. The inherited variants axiom is redundant."
      truth_values = "0 = false only; 1/2 = both; 1 = true only. These are truth values, not individuals."
      abbreviations = "$A\\leftrightarrow B$ abbreviates $(A\\to B)\\land(B\\to A)$."
    }
    references = ["lfi_first_order"]
  }
  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
    operator forall(1)
    operator exists(1)
    operator circle(1)
  }
  presentation "Hilbert" {
    type = "HilbertWithSideConditions"
    extends = presentation.QmbC."Hilbert"
    axiom ci { formula = "\\neg\\circ A\\to(A\\land\\neg A)" }
    axiom dneg { formula = "\\neg\\neg A\\leftrightarrow A" }
    axiom neg_or { formula = "\\neg(A\\lor B)\\leftrightarrow(\\neg A\\land\\neg B)" }
    axiom neg_and { formula = "\\neg(A\\land B)\\leftrightarrow(\\neg A\\lor\\neg B)" }
    axiom neg_implies { formula = "\\neg(A\\to B)\\leftrightarrow(A\\land\\neg B)" }
    axiom neg_exists { formula = "\\neg\\exists x\\,A\\leftrightarrow\\forall x\\,\\neg A" }
    axiom neg_forall { formula = "\\neg\\forall x\\,A\\leftrightarrow\\exists x\\,\\neg A" }
  }
  semantics "Three-valued first-order structures" {
    type = "FirstOrderValuationMatrix"
    domain = ["0", "1/2", "1"]
    designated = ["1/2", "1"]
    operator_mapping not {
      "0" -> "1"
      "1/2" -> "1/2"
      "1" -> "0"
    }
    operator_mapping circle {
      "0" -> "1"
      "1/2" -> "0"
      "1" -> "1"
    }
    operator_mapping and {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "0"
      ["0", "1"] -> "0"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1/2"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    operator_mapping or {
      ["0", "0"] -> "0"
      ["0", "1/2"] -> "1/2"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "1/2"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "1"
      ["1", "1/2"] -> "1"
      ["1", "1"] -> "1"
    }
    operator_mapping implies {
      ["0", "0"] -> "1"
      ["0", "1/2"] -> "1"
      ["0", "1"] -> "1"
      ["1/2", "0"] -> "0"
      ["1/2", "1/2"] -> "1/2"
      ["1/2", "1"] -> "1"
      ["1", "0"] -> "0"
      ["1", "1/2"] -> "1/2"
      ["1", "1"] -> "1"
    }
    restriction individual_domain { expression = "Nonempty individual domain U; arbitrary positive-arity predicates, constants, total function symbols and individual assignments. No built-in equality." }
    restriction consequence { expression = "Global consequence, as in the cited paper: for every structure (and every legal valuation in QmbC), if each premise is designated under every assignment, the conclusion is designated under every assignment. Sentences have no assignment dependence." }
    restriction predicates { expression = "Each n-ary predicate denotes a total map U^n -> {0, 1/2, 1}; term evaluation uses the individual structure and assignment. Propositional connectives use the tables above." }
    restriction quantifier_order { expression = "Use the truth-value order 0 < 1/2 < 1; the individual domain remains nonempty. All quantifier instances vary the same bound variable while retaining other assignment values." }
    forcing atomic { condition = "$v_s(P(t_1,\\ldots,t_n))=P^M(t_1^{M,s},\\ldots,t_n^{M,s})$" }
    forcing universal { condition = "$v_s(\\forall x\\,A)=\\inf\\{v_{s[x\\mapsto a]}(A):a\\in U\\}$" }
    forcing existential { condition = "$v_s(\\exists x\\,A)=\\sup\\{v_{s[x\\mapsto a]}(A):a\\in U\\}$" }
  }
}

relation {
  type = "conservative_extension"
  parent = CPL
  child = FOL
  desc = "Expand classical propositional logic with predicates, terms, identity and individual quantifiers. Identify each propositional variable p with a fresh unary predicate P_p(c) at a fixed constant c; over nonempty structures, consequence on this propositional fragment is preserved and reflected."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["fo_openlogic"]
}

relation {
  type = "language_extension"
  parent = FOL
  child = MSO
  desc = "Add unary relation variables and full set quantifiers; retain arbitrary first-order predicate arities and identity. Shared first-order sentences have the same truth conditions."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["so_semantics"]
}

relation {
  type = "language_extension"
  parent = MSO
  child = SO
  desc = "Allow quantified relations of every positive finite arity; translate MSO set binders to unary relation binders. Both records use full semantics over arbitrary nonempty structures."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["so_semantics"]
}

relation {
  type = "language_extension"
  parent = FOL
  child = SOHenkin
  desc = "Add relation variables and Henkin quantification with the specified comprehension and choice; shared first-order sentences retain their truth conditions."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["so_semantics"]
}

relation {
  type = "extension"
  parent = SOHenkin
  child = SO
  desc = "In the same relational second-order language, restrict Henkin models to full relation domains. This preserves Henkin entailments; it is not an equivalence of the two semantics."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["so_semantics"]
}

relation {
  type = "embedding"
  parent = mbC
  child = QmbC
  desc = "Translate propositional variables to fresh unary predicates P_p(c) at a fixed constant c. Compare propositional consequence with the closed quantifier-free fragment; global open-formula consequence has additional generalization behavior."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["lfi_first_order"]
}

relation {
  type = "embedding"
  parent = LFI1
  child = QLFI1
  desc = "Identify the consistency-language propositional matrix via F = 0, B = 1/2, T = 1, and translate each atom p to P_p(c) at a fixed constant. The closed quantifier-free fragment preserves propositional consequence."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["lfi_first_order"]
}

relation {
  type = "extension"
  parent = QmbC
  child = QLFI1
  desc = "Add the LFI1-circle propositional axioms and both quantifier-negation dualities in the shared equality-free first-order language; retain the global consequence convention."
  status = "Literature-backed; explicit language and consequence scope"
  references = ["lfi_first_order"]
}

