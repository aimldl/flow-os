# 🚀 Flow OS 설치 가이드
- Flow OS와 작업 대상(Data)을 명확히 분리하는 독립성 철학을 가집니다.
- 따라서 본 저장소를 작업 디렉토리(~/my) 내부가 아닌, 홈 디렉토리(~)에 직접 배치하는 것을 권장합니다.

------------------------------
## 1. 저장소 클론 (Clone)

* 원격 저장소 주소: https://github.com/aimldl/flow-os

홈 디렉토리(~)에서 소스코드를 클론합니다.

🚨 중요: 디렉토리 이름 앞에 점(.)을 포함해서 숨김 폴더 형태로 생성합니다.

* ~/.flow-os (O)
* ~/flow-os (X)

### SSH 방식 (권장)
```bash
git clone git@github.com:aimldl/flow-os.git ~/.flow-os
```
### HTTPS 방식
```bash
git clone https://github.com ~/.flow-os
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

## 2. 시스템 셋업 (Setup)
클론이 완료되면 해당 디렉토리로 이동하여 설치 스크립트를 실행합니다.

### 1. 설치 디렉토리로 이동
```bash
cd ~/.flow-os
```
### 2. 스크립트 실행 권한 부여 및 설치 진행
```bash
chmod +x install.sh
./install.sh
```

💡 환경 호환성 안내
설치 스크립트는 Linux의 Bash 환경과 macOS의 Zsh 환경을 모두 자동으로 감지하고 지원하도록 설계되었습니다.

* 참고: Apple은 macOS Catalina(10.15) 버전부터 터미널의 기본 쉘을 Bash에서 Zsh로 변경했습니다. 본 스크립트는 두 환경 모두에서 동작합니다.

## 3. 디렉토리 구조 확인
설치가 정상적으로 완료되면 홈 디렉토리(~) 하위에 다음과 같은 구조가 자동으로 구성됩니다.

```bash
~/
├── .flow-os/   # [OS 레이어] Flow OS 소스 코드, 설정 파일 및 실행 스크립트
└── my/         # [데이터 레이어] 실제 프로젝트 코드 및 작업물이 위치하는 영역
```
