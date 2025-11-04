#!/usr/bin/env bash
# Helper script to write a note to Obsidian vault

set -euo pipefail

# Load config
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/config.sh"

if [ $# -lt 2 ]; then
  echo "Usage: $0 <note-name> <subdirectory> [content]"
  echo ""
  echo "Examples:"
  echo "  $0 'My Reflection' Reflections"
  echo "  $0 'Psalm 51 Notes' Spiritual-Formation"
  echo ""
  echo "Available subdirectories:"
  echo "  - Reflections"
  echo "  - Personal"
  echo "  - Spiritual-Formation"
  echo "  - Projects"
  echo "  - Daily-Notes"
  exit 1
fi

NOTE_NAME="$1"
SUBDIR="$2"
CONTENT="${3:-}"

# Construct full path
NOTE_PATH="$OBSIDIAN_VAULT/$SUBDIR/${NOTE_NAME}.md"

# Create subdirectory if needed
mkdir -p "$OBSIDIAN_VAULT/$SUBDIR"

# If content provided as argument, write it
if [ -n "$CONTENT" ]; then
  echo "$CONTENT" > "$NOTE_PATH"
  echo "✓ Note created: $NOTE_PATH"
# Otherwise, open in editor
else
  # Create empty note with basic structure
  cat > "$NOTE_PATH" << EOF
# $NOTE_NAME

Created: $(date +%Y-%m-%d)

---


EOF
  echo "✓ Note created: $NOTE_PATH"
  echo "Opening in default editor..."
  open "$NOTE_PATH"
fi
