"""Minimal library-use example."""

import json
from pathlib import Path

from logicdsl import compile_file

example_path = Path(__file__).parent / "examples" / "classical.dsl"
print(json.dumps(compile_file(example_path), indent=2))
