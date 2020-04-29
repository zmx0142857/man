# 兰州大学本科生学位论文模板 v0.1.1

最近更新: 2020-04-29

## 安装

下载 [lzuthesis.zip](https://github.com/zmx0142857/man/releases/tag/v0.1.1) 并解压.

## 编译指南

用 `xelatex` 编译两次:

```
xelatex lzuthesis.tex
xelatex lzuthesis.tex
```

更多使用方法详见 `lzuthesis-original.pdf`. 与源码对照查看便可明了.

## 示例文件不能通过编译?

如果你使用的是 CTEX 套装 + MikTeX 发行版, 很可能是因为该套装的 MikTeX 太旧了. 陈旧的 ctexart 类无法在此模板上通过编译 (观察 .log 文件, 你的 ctexart 的日期在 2016 年以后吗?). 对此, 解决方案有二:

1. 弃用陈旧的 CTEX 套装, 改用 [texlive](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/);
1. 仍然使用 CTEX, 只[更新其中的组件](https://zhuanlan.zhihu.com/p/47420690).
