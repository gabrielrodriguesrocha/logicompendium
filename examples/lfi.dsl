// A small Logic of Formal Inconsistency example.
logic LFI1 {
  metadata {
    name = "Logic of Formal Inconsistency 1"
    family = "Paraconsistent"
    aliases = [
      "J_3",
      "LFI1" { author = "Carnielli, Marcos and de Amo", year = 2000 }
    ]
  }

  signature {
    operator not(1)
    operator circle(1)
    operator implies(2)
  }

  presentation "Hilbert-style" {
    type = "Hilbert"

    axiom positive_fragment {
      desc = "A representative positive classical axiom."
      formula = "A implies (B implies A)"
    }
    rule modus_ponens {
      premise = ["A", "A implies B"]
      conclusion = "B"
    }
  }

  semantics "3-valued Matrix" {
    type = "ValuationMatrix"
    domain = [false_value, both, true_value]
    designated = [both, true_value]

    operator_mapping circle {
      false_value -> true_value
      both -> false_value
      true_value -> true_value
    }
  }

  adequacy "Standard Adequacy" {
    syntax = presentation."Hilbert-style"
    semantics = semantics."3-valued Matrix"

    theorem soundness {
      status = "proven"
    }
  }
}

relation {
  type = "sublogic"
  parent = ClassicalProp
  child = LFI1
}
