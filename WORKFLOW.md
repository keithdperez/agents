# Workflow Guide

## Daily Usage

### For Claude Code
You're already here. Claude can read/write freely in:
- `~/agents/projects/*` - Real work
- `~/agents/sandbox/*` - Experiments
- `~/agents/core/prompts/*` - Your instructions (read these to understand your preferences)

Claude's instructions are in `.claude/settings.local.json` at the project root (~/agents).

### For Other Platforms
Point them to their respective prompt files:
- Gemini: `~/agents/core/prompts/GEMINI.md`
- Codex: `~/agents/core/prompts/AGENTS.md`

## Switching Between Platforms

### Same Project, Different AI
If you want multiple AIs to work on the same project:
1. Create the project in `~/agents/projects/my-project`
2. All platforms can access it
3. Each sees the same code, uses platform-specific prompts

### Platform Comparison
Use `~/agents/sandbox/platform-test/` to test the same task across platforms.

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

## Obsidian Integration

When working on Obsidian notes or scripts:
- Reference your vault path in requests
- Use `~/agents/obsidian-integration/` for any helper scripts
- AI can read/analyze notes if you provide paths

## Tips

**Keep prompts DRY**: Edit `UNIFIED.md` first, then sync to other platform-specific files if needed.

**Sandbox freely**: The sandbox dir is gitignored. Trash it, rebuild it, whatever.

**One project, one repo**: Each meaningful project gets its own git repo inside `projects/`.

**Platform testing**: Create parallel directories in sandbox to test same task across platforms, then compare results.
