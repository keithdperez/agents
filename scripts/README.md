# Workflow Scripts

Automation utilities for managing the agents workspace.

## Available Scripts

### `new-project.sh`
Creates a new project with git initialization and basic structure.

**Usage:**
```bash
./scripts/new-project.sh <project-name> [description]
```

**Example:**
```bash
./scripts/new-project.sh obsidian-automation "Scripts for Obsidian vault automation"
```

**What it creates:**
- New directory in `projects/`
- Git repository initialization
- Basic structure: `src/`, `tests/`, `docs/`
- README.md with project name and description
- .gitignore with common exclusions
- Initial commit

---

### `sync-prompts.sh`
Syncs UNIFIED.md to all platform-specific prompt files (CLAUDE.md, GEMINI.md, AGENTS.md).

**Usage:**
```bash
./scripts/sync-prompts.sh
```

**Use this when:**
- You've updated `core/prompts/UNIFIED.md`
- You want all AI platforms to use the same instructions
- You need to ensure consistency across platforms

---

### `commit-all-projects.sh`
Commits changes across all projects in the projects/ directory with the same message.

**Usage:**
```bash
./scripts/commit-all-projects.sh "commit message"
```

**Example:**
```bash
./scripts/commit-all-projects.sh "Update dependencies to latest versions"
```

**Use this when:**
- Making similar changes across multiple projects
- Batch updating documentation
- Synchronizing version bumps

---

## Making Scripts Executable

After creating or cloning this repo, make scripts executable:

```bash
chmod +x scripts/*.sh
```

Or use individual scripts:
```bash
chmod +x scripts/new-project.sh
```
