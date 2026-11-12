"""Lark grammar for the logic description language."""

LOGIC_DSL_GRAMMAR = r"""
    start: (logic_block | relation_block | source_block)*

    logic_block: "logic" IDENTIFIER "{" metadata_block signature_block component* "}"
    relation_block: "relation" "{" relation_type parent_ref child_ref relation_detail* "}"
    ?relation_detail: description | references_def | status_def
    status_def: "status" "=" ESCAPED_STRING
    relation_type: "type" "=" ESCAPED_STRING
    parent_ref: "parent" "=" IDENTIFIER
    child_ref: "child" "=" IDENTIFIER

    metadata_block: "metadata" "{" name_def family_def alias_list? metadata_detail* "}"
    ?metadata_detail: description | authors_def | year_def | tags_def | properties_block | references_def
    authors_def: "authors" "=" string_array
    year_def: "year" "=" INT
    tags_def: "tags" "=" string_array
    references_def: "references" "=" string_array
    properties_block: "properties" "{" property_def* "}"
    property_def: IDENTIFIER "=" ESCAPED_STRING
    source_block: "source" IDENTIFIER "{" "title" "=" ESCAPED_STRING "url" "=" ESCAPED_STRING "authors" "=" string_array "year" "=" INT "}"
    name_def: "name" "=" ESCAPED_STRING
    family_def: "family" "=" ESCAPED_STRING
    alias_list: "aliases" "=" "[" [alias ("," alias)*] "]"
    ?alias: ESCAPED_STRING | alias_with_meta
    alias_with_meta: ESCAPED_STRING "{" "author" "=" ESCAPED_STRING "," "year" "=" INT "}"

    signature_block: "signature" "{" operator_def* "}"
    operator_def: "operator" IDENTIFIER "(" INT ")"

    ?component: presentation_block | semantics_block | adequacy_block

    presentation_block: "presentation" ESCAPED_STRING "{" presentation_type presentation_inheritance? syntax_item* "}"
    presentation_inheritance: "extends" "=" "presentation." IDENTIFIER "." ESCAPED_STRING
    presentation_type: "type" "=" ESCAPED_STRING
    ?syntax_item: axiom_def | rule_def
    axiom_def: "axiom" IDENTIFIER "{" description? formula_def "}"
    formula_def: "formula" "=" ESCAPED_STRING
    rule_def: "rule" IDENTIFIER "{" premise_def conclusion_def "}"
    premise_def: "premise" "=" string_array
    conclusion_def: "conclusion" "=" ESCAPED_STRING

    semantics_block: "semantics" ESCAPED_STRING "{" semantics_type domain_def? designated_def? semantic_item* "}"
    semantics_type: "type" "=" ESCAPED_STRING
    domain_def: "domain" "=" array
    designated_def: "designated" "=" array
    ?semantic_item: operator_mapping | restriction_def | forcing_def
    operator_mapping: "operator_mapping" IDENTIFIER "{" mapping_pair* "}"
    mapping_pair: value "->" value
    restriction_def: "restriction" IDENTIFIER "{" "expression" "=" ESCAPED_STRING "}"
    forcing_def: "forcing" IDENTIFIER "{" "condition" "=" ESCAPED_STRING "}"

    adequacy_block: "adequacy" ESCAPED_STRING "{" syntax_ref semantics_ref theorem_def* "}"
    syntax_ref: "syntax" "=" "presentation." ESCAPED_STRING
    semantics_ref: "semantics" "=" "semantics." ESCAPED_STRING
    theorem_def: "theorem" IDENTIFIER "{" theorem_status formal_statement? proof_method? finitizable? description? "}"
    theorem_status: "status" "=" ESCAPED_STRING
    formal_statement: "formal_statement" "=" ESCAPED_STRING
    proof_method: "proof_method" "=" ESCAPED_STRING
    finitizable: "finitizable" "=" boolean
    description: "desc" "=" ESCAPED_STRING

    string_array: "[" [ESCAPED_STRING ("," ESCAPED_STRING)*] "]"
    array: "[" [scalar ("," scalar)*] "]"
    ?value: array | scalar
    ?scalar: ESCAPED_STRING | NUMBER | IDENTIFIER
    boolean: "true" -> true
           | "false" -> false

    IDENTIFIER: /[a-zA-Z_][a-zA-Z0-9_-]*/

    %import common.ESCAPED_STRING
    %import common.INT
    %import common.NUMBER
    %import common.WS
    %ignore WS

    COMMENT: /\/\/[^\n]*/
    %ignore COMMENT
"""
