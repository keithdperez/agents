# AI Coding Agents Workspace

Multi-platform AI coding workspace with intelligent permissions, workflow automation, and systematic tool comparison.

## Quick Start

### First Time Setup
```bash
cd ~/agents

# Make scripts executable
chmod +x scripts/*.sh

# Review permissions
cat PERMISSIONS.md

# See all workflows
cat WORKFLOW.md
```

### Start Working
```bash
# With Claude Code (primary)
cd ~/agents
claude
"Create a new Python project for web scraping"

# With Cursor (secondary)
cd ~/agents/projects/my-project
code .
# Cmd+K to chat

# With Gemini (mobile/research)
# Open app, reference ~/agents/core/prompts/GEMINI.md
```

---

## Structure

```
~/agents/
├── .claude/
│   └── settings.local.json       # Permission configuration
│
├── core/prompts/                 # Unified AI instructions
│   ├── UNIFIED.md                # Source of truth
│   ├── CLAUDE.md                 # Claude-specific (copy of UNIFIED)
│   ├── GEMINI.md                 # Gemini-specific (copy of UNIFIED)
│   ├── AGENTS.md                 # Other agents (copy of UNIFIED)
│   └── keith-writing-style.md    # Detailed style guide (335 lines)
│
├── projects/                     # Real work (each has own git repo)
│   └── tool-comparison/          # ✨ Compare AI tools systematically
│       ├── test-prompts.md       # 8 test categories
│       ├── results-template.md   # Track findings
│       └── comparison-guide.md   # Methodology
│
├── sandbox/                      # Experiments (gitignored, full autonomy)
│
├── obsidian-integration/         # Scripts for Obsidian vault
│
├── scripts/                      # ✨ Workflow automation
│   ├── new-project.sh            # Scaffold new projects
│   ├── sync-prompts.sh           # Sync UNIFIED to platform prompts
│   ├── commit-all-projects.sh    # Batch commit across projects
│   └── README.md                 # Usage guide
│
├── README.md                     # This file
├── WORKFLOW.md                   # ✨ Comprehensive workflow guide
└── PERMISSIONS.md                # ✨ Permission philosophy
```

## Key Features

