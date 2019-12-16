% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{lzuthesis}[2019/12/16 v0.0.1 Lanzhou University Thesis Template for Bachelor Degree]

% [类与选项]

\LoadClass[a4paper,UTF8]{ctexart}[2015/12/20] % 这里的版本检查只产生警告
% 强制版本检查
\makeatletter
\@ifpackagelater{ctex}{2015/12/20}{}{
	\PackageError{lzuthesis}{require a package 'ctex' newer than 2015/12/20}
}
\makeatother

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions

% [基本信息]

\newtoks\zhtitle	% 中文标题
\newtoks\entitle	% 英文标题
\newtoks\shorttitle	% 短标题 (用于页眉)
\newtoks\zhauthor	% 作者中文名
\newtoks\enauthor	% 作者英文名
\newtoks\zhinstitute% 单位中文名
\newtoks\eninstitute% 单位英文名
\newtoks\teacher	% 导师
\newtoks\college	% 学院
\newtoks\major		% 专业
\newtoks\grade		% 年级

% [字体]

% 默认的中英文字体
% KaiTi, SimHei, SimSun
\setCJKmainfont[ItalicFont={楷体},BoldFont={黑体}]{宋体}
\setmainfont{Times New Roman}

% 加粗宋体, 使用方法:
% \songtibf 	% 先指定字体
% \textbf{宋体加粗内容}
\setCJKfamilyfont{zhsong}[AutoFakeBold = {2.17}]{SimSun}
\newcommand*{\songtibf}{\CJKfamily{zhsong}}

% 汉字与标点的间距: 行末半角式
\punctstyle{hangmobanjiao}

% [页面设置]

\RequirePackage[left=2.5cm,right=2cm,top=2.5cm,bottom=2cm]{geometry} % 页边距
\linespread{1.5}	% 全文行距

% [页眉页脚]

\RequirePackage{fancyhdr}

% 清空默认配置
\fancypagestyle{plain}
\fancyhf{}
\fancyhead{}
\fancyfoot{}

% 开始配置
\fancyhead[C]{\the\zhauthor：\the\shorttitle}	% 页眉居中书写作者名和论文缩写标题
\fancyfoot[C]{~\thepage~} 				% 页脚居中书写页码
%\fancyfoot[C]{--~\thepage~--} 			% 页脚居中书写--页码--
%\renewcommand{\headrulewidth}{0pt}		% 去掉页眉横线

% 应用配置
\pagestyle{fancy}

% [列表]

\RequirePackage{enumitem}

% 二级列表 (1)(2)(3)...
\newlist{subenum}{enumerate}{1}
\setlist[subenum]{label=$(\arabic*)$}

% [数学]

\RequirePackage{amsmath}	% ams 数学包
\RequirePackage{amssymb}	% 数学符号
\RequirePackage{mathrsfs}	% 花体字, 使用方法为\mathscr{ABC}
\RequirePackage{bm}			% 粗斜体, 用于向量和矩阵

% 定理与证明
% 需要 amsthm 包, 这个包含于 amsmath 包
\newtheorem{definition}{\heiti 定义}[section] % 按 section 编号
\newtheorem{axiom}{\heiti 公理}[section]
\newtheorem{lemma}{\heiti 引理}[section]
\newtheorem{theorem}{\heiti 定理}[section]
\newtheorem{proposition}{\heiti 命题}[section]
\newtheorem{corollary}{\heiti 推论}[section]
\newtheorem{property}{\heiti 性质}[section]
\newtheorem{example}{\heiti 例}[section]
\newtheorem{remark}{\heiti 注}[section]

\newenvironment{proof}{
	\heiti 证明\quad\songti
}{
	\hfill $\square$\par
} % \square 在 amssymb 中
\newenvironment{solution}{
	\heiti 解\quad\songti
}{
	\hfill $\square$\par
}

% 数学正体符号
\renewcommand\d{\mathrm{d}}
\newcommand\dd{\,\mathrm{d}}
\newcommand\e{\mathrm{e}}
\renewcommand\i{\mathrm{i}}

% [浮动体]

% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,
% 否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和
% |\bottomfraction| 分别设置顶端和底端的浮动环境
% 的最大比例.
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
\renewcommand*{\floatpagefraction}{0.85}

% [图片]

\RequirePackage{graphicx}	% graph 环境
\RequirePackage{subcaption}	% 图片小标题

\graphicspath{{imgs/}}		% 指定图片路径

% [表格]

\RequirePackage{tabularx}	% 定宽表格
\RequirePackage{array}		% 改变表格行高

% [颜色]

\RequirePackage{xcolor}

\definecolor{darkblack}{HTML}{2e3436}
\definecolor{lightblack}{HTML}{555753}
\definecolor{darkwhite}{HTML}{d3d7cf}
\definecolor{lightwhite}{HTML}{eeeeec}
\definecolor{darkgreen}{HTML}{4e9a06}
\definecolor{darkpurple}{HTML}{75507b}
\definecolor{darkcyan}{HTML}{06989a}

