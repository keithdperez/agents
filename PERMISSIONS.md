# Permissions Philosophy

This workspace uses directory-based permissions to give AI assistants appropriate autonomy while maintaining control over sensitive operations.

## Overview

The `.claude/settings.local.json` file defines three permission levels:
- **allow** - Auto-approved, no prompts
- **deny** - Blocked completely
- **ask** - Requires your approval each time

## Directory-Based Strategy

### `core/` - **High Control**

**Permission Level:** Require approval for all edits

**Rationale:**
- Contains your unified AI instructions
- Changes affect how all AI tools behave
- Should be intentional, not automatic

**Auto-approved:**
- Read operations

**Requires approval:**
- Edit operations
- Write operations

---

### `projects/` - **Moderate Autonomy**

**Permission Level:** Auto-approve most operations

**Rationale:**
- Each project is its own git repo
- Real work happens here
- AI should be able to work freely
- Git provides rollback safety

**Auto-approved:**
- Read, write, edit files
- Git operations (add, commit, status, diff, log)
- Package manager operations (npm, pip, etc.)
- Running tests and builds
- Making scripts executable

**Requires approval:**
- Git push (publishes to remote)
- Deleting files

---

### `sandbox/` - **Full Autonomy**

**Permission Level:** Auto-approve everything

**Rationale:**
- Experimental space
- Nothing here matters long-term
- Gitignored, disposable
- Maximum freedom to experiment

**Auto-approved:**
- All file operations
- All git operations
- All bash commands (within sandbox/)

**Requires approval:**
- Operations that affect files outside sandbox/

---

### `obsidian-integration/` - **High Control**

**Permission Level:** Auto-approve scripts, but ask before running

**Rationale:**
- Scripts may touch your personal vault
- Could affect personal notes and data
- Should review before execution

**Auto-approved:**
- Creating/editing scripts
- Read operations

**Requires approval:**
- Actually running scripts that modify vault
- Changes to vault files

---

### `scripts/` - **Moderate Autonomy**

**Permission Level:** Auto-approve creation and editing

**Rationale:**
- Utility scripts for workspace management
- Generally safe, but should review before first run
- Making them executable is auto-approved

**Auto-approved:**
- Creating new scripts
- Editing existing scripts
- Making scripts executable (chmod +x)

**Requires approval:**
- System-wide installation (cron, launchctl)

---

### `.claude/` - **High Control**

**Permission Level:** Require approval for all changes

**Rationale:**
- Controls Claude's own permissions
- Could be used to escalate privileges
- Must be intentional

**Auto-approved:**
- Read operations

**Requires approval:**
- Any modifications

---

## Command-Level Permissions

### Always Allowed

**File Operations:**
- `ls`, `cat`, `grep`, `find`, `pwd`, `which`, `tree`
- `mkdir`, `touch`, `cp`, `mv`
- `Edit()` and `Write()` in allowed directories

**Git Operations:**
- `git init`, `git status`, `git add`, `git commit`
- `git log`, `git show`, `git diff`, `git branch`, `git checkout`
- `git remote`, `git config --list --local`

**GitHub CLI:**
- `gh repo create`, `gh repo view`
- `gh pr`, `gh issue`

**Package Managers:**
- `npm`, `yarn`, `pnpm`, `pip`, `pip3`
- `cargo`, `rustc`, `go`

**Build Tools:**
- `make`, `cmake`
- `python`, `pytest`

**Search & Research:**
- `WebSearch`

**Making Scripts Executable:**
- `chmod +x` for scripts in allowed directories

---

### Requires Approval

**Destructive Operations:**
- `rm`, `rm -r`, `rm -rf`

**Git Publishing:**
- `git push`
- `git push --force`
- `git reset --hard`

**System-Level Changes:**
- `chmod` (outside of script directories)
- `chown`
- `launchctl`
- `crontab`
- `brew install/uninstall`

**Protected Directories:**
- Any changes to `core/`
- Any changes to `.claude/`

---

### Always Denied

