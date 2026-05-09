#!/bin/bash
# Install Grandline Icons font
# Run this after building with ./build.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONT_FILE="$SCRIPT_DIR/dist/GrandlineIcons-Regular.ttf"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info() {
    echo -e "${GREEN}==>${NC} $1"
}

warn() {
    echo -e "${YELLOW}Warning:${NC} $1"
}

error() {
    echo -e "${RED}Error:${NC} $1"
    exit 1
}

# Check if font exists
if [[ ! -f "$FONT_FILE" ]]; then
    error "Font not found at $FONT_FILE"
    echo "Run ./build.sh first to generate the font."
    exit 1
fi

# Detect OS and install
case "$(uname -s)" in
    Darwin)
        # macOS
        FONT_DIR="$HOME/Library/Fonts"
        info "Detected macOS"
        info "Installing to $FONT_DIR"

        mkdir -p "$FONT_DIR"
        cp "$FONT_FILE" "$FONT_DIR/"

        info "Font installed successfully!"
        echo ""
        echo "The font should be available immediately."
        echo "If not, try restarting your terminal or run:"
        echo "  atsutil databases -remove"
        ;;

    Linux)
        # Linux
        FONT_DIR="$HOME/.local/share/fonts"
        info "Detected Linux"
        info "Installing to $FONT_DIR"

        mkdir -p "$FONT_DIR"
        cp "$FONT_FILE" "$FONT_DIR/"

        # Update font cache
        info "Updating font cache..."
        if command -v fc-cache &> /dev/null; then
            fc-cache -fv "$FONT_DIR"
        else
            warn "fc-cache not found, skipping cache update"
        fi

        info "Font installed successfully!"
        ;;

    MINGW*|MSYS*|CYGWIN*)
        # Windows (Git Bash, MSYS2, Cygwin)
        FONT_DIR="$USERPROFILE/AppData/Local/Microsoft/Windows/Fonts"
        info "Detected Windows"
        info "Installing to $FONT_DIR"

        mkdir -p "$FONT_DIR"
        cp "$FONT_FILE" "$FONT_DIR/"

        info "Font installed successfully!"
        warn "You may need to restart applications to use the new font."
        ;;

    *)
        error "Unsupported operating system: $(uname -s)"
        echo "Please manually copy the font from:"
        echo "  $FONT_FILE"
        echo "to your system's font directory."
        exit 1
        ;;
esac

echo ""
info "Verifying installation..."

# Verify installation
if command -v fc-list &> /dev/null; then
    if fc-list | grep -q "Grandline"; then
        echo -e "${GREEN}✓${NC} Font found in system font list"
    else
        warn "Font not yet visible in fc-list (may need terminal restart)"
    fi
fi

echo ""
echo "Next steps:"
echo "  1. Restart your terminal"
echo "  2. Configure font fallback in your terminal (see README.md)"
echo "  3. Test with: echo -e '\\U100000' (should show straw hat)"
echo ""
echo "Terminal configuration examples:"
echo ""
echo "  Ghostty (~/.config/ghostty/config):"
echo "    font-family = \"JetBrainsMono Nerd Font\""
echo "    font-family = \"Grandline Icons\""
echo ""
echo "  WezTerm:"
echo "    font = wezterm.font_with_fallback({"
echo "      \"JetBrainsMono Nerd Font\","
echo "      \"Grandline Icons\","
echo "    })"
echo ""
echo "  Kitty (~/.config/kitty/kitty.conf):"
echo "    symbol_map U+100000-U+100FFF Grandline Icons"
