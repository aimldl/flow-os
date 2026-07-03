# 🚀 Flow OS 설치 가이드
- Flow OS와 작업 대상(Data)을 명확히 분리하는 독립성 철학을 가집니다.
- 따라서 본 저장소를 홈 디렉토리 `~`에 hidden으로 직접 배치합니다.

설치가 완료되면 홈 디렉토리 `~` 아래에 다음과 같은 구조가 자동으로 생성됩니다.

```bash
~/
├── (OS의 기본 디렉토리)
├── .flow-os/      # OS 레이어
└── my/            # 데이터 레이어
    ├── .flow/     # 상태 레이어
    └── (purpose)  # 의도 레이어  (craft, forge, jobs, ...)
```

사용자 입장에서 사실상 하나의 작업 공간만 보입니다. 

```bash
~/
├── (OS의 기본 디렉토리)
└── my
```

예를 들어 macOS에서 다음과 같이 `my`가 하나의 작업 공간으로 자연스럽게 인식됩니다.

```bash
~/
├── Applications
├── Desktop
├── Documents
├── Downloads
├── Library
├── Movies
├── Music
├── my
├── Pictures
└── Public
```

보다 자세한 내용은 [설계 철학](docs/philosophy.md)를 참고하세요.

------------------------------
## 1. 저장소 클론 (Clone)

* 원격 저장소 주소: https://github.com/aimldl/flow-os

홈 디렉토리(~)에서 소스코드를 클론합니다.

🚨 중요: 디렉토리 이름 앞에 점(.)을 포함해서 숨김 폴더 형태로 생성합니다.

* ~/.flow-os (O)
* ~/flow-os (X)

### **SSH 방식 (권장)**

```bash
git clone git@github.com:aimldl/flow-os.git ~/.flow-os
```
💡 만약 이미 `~/flow-os`로 잘못 클론했다면?
아래 명령어를 통해 디렉토리 이름을 간단히 변경할 수 있습니다.

```bash
mv ~/flow-os ~/.flow-os
```
또는 홈 디렉토리 이동 후 변경
```bash
cd ~ && mv flow-os .flow-os
```

> 💡 Flow OS 관점
>
> SSH 설정은 단순한 인증 방식 변경이 아니라, “작업 흐름을 끊지 않기 위한 환경 설계”입니다

자세한 내용은 [부록. GitHub SSH 설정 가이드]() 을 참고하세요.

## 2. 시스템 셋업

클론이 완료되면 해당 디렉토리로 이동하여 설치 스크립트를 실행합니다.

**1. 설치 디렉토리로 이동**
```bash
cd ~/.flow-os
```
**2. 스크립트 실행 권한 부여 및 설치 진행**
```bash
chmod +x install.sh
./install.sh
```

설치 완료 후 터미널을 재시작하거나 `exec zsh`를 실행합니다.

> 💡 환경 호환성 안내
> 설치 스크립트는 Linux의 Bash 환경과 macOS의 Zsh 환경을 자동 감지하고 지원하도록 설계되었습니다.
>
> 참고: macOS Catalina(10.15) 버전부터 터미널의 기본 쉘이 Bash에서 Zsh로 변경됐습니다.

## 3. 디렉토리 구조 확인
설치가 완료되면 홈 디렉토리 `~` 아래에 다음과 같은 구조가 자동으로 생성됩니다.

```bash
~/
├── .flow-os/              # OS 레이어 (이 저장소)
└── my/                    # 데이터 레이어
    ├── .flow/             # 상태 레이어
    │   └── core/          # 핵심 상태 파일
    │       ├── memo.md
    │       ├── next.md
    │       ├── resume.md
    │       └── todo.md
    ├── craft/             # 의도 레이어
    ├── forge/
    ├── jobs/
    ├── projects/
    ├── temp/
    └── vault/
```

## 4. (레이어 기준) 설치 과정

설치 스크립트는 **Flow OS의 추상화 계층 구조를** 

```
~/
├── (OS의 기본 디렉토리)
├── .flow-os/      # OS 레이어
└── my/            # 데이터 레이어
    ├── .flow/     # 상태 레이어
    │   └── core/  # 상태 파일
    └── (purpose)  # 의도 레이어 (craft, forge, jobs, ...)
```

아래 순서로 구성합니다.

