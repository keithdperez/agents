#!/usr/bin/env bash
# Creates a new project with git initialization

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <project-name> [description]"
  echo "Example: $0 my-new-project 'A cool project'"
  exit 1
fi

PROJECT_NAME="$1"
DESCRIPTION="${2:-}"
PROJECTS_DIR="$(cd "$(dirname "$0")/.." && pwd)/projects"
PROJECT_PATH="$PROJECTS_DIR/$PROJECT_NAME"

if [ -d "$PROJECT_PATH" ]; then
  echo "Error: Project '$PROJECT_NAME' already exists at $PROJECT_PATH"
  exit 1
fi

echo "Creating new project: $PROJECT_NAME"
mkdir -p "$PROJECT_PATH"
cd "$PROJECT_PATH"

# Initialize git
git init
echo "# $PROJECT_NAME" > README.md
if [ -n "$DESCRIPTION" ]; then
  echo "" >> README.md
  echo "$DESCRIPTION" >> README.md
fi

# Create basic structure
mkdir -p src tests docs
touch src/.gitkeep tests/.gitkeep docs/.gitkeep

# Create .gitignore
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
venv/
__pycache__/
*.pyc

# Build outputs
dist/
build/
target/

# Environment
.env
.env.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db
EOF

# Initial commit
git add .
git commit -m "Initial project setup for $PROJECT_NAME"

echo ""
echo "✓ Project created at: $PROJECT_PATH"
echo "✓ Git repository initialized"
echo "✓ Basic structure created (src/, tests/, docs/)"
echo ""
echo "Next steps:"
echo "  cd $PROJECT_PATH"
echo "  # Start working on your project!"
