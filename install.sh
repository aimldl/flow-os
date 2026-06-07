#!/bin/bash

echo "🚀 Installing Flow OS..."

# This directory is where flow-os repository is cloned.
BASE_DIR="$HOME/flow-os"

# shell config
cp "$BASE_DIR/shell/zsh/.zshrc" ~/
cp "$BASE_DIR/shell/zsh/.zshalias" ~/
cp "$BASE_DIR/shell/zsh/.zshconfig" ~/

# core files
cp "$BASE_DIR/core/OS.md" ~/
cp "$BASE_DIR/core/README.md" ~/
cp "$BASE_DIR/core/USAGE.md" ~/

# Initialize TODO and RESUME
cp "$BASE_DIR/core/TODO.template.md" ~/TODO.md
cp "$BASE_DIR/core/RESUME.template.md" ~/RESUME.md

# workspace
mkdir -p ~/my/github
mkdir -p ~/my/projects
mkdir -p ~/my/tmp

echo "✅ Done. Restart terminal."
