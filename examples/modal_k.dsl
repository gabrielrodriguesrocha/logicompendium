// Normal modal logic K with a relational semantics sketch.
logic ModalK {
  metadata {
    name = "Normal Modal Logic K"
    family = "Modal"
    aliases = ["K"]
  }

  signature {
    operator not(1)
    operator implies(2)
    operator box(1)
  }

  presentation "Hilbert K" {
    type = "Hilbert"

    axiom distribution {
      formula = "box(A implies B) implies (box A implies box B)"
    }
    rule necessitation {
      premise = ["A"]
      conclusion = "box A"
    }
  }

  semantics "Kripke Frames" {
    type = "RelationalSemantics"

    restriction arbitrary_frame {
      expression = "R is an arbitrary binary relation on W"
    }
    forcing box_clause {
      condition = "w forces box A iff every R-successor of w forces A"
    }
  }

  adequacy "Kripke Completeness" {
    syntax = presentation."Hilbert K"
    semantics = semantics."Kripke Frames"

    theorem completeness {
      status = "proven"
      proof_method = "canonical model"
      finitizable = false
    }
  }
}
