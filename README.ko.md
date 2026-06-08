
# 🚀 Flow OS

> 개인의 뇌 동작 방식을 기반으로 설계된 CLI 기반 Personal Development Operating System

---

## 🎯 목적

Flow OS의 목표는 단 하나입니다:

> **기억하지 않고, 망설이지 않고, 바로 실행하는 상태를 만드는 것**

---

## 🧠 왜 필요한가 (Brain Model)

문제는 의지가 아니라 **뇌의 구조**입니다.

### 핵심 신경망

- **DMN (Default Mode Network)**
  - 멍때림 / 잡생각 / 공상

- **CEN (Central Executive Network)**
  - 집중 / 문제 해결

---

### 일반적인 뇌
CEN ON → DMN OFF

---

### ADHD 특성


CEN ON 상태에서도 DMN이 계속 튀어나옴

👉 결과:
- 계속 옆으로 샘
- 집중 유지 어려움
- 작업 복귀 실패

---

## 💡 핵심 해결 전략

Flow OS는 억제하지 않는다.

👉 대신:


생각 → memo로 즉시 외부 배출 → 작업 복귀

---

## 🧠 Core Concept

Flow OS는:

👉 **명령 기반 시스템이 아니라 상태 기반 시스템이다**

---

## ⚙️ 시스템 구조


~
├── flow-entry       # 작업 진입 (Focus Layer)
├── flow-state       # 실행 상태 (State Layer)
├── my               # 실제 작업 공간 (Workspace)
├── .flow-os         # 시스템 코어
│   ├── bin          # CLI
│   ├── core         # 상태 / 템플릿
│   ├── design       # 설계 문서
│   ├── docs         # 사용 문서
│   └── shell        # shell 설정
│
├── .zshrc
├── .zshalias
└── .zshconfig

---

## 📂 레이어 구조

### 🧠 1. Workspace Layer (`~/my`)
- 실제 코드
- 모든 작업의 원본

---

### 🎯 2. Flow Entry (`~/flow-entry`)


flow-entry/
├── 1-xxx
├── 2-yyy
├── 3-zzz
├── temporary/
│   └── memo.md

#### 특징

- 항상 3개 유지
- 숫자 = 순서 (priority X, flow O)
- 막히면 다음으로 이동
- **시작을 멈추지 않기 위함**

---

### ⚡ 3. Temporary (매우 중요)


temporary/memo.md

👉 역할:

- 생각 dump
- working memory 해방
- ADHD 대응 핵심 구조

---

### 🔁 4. Flow State (`~/flow-state`)

- 실행 상태
- entry의 snapshot
- (현재 일부 reserved 상태)

---

## 🧠 Flow Lifecycle


flow-entry → flow-state → archive

---

## 🚀 Core Commands

### 📝 memo


memo 메시지
m 메시지

👉 생각 즉시 배출

---

### 🧠 organize


o
flow organize

👉 memo 정리

- 필요한 것 이동
- 불필요한 것 삭제
- **자동 삭제 없음**

출력:


⚠️ Remember to clean up memo manually

---

### 📍 next

다음 시작 위치 저장

---

### 📴 quit

세션 종료 시스템

---

## 🔁 Session Finalization Protocol

Flow OS 종료는 단순 command가 아니라:

👉 **State-driven protocol**

---

### 핵심 단계


checkpoint → review → publish → shutdown

---

### 명령어


q  → checkpoint + review + publish
qq → checkpoint + publish

---

### 핵심 특징

- review & publish **병렬 실행**
- 상태 기반 종료 (조건 충족 시 종료)
- 네트워크 실패 대응 가능

---

## 🔧 Git Workflow


flow push
flow pull

---

### 특징

- git add / commit / push 자동화
- CLI 통합
- 반복 작업 제거

---

## 🚀 Startup Experience

터미널 실행 시:

### ✅ Git Sync


✅ Sync skipped (sync'ed 78 min ago)

---

### ✅ Dashboard


📌 Flow OS
📝 TODO
...
🚀 Resume
...
my
├── github
├── projects
...

---

👉 효과:

- 작업 context 복원
- 기억 없이 바로 시작

---

## 🎯 UX Philosophy

- ✅ 기억하지 않는다
- ✅ 생각은 즉시 기록한다
- ✅ 흐름을 멈추지 않는다
- ✅ 선택을 줄인다
- ✅ 시스템이 뇌를 보완한다

---

## 💡 핵심 통찰

Flow OS는:

👉 **외부화된 인지 시스템 (Externalized Cognition System)**

---

## ✅ 한 줄 정의

Flow OS =

👉 **뇌의 약점을 보완하는 CLI 운영체제**

