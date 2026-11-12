// Classical propositional logic with a two-valued matrix.
logic ClassicalProp {
  metadata {
    name = "Classical Propositional Logic"
    family = "Classical"
    aliases = ["CPL", "Boolean Logic"]
  }

  signature {
    operator not(1)
    operator and(2)
    operator or(2)
    operator implies(2)
  }

  presentation "Natural Deduction" {
    type = "NaturalDeduction"

    rule modus_ponens {
      premise = ["A", "A implies B"]
      conclusion = "B"
    }
  }

  semantics "Boolean Matrix" {
    type = "ValuationMatrix"
    domain = [false_value, true_value]
    designated = [true_value]

    operator_mapping not {
      false_value -> true_value
      true_value -> false_value
    }
  }

  adequacy "Standard Completeness" {
    syntax = presentation."Natural Deduction"
    semantics = semantics."Boolean Matrix"

    theorem soundness {
      status = "proven"
      formal_statement = "If Gamma proves A, then Gamma entails A"
      proof_method = "induction on derivations"
      finitizable = true
      desc = "Every derivable formula is semantically valid."
    }
  }
}