% [代码]

\RequirePackage{listings}
\lstset{ 
	language=c,						% 语言
	title=\lstname,					% 显示文件名或 caption
	captionpos=b,					% 标题位置: bottom/top/none
	backgroundcolor=\color{lightwhite},	% 背景色
	basicstyle=\ttfamily, 			% 基本样式
	escapeinside={\%*}{*)},			% 在代码中使用 LaTeX
	commentstyle=\color{darkcyan},	% 注释样式
	stringstyle=\color{darkpurple},	% 字符串样式
	% 左 padding, 有行号时勿用
	%xleftmargin=2em,
	%framexleftmargin=2em,
	% 断行
	breakatwhitespace=false,		% 是否在空白符处断行
	breaklines=true,				% 是否自动断行
	% 边框
	frame=single,					% 边框: single/none
	rulecolor=\color{darkwhite},	% 如未设置, 边框颜色可能受彩色文字影响
	% 关键字
	keywordstyle=\color{darkgreen},	% 关键字样式
	morekeywords={*,...},			% 添加关键字
	deletekeywords={...},			% 删除关键字
	% 行号
	numberstyle=\small\color{lightblack},% 行号样式
	numbers=none,					% 行号位置: left/right/none
	%numbersep=10pt,				% 行号与代码的距离
	%firstnumber=1000,				% 开始的行号
	%stepnumber=2,					% 每 n 行显示一个行号
	% 空白符
	tabsize=4,						% tab 大小
	keepspaces=true,				% 保留源代码的缩进 (可能需要 columns=flexible)
	showspaces=false,				% 是否把空格显示成下划线, 覆盖 showstringspaces 属性
	showstringspaces=true,			% 是否在字符串中把空格显示成下划线
	showtabs=false,					% 是否显示字符串中的 tab
}

% 令所有 verbatim 环境缩进 2em
\makeatletter
\let \saveverbatime \@xverbatim
\def \@xverbatim {\leftskip = 2em\relax\saveverbatime}
\makeatother

% [封面]

\newcommand\makecover{
	\thispagestyle{empty} % 没有页眉页脚
	\begin{figure*}
		\centering
		\includegraphics[width=0.33\textwidth]{lzu.pdf}
	\end{figure*}
	\vspace*{-1.1em} % 加星号的版本自带参考物, 否则前面需要 \hbox{}
	\begin{center}
	\heiti
	\zihao{0}毕\quad 业\quad 论\quad 文\par
	\zihao{4}(本科生)\par
	\vspace*{4.1em}
	\songti
	\begin{tabular}{rc}
		\textbf{中文标题} & \textbf{\the\zhtitle} \\
		\cline{2-2}\\
		\textbf{英文标题} & \textbf{\the\entitle} \\
		\cline{2-2}\\
	\end{tabular}
	\par
	\vspace*{1em}
	{
	\songti
	\renewcommand\arraystretch{0.75} % 临时改变表格行高
	\begin{tabular}{rc}
		学生姓名 & \the\zhauthor \\
		\cline{2-2}\\
		指导教师 & \the\teacher \\
		\cline{2-2}\\
		学\qquad 院 & \quad \the\college \quad \hbox{} \\
		\cline{2-2}\\
		专\qquad 业 & \the\major \\
		\cline{2-2}\\
		年\qquad 级 & \the\grade \\
		\cline{2-2}\\
	\end{tabular}
	}\par
	\vspace*{4em}
	\zihao{-4}兰州大学教务处
	\end{center}
	\newpage % 换页
}

% [诚信责任书]
\newcommand\makeliability{
	\begin{center}
	\begin{minipage}{0.9\linewidth}

	\linespread{2} % 在 minipage 内临时改变行距
	\vspace*{3em}
	\begin{center}\zihao{3}诚信责任书\end{center}
	\vspace{2.5em}

	\zihao{-3}
	\parindent = 2em % 缩进
	本人郑重声明：本人所呈交的毕业论文（设计），是在导师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等，均已明确注明出处。除文中已经注明引用的内容外，不包含任何其他个人或集体已经发表或在网上发表的论文。

	特此声明。

	\vspace{3em}
	\begin{flushright}
		论文作者签名：\underline{\hspace{6.4em}}
		\quad
		日\qquad 期：\underline{\hspace{6.4em}}
	\end{flushright}
	\end{minipage}
	\end{center}
	\newpage
	% 全局字号
	\zihao{-4}
}

% [摘要]

