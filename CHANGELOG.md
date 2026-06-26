# Changelog

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
