# Workflow Guide

## Quick Start

### Claude Code (Primary - Terminal)
```bash
cd ~/agents
claude
# Start working - I have access to all directories
```

**Permissions configured:**
- ✅ Full autonomy in `projects/` and `sandbox/`
- ❓ Asks approval for git push, system changes, core/ edits
- See [PERMISSIONS.md](PERMISSIONS.md) for details

### Cursor (Secondary - VS Code)
```bash
cd ~/agents/projects/my-project
code .
# Use Cmd+K for Cursor chat
# Point to ~/agents/core/prompts/CLAUDE.md for context
```

### Gemini (Tertiary - Web/Mobile)
- Use for research and quick questions on-the-go
- Reference `~/agents/core/prompts/GEMINI.md` for your style guide

---

## Directory Usage

### `projects/` - Real Work
**Each project = its own git repo**

```bash
# Create new project (using helper script)
./scripts/new-project.sh my-cool-project "A description"

# Or manually
cd ~/agents/projects
mkdir my-project && cd my-project
git init
# ... start working
```

**Auto-approved here:**
- File operations (read, write, edit)
- Git operations (add, commit, status, etc.)
- Package management (npm, pip, etc.)
- Running tests and builds

**Requires approval:**
- `git push` (publishing)
- Deleting files

---

### `sandbox/` - Experiments
**Full autonomy, gitignored, disposable**

```bash
cd ~/agents/sandbox
# Test anything here - it's throwaway space
# No git needed, no structure required
```

**Perfect for:**
- Testing code snippets
- Comparing different approaches
- Learning new libraries
- Quick prototypes

**Everything auto-approved** - experiment freely!

---

### `core/` - Your AI Instructions
**High control - changes affect all AI behavior**

```bash
# Edit the source of truth
vim ~/agents/core/prompts/UNIFIED.md

# Sync to platform-specific files
./scripts/sync-prompts.sh
```

**Requires approval:**
- Any edits to prompt files
- Changes affect how AI assistants behave

---

### `obsidian-integration/` - Vault Scripts
**Scripts that interact with your Obsidian vault**

```bash
# Create scripts here
# Execution requires approval (touches personal data)
```

**Use for:**
- Daily note generation
- Template processing
- Vault automation
- Content extraction

---

### `scripts/` - Workflow Utilities
**Helper scripts for workspace management**

Available scripts:
- `new-project.sh` - Scaffold new projects
- `sync-prompts.sh` - Sync UNIFIED.md to platform prompts
- `commit-all-projects.sh` - Batch commit across projects

See [scripts/README.md](scripts/README.md) for usage.

---

## Tool Comparison Workflow

### Comparing AI Assistants

We have a dedicated project for systematic testing:

```bash
cd ~/agents/projects/tool-comparison
cat test-prompts.md          # 8 test categories
cat comparison-guide.md      # Methodology
cat results-template.md      # Track your findings
```

### Running Comparisons

1. **Pick a test** from `test-prompts.md`
2. **Run in Claude Code** (terminal) - note results
3. **Run in Cursor** (VS Code) - note results
4. **Run in Gemini** (web/mobile) - note results
5. **Record findings** in `results-template.md`

### Recommended Split (Adjust After Testing)

**Claude Code (70%)** - Primary tool
- Complex reasoning tasks
- Multi-step projects
- System automation
- Personal writing (Obsidian)
- Codebase exploration

**Cursor (20%)** - Secondary tool
- Visual editing sessions
- Inline code completion
- Multi-file refactoring
- When you need to see file tree

**Gemini (10%)** - Tertiary tool
- Mobile research
- Web-based questions
- Real-time information
- Away from desk access

---

## Working Across Platforms

### Same Project, Different AI
```bash
# In Claude Code (terminal)
cd ~/agents/projects/my-project
claude
"Help me implement feature X"

# Later, in Cursor (VS Code)
cd ~/agents/projects/my-project
code .
# Cmd+K: "Review the implementation from earlier"

# On mobile via Gemini
"I'm looking at the code in ~/agents/projects/my-project.
Explain how the authentication flow works."
```

All tools see the same files, use platform-specific prompts.

## Working with Git

### This Workspace Repo
```bash
cd ~/agents
git add core/prompts/
git commit -m "Update unified prompts"
```

### Individual Projects
```bash
cd ~/agents/projects/my-project
git init
git add .
git commit -m "Initial commit"
```

## Mobile Access Strategy

### For Code Projects
**GitHub sync workflow:**
```bash
# On Mac (after AI makes changes)
cd ~/agents/projects/my-project
git push

# On mobile
# Use GitHub app to review changes
# Use Working Copy (iOS) or Termux (Android) for git access
```

