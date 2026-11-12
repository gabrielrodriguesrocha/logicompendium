"""Command-line entry point for compiling a logic DSL document."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from logicdsl import compile_file

DEFAULT_EXAMPLE = Path(__file__).parent / "examples" / "lfi.dsl"


def main() -> None:
    parser = argparse.ArgumentParser(description="Compile logic DSL into JSON")
    parser.add_argument(
        "source",
        nargs="?",
        type=Path,
        default=DEFAULT_EXAMPLE,
        help="DSL source file (default: examples/lfi.dsl)",
    )
    args = parser.parse_args()
    print(json.dumps(compile_file(args.source), indent=2))


if __name__ == "__main__":
    main()
