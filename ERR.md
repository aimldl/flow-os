

2026-10-28 (Wed)

Chrome OS의 gLinux Stable의 Terminal에서 실행 시 아래의 문제가 발생함

```bash
~ $ c .flow-os/
.flow-os $ l
CHANGELOG.md  GEMINI.md   README.en.md  README.md  bin/   install.sh*
CLAUDE.md     INSTALL.md  README.ja.md  TODO.md    docs/  shell/
.flow-os $ typora README.md
xdg-open: unexpected option '-a'
Try 'xdg-open --help' for more information.
.flow-os $ type -a typora
typora은(는) `open -a typora'의 별칭임
typora은(는) /usr/bin/typora 임
typora은(는) /bin/typora 임
.flow-os $
```
