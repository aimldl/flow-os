# FUTURE-WORK.md

## 버그 수정

flow-clean-memo 실행 시 이상한거 확인

## Refactoring > 삭제

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

## Refactoring > quit 관련 확인

my % quit
zsh: command not found: quit
my % fquit
📦 sync repos
✅ resume location saved: my
👀 RESUME.md를 열어 검수합니다...
✅ RESUME 검수 후 종료하려면 Enter (취소: Ctrl+C):


## Refactoring > quick-quit 관련 확인

my % qq
📦 sync repos
✅ resume location saved: my
⚡ 빠른 종료
my %