### For Obsidian Notes
**iCloud/Sync approach:**
- Configure Obsidian vault path (see [Obsidian Integration](#obsidian-integration))
- AI writes to vault on Mac
- Changes sync automatically via Obsidian Sync/iCloud
- Access on mobile Obsidian app

### For Quick AI Questions
**Use Gemini mobile:**
- Install Gemini app
- Reference your style guide in prompts
- Good for research, not editing files

### For Full Claude Access on Mobile
**SSH into Mac:**
```bash
# On mobile (using Blink, Termius, or similar)
ssh user@your-mac-ip
cd ~/agents
claude
# Full Claude Code access from mobile
```

---

## Obsidian Integration

### Setting Up Vault Path

1. **Tell me your vault path:**
   ```
   "My Obsidian vault is at ~/Documents/Obsidian/MyVault"
   ```

2. **I'll create config file:**
   ```bash
   # Saved in ~/agents/obsidian-integration/config.sh
   ```

3. **Writing to vault:**
   ```
   "Write a reflection on Psalm 51 to my vault in Personal/Reflections/"
   ```

### Example Scripts

**Daily Note Generator:**
```bash
~/agents/obsidian-integration/daily-note.sh
# Creates daily note with template, date, links
```

**Note from Conversation:**
```bash
# After a good discussion with Claude
"Export this conversation as an Obsidian note"
```

---

## Common Workflows

### Workflow 1: New Software Project
```bash
# Create project
./scripts/new-project.sh todo-app "A simple CLI todo app"

# Work on it with Claude
cd ~/agents/projects/todo-app
claude
"Build a Python CLI todo app with SQLite backend"

# Review in Cursor if needed
code .

# Push when ready
git remote add origin git@github.com:you/todo-app.git
git push -u origin main
```

---

### Workflow 2: Obsidian Writing Session
```bash
cd ~/agents
claude
"Write a raw, honest reflection on fighting lust patterns.
Reference Psalm 51, Romans 7, theme of repentance vs shame.
Save to my Obsidian vault in Personal/Spiritual-Formation/"
```

Claude writes directly to your vault → syncs to mobile automatically.

---

### Workflow 3: System Automation Script
```bash
cd ~/agents/scripts
claude
"Create a script that backs up my Obsidian vault to an external drive,
keeps 7 days of backups, and can run via cron"

# Test in sandbox first
cd ~/agents/sandbox
./test-backup.sh

# Move to scripts when working
mv ~/agents/sandbox/test-backup.sh ~/agents/scripts/backup-vault.sh

# Set up cron (Claude will ask approval)
crontab -e
```

---

### Workflow 4: Learning/Experimenting
```bash
cd ~/agents/sandbox
claude
"I want to learn how websockets work in Python.
Create examples of:
1. Basic server
2. Basic client
3. Chat application
Test them all and show me the output"
```

Everything happens in sandbox → full autonomy → trash when done.

---

### Workflow 5: Cross-Platform Comparison
```bash
# Set up test
cd ~/agents/projects/tool-comparison
cat test-prompts.md

# Run in Claude Code
claude
[paste test prompt 1]

# Run in Cursor
code .
# Cmd+K [paste same prompt]

# Run in Gemini
# Open browser, paste same prompt

# Record results
vim results-template.md
```

After testing, update your workflow preferences.

---

## Tips & Best Practices

### Prompts
**Keep prompts DRY:**
- Edit `UNIFIED.md` once
- Run `./scripts/sync-prompts.sh` to sync
- All AI platforms stay consistent

**Update as you learn:**
- Add examples of good responses
- Note what doesn't work
- Refine your style guide over time

### Projects
**One project, one repo:**
- Each meaningful project = own git repo in `projects/`
- Don't mix unrelated work
- Easier to publish, share, or archive

**Use sandbox liberally:**
- Not sure if approach will work? Sandbox it
- Want to test something quick? Sandbox it
- The dir is gitignored - trash it anytime

### Commits
**Batch commits across projects:**
```bash
./scripts/commit-all-projects.sh "Update dependencies"
```

**Descriptive commit messages:**
- Claude will create detailed commits
- Includes co-authored-by attribution
- Review before pushing

### Trust Building
**Week 1:** Approve everything manually, learn the flow

**Week 2-3:** Start auto-approving safe operations
- File operations in projects/
- Git commits
- Package installs

**Month 2+:** Consider auto-approving:
- Git push for specific projects
- Brew operations
- More system automation

**Never auto-approve:**
- Changes to `core/` prompts
- Changes to `.claude/` settings
- System-level destructive ops

### Performance
**Use Task agents for research:**
- Don't search manually when exploring codebases
- Let specialized agents do deep research
- Saves time, better results

**Parallel tool calls:**
- Claude can run multiple Read/Grep/Bash in parallel
- Faster than sequential operations
- Automatic when possible

### Mobile Integration
**For code:** Git → GitHub → mobile review

**For notes:** Obsidian Sync → instant mobile access

**For AI:** Gemini mobile for quick questions, SSH for full Claude access

---

## Troubleshooting

### "Permission denied" errors
Check `.claude/settings.local.json` - operation might need approval.

### "Git conflicts" in projects
Each project has own repo - conflicts are local to that project.

### "Can't find Obsidian vault"
Set vault path: Tell Claude where your vault lives.

### "Scripts not executable"
```bash
chmod +x ~/agents/scripts/*.sh
```

### "Prompts out of sync"
```bash
./scripts/sync-prompts.sh
```
