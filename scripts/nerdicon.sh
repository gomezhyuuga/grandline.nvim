#!/usr/bin/env bash
# Returns a Nerd Font icon for a given input name

if [ -z "$1" ]; then
  echo "Usage: nerdicon.sh <name>" >&2
  exit 1
fi

case "$1" in
  1) echo "󰲠" ;;
  2) echo "󰲢" ;;
  3) echo "󰲤" ;;
  4) echo "󰲦" ;;
  5) echo "󰲨" ;;
  6) echo "󰲪" ;;
  7) echo "󰲬" ;;
  8) echo "󰲮" ;;
  9) echo "󰲰" ;;
  neovim) echo "" ;;
  vim) echo "" ;;
  github) echo "" ;;
  *)
    echo "Unknown icon: $1" >&2
    exit 1
    ;;
esac
