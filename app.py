"""Build and preview the static Logicompendium site. Run: python app.py."""

import argparse
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer

from scripts.build_site import build_site


def main():
    parser = argparse.ArgumentParser(description="Preview the static Logicompendium")
    parser.add_argument("--port", type=int, default=8000)
    args = parser.parse_args()
    directory = build_site()
    handler = partial(SimpleHTTPRequestHandler, directory=str(directory))
    server = ThreadingHTTPServer(("127.0.0.1", args.port), handler)
    print(f"Logicompendium: http://127.0.0.1:{server.server_port}", flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