| 단계 | 레이어 | 작업        | 설정 내용 요약                                               |
| ---- | ------ | ----------- | ------------------------------------------------------------ |
| 0    |        | 선택 도구   | Python3, Docker, Jupyter Lab, VS Code가 없으면 설치할지 확인 후 설치 |
| 1    | OS     | 연결/활성화 | `~/.zshconfig`, `~/.zshalias` 생성 후 `~/.zshrc`에 로더 추가 |
| 2    | 데이터 | 생성        | `~/my` 작업 공간 생성                                        |
| 3    | 상태   | 생성        | `~/my/.flow`  생성                                           |
| 4    | 의도   | 생성        | `craft`, `forge`, `jobs`, `projects`, `temp`, `vault` 생성   |
| 5    | 상태   | 초기화      | `~/my/.flow/core`에 핵심 상태 파일 (`memo.md`, `next.md`, `resume.md`, `todo.md`) 생성 |
| 6    |        | 실행 환경   | `bin/` 스크립트에 실행 권한 부여                             |

**🧠 왜 이런 순서를 따르는가?**

Flow OS는 **상태를 기반으로 행동하는 시스템** 이므로 설치 과정도 이와 같은 흐름을 따릅니다.

> 환경 연결 → 작업 공간 생성 → 상태 구조 정의 → 상태 초기화



## 📎 부록. Lite Mode: SSH 없이 사용하기

SSH 설정 없이도 Flow OS는 정상적으로 사용할 수 있지만 일부 Git 기반 자동화 기능은 제한됩니다.

> - **Lite Mode (HTTPS)** → 빠른 시작, 최소 설정
>
> - **SSH Mode** → 지속적 작업, 흐름 유지
>
>   👉 그래서 Flow OS에서는 SSH 방식을 권장합니다.

### 왜 SSH 방식을 권장하는가?

Flow OS는 GitHub와의 작업을 **흐름(flow)을 유지하는 방식**으로 설계되어 있습니다.

SSH가 아닌 HTTPS 방식으로도 저장소를 클론할 수 있습니다.

```bash
git clone https://github.com/aimldl/flow-os.git ~/.flow-os
```

> **⚠️ 제한 사항**
>
> HTTPS 방식으로 설치와 기본적인 사용에는 문제가 없지만, 다음과 같은 불편이 발생합니다.
>
> - `git push`, `git pull` 시 인증 요구 (ID / 토큰 입력)
> - 자동화된 워크플로우에서 흐름이 끊김

> **💡 Flow OS 관점**
>
> Lite Mode는 “빠른 시작”을 위한 선택이며,
>  SSH Mode는 “지속 가능한 흐름”을 위한 환경입니다.

### 언제 Lite Mode를 사용하는가?

- SSH 설정이 번거로운 경우
- 로컬 환경에서만 작업하는 경우
- GitHub 연동이 필수적이지 않은 경우

### 언제 SSH로 전환해야 하는가?

- Git 작업 빈도가 증가할 때
- 자동화 스크립트를 활용할 때
- 작업 흐름(flow)을 유지하고 싶을 때

## 📎 부록. GitHub SSH 설정 가이드

GitHub와 상호작용의 **흐름이 끊기 않도록 자동화**하기 위해 HTTPS 대신 **SSH 방식 사용을 권장**합니다.

**왜 SSH를 사용하는가?**

HTTPS 방식은 `git push`, `git pull` 할 때 ID/토큰 입력이 필요하므로 작업 흐름(flow)이 끊깁니다.

👉 SSH는 한 번 설정 후 인증 없이 계속 사용 가능합니다.

**SSH 설정: 세 단계**

1. SSH 키 생성
2. GitHub에 키 등록
3. 연결 테스트

------

### 1. SSH 키 생성

터미널에서 아래 명령어를 실행합니다:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com'
```

- 이메일은 GitHub 계정 이메일을 사용
- 파일 경로는 기본값(Enter) 그대로 사용
- 패스프레이즈는 선택 (비워도 됨)

### 2. SSH Agent 실행 및 키 등록

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### 3. GitHub에 SSH 키 등록

**3-1. 공개키 복사**

```bash
cat ~/.ssh/id_ed25519.pub
```

출력된 내용을 전체 복사합니다.

**3-2. GitHub에 등록**

1. GitHub 접속
2. Settings → **SSH and GPG keys**
3. **New SSH key** 클릭
4. 복사한 키 붙여넣기

### 4. 연결 테스트

```bash
ssh -T git@github.com
```

정상이라면 다음과 같은 메시지가 출력됩니다:

```
Hi <username>! You've successfully authenticated...
```

------

### 5. SSH 방식으로 클론

아래 방식으로 클론할 수 있는지 확인합니다.

```bash
git clone git@github.com:aimldl/flow-os.git ~/.flow-os
```

