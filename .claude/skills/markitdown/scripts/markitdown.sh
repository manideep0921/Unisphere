#!/usr/bin/env bash
# Run Microsoft MarkItDown (https://github.com/microsoft/markitdown), installing it on first use.
# Usage: markitdown.sh <file-or-url> [-o output.md]
set -euo pipefail

VENV="${MARKITDOWN_VENV:-$HOME/.cache/markitdown-venv}"
SPEC="git+https://github.com/microsoft/markitdown.git#subdirectory=packages/markitdown"

if [ ! -x "$VENV/bin/markitdown" ]; then
  echo "Installing markitdown (with PDF support) into $VENV ..." >&2
  python3 -m venv "$VENV"
  "$VENV/bin/pip" install -q "markitdown[pdf] @ $SPEC"
fi

exec "$VENV/bin/markitdown" "$@"
