Translations: **한국어** | [English](README.en.md) | [日本語](README.ja.md)

# Flow OS

> 우선순위 작업으로 복귀하는 인지적 부담을 최소화하는 개인용 미루기 방지 셸 시스템

## Flow OS란?

Flow OS는 `~/.flow-os`에 위치하는 셸 설정 레이어입니다. 항상 마지막으로 작업하던 위치를 보여줌으로써 작업 시작의 심리적 마찰을 줄입니다. 기억하지 않고, 망설이지 않고, 바로 실행합니다.

```
[ 인지 부담 경감 ] → [ 마찰 없는 복귀 ] → [ 즉시 재개 ]
```

## 작동 방식

터미널을 열면 TODO 목록과 재개할 경로가 대시보드에 표시됩니다. `go` 하나로 마지막 작업 디렉토리로 즉시 이동합니다.

```
터미널 시작 → Dashboard → go → 작업 → clean → quit
```

## 구조

```
~/
├── .flow-os/          # OS 레이어 (이 저장소)
└── my/                # 데이터 레이어
    ├── .flow/
    │   └── core/      # 상태 레이어
    │       ├── resume.md
    │       ├── todo.md
    │       ├── memo.md
    │       └── next.md
    ├── craft/         # 의도 레이어
    ├── forge/
    ├── jobs/
    ├── projects/
    ├── temp/
    └── vault/
```

## 핵심 명령어

| 명령어 | 설명 |
|--------|------|
| `go` | resume.md에 기록된 경로로 이동 |
| `fmemo <텍스트>` | '잡'생각을 memo.md에 즉시 기록 |
| `q` | git push → resume 저장 → 검수 → 터미널 종료 |
| `qq` | git push → resume 저장 → 즉시 종료 (검수 생략) |
| `cleanmemo` | memo.md를 history로 아카이브 |
| `cleantodo` | 완료 항목을 history로 이동, 미완료 항목 유지 |

## 빠른 시작

```bash
git clone git@github.com:aimldl/flow-os.git ~/.flow-os
cd ~/.flow-os && chmod +x install.sh && ./install.sh
exec zsh
```

전체 설치 가이드는 [INSTALL.md](INSTALL.md)를 참고하세요.

## 문서

| 문서 | 설명 |
|------|------|
| [docs/workflow.md](docs/workflow.md) | 일상 작업 흐름 가이드 |
| [docs/commands.md](docs/commands.md) | 전체 명령어 레퍼런스 |
| [docs/philosophy.md](docs/philosophy.md) | 설계 철학 및 뇌 과학 |
| [docs/git-sync.md](docs/git-sync.md) | Git 자동화 설정 |
| [docs/memo-design.md](docs/memo-design.md) | 메모 시스템 설계 |
