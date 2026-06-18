# HISTORY.md

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

### secure-tasks → vault & tasks → jobs로 디렉토리명 변경

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
