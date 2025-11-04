#!/usr/bin/env bash
# Syncs UNIFIED.md to platform-specific prompt files

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
AGENTS_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROMPTS_DIR="$AGENTS_DIR/core/prompts"
UNIFIED="$PROMPTS_DIR/UNIFIED.md"

if [ ! -f "$UNIFIED" ]; then
  echo "Error: UNIFIED.md not found at $UNIFIED"
  exit 1
fi

echo "Syncing UNIFIED.md to platform-specific prompts..."

# List of files to sync to
TARGETS=(
  "CLAUDE.md"
  "GEMINI.md"
  "AGENTS.md"
)

for target in "${TARGETS[@]}"; do
  TARGET_PATH="$PROMPTS_DIR/$target"
  if cp "$UNIFIED" "$TARGET_PATH"; then
    echo "✓ Synced to $target"
  else
    echo "✗ Failed to sync to $target"
    exit 1
  fi
done

echo ""
echo "All prompts synced successfully!"
echo "Remember to commit the changes if needed."
