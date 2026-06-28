# Changelog

## 2026-06-28
- `.flow` 구조 평탄화: `core/` 서브디렉토리 제거, 파일을 `.flow/` 루트로 이동
- `history/YYYY-MM-DD-*/` 폐지 → 월별 아카이브 파일 (`v-memo-YYYY-MM.md`, `v-todo-YYYY-MM.md`) 도입
- `last_gsync` → `.last_gsync` 이름 변경
- `flow-clean-memo` / `flow-clean-todo` 재작성: 월별 파일에 prepend, idempotent
- `flow-clean-todo`: `[->]` 항목을 `next.md`로 이동하는 기능 추가
- `flow-clean-next` 신규 추가: `next.md` → `v-next-YYYY-MM.md` 아카이브
- 날짜 형식 통일: `YYYY-MM-DD (요일)` → `   YYYY-MM-DD-요일` (3 spaces, 요일 suffix)
- alias 추가: `next`, `enext`, `editnext`, `cleannext`, `fcleannext`, `clean-next`
- `lib-date`: `flow_history_dir` → `flow_today_full` 으로 재명명
- `lib-path`: `FLOW_CORE` 경로 업데이트, `FLOW_HISTORY` 제거

## 2026-06-25
- Claude Code 도입

## 2026-06-19
- `bin/flow` 명령어 완전 삭제 — 독립 bin 스크립트 방식으로 전환

## 2026-06-18
- 워크스페이스 디렉토리명 변경  
  `secure-tasks` → `vault`, `tasks` → `jobs`
- 핵심 상태 파일 경로 변경  
  `flow-entry/temporary/` → `~/my/.flow/core/`
- `flow` wrapper 명령어 폐지 — alias 기반 직접 호출로 전환
- 디렉토리 구조 단순화 (6개 → 2개)  
  `~/my`, `~/.flow-os`

## 2026-06-17
- `flow` 명령어를 wrapper에서 분리된 독립 bin 스크립트로 구조 변경  
  (`clean-memo`, `clean-todo` 등 별도 스크립트로 추출)