### 🔐 Intelligent Permissions (Directory-Based)
- **projects/** - Moderate autonomy (auto-approve edits, ask for git push)
- **sandbox/** - Full autonomy (experiment freely)
- **core/** - High control (requires approval for changes)
- **obsidian-integration/** - Protected (asks before touching vault)

See [PERMISSIONS.md](PERMISSIONS.md) for complete details.

### 🤖 Multi-Platform Support
- **Claude Code** (Primary) - Terminal-native, best reasoning
- **Cursor** (Secondary) - Visual editing, inline completion
- **Gemini** (Tertiary) - Mobile access, web research

All tools use unified instructions from `core/prompts/`.

### 🛠️ Workflow Automation
```bash
./scripts/new-project.sh my-app "Description"
./scripts/sync-prompts.sh
./scripts/commit-all-projects.sh "Update all"
```

### 📊 Systematic Tool Comparison
- 8 test categories covering real-world use cases
- Results tracking template
- Methodology guide
- Located in `projects/tool-comparison/`

### 📱 Mobile-Friendly
- Git sync for code projects
- Obsidian sync for notes
- Gemini app for quick questions
- SSH access for full Claude Code on mobile

---

## Common Workflows

### Create New Project
```bash
./scripts/new-project.sh my-project "A cool new idea"
cd ~/agents/projects/my-project
claude
"Build feature X"
```

### Compare AI Tools
```bash
cd ~/agents/projects/tool-comparison
cat test-prompts.md
# Run same prompt in Claude, Cursor, Gemini
# Track results in results-template.md
```

### Sandbox Experiment
```bash
cd ~/agents/sandbox
claude
"Test different approaches to problem X"
# Full autonomy, trash when done
```

### Write to Obsidian
```bash
cd ~/agents
claude
"Write a reflection on [topic] for my Obsidian vault"
# (First configure vault path - see WORKFLOW.md)
```

See [WORKFLOW.md](WORKFLOW.md) for detailed workflows and examples.

---

## Permission Overview

### Auto-Approved Operations
- ✅ Read/write/edit in `projects/` and `sandbox/`
- ✅ Git operations (add, commit, status, diff, log)
- ✅ Package managers (npm, pip, cargo, etc.)
- ✅ Running tests and builds
- ✅ Web search
- ✅ Making scripts executable

### Requires Approval
- ❓ Git push (publishing code)
- ❓ Deleting files
- ❓ Changes to `core/` prompts
- ❓ Changes to `.claude/` settings
- ❓ System-level operations (cron, launchctl)
- ❓ brew install/uninstall

### Blocked
- ❌ sudo operations
- ❌ Destructive system commands
- ❌ Fork bombs and attacks

Customize in `.claude/settings.local.json` as trust builds.

---

## Platform-Specific Instructions

### Claude Code
```bash
cd ~/agents
claude
# Reads .claude/settings.local.json automatically
# Has access to all directories with configured permissions
```

### Cursor
```bash
cd ~/agents/projects/my-project
code .
# Cmd+K to open chat
# Reference ~/agents/core/prompts/CLAUDE.md in prompts
```

### Gemini
- Mobile app or web interface
- Copy/paste from `~/agents/core/prompts/GEMINI.md`
- Best for research, not file operations

---

## Git Strategy

### Workspace Repo (this one)
**Tracks:**
- `core/prompts/` - AI instructions
- `scripts/` - Automation utilities
- Documentation files (README, WORKFLOW, PERMISSIONS)
- `.gitkeep` files

**Ignores:**
- `projects/*` - Each project has own repo
- `sandbox/*` - Disposable experiments
- `obsidian-integration/*` - May contain personal data

### Project Repos
Each project in `projects/` is its own git repository:
```bash
~/agents/projects/my-app/.git        # Independent repo
~/agents/projects/another-app/.git   # Independent repo
```

### Sandbox
No git tracking - full freedom to experiment and trash.

---

## Tool Comparison Guide

To decide which AI tool to use for different tasks:

1. **Read the test prompts:**
   ```bash
   cat ~/agents/projects/tool-comparison/test-prompts.md
   ```

2. **Run same prompts in each tool:**
   - Claude Code (terminal)
   - Cursor (VS Code)
   - Gemini (web/mobile)

3. **Track results:**
   ```bash
   vim ~/agents/projects/tool-comparison/results-template.md
   ```

4. **Adjust your workflow** based on findings

**Initial recommendation:** Claude Code for 70% of work, Cursor for 20%, Gemini for 10%.

---

## Obsidian Integration

### Setup
Tell Claude your vault path:
```
"My Obsidian vault is at ~/Documents/Obsidian/MyVault"
```

### Usage
```
"Write a reflection on [topic] to my vault in Reflections/"
```

Scripts for vault automation go in `obsidian-integration/`.

Changes sync automatically to mobile via Obsidian Sync/iCloud.

---

## Next Steps

1. ✅ **Review permissions** - Read [PERMISSIONS.md](PERMISSIONS.md)
2. ✅ **Explore workflows** - Read [WORKFLOW.md](WORKFLOW.md)
3. ✅ **Make scripts executable** - `chmod +x scripts/*.sh`
4. ✅ **Create your first project** - `./scripts/new-project.sh test "My first AI project"`
5. ✅ **Compare tools** - Try the same task in Claude Code, Cursor, and Gemini
6. ✅ **Configure Obsidian** - Set your vault path for writing integration

---

## Documentation

- [README.md](README.md) - This overview (you are here)
- [WORKFLOW.md](WORKFLOW.md) - Detailed workflows, examples, troubleshooting
- [PERMISSIONS.md](PERMISSIONS.md) - Permission philosophy and configuration
- [scripts/README.md](scripts/README.md) - Automation script usage
- [projects/tool-comparison/](projects/tool-comparison/) - Tool comparison framework

---

## Customization

### Update Prompts
```bash
vim ~/agents/core/prompts/UNIFIED.md
./scripts/sync-prompts.sh
```

### Adjust Permissions
```bash
vim ~/.claude/settings.local.json
# Move operations between "allow", "ask", and "deny"
```

### Add Scripts
```bash
vim ~/agents/scripts/my-script.sh
chmod +x ~/agents/scripts/my-script.sh
```

---

## Philosophy

**Trust, but verify.**

Start with controlled permissions, build trust over time, automate what works.

Give AI autonomy in safe spaces (sandbox), require approval for sensitive operations (publishing code, system changes, personal data).

Each directory has a permission level that matches its purpose and risk profile.
