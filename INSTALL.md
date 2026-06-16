# 🚀 설치 및 시작 (Installation)
Flow OS는 운영 체제(OS)와 작업 대상(Data)을 명확히 분리하는 철학을 가집니다. 

따라서 이 저장소는 작업 디렉토리(`~/my/github`) 내부가 아닌, **OS 레이어(`~`)에 직접 배치**하는 것을 권장합니다.

## 1. 저장소 클론 (Clone)
기존 작업 영역 밖인 최상위 OS Layer에 소스코드를 클론합니다.
[https://github.com/aimldl/flow-os](https://github.com/aimldl/flow-os)

```bash
git clone https://github.com/aimldl/flow-os ~/.flow-os

혹은

git clone git@github.com:aimldl/flow-os.git ~/.flow-os
```

중요: .를 반드시 포함하세요. 

## 2. 시스템 셋업 (Setup)
클론한 디렉토리로 이동하여 설치 스크립트를 실행합니다.

```bash
cd ~/.flow-os
bash install.sh 
# 또는 본인이 설정한 bootstrap 스크립트 실행
```

## 3. 디렉토리 구조 확인
설치가 완료되면 다음과 같은 구조가 만들어져야 합니다.

```text
~/
├── .flow-os/    ← [현재 저장소] OS 소스 코드 및 설정 스크립트
└── my/          ← [작업 영역] 실제 프로젝트 코드가 위치할 곳
```