**Dangerous System Operations:**
- `sudo` - No root access
- `rm -rf /` - Filesystem destruction
- `dd` - Disk operations
- `mkfs` - Filesystem formatting
- Fork bombs and similar attacks

---

## Philosophy by Task Type

### Writing/Content Creation
- **Projects & Sandbox:** Full autonomy
- AI can freely create, edit, iterate
- Git provides safety net
- You review final output

### Software Development
- **Creation:** Full autonomy
- **Testing:** Auto-approved
- **Publishing:** Requires approval (git push)
- **System changes:** Requires approval

### System Automation
- **Script creation:** Auto-approved
- **Script execution:** Auto-approved in sandbox
- **System installation:** Requires approval (cron, launchctl)
- **Dangerous ops:** Denied

### Research & Exploration
- **Reading codebase:** Full autonomy
- **Web search:** Auto-approved
- **Making changes:** Follows directory rules

---

## Adjusting Permissions

### Making Things More Permissive

Edit `.claude/settings.local.json` to move items from `ask` to `allow`:

```json
{
  "permissions": {
    "allow": [
      "Bash(git push:*)"  // Now auto-approved
    ],
    "ask": []
  }
}
```

### Making Things More Restrictive

Move items from `allow` to `ask`:

```json
{
  "permissions": {
    "allow": [],
    "ask": [
      "Bash(npm install:*)"  // Now requires approval
    ]
  }
}
```

### Blocking Operations

Add to `deny`:

```json
{
  "permissions": {
    "deny": [
      "Bash(python:*)"  // Block Python execution
    ]
  }
}
```

---

## Trust Levels Over Time

As you build trust with Claude Code, consider:

1. **Week 1:** Leave defaults, approve manually
2. **Week 2:** Auto-approve git push for specific repos
3. **Week 3:** Auto-approve package installations
4. **Month 2:** Consider auto-approving brew operations

**Never auto-approve:**
- Changes to core prompts
- Changes to permission settings
- System-level destructive operations

---

## Security Considerations

### Git Safety
- All projects are git repos
- Can rollback any change
- Review before pushing to remote

### Sandboxing
- Sandbox is gitignored
- No important data here
- Full autonomy acceptable

### Personal Data
- Obsidian integration requires approval
- Vault modifications are explicit
- Always review before execution

### System Integrity
- No sudo access
- No system-level destructive commands
- Cron and launchctl require approval

---

## Examples

### Scenario 1: Creating a New Project

**What happens:**
```bash
"Create a new Python project for web scraping"
```

1. ✅ Auto-approved: `mkdir projects/web-scraper`
2. ✅ Auto-approved: `Write()` Python files
3. ✅ Auto-approved: `git init`
4. ✅ Auto-approved: `git commit`
5. ❓ Asks approval: `git push`

### Scenario 2: Updating Prompts

**What happens:**
```bash
"Update my UNIFIED.md to be more concise"
```

1. ✅ Auto-approved: `Read(core/prompts/UNIFIED.md)`
2. ❓ Asks approval: `Edit(core/prompts/UNIFIED.md)`

### Scenario 3: Sandbox Experimentation

**What happens:**
```bash
"Test different approaches to parsing JSON"
```

1. ✅ Auto-approved: `Write(sandbox/json-test.py)`
2. ✅ Auto-approved: `python sandbox/json-test.py`
3. ✅ Auto-approved: Multiple iterations
4. ✅ Auto-approved: `rm sandbox/json-test.py` (inside sandbox)

### Scenario 4: System Automation

**What happens:**
```bash
"Set up a daily backup script"
```

1. ✅ Auto-approved: `Write(scripts/backup.sh)`
2. ✅ Auto-approved: `chmod +x scripts/backup.sh`
3. ❓ Asks approval: `crontab -e` (system installation)

---

## Summary

**The key principle:** Give AI autonomy in safe spaces, require approval for anything that affects:
- Your core instructions
- System configuration
- Publishing/sharing code
- Personal data
- Destructive operations

This balance lets you work efficiently while maintaining control over important decisions.
