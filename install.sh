#!/usr/bin/env bash

# 💡 Bash와 Zsh 모두에서 안정적으로 실행되도록 Shebang을 변경했습니다.
# (스크립트가 실행된 현재 디렉토리를 자동으로 BASE_DIR로 잡습니다)
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🚀 Installing Flow OS..."

# shell config
cp "$BASE_DIR/shell/zsh/.zshrc" ~/
cp "$BASE_DIR/shell/zsh/.zshalias" ~/
cp "$BASE_DIR/shell/zsh/.zshconfig" ~/

# core files
cp "$BASE_DIR/core/OS.md" ~/
cp "$BASE_DIR/core/README.md" ~/
cp "$BASE_DIR/docs/USAGE.md" ~/

# Initialize TODO and RESUME
mkdir -p ~/.flow/core
cp "$BASE_DIR/core/TODO.template.md" ~/.flow/core/TODO.md
cp "$BASE_DIR/core/RESUME.template.md" ~/.flow/core/RESUME.md

# workspace
mkdir -p ~/my/github
mkdir -p ~/my/projects
mkdir -p ~/my/tmp

# bin scripts
mkdir -p "$HOME/.flow-os/bin"
# ⚠️ 중요: 와일드카드(*)를 따옴표 밖으로 빼서 정상 작동하게 수정했습니다.
cp "$BASE_DIR"/bin/* "$HOME/.flow-os/bin/"
chmod +x "$HOME/.flow-os/bin/"*

echo "✅ Done. Restart terminal."
