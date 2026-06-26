#!/usr/bin/env bash
# install.sh — Flow OS 설치 스크립트
# 사용법: cd ~/.flow-os && chmod +x install.sh && ./install.sh

echo "🚀 Installing Flow OS..."

# Step 1. OS layer — connect/activate
#   Append Flow OS loader to shell rc files (zsh and/or bash)

# 단계 1. OS 레이어 — 연결/활성화
#   셸 rc 파일에 Flow OS 로더 추가 (zsh 및/또는 bash)

FLOW_ZSH_LOADER='# --------------------------------------------------
# 🚀 Load Flow OS
# --------------------------------------------------

FLOW_ZSH="$HOME/.flow-os/shell/zsh"

[ -d "$FLOW_ZSH" ] && {
    source "$FLOW_ZSH/config"
    source "$FLOW_ZSH/alias"
    source "$FLOW_ZSH/functions"
    source "$FLOW_ZSH/rc"
}'

FLOW_BASH_LOADER='# --------------------------------------------------
# 🚀 Load Flow OS
# --------------------------------------------------

FLOW_BASH="$HOME/.flow-os/shell/bash"

[ -d "$FLOW_BASH" ] && {
    source "$FLOW_BASH/config"
    source "$FLOW_BASH/alias"
    source "$FLOW_BASH/functions"
    source "$FLOW_BASH/rc"
}'

if command -v zsh >/dev/null 2>&1; then
    ZSHRC="$HOME/.zshrc"
    touch "$ZSHRC"
    if grep -q "Load Flow OS" "$ZSHRC" 2>/dev/null; then
        echo "  ✅ [OS]    .zshrc already configured"
    else
        echo "" >> "$ZSHRC"
        echo "$FLOW_ZSH_LOADER" >> "$ZSHRC"
        echo "  ✅ [OS]    .zshrc updated"
    fi
fi

if command -v bash >/dev/null 2>&1; then
    BASHRC="$HOME/.bashrc"
    touch "$BASHRC"
    if grep -q "Load Flow OS" "$BASHRC" 2>/dev/null; then
        echo "  ✅ [OS]    .bashrc already configured"
    else
        echo "" >> "$BASHRC"
        echo "$FLOW_BASH_LOADER" >> "$BASHRC"
        echo "  ✅ [OS]    .bashrc updated"
    fi
fi

# Step 2. Data layer — create
#   Create ~/my workspace

# 단계 2. 데이터 레이어 — 생성
#   ~/my 작업 공간 생성

if [ ! -d "$HOME/my" ]; then
    mkdir "$HOME/my"
    echo "  ✅ [data]  ~/my created"
else
    echo "  •  [data]  ~/my already exists"
fi

# Step 3. State layer — create
#   Create ~/my/.flow

# 단계 3. 상태 레이어 — 생성
#   ~/my/.flow 생성

if [ ! -d "$HOME/my/.flow" ]; then
    mkdir "$HOME/my/.flow"
    echo "  ✅ [state] ~/my/.flow created"
else
    echo "  •  [state] ~/my/.flow already exists"
fi

# Step 4. Intent layer — create
#   Create craft, forge, jobs, projects, temp, vault

# 단계 4. 의도 레이어 — 생성
#   craft, forge, jobs, projects, temp, vault 생성

PURPOSE_DIRS=(craft forge jobs projects temp vault)

for dir in "${PURPOSE_DIRS[@]}"; do
    mkdir -p "$HOME/my/$dir"
done
echo "  ✅ [intent] purpose dirs ready (${PURPOSE_DIRS[*]})"

# Step 5. State layer — initialize
#   Create core state files in ~/my/.flow/core

# 단계 5. 상태 레이어 — 초기화
#   ~/my/.flow/core에 핵심 상태 파일 생성

CORE="$HOME/my/.flow/core"
CORE_FILES=(memo.md next.md resume.md todo.md)

mkdir -p "$CORE"

for file in "${CORE_FILES[@]}"; do
    if [ ! -f "$CORE/$file" ]; then
        echo "# ${file%.md}" > "$CORE/$file"
        echo "  ✅ [state] $file created"
    else
        echo "  •  [state] $file already exists"
    fi
done

# Step 6. Execution environment
#   Set executable permission on bin/ scripts

# 단계 6. 실행 환경
#   bin/ 스크립트에 실행 권한 부여

chmod +x "$HOME/.flow-os/bin/"*
echo "  ✅ [env]   bin/ scripts executable"

echo ""
echo "✅ Done. Restart terminal or run: exec zsh  (zsh)"
echo "                              or run: exec bash (bash)"
