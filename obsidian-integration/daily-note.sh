#!/usr/bin/env bash
# Generate daily note in Obsidian vault

set -euo pipefail

# Load config
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/config.sh"

# Get today's date
TODAY=$(date +%Y-%m-%d)
DAY_NAME=$(date +%A)

# Daily note path
DAILY_NOTE="$VAULT_DAILY/$TODAY.md"

# Check if note already exists
if [ -f "$DAILY_NOTE" ]; then
  echo "Daily note already exists: $DAILY_NOTE"
  echo "Opening in default editor..."
  open "$DAILY_NOTE"
  exit 0
fi

# Create daily notes directory if it doesn't exist
mkdir -p "$VAULT_DAILY"

# Generate daily note
cat > "$DAILY_NOTE" << EOF
# $DAY_NAME, $TODAY

## Morning
- [ ] Prayer & scripture reading
- [ ] Review goals for the day

## Tasks
- [ ]

## Reflections

### What am I grateful for?

### Where did I see God today?

### What am I wrestling with?

## Evening Review
- [ ] Day review
- [ ] Pray through the day
- [ ] Plan tomorrow

---

## Links
- [[$(date -v-1d +%Y-%m-%d)]] ← Yesterday | Tomorrow → [[$(date -v+1d +%Y-%m-%d)]]
EOF

echo "✓ Daily note created: $DAILY_NOTE"
echo "Opening in default editor..."
open "$DAILY_NOTE"
