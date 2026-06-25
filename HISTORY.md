# HISTORY.md

## 2026-06-25-목
- [몇 일 전] Gemini CLI에 Pro Plan임에도 알 수 없는 quota issue로 고치는데 시간/노력이 드는 상태
- Claude Code 도입!


## TODOs
### 버그 수정

flow-clean-memo 실행 시 이상한거 확인


### Refactor?
- go2, `go3`: 각각 2번째, 3번째 항목으로 이동합니다.

### Refactoring > 삭제

.flow-os/bin/flow.old
  -> flow next [path]
  -> organize [target] < clean
  -> flow pull < git-sync와 다른가?
  -> usage 명령어 대신 OS.md 사용중 -> usage 만들어?

.flow-os/template
  -> install.sh에서 template의 파일 없이 가능하도록

.flow-os
└── template
    ├── RESUME.template.md
    └── TODO.template.md

### Refactoring > quit 관련 확인

my % quit
zsh: command not found: quit
my % fquit
📦 sync repos
✅ resume location saved: my
👀 RESUME.md를 열어 검수합니다...
✅ RESUME 검수 후 종료하려면 Enter (취소: Ctrl+C):


### Refactoring > quick-quit 관련 확인

my % qq
📦 sync repos
✅ resume location saved: my
⚡ 빠른 종료
my %

## History

### 2026-06-19 (금)

[v].flow-os/bin/flow 명령어 완전 삭제

현 상태

```bash
.flow-os
├── flow-clean-memo
├── flow-clean-todo
├── flow-go
├── flow-memo
├── flow-quick-quit
├── flow-quit
├── git-init
├── git-push
├── git-repositories.cfg
├── git-setup
├── git-status
├── git-sync
└── lib-date

1 directory, 13 files
```

[] `day=$(flow_weekday)`와 `lib-date` 중복 제거
- lib-today
- lib-time
- lib-day

flow-memo 등에 공통 적용된 부분을 lib-*로 추출 후 refactor
```
today=$(flow_today)
time=$(flow_time)
day=$(flow_weekday)
```



### 2026-06-18 (목)

#### secure-tasks → vault & tasks → jobs로 디렉토리명 변경

알파벳 순서 + 의미 + 흐름 전부 해결됨

```bash
.
├── craft
├── forge
├── projects
├── tasks
├── temp
└── vault
```
에서
```bash
.
├── craft
├── forge
├── jobs
├── projects
├── temp
└── vault
```
```text
✨ 의미 흐름 (중요)
craft    → 이미 익숙한 기술 유지
forge    → 배우고 성장
jobs     → 실험/작업 실행
projects → job보다 큰 project
temp     → 임시
vault    → private
```
이건 그냥 폴더가 아니라 → “인지 상태 + 작업 단계 흐름”

### 핵심 파일 위치 변경

`flow-entry/temporary/`에서 `~/my/.flow/core/`로 디렉토리 구조를 변경

디렉토리 구조 변경 이력
1. 1개: ~/workspace 대신 ~/my로 변경
2. 2개:
3. 4개: ~/my ~/flow-entry/ ~/flow-state ~/flow-os
4. 5개: ~/my ~/flow-entry/ ~/flow-state ~/.flow-os ~/.flow
5. 6개:  ~/my ~/flow-entry/ ~/flow-state ~/.flow-os ~/.flow ~/.flow-architecture
6. 2개로 변경: ~/my ~/.flow-os
  - 설치 후 사용자 입장에선 1개의 디렉토리 ~/my만 사용

주요 변경 사항
`flow-entry/temporary/memo.md`에서 `~/my/.flow/core/MEMO.md`로 변경


### 2026-06-18 (목)

어제 flow 명령어와 stand-alone commands를 merge했지만...
- alias flow (.flow로 cd하는 alias)와 flow 명령어가 충돌함에 따라, flow 명령어의 사용을 폐지.
- 대신 flow 명령어는 shell/zsh/alias에서 입력 가능한 다양한 입력 명령어를 지정-> 오히려 이게 나은 듯?

#!/usr/bin/env bash

cmd="$1"
shift || true

show_usage() {
  cat <<'USAGE'
Usage:
  flow memo <text>
  flow clean-memo
  flow clean-todo
  flow next [path]
  flow organize [memo]
  flow sync
  flow push [message]
  flow pull
  flow status
  flow git-init [core|exp|all]
  flow git-sync [core|exp|all]
  flow git-status
  flow git-push [core|exp|all]
  flow git-setup
  flow quit [path]
  flow quick-quit [path]

Merge commands
  clean-memo -> flow clean-memo
  clean-todo -> flow clean-todo


}

### 2026-06-17 (수)

리눅스 명령어 모음이였던 flow 명령어 

Old Usage:
```
  flow next [path]
  flow organize [memo]
  flow sync
  flow push [message]
  flow pull
  flow status
```

예:
    pull)
        cd "$HOME/.flow-os" || exit 1
        git pull
          
        echo "⬇ ️ Flow OS pull..."
        echo "✅ up to date"
        ;;

에 포함되는 명령어 숫자가 늘어남.

bin 폴더에 추가했던 별도 명령어를 

  clean-memo
  clean-todo

flow 명령어로 refactor하고 

  clean-memo -> flow clean-memo
  clean-todo -> flow clean-todo


flow 명령어가 wrapper지원

예: 
    status)
        exec git-status
        ;;
    git-init)
        exec git-init "$@"
        ;;
    git-sync)
        exec git-sync "$@"
        ;;
    git-status)
        exec git-status "$@"
        ;;
    git-push)
        exec git-push "$@"
        ;;
    git-setup)
        exec git-setup "$@"
        ;;
    quit)
        exec quit "$@"
        ;;
    quick-quit|quick_quit|quick)
        exec quick-quit "$@"
        ;;
    ""|help|-h|--help)
        show_usage
        ;;
    *)


duplicate standalone commands을 
  flow-sync 
  git-init
  git-push
  git-status
  git-sync
  git-setup
  quit
  quick-quit

flow 명령어로 merge

  flow memo <text>
  flow clean-memo
  flow clean-todo
  flow next [path]
  flow organize [memo]
  flow sync
  flow push [message]
  flow pull
  flow status
  flow git-init [core|exp|all]
  flow git-sync [core|exp|all]
  flow git-status
  flow git-push [core|exp|all]
  flow git-setup
  flow quit [path]
  flow quick-quit [path]


