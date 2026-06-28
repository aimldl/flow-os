# Git Sync

Flow OS는 터미널의 시작과 종료 시점에 git 동기화를 자동으로 수행합니다.

## 동기화 흐름

```
터미널 시작 (pull) → 작업 → 터미널 종료 (push)
```

| 시점 | 동작 | 조건 |
|------|------|------|
| 터미널 시작 | `git pull` (최신 상태 받아오기) | 네트워크 연결 + 마지막 sync 이후 180분 경과 |
| 터미널 종료 (`q`, `qq`) | `git push` (변경 사항 올리기) | 네트워크 연결 |

- 시작 시 pull → 종료 시 push 순서로 sync가 완성됩니다.
- 오프라인 상태에서는 sync를 건너뛰고 정상 종료합니다.

## 수동 실행

터미널 사용 중 언제든 직접 실행할 수 있습니다.

| 명령어 | 동작 |
|--------|------|
| `gpull` | 모든 설정된 repo를 pull |
| `gpush` | 모든 설정된 repo를 auto-commit & push |
| `gstatus` | 모든 설정된 repo의 dirty/clean 상태 표시 |

수동 실행에는 간격 제한이 적용되지 않습니다.

## 대상 저장소

`~/.flow-os/bin/git-target-repos`에서 관리합니다.

```bash
PRIVATE_REPOS=( ".flow|git@github.com:user/flow.git" )
PUBLIC_REPOS=( "craft/my-repo|git@github.com:user/my-repo.git" )
```

- 형식: `로컬경로|SSH_URL` (파이프 구분)
- 경로는 `~/my/` 기준 상대 경로
- SSH 인증 사용 (별도 인증 불필요)

## 스마트 Sync

터미널 시작 시 실행되는 pull에는 스마트 sync가 적용됩니다.

- **네트워크 확인**: `github.com`에 ping으로 접속 가능 여부 확인
- **간격 제한**: 마지막 sync 이후 180분이 경과해야 재실행 (환경변수 `SYNC_INTERVAL_MINUTES`로 변경 가능)
- **타임스탬프**: `~/my/.flow/.last_gsync` 파일에 마지막 sync 시각 기록

## 관련 파일

| 파일 | 역할 |
|------|------|
| `bin/lib-git` | 네트워크 확인, 간격 제어, 설정 로드 함수 |
| `bin/git-target-repos` | 동기화 대상 저장소 목록 |
| `bin/git-push` | auto-commit & push 실행 |
| `bin/git-pull` | pull 실행 |
| `shell/zsh/rc` | 터미널 시작 시 스마트 sync 호출 |
| `bin/flow-quit` | 종료 시 네트워크 체크 후 push |
