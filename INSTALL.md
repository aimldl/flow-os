# 🚀 설치 및 시작 (Installation)
Flow OS는 운영 체제(OS)와 작업 대상(Data)을 명확히 분리하는 철학을 가집니다. 

따라서 이 저장소는 작업 디렉토리(`~/my/github`) 내부가 아닌, **OS 레이어(`~`)에 직접 배치**하는 것을 권장합니다.

## 1. 저장소 클론 (Clone)
기존 작업 영역 밖인 최상위 OS Layer에 소스코드를 클론합니다.
[https://github.com/aimldl/flow-os](https://github.com/aimldl/flow-os)

**중요: 반드시 .포함하세요**
- `~/.flow-os` (O)
- `~/flow-os` (X)

```bash
git clone git@github.com:aimldl/flow-os.git ~/.flow-os
```
혹은
```bash
git clone https://github.com/aimldl/flow-os ~/.flow-os
```

만약 `~/flow-os`로 클론했다면, 디렉토리 이름을 변경하면 됩니다.
```bash
mv ~/flow-os ~/.flow-os
```
혹은

```bash
cd
mv flow-os .flow-os
```

## 2. 시스템 셋업 (Setup)
클론한 디렉토리로 이동하여 

```bash
cd ~/.flow-os
```

설치 스크립트를 실행합니다.
**주의: 코드를 사용할 때는 주의가 필요합니다**

Option A: Bash Shell 환경
- Ubuntu, 구형 macOS 등

```bash
bash install.sh 
```

Option B: Zsh(Z shell) 환경
- 최신 MacBook 등

- install.zsh 생성

```zsh
chmod +x install.sh
zsh install.sh
```

```
참고: Apple은 2019년 출시된 macOS Catalina(10.15) 버전부터 터미널의 기본 쉘을 Bash에서 Zsh로 완전히 변경했습니다.
```

## 3. 디렉토리 구조 확인
설치가 완료되면 다음과 같은 구조가 만들어져야 합니다.

```text
~/
├── .flow-os/    ← [현재 저장소] OS 소스 코드 및 설정 스크립트
└── my/          ← [작업 영역] 실제 프로젝트 코드가 위치할 곳
```
