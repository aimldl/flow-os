#!/bin/bash

echo "🚀 Installing My OS 2.0..."

# This directory is where my-os repository is cloned.
BASE_DIR="$HOME/my-os"

# zsh config
cp "$BASE_DIR/zsh/.zshrc" ~/
cp "$BASE_DIR/zsh/.zshalias" ~/
cp "$BASE_DIR/zsh/.zshconfig" ~/

# system files
cp "$BASE_DIR/system/OS.md" ~/
cp "$BASE_DIR/system/README.md" ~/
cp "$BASE_DIR/system/USAGE.md" ~/

# Initialize TODO and RESUME
cp "$BASE_DIR/system/TODO.template.md" ~/TODO.md
cp "$BASE_DIR/system/RESUME.template.md" ~/RESUME.md

# workspace
mkdir -p ~/my/github
mkdir -p ~/my/projects
mkdir -p ~/my/tmp

echo "✅ Done. Restart terminal."
