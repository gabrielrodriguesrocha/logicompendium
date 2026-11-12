"""Compile logic DSL source into a JSON-compatible intermediate representation."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any

from lark import Lark, Transformer

from .syntax import LOGIC_DSL_GRAMMAR

CompiledDocument = dict[str, list[dict[str, Any]]]


class LogicDSLTransformer(Transformer):
    """Convert a Lark parse tree into plain Python values."""

    def ESCAPED_STRING(self, token):
        return json.loads(str(token))

    def IDENTIFIER(self, token):
        return str(token)

    def INT(self, token):
        return int(token)

    def NUMBER(self, token):
        text = str(token)
        return float(text) if any(marker in text for marker in ".eE") else int(text)

    def start(self, items):
        result = {
            "logics": [item for item in items if "logic_id" in item],
            "relations": [item for item in items if "relation_type" in item],
        }
        sources = [item for item in items if "source_id" in item]
        if sources:
            result["sources"] = sources
        return result

    def logic_block(self, items):
        logic_id, metadata, signature, *components = items
        result = {
            "logic_id": logic_id,
            "metadata": metadata,
            "signature": signature,
            "presentations": [],
            "semantics": [],
            "adequacy": [],
        }
        targets = {
            "presentation_name": "presentations",
            "semantic_name": "semantics",
            "adequacy_name": "adequacy",
        }
        for component in components:
            for marker, target in targets.items():
                if marker in component:
                    result[target].append(component)
                    break
        return result

    def name_def(self, items):
        return items[0]

    def family_def(self, items):
        return items[0]

    def metadata_block(self, items):
        name, family, *details = items
        result = {"name": name, "family": family, "aliases": []}
        for detail in details:
            if isinstance(detail, list):
                result["aliases"] = detail
            else:
                result[detail[0]] = detail[1]
        return result

    def authors_def(self, items):
        return ("authors", items[0])

    def year_def(self, items):
        return ("year", items[0])

    def tags_def(self, items):
        return ("tags", items[0])

    def references_def(self, items):
        return ("references", items[0])

    def status_def(self, items):
        return ("status", items[0])

    def property_def(self, items):
        return (items[0], items[1])

    def properties_block(self, items):
        return ("properties", dict(items))

    def source_block(self, items):
        source_id, title, url, authors, year = items
        return {"source_id": source_id, "title": title, "url": url, "authors": authors, "year": year}

    def alias_list(self, items):
        return [item for item in items if item is not None]

    def alias_with_meta(self, items):
        name, author, year = items
        return {"name": name, "author": author, "year": year}

    def signature_block(self, items):
        return {operator["name"]: operator["arity"] for operator in items}

    def operator_def(self, items):
        return {"name": items[0], "arity": items[1]}

    def presentation_type(self, items):
        return items[0]

    def formula_def(self, items):
        return items[0]

    def description(self, items):
        return ("description", items[0])

    def axiom_def(self, items):
        axiom_id, *fields = items
        description = fields[0][1] if len(fields) == 2 else None
        return {
            "type": "axiom",
            "id": axiom_id,
            "desc": description,
            "formula": fields[-1],
        }

    def premise_def(self, items):
        return items[0]

    def conclusion_def(self, items):
        return items[0]

    def rule_def(self, items):
        rule_id, premises, conclusion = items
        return {
            "type": "rule",
            "id": rule_id,
            "premises": premises,
            "conclusion": conclusion,
        }

    def string_array(self, items):
        return [item for item in items if item is not None]

    def presentation_block(self, items):
        name, presentation_type, *entries = items
        result = {
            "presentation_name": name,
            "type": presentation_type,
            "axioms": [entry for entry in entries if entry.get("type") == "axiom"],
            "rules": [entry for entry in entries if entry.get("type") == "rule"],
        }
        for entry in entries:
            if "extends" in entry:
                result.update(entry)
        return result

    def presentation_inheritance(self, items):
        return {"extends": {"logic_id": items[0], "presentation_name": items[1]}}

    def semantics_type(self, items):
        return items[0]

    def domain_def(self, items):
        return ("domain", items[0])

    def designated_def(self, items):
        return ("designated", items[0])

    def array(self, items):
        return [item for item in items if item is not None]

    def mapping_pair(self, items):
        return {"from": items[0], "to": items[1]}

    def operator_mapping(self, items):
        name, *mappings = items
        return {"kind": "operator_mapping", "operator": name, "mappings": mappings}

    def restriction_def(self, items):
        return {"kind": "restriction", "id": items[0], "expression": items[1]}

    def forcing_def(self, items):
        return {"kind": "forcing", "id": items[0], "condition": items[1]}

    def semantics_block(self, items):
        name, semantics_type, *details = items
        result = {
            "semantic_name": name,
            "type": semantics_type,
            "domain": None,
            "designated": None,
            "operator_mappings": [],
            "restrictions": [],
            "forcing": [],
        }
        targets = {
            "operator_mapping": "operator_mappings",
            "restriction": "restrictions",
            "forcing": "forcing",
        }
        for detail in details:
            if isinstance(detail, tuple):
                result[detail[0]] = detail[1]
            else:
                result[targets[detail["kind"]]].append(
                    {key: value for key, value in detail.items() if key != "kind"}
                )
        return result

    def syntax_ref(self, items):
        return items[0]

    def semantics_ref(self, items):
        return items[0]

    def theorem_status(self, items):
        return ("status", items[0])

    def formal_statement(self, items):
        return ("formal_statement", items[0])

    def proof_method(self, items):
        return ("proof_method", items[0])

    def finitizable(self, items):
        return ("finitizable", items[0])

    def true(self, _items):
        return True

    def false(self, _items):
        return False

    def theorem_def(self, items):
        theorem_id, *fields = items
        theorem = {
            "theorem_id": theorem_id,
            "status": None,
            "formal_statement": None,
            "proof_method": None,
            "finitizable": None,
            "desc": None,
        }
        for name, value in fields:
            theorem["desc" if name == "description" else name] = value
        return theorem

    def adequacy_block(self, items):
        name, syntax_reference, semantics_reference, *theorems = items
        return {
            "adequacy_name": name,
            "syntax_reference": syntax_reference,
            "semantics_reference": semantics_reference,
            "theorems": theorems,
        }

    def relation_type(self, items):
        return items[0]

    def parent_ref(self, items):
        return items[0]

    def child_ref(self, items):
        return items[0]

    def relation_block(self, items):
        relation_type, parent, child, *details = items
        return {"relation_type": relation_type, "parent": parent, "child": child, **dict(details)}


class LogicCompiler:
    """Reusable compiler for logic DSL documents."""

    def __init__(self) -> None:
        self._parser = Lark(
            LOGIC_DSL_GRAMMAR,
            parser="lalr",
            transformer=LogicDSLTransformer(),
        )

    def compile(self, source: str) -> CompiledDocument:
        """Compile DSL source text into a JSON-compatible dictionary."""
        return self._parser.parse(source)

    def compile_file(self, path: str | Path) -> CompiledDocument:
        """Read and compile a UTF-8 DSL file."""
        return self.compile(Path(path).read_text(encoding="utf-8"))


def compile_dsl(source: str) -> CompiledDocument:
    """Compile DSL source with a fresh compiler instance."""
    return LogicCompiler().compile(source)


def compile_file(path: str | Path) -> CompiledDocument:
    """Compile a UTF-8 DSL file with a fresh compiler instance."""
    return LogicCompiler().compile_file(path)
