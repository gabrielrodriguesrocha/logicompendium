"""Verify the published artifact on a plain static host, including project paths."""

import io
import json
from http.server import SimpleHTTPRequestHandler
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from logicdsl import compile_file
from scripts.build_site import build_site, CATALOG


class MemorySocket:
    def __init__(self, request):
        self.request = io.BytesIO(request)
        self.response = bytearray()

    def makefile(self, *_args):
        return self.request

    def sendall(self, data):
        self.response.extend(data)


def request(directory, path, method="GET"):
    socket = MemorySocket(f"{method} {path} HTTP/1.0\r\nHost: localhost\r\n\r\n".encode())
    with patch.object(SimpleHTTPRequestHandler, "log_message"):
        SimpleHTTPRequestHandler(socket, ("127.0.0.1", 12345), object(), directory=str(directory))
    headers, body = bytes(socket.response).split(b"\r\n\r\n", 1)
    return int(headers.split(b" ")[1]), headers, body


class AppTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory()
        cls.addClassCleanup(cls.temp.cleanup)
        cls.host = Path(cls.temp.name)
        cls.site = build_site(cls.host / "logic-dsl")

    def test_catalog_matches_validated_source(self):
        status, _, body = request(self.host, "/logic-dsl/catalog.json")
        self.assertEqual(status, 200)
        self.assertEqual(json.loads(body), compile_file(CATALOG))

    def test_assets_load_from_project_subpath(self):
        for asset in ("", "app.js", "style.css", "math.mjs", "catalog.mjs", "graph.mjs", "filters.mjs", "vendor/d3/d3.min.js", "vendor/d3/LICENSE", "vendor/katex/katex.mjs", "vendor/katex/katex.min.css", "vendor/katex/fonts/KaTeX_Main-Regular.woff2"):
            with self.subTest(asset=asset):
                self.assertEqual(request(self.host, "/logic-dsl/" + asset)[0], 200)
        _, headers, _ = request(self.host, "/logic-dsl/math.mjs")
        self.assertIn(b"javascript", headers)
        self.assertTrue((self.site / ".nojekyll").is_file())
        for private in ("app.py", "requirements.txt", "catalog/atlas.dsl", "logicdsl/compiler.py"):
            self.assertEqual(request(self.host, "/logic-dsl/" + private)[0], 404)

    def test_no_runtime_compiler(self):
        self.assertEqual(request(self.host, "/logic-dsl/api/catalog")[0], 404)
        self.assertEqual(request(self.host, "/logic-dsl/api/compile", "POST")[0], 501)

    def test_invalid_catalog_cannot_replace_published_catalog(self):
        before = (self.site / "catalog.json").read_bytes()
        invalid = self.host / "invalid.dsl"
        invalid.write_text('relation { type = "extension" parent = Missing child = AlsoMissing }', encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "unknown logic Missing"):
            build_site(self.site, invalid)
        self.assertEqual((self.site / "catalog.json").read_bytes(), before)


if __name__ == "__main__":
    unittest.main()