\newcommand\cnabstractname{摘要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywordsname{Key Words}
\newcommand\cnkeywords[1]{ {\noindent\heiti\zihao{-4}\cnkeywordsname: }#1}
\newcommand\enkeywords[1]{ {\noindent\bfseries\zihao{-4}\enkeywordsname: }#1}

\makeatletter % 与 \makeatother 配合使用, 使得 @ 暂时可用
\newenvironment{cnabstract}{
	\begin{center}
	\songtibf \zihao{3} \textbf{\the\zhtitle}\\
	\zihao{-4} \the\zhauthor, \the\zhinstitute
	\end{center}
	\section*{\ziju{2}{\cnabstractname}}
	\@afterheading
}{
	\par
	\vspace*{2em}
}

\newenvironment{enabstract}{
	\begin{center}
	\zihao{3}
	\textbf{\the\entitle}\\
	\zihao{-4} \the\enauthor, \the\eninstitute
	\end{center}
	\section*{\enabstractname}
	\@afterheading
}{
	\par
	\vspace*{2em}
}
\makeatother

% [附录]

\RequirePackage[toc, page, title, titletoc, header]{appendix}
\renewenvironment{appendix}{
	\begin{appendices}
		% 计数器清零(附录重新编号)
		\setcounter{table}{0}
		\setcounter{figure}{0}
		\setcounter{lstlisting}{0}
		\setcounter{equation}{0}
		% 宋体5号
		\songti \zihao{5}
}{
	\end{appendices}
	\newpage
}

% [参考文献]

\RequirePackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref} % 链接颜色与 pdf 书签
%\bibliographystyle{abbrv} % 参考文献样式: plain,unsrt,alpha,abbrv,chinesebst

% 参考文献上标
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% [致谢]

\newenvironment{acknowledgement}{
	\vspace*{0em}
	\section*{\ziju{2}致谢}
	\vspace{2em}
	\songti \zihao{-4} % 宋体小四
}{
	\newpage
}

% [评语]

\newcommand\makereviews{
	\begin{center}
	\songtibf
	\begin{minipage}{0.93\linewidth}
	\fbox{
		\parbox[c][0.45\vsize][t]{1\linewidth}{
			\begin{center}
				\zihao{-2}\textbf{评\qquad 语}
			\end{center}
			\vfill
			\zihao{-3}
			\hfill \textbf{建议成绩}\underline{\hspace{6em}}\quad
			\textbf{指导教师（签字）}\underline{\hspace{6em}}
		}
	}
	\vskip -1.4pt % 刚好使得两个 fbox 边缘重合的距离
	\fbox{
		\parbox[c][0.18\vsize][t]{1\linewidth}{
			\zihao{-3} 
			\begin{center}
				\textbf{答辩小组意见}
			\end{center}
			\vfill
			\hfill \textbf{答辩委员会负责人（签字）}
			\underline{\hspace{6em}}
		}
	}
	\vskip -1.4pt
	\fbox{
		\parbox[c][0.27\vsize][t]{1\linewidth}{
			\zihao{-3}
			\hbox{}
			\vfill
			\hfill \textbf{成\qquad 绩}
			\underline{\hspace{6em}}\quad
			\textbf{学院（盖章）}
			\underline{\hspace{6em}}
			\begin{flushright}
				\textbf{\zihao{-4}20\quad 年\quad 月\quad 日}
			\end{flushright}
		}
	}
	\end{minipage}
	\end{center}
	\newpage
}

% [section 标题设为黑体]

% 在实际测试中, 宋体加粗会影响 section 标题样式,
% 这里将它恢复为黑体
\ctexset{
	section/format += \heiti,
	subsection/format += \heiti,
	subsubsection/format += \heiti,
}

% [自定义 caption]

\renewcommand\contentsname{\heiti 目\qquad 录}
\renewcommand\listfigurename{\heiti 插图}
\renewcommand\listtablename{\heiti 表格}
\renewcommand\figurename{\heiti 图}
\renewcommand\tablename{\heiti 表}
\renewcommand\appendixname{\heiti 附录}		% 附录标题
\renewcommand\appendixtocname{\heiti 附录}	% 附录在目录中的名字
\renewcommand\appendixpagename{}			% 附录大标题
\renewcommand\lstlistingname{\heiti 代码}	% 需要 listings 包
%\renewcommand\abstractname{\heiti 摘\qquad 要}
%\renewcommand\indexname{\heiti 索引}
%\renewcommand\proofname{\heiti 证明}
%\renewcommand\refname{\heiti 参考文献}

\endlinechar `\^^M % 声明换行符

\endinput

% [修改日志]

% 版本号: 每修一个小 bug 增加 0.0.1, 重大 bug 增加 0.1.0
% 版本号	YYYY-MM-DD	详情 
% v0.0.0	2019-10-24	添加 lzuthesis.cls lzuthesis.tex imgs/
% v0.0.1	2019-12-16	增加对 ctexart 类的版本检查, 改写帮助手册
