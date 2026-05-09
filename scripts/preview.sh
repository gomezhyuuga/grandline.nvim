#!/usr/bin/env bash
# Live preview for theme-preview.html with auto-reload
# Requires: Node.js (uses npx, no install needed)

cd "$(dirname "$0")/.." || exit 1

echo "Starting live preview server..."
echo "Open: http://localhost:3009/theme-preview.html"
echo ""

npx browser-sync start \
  --server docs \
	--index docs/theme-preview.html \
	--directory \
  --files "docs/**/*" \
  --no-notify \
  --port 3009
