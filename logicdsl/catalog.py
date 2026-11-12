"""Catalog integrity checks, separate from the permissive document compiler."""

from typing import Any


def validate_catalog(document: dict[str, Any]) -> list[str]:
    """Check references without pretending to prove mathematical claims."""
    errors: list[str] = []
    logics = document.get("logics", [])
    sources = document.get("sources", [])
    ids = [logic["logic_id"] for logic in logics]
    source_ids = [source["source_id"] for source in sources]
    for label, values in (("logic", ids), ("source", source_ids)):
        seen = set()
        for value in values:
            if value in seen:
                errors.append(f"Duplicate {label} identifier: {value}")
            seen.add(value)

    def check_references(record, context):
        for reference in record.get("references", []):
            if reference not in source_ids:
                errors.append(f"{context}: unknown source {reference}")

    for logic in logics:
        context = logic["logic_id"]
        check_references(logic["metadata"], context)
        for field, key in (("presentations", "presentation_name"), ("semantics", "semantic_name"), ("adequacy", "adequacy_name")):
            names = [entry[key] for entry in logic[field]]
            if len(names) != len(set(names)):
                errors.append(f"{context}: duplicate {field} name")
        for semantic in logic["semantics"]:
            domain = semantic["domain"]
            if domain is not None and any(value not in domain for value in semantic["designated"] or []):
                errors.append(f"{context}: designated values must belong to the domain")
            for mapping in semantic["operator_mappings"]:
                if mapping["operator"] not in logic["signature"]:
                    errors.append(f"{context}: undeclared operator {mapping['operator']}")
        for adequacy in logic["adequacy"]:
            for field, target, key in (("syntax_reference", "presentations", "presentation_name"), ("semantics_reference", "semantics", "semantic_name")):
                if adequacy[field] not in [entry[key] for entry in logic[target]]:
                    errors.append(f"{context}: unresolved {field} {adequacy[field]}")
    presentations = {
        (logic["logic_id"], presentation["presentation_name"]): presentation
        for logic in logics for presentation in logic["presentations"]
    }
    signatures = {logic["logic_id"]: logic["signature"] for logic in logics}
    parents = {}
    for key, presentation in presentations.items():
        base = presentation.get("extends")
        if not base:
            continue
        parent = (base["logic_id"], base["presentation_name"])
        if parent not in presentations:
            errors.append(f"{key[0]}: unresolved base presentation {parent[0]}.{parent[1]}")
            continue
        parents[key] = parent
        if any(signatures[key[0]].get(operator) != arity for operator, arity in signatures[parent[0]].items()):
            errors.append(f"{key[0]}: inherited signature is incompatible with {parent[0]}")
    visited = set()
    for key in parents:
        chain = set()
        cursor = key
        while cursor in parents and cursor not in visited:
            if cursor in chain:
                errors.append(f"{key[0]}: cyclic presentation inheritance")
                break
            chain.add(cursor)
            cursor = parents[cursor]
        visited.update(chain)
    for index, relation in enumerate(document.get("relations", []), 1):
        for endpoint in ("parent", "child"):
            if relation[endpoint] not in ids:
                errors.append(f"Relation {index}: unknown logic {relation[endpoint]}")
        check_references(relation, f"Relation {index}")
    return errors
