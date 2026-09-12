#!/usr/bin/env python3
"""
Build script for Grandline Icons font.
Creates a font with custom One Piece-themed icons for use with Nerd Fonts.

Requirements:
    - FontForge (brew install fontforge)

Usage:
    fontforge -script build_font.py

Or with Python fontforge module:
    python build_font.py
"""

import os
import sys

try:
    import fontforge
except ImportError:
    print("Error: FontForge not found.")
    print("Install with: brew install fontforge")
    print("Then run with: fontforge -script build_font.py")
    sys.exit(1)

# Configuration
FONT_NAME = "GrandlineIcons"
FONT_FAMILY = "Grandline Icons"
FONT_VERSION = "1.0.0"
EM_SIZE = 1024
ASCENT = 800
DESCENT = 200

# Icon definitions: (name, codepoint, svg_file)
# Using Private Use Area starting at U+F0000 to avoid Nerd Font conflicts
ICONS = [
    ("straw_hat", 0x100000, "icons/straw-hat.svg"),
    ("jolly_roger", 0x100001, "icons/jolly-roger.svg"),
    ("going_merry", 0x100002, "icons/going-merry.svg"),
    ("thousand_sunny", 0x100003, "icons/thousand-sunny.svg"),
    ("devil_fruit", 0x100004, "icons/devil-fruit.svg"),
    ("log_pose", 0x100005, "icons/log-pose.svg"),
    ("den_den_mushi", 0x100006, "icons/den-den-mushi.svg"),
    ("straw_hat_flag", 0x100007, "icons/straw-hat-flag.svg"),
    # Add more icons here, keeping the codepoints contiguous from U+100008.
]

def create_font():
    """Create a new font with grandline icons."""
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # Create new font
    font = fontforge.font()

    # Set font metadata
    font.fontname = FONT_NAME
    font.familyname = FONT_FAMILY
    font.fullname = f"{FONT_FAMILY} Regular"
    font.version = FONT_VERSION
    font.copyright = "Grandline.nvim - One Piece inspired icons"
    font.encoding = "UnicodeFull"

    # Set font metrics
    font.em = EM_SIZE
    font.ascent = ASCENT
    font.descent = DESCENT

    # Create a basic .notdef glyph
    notdef = font.createChar(-1, ".notdef")
    pen = notdef.glyphPen()
    pen.moveTo((100, 0))
    pen.lineTo((100, 700))
    pen.lineTo((600, 700))
    pen.lineTo((600, 0))
    pen.closePath()
    pen.moveTo((150, 50))
    pen.lineTo((550, 50))
    pen.lineTo((550, 650))
    pen.lineTo((150, 650))
    pen.closePath()
    pen = None
    notdef.width = 700

    # Create space glyph
    space = font.createChar(0x0020, "space")
    space.width = 500

    # Import each icon
    for name, codepoint, svg_path in ICONS:
        full_path = os.path.join(script_dir, svg_path)

        if not os.path.exists(full_path):
            print(f"Warning: SVG not found: {full_path}")
            continue

        print(f"Adding icon: {name} at U+{codepoint:X}")

        # Create glyph at the specified codepoint
        glyph = font.createChar(codepoint, name)

        # Import SVG outline
        glyph.importOutlines(full_path)

        # Scale and position the glyph
        # SVG is 1024x1024, font em is 1024
        bbox = glyph.boundingBox()
        if bbox[2] > bbox[0]:  # Has content
            # Center horizontally and adjust baseline
            glyph.transform((1, 0, 0, 1, 0, -200))  # Adjust baseline

        # Set width for monospace compatibility
        glyph.width = EM_SIZE

        print(f"  -> Added {name}")

    # Output directory
    output_dir = os.path.join(script_dir, "dist")
    os.makedirs(output_dir, exist_ok=True)

    # Generate fonts
    ttf_path = os.path.join(output_dir, f"{FONT_NAME}-Regular.ttf")
    otf_path = os.path.join(output_dir, f"{FONT_NAME}-Regular.otf")
    woff2_path = os.path.join(output_dir, f"{FONT_NAME}-Regular.woff2")

    print(f"\nGenerating fonts...")

    font.generate(ttf_path)
    print(f"  -> {ttf_path}")

    font.generate(otf_path)
    print(f"  -> {otf_path}")

    try:
        font.generate(woff2_path)
        print(f"  -> {woff2_path}")
    except Exception as e:
        print(f"  -> WOFF2 generation skipped: {e}")

    font.close()

    print(f"\nDone! Install the font from: {output_dir}")
    print(f"\nTo use the straw hat icon in Lua:")
    print(f'  local straw_hat = "\\u{{100000}}"')
    print(f"  -- or")
    print(f'  local straw_hat = vim.fn.nr2char(0x100000)')

    # Generate a codepoints reference file
    ref_path = os.path.join(output_dir, "codepoints.lua")
    with open(ref_path, "w") as f:
        f.write("-- Grandline Icons Codepoints\n")
        f.write("-- Use with font fallback in your terminal\n\n")
        f.write("return {\n")
        for name, codepoint, _ in ICONS:
            char = chr(codepoint)
            f.write(f'  {name} = "{char}", -- U+{codepoint:X}\n')
        f.write("}\n")
    print(f"  -> {ref_path}")


if __name__ == "__main__":
    create_font()
