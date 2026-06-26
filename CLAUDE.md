# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What is Flow OS

Flow OS is a personal anti-procrastination shell system (~/.flow-os) that minimizes cognitive load for resuming priority tasks. It is **not** a traditional software project — it's a collection of shell scripts, aliases, and configuration files that form an "operating system" layer on top of zsh. The user data lives separately in `~/my/.flow/core/` (resume.md, todo.md, memo.md, next.md).

## Architecture

Two-layer design with strict separation:

- **OS layer** (`~/.flow-os/`): Source code, scripts, shell config — this repo
- **Data layer** (`~/my/`): User workspace, projects, and flow state files — not in this repo

### Key directories

- `bin/` — Executable shell scripts (bash). All are on PATH via `shell/zsh/config` or `shell/bash/config`.
- `shell/zsh/` — Zsh configuration loaded at terminal startup:
  - `rc` — Dashboard display + prompt setup (loaded by `.zshrc`)
  - `functions` — Shell functions (notably `flow-go` and `__edit`)
  - `alias` — All user-facing command aliases
  - `config` — Environment variables and PATH
- `shell/bash/` — Bash equivalents of the above (loaded by `.bashrc`):
  - `rc` — Dashboard + `PROMPT_COMMAND`-based prompt
  - `functions` — Same as zsh (bash-compatible)
  - `alias` — Sources `shell/zsh/alias` (identical syntax)
  - `config` — Environment variables and PATH

### Core state files (in ~/my/.flow/core/, not this repo)

- `resume.md` — The most important file. Records where to resume work (path).
- `todo.md` — Task list with `[]`/`[v]` markers (Recommend only top 3 task)
- `memo.md` — Quick-capture for stray thoughts (timestamped)
- `next.md` — Intention setting

### History archival

`flow-clean-memo` and `flow-clean-todo` archive to `~/my/.flow/history/YYYY-MM-DD-DAY/`.

## Command flow

The daily workflow cycle: `terminal start → Dashboard → go → work → (memo/todo) → clean → quit`

Key commands (all have multiple aliases defined in `shell/zsh/alias`):

| Command | Script/Function | What it does |
|---------|----------------|--------------|
| `go` | `shell/zsh/functions:flow-go` | cd to path in resume.md line 1 |
| `fmemo <text>` | `bin/flow-memo` | Append timestamped memo to memo.md |
| `q` / `quit` | `bin/flow-quit` | git-push → save resume → review → close terminal |
| `qq` | `bin/flow-quick-quit` | git-push → save resume → close terminal (no review) |
| `cleanmemo` | `bin/flow-clean-memo` | Archive memo.md to history, reset core |
| `cleantodo` | `bin/flow-clean-todo` | Move `[v]` items to history, keep `[]` items |
| `todo` / `resume` / `memo` | aliases | Open respective core file in editor |

## Important implementation details

- `flow-go` is a **shell function** (in `shell/zsh/functions`), not a standalone script, because it needs to `cd` in the current shell. The `bin/flow-go` file is a placeholder/reminder.
- `__edit` opens TextEdit on macOS, nano on Linux.
- Shared bash libraries (`lib-*`) are sourced, not executed. Chain: `lib-resume` → `lib-path` → `lib-date`. `lib-git` is standalone.
- `lib-git` provides smart sync utilities (network check, interval-based skip) and config-based repo iteration.
- `git-push`, `git-pull`, `git-status` operate on repos defined in `bin/git-target-repos.cfg` (pipe-delimited `path|url` format). SSH auth.
- Smart sync runs at terminal startup (`shell/zsh/rc`) with network check + interval skip (default 180 min).
- `flow-quit` / `flow-quick-quit` wrap git-push with network check (skip push if offline).
- `git-target-repos` (no extension) in `bin/` is a bash script sourced by `lib-git` — not executable directly.

## Shell configuration chain

**zsh:** `.zshrc` sources → `shell/zsh/config` → `shell/zsh/alias` → `shell/zsh/functions` → `shell/zsh/rc` (dashboard)

**bash:** `.bashrc` sources → `shell/bash/config` → `shell/bash/alias` → `shell/bash/functions` → `shell/bash/rc` (dashboard)

`install.sh` detects available shells and appends the appropriate loader block to `~/.zshrc` and/or `~/.bashrc`.

## Language

The codebase is bilingual. User-facing messages and documentation are primarily in Korean. Code comments mix Korean and English. The `lib-date` library supports ko/en/ja via `FLOW_LANG`.
