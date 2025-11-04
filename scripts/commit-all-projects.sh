#!/usr/bin/env bash
# Commits changes across all projects in the projects/ directory

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECTS_DIR="$(cd "$SCRIPT_DIR/../projects" && pwd)"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <commit-message>"
  echo "Example: $0 'Update dependencies'"
  exit 1
fi

COMMIT_MSG="$1"

echo "Committing changes across all projects..."
echo "Commit message: $COMMIT_MSG"
echo ""

# Find all git repositories in projects/
for project in "$PROJECTS_DIR"/*; do
  if [ ! -d "$project" ]; then
    continue
  fi

  if [ ! -d "$project/.git" ]; then
    continue
  fi

  PROJECT_NAME=$(basename "$project")
  cd "$project"

  # Check if there are changes
  if git diff-index --quiet HEAD -- 2>/dev/null; then
    echo "✓ $PROJECT_NAME - No changes"
  else
    echo "→ $PROJECT_NAME - Committing changes..."
    git add .
    git commit -m "$COMMIT_MSG" || echo "  (commit failed or nothing to commit)"
    echo "✓ $PROJECT_NAME - Done"
  fi
  echo ""
done

echo "All projects processed!"
