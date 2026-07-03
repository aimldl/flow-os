#!/usr/bin/env bash
# install.sh — Flow OS 설치 스크립트
# 사용법: cd ~/.flow-os && chmod +x install.sh && ./install.sh

echo "🚀 Installing Flow OS..."

# Step 0. Optional tools — check & install
#   Ask up front whether to install Python3, Docker, Jupyter Lab if missing

# 단계 0. 선택 도구 — 확인 및 설치
#   Python3, Docker, Jupyter Lab이 없으면 초반에 설치 여부를 묻는다

check_and_install() {
    local name="$1" check_cmd="$2" install_cmd="$3"

    if eval "$check_cmd" >/dev/null 2>&1; then
        echo "  •  [tool]  $name already installed"
        return
    fi

    read -r -p "  ❓ [tool]  $name not found. Install now? (y/N) " reply
    case "$reply" in
        [yY]*)
            eval "$install_cmd"
            echo "  ✅ [tool]  $name installed"
            ;;
        *)
            echo "  ⏭  [tool]  $name skipped"
            ;;
    esac
}

if [ "$(uname -s)" = "Darwin" ] && command -v brew >/dev/null 2>&1; then
    check_and_install "Python3" "command -v python3" "brew install python"
    check_and_install "Docker" "command -v docker" "brew install --cask docker"
elif command -v apt-get >/dev/null 2>&1; then
    check_and_install "Python3" "command -v python3" "sudo apt-get update && sudo apt-get install -y python3 python3-pip"
    check_and_install "Docker" "command -v docker" "sudo apt-get update && sudo apt-get install -y docker.io"
else
    echo "  ⚠️  [tool]  Unsupported platform for auto-install of Python3/Docker — please install manually if needed"
fi

check_and_install "Jupyter Lab" "command -v jupyter" "python3 -m pip install --user jupyterlab"

# Step 1. OS layer — connect/activate
#   Create ~/.zshconfig & ~/.zshalias, then append loaders to shell rc files (zsh and/or bash)

# 단계 1. OS 레이어 — 연결/활성화
#   ~/.zshconfig, ~/.zshalias 생성 후 셸 rc 파일에 로더 추가 (zsh 및/또는 bash)

if [ ! -f "$HOME/.zshconfig" ]; then
    cat > "$HOME/.zshconfig" <<'EOF'
# .zshconfig  Z Shell Configuration

# -------------------------
# Jupyter Lab
# -------------------------
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# -------------------------
# 🐍 Python (mac only)
# -------------------------
if [ "$(uname -s)" = "Darwin" ] && command -v brew >/dev/null 2>&1; then
    export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
fi
EOF
    echo "  ✅ [dotfile] ~/.zshconfig created"
else
    echo "  •  [dotfile] ~/.zshconfig already exists"
fi

if [ ! -f "$HOME/.zshalias" ]; then
    cat > "$HOME/.zshalias" <<'EOF'
# .zshalias Z Shell Alias

# ==================================================
# Jupyter Lab Layer
# ==================================================

alias j='jupyter lab'
alias jl='jupyter lab'
alias jlab='jupyter lab'

# ==================================================
# 🐳 Docker Layer
# ==================================================

alias dl='docker login'
alias dp='docker ps'
alias dr='docker run -it'
alias ds='docker stop'
alias da='docker attach'

alias dpull='docker pull'
alias dpush='docker push'
alias dc='docker commit'
EOF
    echo "  ✅ [dotfile] ~/.zshalias created"
else
    echo "  •  [dotfile] ~/.zshalias already exists"
fi

ZSH_DOTFILE_LOADER='# --------------------------------------------------
# Load Alias & Config for Z Shell
# --------------------------------------------------

[ -f "$HOME/.zshconfig" ] && source "$HOME/.zshconfig"
[ -f "$HOME/.zshalias" ] && source "$HOME/.zshalias"'

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

    if grep -q "Load Alias & Config for Z Shell" "$ZSHRC" 2>/dev/null; then
        echo "  ✅ [OS]    .zshrc already loads ~/.zshconfig & ~/.zshalias"
    else
        echo "" >> "$ZSHRC"
        echo "$ZSH_DOTFILE_LOADER" >> "$ZSHRC"
        echo "  ✅ [OS]    .zshrc updated to load ~/.zshconfig & ~/.zshalias"
    fi

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
