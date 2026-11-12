"""Build the public static site: python -m scripts.build_site."""

import json
from pathlib import Path
from shutil import copytree

from logicdsl import compile_file
from logicdsl.catalog import validate_catalog

ROOT = Path(__file__).resolve().parents[1]
DIST = ROOT / "dist"
CATALOG = ROOT / "catalog" / "atlas.dsl"


def build_site(output_dir=DIST, catalog_path=CATALOG):
    """Compile and validate before publishing any files to the output directory."""
    document = compile_file(catalog_path)
    errors = validate_catalog(document)
    if errors:
        raise ValueError("Catalog references are invalid:\n" + "\n".join(errors))
    output_dir = Path(output_dir)
    copytree(ROOT / "web", output_dir, dirs_exist_ok=True)
    (output_dir / "catalog.json").write_text(
        json.dumps(document, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    (output_dir / ".nojekyll").touch()
    return output_dir


if __name__ == "__main__":
    print(f"Built static site: {build_site()}")
