# AI Coding Agents Workspace

Testing ground for Claude Code, Gemini, Codex, and OpenCode.

## Structure

```
~/agents/
├── core/prompts/           # Unified instructions for all platforms
│   ├── UNIFIED.md          # Core operating rules + writing style
│   ├── CLAUDE.md           # Claude-specific (symlinked to UNIFIED)
│   ├── GEMINI.md           # Gemini-specific
│   ├── AGENTS.md           # Agents-specific
│   └── keith-writing-style.md  # Full style guide
│
├── projects/               # Real projects (each has own git repo)
│   └── [project-name]/     # Individual project directories
│
├── sandbox/                # Quick experiments and throwaway code
│
└── obsidian-integration/   # Scripts/tools for Obsidian workflows
```

## Workflow

### Starting a New Project
1. Create project directory: `mkdir ~/agents/projects/my-project`
2. Initialize git inside the project: `cd ~/agents/projects/my-project && git init`
3. Work on it with any AI platform

### Quick Experiments
Use `~/agents/sandbox/` for throwaway code. No git needed.

### Working with Obsidian
Use `~/agents/obsidian-integration/` for scripts that interact with your vault.

## Platform Access to Prompts

All platforms can reference the unified prompts:
- Claude: Reads from `~/.config/claude/custom_instructions.md` (symlink to core/prompts/CLAUDE.md)
- Others: Point to `~/agents/core/prompts/[PLATFORM].md`

## Git Strategy

- **This repo** (`~/agents`): Tracks only `core/prompts/` and documentation
- **Project repos**: Each project in `projects/` has its own git repo
- **Sandbox**: No git tracking (gitignored)
