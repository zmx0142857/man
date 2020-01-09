% !Mode:: "TeX:UTF-8"
%
% 兰州大学本科生毕业论文模板
% 维护者: 卓铭鑫, 黄洋锐
% 地址: https://github.com/zmx0142857/man/tree/master/tex/latex/lzuthesis/
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{lzuthesis}[2020/01/09 v0.1.0 Lanzhou University Thesis Template for Bachelor Degree]

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

\RequirePackage[
	top=3cm,bottom=2.54cm,left=3.17cm,right=3.17cm, headheight=2cm,
]{geometry} % 页边距
\linespread{1.5}	% 全文行距

% [页眉页脚]

\RequirePackage{fancyhdr}

% 清空默认配置
\fancypagestyle{plain}
\fancyhf{}
\fancyhead{}
\fancyfoot{}

% [列表]

\RequirePackage{enumitem}

% 减小列表行距
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

% 也可以在每个列表中单独配置:
% \begin{itemize}
%	\setlength{\itemsep}{0pt}
%	\setlength{\parsep}{0pt}
%	\setlength{\parskip}{0pt}
%	...
% \end{itemize}

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
	\noindent\heiti 证明\quad\songti
}{
	\hfill $\square$\par
} % \square 在 amssymb 中
\newenvironment{solution}{
	\noindent\heiti 解\quad\songti
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

% [ctex 设置]

\ctexset{
	% 宋体加粗功能会影响 section 标题样式, 这里将它恢复为黑体
	section/format += \heiti,
	subsection/format += \heiti,
	subsubsection/format += \heiti,
	% 自定义章节标题
	section = {
		name = {第,章},
		number = \chinese{section},
	}
}

% [封面]

\newcommand\makecover{
	\pagestyle{empty}
	\begin{figure*}
		\centering
		\includegraphics[width=0.33\textwidth]{lzu.pdf}
	\end{figure*}
	\vspace*{-1.1em} % 加星号的版本自带参考物, 否则前面需要 \hbox{}
	\begin{center}
	\heiti \zihao{0} \ziju{1} 毕业论文\par
	\vspace*{1em}
	\zihao{4} \ziju{0.5} (本科生)\par
	\vspace*{4.1em}
	{
		\songti \ziju{0}
		\renewcommand\arraystretch{0.85} % 临时改变表格行高
		\begin{tabular}{lc}
			\textbf{论文题目（中文）}& \the\zhtitle \\
			\cline{2-2}\\
			\textbf{论文题目（外文）}& \the\entitle \\
			\cline{2-2}\\
			\ziju{1} \textbf{学生姓名} & \the\zhauthor \\
			\cline{2-2}\\
			\textbf{导师姓名、职称} & \the\teacher \\
			\cline{2-2}\\
			\ziju{0.2} \textbf{学生所属学院} & \the\college \\
			\cline{2-2}\\
			\ziju{5} \textbf{专业} & \the\major \\
			\cline{2-2}\\
			\ziju{5} \textbf{年级} & \the\grade \\
			\cline{2-2}\\
		\end{tabular}
	}\par
	\vspace*{4em}
	\heiti \zihao{-4} \ziju{0.5} 兰州大学教务处
	\end{center}
	\newpage % 换页
	%-------------------------------------------------------
	% 图表按章节编号
	%\renewcommand\thetable{\thesection.\arabic{table}}
	%\renewcommand\thefigure{\thesection.\arabic{figure}}
	%\renewcommand\theequation{\thesection.\arabic{equation}}
	\numberwithin{table}{section}
	\numberwithin{figure}{section}
	\numberwithin{equation}{section}
	\numberwithin{lstlisting}{section} % 必须在 \begin{document} 后
}

% [诚信责任书]
\newcommand\makeliability{
	\begin{center}\zihao{3}\textbf{诚信责任书}\end{center}
	\zihao{-4}
	\parindent = 2em % 缩进
	本人郑重声明：本人所呈交的毕业论文（设计），是在导师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等，均已明确注明出处。除文中已经注明引用的内容外，不包含任何其他个人或集体已经发表或在网上发表的论文。

	本声明的法律责任由本人承担。

	\vspace{2em}
	论文作者签名：\underline{\hspace{7em}}
	\hspace{7em}
	日\qquad 期：\underline{\hspace{7em}}

	\vspace*{3em}
	\begin{center}
	\zihao{3}\textbf{关于毕业论文（设计）使用授权的声明}
	\end{center}
	
	本人在导师指导下所完成的论文及相关的职务作品，知识产权归属兰州大学。本人完全了解兰州大学有关保存、使用毕业论文的规定，同意学校保存或向国家有关部门或机构送交论文的纸质版和电子版，允许论文被查阅和借阅；本人授权兰州大学可以将本毕业论文的全部或部分内容编入有关数据库进行检索，可以采用任何复制手段保存和汇编本毕业论文。本人离校后发表、使用毕业论文或与该论文直接相关的学术论文或成果时，第一署名单位仍然为兰州大学。
	
	本毕业论文研究内容：

	$\square$ 可以公开

	$\square$ 不宜公开，已在学位办公室办理保密申请，解密后适用本授权书。

	（请在以上选项内选择其中一项打“√”）

	\vspace{2em}
	论文作者签名：\underline{\hspace{7em}}
	\hspace{3em}
	导师签名：\underline{\hspace{7em}}

	\medskip
	日\qquad\qquad 期：\underline{\hspace{7em}}
	\hspace{3em}
	日\qquad 期：\underline{\hspace{7em}}
	\newpage
	%-------------------------------------------------------
	\zihao{-4} % 全局字号
	\renewcommand{\headrulewidth}{0pt}	% 去掉页眉横线
	\fancyfoot[C]{~\thepage~} 			% 页脚居中书写页码
	\pagestyle{fancy}
	\pagenumbering{Roman}				% 页码为大写罗马数字
}

% [摘要]

\newcommand\cnabstractname{摘要}
\newcommand\enabstractname{Abstract}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywordsname{Key words}
\newcommand\cnkeywords[1]{
	{\noindent\heiti\zihao{-4}\cnkeywordsname: }#1 \newpage
}
\newcommand\enkeywords[1]{
	{\noindent\bfseries\zihao{-4}\enkeywordsname: }#1 \newpage
}

\makeatletter % 与 \makeatother 配合使用, 使得 @ 暂时可用
\newenvironment{cnabstract}{
	\begin{center}
	\heiti \zihao{3} \the\zhtitle
	\end{center}
	\section*{\ziju{2}{\cnabstractname}}
	\addcontentsline{toc}{section}{中文摘要} % 将中文摘要加入目录
	\@afterheading
}{
	\par
	\vspace*{2em}
}

\newenvironment{enabstract}{
	\begin{center}
	\heiti \zihao{3} \textbf{\the\entitle}
	\end{center}
	\section*{\enabstractname}
	\addcontentsline{toc}{section}{英文摘要} % 将英文摘要加入目录
	\@afterheading
}{
	\par
	\vspace*{2em}
}
\makeatother

% [目录]

\newcommand\maketoc{
	\tableofcontents						% 生成目录
	\newpage
	\pagenumbering{arabic}					% 页码为阿拉伯数字
	\fancyhead[L]{兰州大学本科生毕业论文}	% 页眉左边
	\fancyhead[R]{\the\shorttitle}			% 页眉右边
	\renewcommand{\headrulewidth}{1pt}		% 添加页眉横线
	\pagestyle{fancy}						% 应用页眉页脚配置
}

% [参考文献]

\renewenvironment{bibliography}{
	\zihao{5}
	\begin{thebibliography}{0}
		\addcontentsline{toc}{section}{参考文献} % 将参考文献加入目录
}{
	\end{thebibliography}
}

\RequirePackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref} % 链接颜色与 pdf 书签
%\bibliographystyle{abbrv} % 参考文献样式: plain,unsrt,alpha,abbrv,chinesebst

