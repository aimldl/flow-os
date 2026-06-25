# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What is Flow OS

Flow OS is a personal anti-procrastination shell system (~/.flow-os) that minimizes cognitive load for resuming priority tasks. It is **not** a traditional software project — it's a collection of shell scripts, aliases, and configuration files that form an "operating system" layer on top of zsh. The user data lives separately in `~/my/.flow/core/` (RESUME.md, TODO.md, MEMO.md, NEXT.md).

## Architecture

Two-layer design with strict separation:

- **OS layer** (`~/.flow-os/`): Source code, scripts, shell config — this repo
- **Data layer** (`~/my/`): User workspace, projects, and flow state files — not in this repo

### Key directories

- `bin/` — Executable shell scripts (bash). All are on PATH via `shell/zsh/config`.
- `shell/zsh/` — Zsh configuration loaded at terminal startup:
  - `rc` — Dashboard display + prompt setup (loaded by `.zshrc`)
  - `functions` — Shell functions (notably `flow-go` and `__edit`)
  - `alias` — All user-facing command aliases
  - `config` — Environment variables and PATH

### Core state files (in ~/my/.flow/core/, not this repo)

- `RESUME.md` — The most important file. Records where to resume work (path).
- `TODO.md` — Task list with `[]`/`[v]` markers (Recommend only top 3 task)
- `MEMO.md` — Quick-capture for stray thoughts (timestamped)
- `NEXT.md` — Intention setting

### History archival

`flow-clean-memo` and `flow-clean-todo` archive to `~/my/.flow/history/YYYY-MM-DD-DAY/`.

## Command flow

The daily workflow cycle: `terminal start → Dashboard → go → work → (memo/todo) → clean → quit`

Key commands (all have multiple aliases defined in `shell/zsh/alias`):

| Command | Script/Function | What it does |
|---------|----------------|--------------|
| `go` | `shell/zsh/functions:flow-go` | cd to path in RESUME.md line 1 |
| `fmemo <text>` | `bin/flow-memo` | Append timestamped memo to MEMO.md |
| `q` / `quit` | `bin/flow-quit` | git-push → save RESUME → review → close terminal |
| `qq` | `bin/flow-quick-quit` | git-push → save RESUME → close terminal (no review) |
| `cleanmemo` | `bin/flow-clean-memo` | Archive MEMO.md to history, reset core |
| `cleantodo` | `bin/flow-clean-todo` | Move `[v]` items to history, keep `[]` items |
| `todo` / `resume` / `memo` | aliases | Open respective core file in editor |

## Important implementation details

- `flow-go` is a **shell function** (in `shell/zsh/functions`), not a standalone script, because it needs to `cd` in the current shell. The `bin/flow-go` file is a placeholder/reminder.
- `__edit` opens TextEdit on macOS, nano on Linux.
- `lib-date` is a shared bash library (sourced, not executed). It provides `flow_today`, `flow_time`, `flow_weekday`, `flow_history_dir`, and localized messages via `FLOW_LANG` (defaults to `ko`).
- `git-push` and `git-sync` operate on all git repos under `~/my/craft/`, not on this repo.
- `install.sh` is outdated — it references paths (`core/`, `docs/`) that don't exist in the current repo structure.

## Shell configuration chain

`.zshrc` (home) sources → `shell/zsh/config` → `shell/zsh/functions` → `shell/zsh/alias` → `shell/zsh/rc` (dashboard).

The repo also ships `.zshrc`, `.zshalias`, `.zshconfig` templates in `shell/zsh/` (dotfile prefixed versions) that `install.sh` copies to `~/`.

## Language

The codebase is bilingual. User-facing messages and documentation are primarily in Korean. Code comments mix Korean and English. The `lib-date` library supports ko/en/ja via `FLOW_LANG`.
