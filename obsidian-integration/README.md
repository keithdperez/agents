# Obsidian Integration

Scripts for interacting with your Obsidian vault at:
```
/Users/keithperez/Library/Mobile Documents/iCloud~md~obsidian/Documents/Keith
```

## Configuration

Vault path and common directories are defined in `config.sh`:
- Main vault path
- Common subdirectories (Reflections, Personal, Spiritual-Formation, etc.)

Edit `config.sh` to customize directory paths based on your vault structure.

---

## Available Scripts

### `daily-note.sh`
Creates a daily note with template.

**Usage:**
```bash
./obsidian-integration/daily-note.sh
```

**Features:**
- Checks if note exists (won't overwrite)
- Creates from template with date, tasks, reflection prompts
- Auto-links to yesterday/tomorrow
- Opens in default editor

**Template includes:**
- Morning checklist
- Daily tasks
- Reflection prompts (gratitude, seeing God, wrestling)
- Evening review
- Navigation links

---

### `write-note.sh`
Helper script to create a new note in a specific subdirectory.

**Usage:**
```bash
./obsidian-integration/write-note.sh "Note Name" subdirectory
```

**Examples:**
```bash
# Create reflection
./obsidian-integration/write-note.sh "Psalm 51 Meditation" Reflections

# Create personal note
./obsidian-integration/write-note.sh "Marriage Wins" Personal

# Create spiritual formation note
./obsidian-integration/write-note.sh "Repentance vs Shame" Spiritual-Formation
```

**Available subdirectories:**
- `Reflections`
- `Personal`
- `Spiritual-Formation`
- `Projects`
- `Daily-Notes`

---

## Using with Claude Code

### Writing Reflections
```
"Write a raw, honest reflection on fighting lust patterns.
Reference Psalm 51, Romans 7. Theme: repentance vs shame.
Save to my Obsidian vault in Spiritual-Formation/ as 'Fighting Lust'"
```

Claude will:
1. Generate the content
2. Use the vault path from config
3. Write directly to your vault
4. Changes sync to mobile via iCloud

### Daily Notes
```
"Create today's daily note in my Obsidian vault"
```

Claude will run `daily-note.sh` to create templated daily note.

### Custom Notes
```
"Create a note about today's marriage win in my vault under Personal/"
```

Claude will write directly to the appropriate subdirectory.

---

## Permissions

**Auto-approved:**
- Creating/editing scripts in `obsidian-integration/`
- Reading config

**Requires approval:**
- Actually writing to vault (touches personal data)
- Running scripts that modify vault files

This ensures you review before personal content is modified.

---

## Sync Strategy

**On Mac:**
- Claude writes directly to vault
- iCloud syncs automatically

**On Mobile:**
- Changes appear in Obsidian app
- Instant access to new notes
- Two-way sync

**Workflow:**
1. Ask Claude to write reflection
2. Claude writes to vault on Mac
3. iCloud syncs to mobile within seconds
4. Read/edit on mobile Obsidian app
5. Edits sync back to Mac

---

## Customization

### Add New Subdirectories
Edit `config.sh`:
```bash
VAULT_MY_NEW_DIR="$OBSIDIAN_VAULT/My-New-Directory"
export VAULT_MY_NEW_DIR
```

### Modify Daily Note Template
Edit `daily-note.sh` to change:
- Section headers
- Checklist items
- Reflection prompts
- Link format

### Create Custom Scripts
Example - weekly review script:
```bash
#!/usr/bin/env bash
source "$(dirname "$0")/config.sh"

WEEK=$(date +%Y-W%U)
NOTE_PATH="$VAULT_REFLECTIONS/Weekly-Review-$WEEK.md"

# Generate weekly review template
cat > "$NOTE_PATH" << EOF
# Weekly Review - Week of $(date +%Y-%m-%d)

## Wins
-

## Losses
-

## Lessons
-

## Next Week
-
EOF

open "$NOTE_PATH"
```

---

## Example Workflows

### Morning Routine
```bash
cd ~/agents
claude
"Create today's daily note and add a morning reflection on Psalm 23"
```

### After a Conversation
```bash
"Export this conversation as an Obsidian note in Projects/ called 'AI Workflow Setup'"
```

### Writing Session
```bash
"Write 3 reflections on:
1. The theme of hiding vs being known (Personal/Hiding-vs-Known.md)
2. Performance vs presence in marriage (Personal/Marriage-Performance.md)
3. Fighting lust as spiritual warfare (Spiritual-Formation/Lust-as-Warfare.md)

Use raw, honest voice. Scripture-saturated. No preamble."
```

Claude writes all three directly to your vault.

---

## Troubleshooting

### "Permission denied" when writing to vault
iCloud might be syncing. Wait a moment and retry.

### "Directory doesn't exist"
The script will create subdirectories automatically. If issues persist, manually create in Obsidian first.

### "Can't find vault"
Check `config.sh` - ensure `OBSIDIAN_VAULT` path is correct.

### Notes not syncing to mobile
Check iCloud settings - ensure Obsidian folder is syncing.

---

## Making Scripts Executable

After cloning or creating scripts:
```bash
chmod +x obsidian-integration/*.sh
```

Or individually:
```bash
chmod +x obsidian-integration/daily-note.sh
```
