## install

    $ sudo pacman -S intellij-idea-community-edition

## shortcut

    ctrl-alt-l: 整理代码格式
    ctrl-h: 继承树
    ctrl-F12: 查看继承的成员
    ctrl-n 或 shift-shift: search everywhere
    alt+enter: 导入类, 导入局部变量, ...

## snippet

use tab to expand snippet

    sout: System.out.println();
    foo.toString().sout: System.out.println(foo.toString());
    list.for: for (item: list) { ... }

## settings

    Malformed content of <script> tag: 默认为 error, 可以调整为 warning
    live template: 代码小模板 sout = System.out.println()

## project

### 建立子项目

* 先建立一个普通 maven 项目作为父项目
* 在 `pom.xml` 中导入 maven 依赖
* 删除 src 目录, 因为用不到它
* 右键单击项目名 -> new module, 仍选择普通 maven 项目,
  注意把项目保存在父项目的子目录中

### 将普通项目转为 web 项目 (仅专业版)

右键单击项目名 -> add framework support... -> web application

1. 没有看到 web application? -> 去插件页面, 启用打开 Java EE 插件
1. 没有 Java EE 插件? 菜单 Help -> edit custom properties, 增加一行:

```properties
javaee.legacy.project.wizard=true
```

然后重启 idea
