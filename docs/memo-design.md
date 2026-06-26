
# 메모 설계

Flow OS의 `memo`는 단순 메모 기능으로 시작했지만 ,
생각을 빠르게 외부화하고 작업 흐름으로 복귀하기 위한 핵심 인터페이스입니다.

## 목적

- '잡'생각을 억제하지 않고 빠르게 외부로 배출
- 작업 흐름(CEN 상태)으로 즉시 복귀
- 상태 기반 시스템에서 인지 부담 최소화

## 설계 원칙

1. 속도가 최우선이다
   - 입력은 가능한 한 단순해야 한다
   - 구조화는 나중의 문제다

2. 기록은 자연스러워야 한다
   - 멀티라인 입력 지원
   - 생각 흐름을 끊지 않는다

3. 기본은 최소, 확장은 선택
   - 기본은 완전히 clean
   - 필요 시 context 추가

## 입력 방식

### 기본 사용

```bash
fmemo <text>
```

### 멀티라인 입력

```bash
fmemo
```

```
📝 enter memo (Ctrl+D to save, Ctrl+C to cancel)
line 1
line 2
line 3
```

- Ctrl+D → 저장
- Ctrl+C → 취소

## 저장 위치 및 구조

```bash
~/my/.flow/core/memo.md
```

### 기본 포맷

```
2026-01-01 (Mon)
12:10  작업 내용
12:12  또 다른 생각
```

## Memo View (출력 모드)

메모는 필요에 따라 context 정보를 함께 출력할 수 있습니다.

```bash
FLOW_MEMO_VIEW=off | layer | full_path
```

### off (기본)

```
12:10  작업 내용
```

- 가장 단순한 형태

### layer

현재 위치의 Flow OS 구조를 함께 출력합니다.

```
12:10  .flow-os     | 설정 수정
12:10  my           | 작업 시작
12:10  .flow        | 상태 정리
12:10  my/projects  | API 수정
12:10  my/forge     | 아이디어 정리
```

#### 규칙

- OS 레이어 → `.flow-os`
- 데이터 레이어 → `my`
- 상태 레이어 → `.flow`
- 의도 레이어 → `my/<purpose>`

### full_path

전체 경로를 포함하여 출력합니다.

```
12:10  ~/my/projects/flow-os/backend | 버그 수정
```

- 디버깅 및 추적에 유용

## 출력 포맷

모든 context 출력은 다음 구조를 따릅니다:

```
HH:MM  <context> | <message>
```

예:

```
12:10  my/projects  | API 수정
```

### 정렬

- context는 고정 폭으로 정렬
- 가독성을 위해 일정한 컬럼 구조 유지

```
12:10  my/projects  | API 수정
12:10  my/forge     | 아이디어 정리
```

## 설계 의도

### 상태와 행동의 분리

```
context | message
상태    | 행동
```

Flow OS의 상태 기반 구조를 그대로 반영합니다.

### 구조 인식 강화

```
my/projects
```

- `my` → 데이터 레이어
- `projects` → 의도 레이어

구조를 자연스럽게 학습하도록 유도합니다.

### 확장 가능한 구조

```
off → layer → full_path
```

- 기본은 단순
- 필요 시 정보 확장

## 설계 변화

이전:
- 단일 입력 (read)
- context 없음
- 단순 문자열 저장

현재:
- 멀티라인 입력 (cat)
- 선택적 context
- 구조 기반 출력

## 핵심 요약

memo는 정리하는 도구가 아니라,
생각을 빠르게 외부로 흘려보내는 도구입니다.

> memo = capture, not organize