% 参考文献上标
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% [附录]

\RequirePackage[page, title, header]{appendix}
\renewenvironment{appendix}{
	\begin{appendices}
		\ctexset {
			section = {
				name = {附录},
				number = \Alph{section},
			}
		}
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

% [致谢]

\newenvironment{acknowledgement}{
	\section*{\ziju{2}致谢}
	\addcontentsline{toc}{section}{\ziju{2}致谢} % 将致谢加入目录
	\songti \zihao{-4}
}{
	\newpage
}

% [评语]

\newcommand\makereviews{
	\section*{论文（设计）成绩}
	\addcontentsline{toc}{section}{论文（设计）成绩} % 将评语加入目录
	\begin{center}
	\songtibf
	\begin{minipage}{0.93\linewidth}
	\zihao{-3}
	\fbox{
		\parbox[c][0.45\vsize][t]{1\linewidth}{
			\textbf{导师评语}
			\vfill
			\hfill \textbf{建议成绩}\underline{\hspace{6em}}\quad
			\textbf{指导教师（签字）}\underline{\hspace{6em}}
		}
	}
	\vskip -1.4pt % 刚好使得两个 fbox 边缘重合的距离
	\fbox{
		\parbox[c][0.18\vsize][t]{1\linewidth}{
			\textbf{答辩小组意见}
			\vfill
			\hfill \textbf{答辩委员会负责人（签字）}
			\underline{\hspace{6em}}
		}
	}
	\vskip -1.4pt
	\fbox{
		\parbox[c][0.27\vsize][t]{1\linewidth}{
			\hbox{}
			\vfill
			\hfill \textbf{成绩}
			\underline{\hspace{6em}}\quad
			\textbf{学院（盖章）}
			\underline{\hspace{6em}}
			\begin{flushright}
				\textbf{\zihao{-4}\ziju{1.5}年月日}
			\end{flushright}
		}
	}
	\end{minipage}
	\end{center}
	\newpage
}

% [自定义 caption]

\renewcommand\contentsname{\heiti\ziju{2} 目录}
\renewcommand\listfigurename{\heiti 插图}
\renewcommand\listtablename{\heiti 表格}
\renewcommand\figurename{\heiti 图}
\renewcommand\tablename{\heiti 表}
\renewcommand\appendixname{\heiti 附录}		% 附录标题
\renewcommand\appendixtocname{\heiti\ziju{2} 附录}	% 附录在目录中的名字
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
% v0.1.0	2020-01-09	减小列表行距, 按新规范重写模板
