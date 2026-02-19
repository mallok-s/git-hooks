#!/bin/bash

# Install global git hooks

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HOOKS_DIR="$SCRIPT_DIR/hooks"

# Make all hooks executable
chmod +x "$HOOKS_DIR"/*

# Set global hooks path
git config --global core.hooksPath "$HOOKS_DIR"

echo "Global git hooks installed!"
echo "Hooks directory: $HOOKS_DIR"
echo ""
echo "Current hooks:"
ls -1 "$HOOKS_DIR"
echo ""
echo "To uninstall: git config --global --unset core.hooksPath"
