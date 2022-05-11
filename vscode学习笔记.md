>🤵: Jin OuYang
:email:: ouyangjin334@gmail.com
:timer_clock:: 2022-05-11 16:54:11
:book:: vscode学习笔记

# vscode学习笔记

> *问题：* 解决配置markdown中settings.json仅可读问题
解决方案:因为采用Ctrl+Shift+P修改配置，所以打开默认方式仅可读。通过点击Ctrl+,快捷键可打开设置界面，键入关键词，找到在settings.json中编辑即可。
插入这段代码
"[markdown]": {
        "editor.unicodeHighlight.ambiguousCharacters": false,
        "editor.unicodeHighlight.invisibleCharacters": false,
        "editor.wordWrap": "on",
        **"editor.quickSuggestions": true,** //主要修改这里
    },

> *问题描述：* xxxxxxx
解决方案:
ssssss
ssssss

> *问题描述：* xxxxxxx
解决方案:
ssssss
ssssss