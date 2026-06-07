

터미널 추천 세팅
폰트: D2Coding
사이즈: 18
줄간격: 1.25
문자간격: 1.0

배경: #F8F6F0
텍스트: #2A2A2A
볼드: #2A2A2A
선택: #D6EDEA
커서: #444444

✅ 이렇게 바꾸면
👀 눈 피로 확실히 줄어듦
🧠 글 읽을 때 집중력 증가
😌 전체 화면이 “부드럽게 느껴짐”
⌨️ 터미널 작업 오래해도 덜 지침

## 

✅ 1️⃣ macOS 메뉴바 + 전체 느낌 맞추기

✅ ✅ Step 1: Night Shift (핵심)
👉 눈 피로 줄이는 가장 중요한 설정 방법

System Settings
→ Displays (디스플레이)
→ Night Shift 탭
Color Temperature:
👉 중간보다 약간 따뜻하게
👉 효과: 화면이 살짝 아이보리 느낌으로 변함
파란빛 줄어서 눈 피로 감소 [support.apple.com]

✅ ✅ 🔥 핵심 팁
👉 Night Shift 너무 세게 하면 화면 노랗고 답답함 ❌
👉 👉 “살짝 따뜻” 정도가 정답

✅ ✅ Step 2: 메뉴바 더 부드럽게
System Settings
→ Accessibility
→ Display

✔ 옵션: Reduce transparency ✅
👉 메뉴바 + UI 가 더 또렷하고 덜 반짝임 [macobserver.com]

✅ ✅ 결과
👉 macOS 전체가 VS Code 느낌과 유사한 따뜻한 톤. 눈 피로 최소 상태

## VS Code

```
{
    "window.openFoldersInNewWindow": "off",
    "workbench.colorTheme": "Light 2026",
    "claudeCode.preferredLocation": "panel",

    // ✅ 전체 UI 색 (아이보리 + 바다톤 통일)
    "workbench.colorCustomizations": {
        "editor.background": "#F8F6F0",
        "editor.foreground": "#2A2A2A",
        "editor.selectionBackground": "#D6EDEA",
        "editor.lineHighlightBackground": "#EFEAE2",

        "sideBar.background": "#F8F6F0",
        "sideBar.foreground": "#2A2A2A",

        "activityBar.background": "#F8F6F0",
        "activityBar.foreground": "#2A2A2A",

        "statusBar.background": "#6FA3A3",
        "statusBar.foreground": "#FFFFFF",

        "titleBar.activeBackground": "#F8F6F0",
        "titleBar.activeForeground": "#2A2A2A",

        "tab.activeBackground": "#F8F6F0",
        "tab.activeForeground": "#2A2A2A",
        "tab.inactiveBackground": "#EFEAE2",

        "panel.background": "#F8F6F0",
        "panel.border": "#E0DBD2",

        "dropdown.background": "#F8F6F0",
        "dropdown.foreground": "#2A2A2A",

        "input.background": "#FFFFFF",
        "input.foreground": "#2A2A2A"
    },

    // ✅ 폰트 & 가독성
    "editor.fontFamily": "D2Coding",
    "editor.fontSize": 18,
    "editor.lineHeight": 26,

    // ✅ 눈 피로 최소화 옵션
    "editor.renderLineHighlight": "all",
    "editor.cursorBlinking": "smooth",
    "editor.minimap.enabled": false,

    // ✅ 코드 색상 (저자극 컬러)
    "editor.tokenColorCustomizations": {
        "textMateRules": [
            {
                "scope": "comment",
                "settings": {
                    "foreground": "#8A8A8A"
                }
            },
            {
                "scope": "string",
                "settings": {
                    "foreground": "#7A9E9F"
                }
            },
            {
                "scope": "keyword",
                "settings": {
                    "foreground": "#6F8FA3"
                }
            },
            {
                "scope": "variable",
                "settings": {
                    "foreground": "#2A2A2A"
                }
            },
            {
                "scope": "function",
                "settings": {
                    "foreground": "#5C7A7A"
                }
            },
            {
                "scope": "number",
                "settings": {
                    "foreground": "#9A7A5C"
                }
            }
        ]
    }
}
```

## 
