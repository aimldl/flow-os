# --------------------------------------------------
# 🚀 Startup Behavior (Flow OS)
# --------------------------------------------------

# --------------------------------------------------
# 🔄 Smart Git Sync
# --------------------------------------------------

LAST_RUN_FILE="$HOME/.last_gsync"
GITHUB_DIR="$HOME/my/github"
SYNC_SCRIPT="$GITHUB_DIR/sync.sh"
SYNC_INTERVAL_MINUTES="${SYNC_INTERVAL_MINUTES:-180}"

if [ -d "$GITHUB_DIR" ] && command -v git >/dev/null; then
    if ping -q -c 1 github.com >/dev/null 2>&1; then

        if [ -f "$LAST_RUN_FILE" ]; then
            LAST_RUN=$(stat -f %Sm -t %Y%m%d%H%M "$LAST_RUN_FILE")
            NOW=$(date +%Y%m%d%H%M)

            DIFF_MINUTES=$(( ( $(date -j -f "%Y%m%d%H%M" "$NOW" +%s) - \
                               $(date -j -f "%Y%m%d%H%M" "$LAST_RUN" +%s) ) / 60 ))
        else
            DIFF_MINUTES=$SYNC_INTERVAL_MINUTES
        fi

        if [ "$DIFF_MINUTES" -ge "$SYNC_INTERVAL_MINUTES" ]; then
            echo "🔄 Syncing github repos..."
            bash "$SYNC_SCRIPT"
            date > "$LAST_RUN_FILE"
        else
            echo "✅ Sync skipped (sync'ed ${DIFF_MINUTES} min ago)"
        fi
    else
        echo "⚠️ Network unavailable → skip sync"
    fi
fi

# --------------------------------------------------
# 🧠 Dashboard
# --------------------------------------------------

echo ""

echo "📌 Flow OS"
[ -f "$HOME/OS.md" ] && grep -v "^#" "$HOME/OS.md" | grep -v "^$" | head -n 1

echo ""
echo "📝 TODO"
[ -f "$HOME/TODO.md" ] && grep -v "^#" "$HOME/TODO.md" | grep -v "^$"

echo ""
echo "🚀 Resume"
[ -f "$HOME/RESUME.md" ] && grep -v "^#" "$HOME/RESUME.md" | grep -v "^$"

echo ""

# --------------------------------------------------
# 📂 Workspace
# --------------------------------------------------

if [ "$PWD" = "$HOME" ]; then
    cd ~/my
    echo "my"
    tree -d -L 1 ~/my --noreport | sed '1d'
fi

# --------------------------------------------------
# 🛠 Editor wrapper (✅ 추가된 부분)
# --------------------------------------------------

__edit() {
    if [ $# -eq 0 ]; then
        if [ "$(uname -s)" = "Darwin" ]; then
            open -a TextEdit
        else
            nano
        fi
        return
    fi

    if [ "$(uname -s)" = "Darwin" ]; then
        open -a TextEdit "$@"
    else
        nano "$@"
    fi
}

# --------------------------------------------------
# 🚀 Resume Engine
# --------------------------------------------------

__resume_open() {
    local index="$1"
    local resume_file="$HOME/RESUME.md"

    local target
    target=$(grep -v '^#' "$resume_file" | grep -v '^$' | sed -n "${index}p")

    local full_path="$HOME/my/$target"

    if [ -f "$full_path" ]; then
        cd "$(dirname "$full_path")"
        echo "📂 Open: $target"
        __edit "$full_path"

    elif [ -d "$full_path" ]; then
        cd "$full_path"
        echo "📂 Open dir: $target"

    else
        echo "❌ $target not found"
    fi
}

# --------------------------------------------------
# 🛑 Quit Engine (✅ 추가해야 할 부분)
# quit        = full shutdown
# quit_quick  = fast shutdown (review skip)
# --------------------------------------------------

__resume_target() {
    local target="$1"
    local my_root="$HOME/my"

    if [ -n "$target" ]; then
        echo "$target"
        return
    fi

    if [[ "$PWD" == "$my_root"* ]]; then
        echo "${PWD#$my_root/}"
    else
        echo "$PWD"
    fi
}

__write_resume() {
    local target="$1"
    local resume_file="$HOME/RESUME.md"

    {
        echo "# RESUME"
        echo ""
        echo "$target"
    } > "$resume_file"

    echo "✅ RESUME updated: $target"
}

# ✅ Full shutdown (기본)


quit() {
    local target
    target="$(__resume_target "$1")"

    echo "📦 Running gpush..."
    bash "$HOME/my/github/push.sh"

    echo "📝 Updating RESUME.md..."
    __write_resume "$target"

    echo "👀 Opening RESUME.md for review..."
    __edit "$HOME/RESUME.md"

    echo ""
    read -r "?✅ RESUME 검수 후 종료하려면 Enter (취소: Ctrl+C) "

    echo "👋 Closing session..."
    if [ "$(uname -s)" = "Darwin" ]; then
        osascript -e 'tell application "Terminal" to close front window'
    else
        exit
    fi
}

# ✅ Quick shutdown (fast)
quit_quick() {
    local target
    target="$(__resume_target "$1")"

    echo "📦 Running gpush..."
    bash "$HOME/my/github/push.sh"

    echo "📝 Updating RESUME.md..."
    __write_resume "$target"

    echo "⚡ Quick exit"
    if [ "$(uname -s)" = "Darwin" ]; then
        osascript -e 'tell application "Terminal" to close front window'
    else
        exit
    fi
}

# --------------------------------------------------
# 📦 Load modules
# --------------------------------------------------

[ -f "$HOME/.zshconfig" ] && source "$HOME/.zshconfig"
[ -f "$HOME/.zshalias" ] && source "$HOME/.zshalias"
