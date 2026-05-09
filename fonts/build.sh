#!/bin/bash
# Build Grandline Icons font
# Requires: fontforge (brew install fontforge)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building Grandline Icons font..."
echo ""

# Check for fontforge
if ! command -v fontforge &> /dev/null; then
    echo "Error: fontforge not found"
    echo "Install with: brew install fontforge"
    exit 1
fi

# Run the build script
cd "$SCRIPT_DIR"
fontforge -script build_font.py

echo ""
echo "Build complete!"
echo ""
echo "Next steps:"
echo "  1. Install the font from: $SCRIPT_DIR/dist/"
echo "  2. Configure your terminal to use it as a fallback font"
echo "  3. See README.md for terminal configuration examples"
