==== 曹孟德使用指南 ==================================================

                                  _____
        _________                /\    \
       /::::\    \              /::\____\                  _____
      /::::::\    \            /::::|    |                /\    \
     /::::::::\    \          /:::::|    |               /::\    \
    /:::/~~\:::\    \        /::::::|    |              /::::\    \
   /:::/    \:::\    \      /:::::::|    |             /::::::\    \
  /:::/    / \:::\ ___\    /:::/|:::|    |            /:::/\:::\    \
 /:::/____/   \:::|    |  /:::/ |:::|____|_____      /:::/  \:::\    \
 |::|    |     |::|    | /:::/  |:::::::::\    \    /:::/    \:::\    \
 |::|____|     |::|____| :::/   \::::::::::\____\  /:::/    / \:::|    |
 |:::\    \   /:::/    / ::/    /\:::::::::/    / /:::/    /   |::|    |
  \:::\    \  \::/    /  \/____/  ~~~~/:::/    / /:::/____/    |::|    |
   \:::\    \__\/____/               /:::/    /  \:::\    \    |::|    |
    \:::\__/\    \                  /:::/    /    \:::\    \   /::|____|
     \:::::::\____\                /:::/    /      \:::\    \ /:::/    /
      \::::::/    /               /:::/    /        \:::\____/:::/    /
       \::::/    /               /:::/    /          \::::::::::/    /
        ~~~~~~~~~               /:::/    /            \::::::::/    /
                                \::/    /              ~~~~~~~~~~~~~
                                 \/____/

本文来自网络, 由 youxi01 整理, zmx0142857 重写并补充.
其中补充的部分资料来自百度知道, 但已重新整理.

---- 基本事项 -------------------------------------------------------

脚本

	一类编程语言, 不需要编译, 由解释器直接解释执行.
	编辑好文本文件就可以直接运行.
	流行的脚本有 shell, python, javascript 等等.

批处理 (batch)

	windows 下的一种脚本. 还有两种常见的是 vbscript 和 powershell.

cmd (command processor, 命令处理器)

	windows 的 batch 脚本解释器. 在 dos 时代, 它是 command.com,
	在 windows 中则是 cmd.exe (%systemroot%/system32/cmd.exe).

控制台 (console)

	cmd 运行时打开的黑窗口. 是 IO (=输入输出) 设备之一.
	cmd 中的常见 IO 设备有 con 控制台, prn 打印机, nul 空设备,
	其中空设备表示丢弃这些 IO 信息, 可以把 nul 理解为无底洞.
	当然文件也可以是 IO 的对象. 因此, con, prn, nul 是 windows 的保留名,
	给文件命名时, 不可以取这些名字.

命令

	脚本既可以写成文件, 再交由 cmd 执行, 也能以交互形式由用户逐条输入给
	cmd 并执行. 脚本中的每一条语句都是一个命令.

内部命令, 外部命令

	内部命令是 cmd.exe 本身支持的命令.
	外部命令是 cmd.exe 本身不支持, 通过调用其他程序来实现的命令.


参数

	运行命令的格式一般是

		[命令名] [参数1] [参数2] ...

	参数指的就是命令名后面以空格分隔的那些字符串.

开关

	又叫选项. 形如 /x 或 -x 的参数, 用来使命令实现一些特殊要求.

环境变量

	简称变量.  环境变量可以理解为程序运行时, 由运行环境 (如 cmd)
	提供的变量, 保存着各种系统信息. 另一方面, 环境变量也可以由用户设定.
	如 %errorlevel% 是 windows 环境变量之一.

扇区

	又叫分区或驱动器 (driver). 同一块物理磁盘可以有多个分区.
	跨分区的文件访问存在一些限制.  一般不宜设定过多的分区,
	一个系统分区和一个用户文件分区已经足够.

---- 入门操作 -------------------------------------------------------

help [command]
[command] /?

	显示该命令的帮助. 缺省参数时, 显示常用命令.

	help				显示常用命令
	help dir			查看 dir 命令的帮助
	dir /?				同上

rem [anything]
:: [anything]

	注释行不执行操作. 解释器自动忽略 rem 或 :: 以后直到行末的所有内容.

cd [option] [path]

	内部命令. 切换工作目录 (change directory).
	省略 [path] 时, 显示当前工作目录, 相当于 unix 的 "pwd" (print working
	directory).

	/d					跨磁盘分区切换目录. 比如从 C 盘切换到 D
						盘的某一目录, 若没有此选项则不成功
						不过, 直接输入 D: 是可以切换到 D 盘的

	cd					显示当前目录
	cd subdir			进入子目录 subdir, 不存在则报错,
						置 %errorlevel%=1
	cd \				进入当前分区的根目录
	cd "my work"		文件名带空格或特殊字符时需要加上引号

	每个文件夹都有 2 个子目录 "." 和 "..";
	"." 代表当前目录, ".." 代表当前目录的上级目录.

	cd .				进入当前目录 （没有什么卵用）
	cd ..				进入上级目录
	cd /d %~dp0			切换到当前脚本所在的目录

dir [option] [path/file]

	内部命令, 列出文件和子目录 (directory). 相当于 unix 的 ls (list).
	如果指定的目录或文件不存在, 则置 %errorlevel%=1.

	/a					(all) 显示隐藏文件和系统文件
	/d					(directory) 列出子目录, 但不列出文件
	/b					(brief) 只显示文件名
	/p					逐屏显示, 只显示文件名
	/s					(subdir) 列出当前目录与其子目录中的文件
	/w					比默认显示简短, 比 /b 啰嗦

	通配符 "*" 代表任意字符串, 通配符 "?" 代表任意一个字符.

	dir c*.*			列出以 "c" 开头的所有文件
	dir *.*				列出所有文件, 不包括隐藏, 系统文件
	dir ?.exe			列出所有文件名是一个字符的 .exe 文件

pushd
popd

	pushd 将工作目录存于栈中, popd 将目录从栈取出.
	可以快速在多个目录间切换.

	cd /d d:\foo		切换目录到 d:\foo
	pushd c:\bar		保存当前目录后, 切换到 c:\bar
	popd				回到刚才保存的目录 d:\foo

ctrl-c

	用于中止命令的运行. 比如

	ping -t 127.0.0.1
	^C

	就结束了 ping 的运行.

ctrl-z enter

	用于输入文件结束符 (EOF). 如

	type con

	向控制台随意输入一些内容后, ctrl-z 并回车以结束输入.

---- 装点操作 -------------------------------------------------------

cls

	内部命令, 清屏 (clear screen). 相当于 unix 的 ctrl-l.

pause

	运行该命令时, 将显示下面的消息:

		请按任意键继续. . .

	一般用于看清楚屏幕上显示的内容, 避免图形界面下程序 "一闪而过".

	pause > nul			不想看到任何消息的话, 可以重定向到 nul:

title [newtitle]

	设置控制台窗口标题

color [bg][fg]

	设置 cmd 窗口的颜色, 有 0-9a-f 共 16 色.
	缺省参数时, 使用默认颜色.

	0	深黑				8	浅黑
	1	深蓝				9	浅蓝
	2	深绿				a	浅绿
	3	深青				b	浅青
	4	深红				c	浅红
	5	深紫				d	浅紫
	6	深黄				e	浅黄
	7	深白				f	浅白

	color fc	浅白色背景, 浅红色前景
	color f0	白底黑字, 适合投影仪

prompt [text]

	更改命令提示符号. 缺省参数时, 变回默认提示符.

	$a	&           $n	当前分区
	$b	|           $p	当前路径
	$c	(           $q	=
	$d	当前日期    $s	空格
	$e	escape      $t	当前时间
	$f	)           $v	windows 版本
	%g	>           $_	换行符
	$h	backspace   $$	$
	$l	<

doskey [alias]=[command]

	命令别名

	doskey cd=cd /d							为 cd 加上默认的 /d 选项
	doskey ls=dir /b						模仿 unix 的命令名
	doskey vi=vim $*						vi 是 vim 的别名
	doskey hash=certutil -hashfile $1 $2	方便计算 hash, $1 $2 为参数

chcp [codepage]

	改变控制台的编码. 中文 windows 系统中编码常常是 gbk,
	有时我们需要把它改成 utf-8.

	chcp cp936				设置编码为 gbk
	chcp 65001				设置编码为 utf-8

certutil -hashfile

	certutil -hashfile sha1 filename	:: win10
	certutil -hashfile filename			:: win7 默认就是 sha1

---- IO 操作 ---------------------------------------------------------

@ [command]

	取消回显
	回显是指运行批处理脚本时, 除了显示运行结果, 还显示脚本里的命令.
	默认情况下回显是开启的. 在批处理文件中, @ 用在一行开头,
	可以取消当前行的回显.

echo [args]

	输出字符串, 回显控制

	echo hello world	输出 hello world
	echo:				输出一个换行符
	echo.				同上

	echo				查看当前回显是否被打开
	echo on				打开回显, 相当于 unix 的 "bash -x [script.sh]"
	@echo off			关闭回显. 一般写在批处理文件开头

	echo %errorlevel%	上一条命令成功执行则显示 0, 否则返回非 0 值

more [file]

	外部命令. 逐屏显示文件内容, 缺省参数时, 读入标准输入,
	经常与管道配合使用.

	more c:\test.txt			逐屏显示 c:\test.txt 的文件内容

type [file]

	内部命令, 把文本文件输出到控制台, 相当于 unix 的 cat.
	不支持通配符.

	type [file] | more			分屏显示
	type [file] > prn			输出到打印机

fc [option] [file1] [file2]

	外部命令, 比较文件, 列出差异之处. 相当于 unix 上的 diff.

	/a					ascii 比较模式
	/b					(binary) 二进制比较模式
	/c					(case insensitive) 不区分大小写
	/n					(number) 显示行号 (仅 ascii 模式)

find "string" [file]

	外部命令, 在文件中查找字符串. unix 中的 grep 显然更强大些...

	/i					忽略大小写
	/c					统计成功匹配的行数

	find "abc" file		在 file 中查找含 "abc" 的行;
						找不到则置 %errorlevel%=1

	ipconfig | find "IPv6"	在 ipconfig 的输出中寻找含 IPv6 的行

certutil -hashfile [filename] [md5|sha1|sha256]

	外部命令, 计算文件的 hash 值. 通常用于检查下载的文件的完整性.

---- 文件操作 --------------------------------------------------------

ren [file] [newname]
rename [file] [newname]

	内部命令, 重命名文件. 相当于 unix 的 mv.
	新文件名前不可以加上路径, 因为该命令只能对同一盘上的文件更换文件名.

	ren 1.txt 1.bak		把 1.txt 更名为 1.bak
	ren *.txt *.ini		把当前目录里所有 .txt 文件改成 .ini 文件
	ren d:\temp tmp		重命名文件夹

move [option] [source-file] [target-path/file]

	内部命令, 移动文件. 相当于 unix 的 mv.
	默认情况下, 不移动隐藏, 系统文件.
	省略目标文件名时, 使用原文件的名字.
	目标目录下存在同名文件会询问是否覆盖.

copy [option] [source-file...] [target-path/file]

	内部命令, 拷贝文件. 相当于 unix 的 cp.
	默认情况下, 不拷贝隐藏, 系统文件.
	省略目标文件名时, 使用原文件的名字.
	完全省略目标路径时, 复制到当前目录. 系统会自动重命名.
	目标目录下存在同名文件会询问是否覆盖.

	copy c:\test.txt d:\			复制 c:\test.txt 文件到 d:\
	copy c:\test.txt d:\test.bak	复制 c:\test.txt 文件到 d:\,
									重命名为 test.bak
	copy c:\*.*						复制 c:\ 所有文件到当前目录,
									不含隐藏, 系统文件

	cmd 中的常见设备有 con 控制台, prn 打印机, nul 空设备

	copy con test.txt				从控制台输入, ctrl+z 结束,
									内容存为 test.txt

	copy 1.txt + 2.txt 3.txt		合并 1.txt 和 2.txt 的内容,
									保存为 3.txt.
									如不指定 3.txt, 则保存到 1.txt
	copy test.txt +					合并文件到自己, 实际上是修改了文件日期
									unix 中的 touch 可以达到同样目的

xcopy [option] [source-path/file...] [target-path]

	外部命令, 是 copy 的强化版, 可以拷贝整个目录结构.
	默认不拷贝隐藏, 系统文件.

	/b						复制快捷方式的目标而不是快捷方式
	/e						一并拷贝空目录
	/i						如果目标目录不存在则自动新建
	/s						一并拷贝子目录
	/v						对拷贝的扇区进行校验
	/y						覆盖已有文件

md [option] [path]
mkdir [option] [path]

	内部命令, 创建目录 (make directory). 与 unix 的 mkdir 不同,
	默认允许一次创建多重目录.

	md abc				在当前目录里建立子目录 "abc"
	md d:\a\b\c			如果 "d:\a\b" 不存在, 将会自动创建

rd [option] [path]
rmdir [option] [path]

	内部命令, 删除目录 (remove directory).
	默认情况下，rd 无法删除非空目录, 当前目录, 根目录和其它受保护的目录.

	注意! 用 rd 和 del 删除的文件和目录都不会进入回收站.

	/s					(subdir) 一并删除子目录
	/q					(quiet) 无需按 y 确认

	rd abc				删除空目录 "abc"
	rd /s/q d:\temp		删除 "d:\temp" 及其下的所有内容, 无需按 y 确认
						(一干二净)

del [option] [file]

	内部命令, 删除文件 (delete). 相当于 unix 的 rm.
	默认情况下, del 不删除受保护的文件 (隐藏, 只读, 系统文件),
	也不会删除子目录中的文件.

	注意! 用 rd 和 del 删除的文件和目录都不会进入回收站.

	/a					(all) 包括受保护的文件, 即隐藏, 只读, 系统文件
	/f					(force) 强制删除只读文件
	/p					(prompt) 删除前总是询问
	/q					(quiet) 删除前总是不询问
	/s					(subdir) 一并删除子目录下的文件

	del d:\test.txt				删除指定文件
	del /a/f/q/s d:\temp\*.*	删除 "d:\temp" 及其子目录下的所有文件,
								包括隐藏, 只读, 系统文件, 而且不询问
								(也是一干二净)
undelete [option] [file]

	外部命令, 恢复误删的文件. (警告: win 10 不存在此命令)

	/dos				根据目录中残留的记录来恢复文件.  文件被删除时,
						文件名第一个字节会被改为E5, dos 即依据文件开头的
						E5 和其后续的字符来找到欲恢复的文件. undelete
						会要求用户输入一个字符, 以便将文件名字补齐.
						此字符不必和原来的一样, 只需符合 dos
						的文件名规则即可.

	/list				仅列出符合指定条件的文件而不实际恢复

	/all				自动恢复那些可完全恢复的文件, 而不询问.
						使用此参数时, 若是利用目录中残留记录来恢复文件,
						undelete 会自动选一个字符将文件名补齐,
						并且使其不与现存文件名冲突.
						选用字符的优先顺序为 #%0-9A-Z。

	undelete 还具有建立文件的防护措施的功能. 在此不作具体介绍.

tree [path]

	外部命令, 显示目录结构.

	tree d:\			显示 D 盘的文件目录结构, 但不显示文件
		/f				也显示文件

deltree [path]

	外部命令, 删除目录树, 是一个危险的命令 (win 10 无此命令).
	将所指定的目录下的一切删除, 包括受保护的文件.

attrib [file] [attribute]

	外部命令, 修改文件属性 (attribute). 相当于 unix 的 chmod.

	/s					对所有子目录作相同设置

	attribute:

	r		只读属性
	-r		取消只读属性
	a		档案属性
	-a		取消档案属性
	s		系统属性
	-s		取消系统属性
	h		隐藏属性
	-h		取消隐藏属性

assoc
	将文件扩展名关联到文件类型

ftype
	将文件类型关联到默认的打开方式, 即默认的应用及其参数

	当你双击一个 .txt 文件时, windows 并不是根据 .txt 直接判断用
	notepad.exe 打开, 而是先判断 .txt 属于 txtfile 类型,
	再调用 txtfile 关联的命令

	txtfile=%SystemRoot%\system32\NOTEPAD.EXE %1

	可以在 文件夹选项 -> 文件类型 里修改这两种关联;
	当然, 也可以通过命令.

	assoc					显示所有文件扩展名关联
	assoc .txt				显示 .txt 代表的文件类型, .txt=txtfile
	assoc .doc				.doc=Word.Document.8
	assoc .exe				.exe=exefile

	assoc .txt=Word.Document.8
							设置 .txt 为 word 类型的文档, 可以看到 .txt
							文件的图标都变了
	assoc .txt=txtfile		恢复 .txt 的正确关联

	ftype					显示所有文件类型关联
	ftype exefile			显示 exefile 类型关联的命令, exefile="%1" %*
	ftype exefile="%1" %*	恢复 exefile 的正确关联

---- 系统信息 ---------------------------------------------------------

ver
	内部命令, 显示系统版本

msd [option]

	外部命令, 系统报告, 显示硬件和操作系统的一些信息 (win 10 无此命令).

	/i					(ignore) 不检测硬件
	/b					(black & white) 以黑白方式启动 msd
	/s					(short) 简短的版本

date [mm-dd-yy]

	内部命令, 设置系统日期.
	缺省参数时会显示当前日期并提示输入新日期, 如不想修改日期, 直接回车.

	/t					显示日期

time [hh:mm]

	内部命令, 设置系统时间.
	缺省参数时会显示当前时间并提示输入新时间, 如不想修改时间, 直接回车.
	unix 中, time 是程序计时工具而非查看时间的命令.

	/t					显示时间

	echo 12:00 | time	将时间修改为 12:00

mem [option]

	外部命令, 显示当前内存使用状况 (win 10 无此命令).

	/c					显示装入常规内存和 cmb 的各文件的长度,
						并显示已用内存和最大可用空间
	/f					显示常规内存剩余的字节大小和 umb 可用区域大小
	/m					显示该模块使用内存地址, 大小及模块性质
	/p					逐屏显示

---- 复合命令 --------------------------------------------------------

| 管道

	将前一个命令的执行结果作为后一个命令的输入
	(如果后一个命令需要键盘的输入)

	输出当前目录及其子目录里的 .exe 文件并计数.
	先执行 dir 命令, 将其输出的结果传递给 find 命令:

		dir *.* /s/a | find /c ".exe"

	前面已经提到, 逐屏输出文件内容, 下面两种方法等效:

		more c:\test.txt
		type c:\test.txt | more

> 输出重定向

	本应输出到控制台的文字可以用 >, >> 重定向到文件, 文件是自动生成的.

	> 					清除文件内容再写入
	>> 					追加内容到文件末尾

	生成 c:\test.txt 文件, 内容为 "hello world".
	这种写法可以方便地新建文件:

		echo hello world > c:\test.txt

	输出到打印机

		type c:\test.txt > prn

	拷贝文件, 不显示 "文件复制成功" 的提示信息.  但如果 f 盘不存在,
	会显示出错信息:

		copy c:\test.txt f: > nul

	不显示 "文件复制成功" 的提示信息.  f 盘不存在时, 也不显示错误:
	2> 表示对第二部分输出的重定向 (一般为错误信息)

		copy c:\test.txt f: > nul 2> nul

	^ 是转义符号. 生成的文件内容为 ^ >

		echo ^^ ^> > c:\test.txt

	% 也要转义. 生成的文件内容为 load "%1" "%2"

		echo load "%%1" "%%2" > c:\test.txt

< 输入重定向

	本应从键盘读取的文字, 可以改从文件读入.
	一般用于 date time label 等需要等待输入的命令,
	假定 temp.txt 的内容是 2015-01-01, 则

		date < temp.txt

	可以不等待输入, 直接修改当前日期.

& 顺序执行

	顺序执行多条命令, 而不管是否执行成功

		c: & cd \ & dir /w

&& 且

	顺序执行多条命令, 遇出错则停止

	如果 f 盘不存在, 后面 2 条命令将不会执行

		f: && cd \ && dir > c:\test.txt

	如果找到了 "ok" 字样, 就显示 "成功", 否则不显示

		find "ok" c:\test.txt && echo 成功

|| 或

	顺序执行多条命令, 直到执行成功为止

	如果找不到 "ok" 字样, 显示 "不成功", 否则不显示

		find "ok" c:\test.txt || echo 不成功

---- 启动与调用 ------------------------------------------------------

start

	调用外部程序. 在批处理中, 等外部程序完成后才会继续执行剩下的指令.

	调用图形界面打开 D 盘:

		start explorer d:\

call

	调用批处理脚本. 在批处理中, 等子程序完成后才会继续执行剩下的指令.
	有时应用程序用 start 调用出错, 也可以 call 调用.

---- 参数与变量 ------------------------------------------------------

%0 %1 ... %9 %*

	(传递给脚本的) 命令行参数

	%0 					命令或程序的名字
	%1 					第一个参数
	%9 					第九个参数
	%* 					从 %1 开始的所有参数

	在 C 盘根目录新建 test.bat, 内容如下:

		@echo off
		echo %0			:: 命令名
		echo %1			:: 第一个参数
		echo %2			:: 第二个参数
		echo %*			:: 从第一个参数开始的所有参数

	运行cmd, 输入 c:\test.bat 1 2 3 4, 可以看出每个参数的含义.
	修改test.bat内容如下:

		@echo off
		echo %~f0		:: 脚本完整路径
		echo %~d0		:: 脚本所在分区 (盘符)
		echo %~p0		:: 脚本路径, 不含盘符与文件名
		echo %~n0		:: 脚本名, 不含文件名
		echo %~x0		:: 脚本文件的后缀名
		echo %~s0		:: 脚本完整路径 (?)
		echo %~a0		:: 脚本属性
		echo %~t0		:: 脚本修改日期
		echo %~z0		:: 脚本文件的大小 (byte)

	这些变量可以连用:

		echo %~dp0		:: 脚本盘符与路径, 不含文件名

shift [option]

	传递给批处理的参数不止 9 个时, 用以切换参数.
	将第 10 个参数以及以后的所有参数向前移动, 覆盖第 9 个参数.

	/n					将第 n+1 个参数以及以后的所有参数向前移动,
						覆盖第 n 个参数

	@echo off
	echo %*
	echo %9
	shift
	echo %9
	shift
	echo %9
	shift
	echo %9

	运行: test.bat 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15

set [variable][=value]

	设置环境变量, 默认赋以字符串值. 环境变量也简称为变量.

	set					显示目前可用的变量, 包括系统变量和自定义的变量
	set p				显示所有以 p 开头的变量, 没有则置 errorlevel=1
	set p=hello			设置变量 p, 并赋以字符串值 hello
	echo %p%			查看变量 p
	set p=				取消 p 变量, 即置 p 为空字符串
	set /p p=请输入		屏幕上显示 "请输入", 并将输入的字符串赋给变量 p

	---------------------------------------------------------------------
	常见系统变量

	systemdrive			系统盘符
	systemroot			系统目录
	comspec				cmd 的所在目录
	appdata				windows 上各应用程序的数据目录
	path				系统路径, 各路径以半角分号隔开.
						在 cmd 中输入命令时, 解释器首先在当前目录中搜索
						可执行文件, 如果没有找到再依次搜索 %path%
						中的各目录. 也可以直接使用 path 命令进行操作

	动态变量, 运行 set 不能看到

	cd					当前目录
	date				当前日期
	time				当前时间
	random				0~32767 的随机整数
	errorlevel			程序返回码, 0 表示程序正常执行, 非正常时为非 0 值
	cmdextension		当前 cmd 扩展名版本号
	cmdcmdline			调用当前脚本的原始命令行
	highestnumanodenumber 当前计算机上的最高 numa 节点号
	---------------------------------------------------------------------

	字符串切片

	set p=aa1bb1aa2bb2	设置变量 p, 并赋以字符串值 aa1bb1aa2bb2
	echo %p%			查看变量 p
	echo %p:~6%			显示 p[6:end), 即 aa2bb2
	echo %p:~6,3%		显示 p[6:6+3), 即 aa2
	echo %p:~0,3%		显示 p[0:0+3), 即 aa1
	echo %p:~-2%		显示 p[-2:end), 即 b2
	echo %p:~0,-2%		显示 p[0:-2), 即 aa1bb1aa2b

	字符串替换

	echo %p:aa=c%		将 p 中所有 aa 替换为 c, 即 c1bb1c2bb2
	echo %p:aa=%		将 p 中所有 aa 替换为空, 即 1bb12bb2
	echo %p:*bb=c%		将首个 bb 及其之前的所有字符替换为 c, 即 c1aa2bb2
	set p=%p:*bb=c%		将替换操作的结果赋给 p

	算术运算

	set /a p=39			设置 p 为数值型变量 39
	set /a p=39/10		舍去小数部分, 39/10=3
	set /a p=p/10		用 /a 参数时, '=' 后面的变量可以不加 % 直接引用
	set /a p="1&0"		"与" 运算, 要加引号. 其它支持的运算符参见 set /?
	set /a p=%random% % 2	抛硬币

	环境变量虽然叫做变量, 但其行为更接近宏, 即字符串的简单替换. 比如,
	在 if 和 for 语句里, 变量是一次性全部替换的. 在下面的例子中, 读取
	if 语句时就已将所有的 %p% 替换为 "复读机", 从而第二个 set 语句未生效:

		@echo off
		set p=复读机
		if %p% == 复读机 (
			echo %p%
			set p=必胜
			echo %p%
		)

	结果:

		复读机
		复读机

	这里的 "替换" 又称为 "扩充" 或 "环境变量扩充". 为使上例的第二个 set
	语句生效, 可以启用 "延迟环境变量扩充", 并用 ! 而不是 % 来引用变量.
	另外, 为使 "延迟环境变量" 只在局部有效, 使用了命令 setlocal:

		@echo off
		:: Enable delayed expansion
		setlocal enabledelayedexpansion
		set p=复读机
		if %p% == 复读机 (
			echo %p%
			set p=必胜
			echo !p!
		)
		endlocal

	结果:

		复读机
		必胜

	延迟环境变量扩充同样影响着 for 语句, 尝试运行下面的脚本:

		@echo off
		set list=
		for %%i in (*) do set list=%list% %%i
		echo %list%

	和

		@echo off
		setlocal enabledelayedexpansion
		set list=
		for %%i in (*) do set list=!list! %%i
		echo %list%
		endlocal

	可以看到, 第一个版本只输出了最后一个文件名. 这是 list
	只扩展了一次的缘故.

--- 流程控制 ---------------------------------------------------------

if [condition] [command...]

if [condition] (
	[command...]
) else (
	[command...]
)

	选择语句.  condition 可以是以下三种类型:

		str1 == str2
		errorlevel [n]			errorlevel 大于等于 n
		exist [file]

	为防止参数为空, 一般把判断 %1 == -u 写成 [%1] == [-u].
	由于 errorlevel n 是指 errorlevel >= n, 故判断 errorlevel 时,
	一般先判断较大的值.

	not 表示逻辑否:

		not str1 == str2

	/i 选项下, if 有更多的可用条件:

		str1 op str2			此时的比较不区分大小写
		cmdextversion [n]		cmdextversion 大于等于 n
		defined [variable]

	op 可以是:

		equ			等于
		neq			不等于
		lss			小于
		leq			小于或等于
		gtr			大于
		geq			大于或等于

for [%v] in ([set]) do [command...]

	循环语句.

		%v			单个字母的参数, 区分大小写
		[set]		一个或一组文件, 支持通配符

	在脚本中使用 for 语句时, 应该使用 %%v 而不是 %v

	for /d ...		若 [set] 中含有通配符, 则只匹配目录名而不匹配文件名
	for /r [path]	递归搜索 [path] 下的子目录, 缺省使用当前目录
	for /l %v in (start,step,end) ...
					在数字序列中迭代, 如 (1,1,3) 是 1, 2, 3;
					(3,-1,1) 是 3, 2, 1.

	分析 file 的每一行, 忽略以分号打头的行, 将每行的第 2, 3 个 token 传给
	for 循环体, 用逗号和/或空格分隔 tokens.  %i 代表第 2 个 token,
	%j 代表第 3 个 token, %k 代表剩余所有 tokens.
	for /f "eol=; tokens=2,3* delims=, " %i in (file) do @echo %i %j %k

goto

	跳转语句

	:label		 		行首为 ":" 表示该行是标签行, 标签行不执行操作
	goto label	 		跳转到指定的标签行

choice

	外部命令, 多重选择.
	根据读入的字符串, 设 errorlevel 为 1, 2, 3..., 从而运行不同的命令.
	此命令在 win98 里是 choice.com, win2003 里是 choice.exe.
	win2000pro 里没有, 可以从 win98 里拷过来.

	choice /c:yn					根据用户输入是 y 或 n 执行相应命令
	chioce							同上
	choice /n /c y /t 5 /d y > nul	延时5秒

	以下脚本在 win2000pro 运行通过, 是从 win98 里拷的 chioce.com 文件:

		@echo off
		choice /c:abc aaa,bbb,ccc
		rem 必须先判断数值高的返回码
		rem 可以看到 errorlevel 值的判断有 3 种写法
		if errorlevel 3 goto ccc
		if %errorlevel%==2 goto bbb
		if errorlevel==1 goto aaa
		:aaa
		echo aaa
		goto end
		:bbb
		echo bbb
		goto end
		:ccc
		echo ccc
		goto end
		:end

---- 服务管理 --------------------------------------------------------

net start/stop [service]

	启动/停止服务

sc [subcommand] [service] [key1=value1] [key2=value2]

	外部命令, 服务控制.

	创建服务, 服务名称=aaa, 显示名称=bbb, 启动类型=自动;
	启动命令="C:\WINDOWS\System32\alg.exe":

		sc create aaa displayname=bbb start=auto binpath="C:\WINDOWS\System32\alg.exe"


	更改 aaa, 描述=ccc

		sc description aaa "ccc"

	更改 aaa, 启动类型=已禁用,
	启动命令="C:\WINDOWS\System32\svchost.exe -k netsvcs"

		sc config aaa start=disabled
			binpath="C:\WINDOWS\System32\svchost.exe -k netsvcs"

	更改 aaa, 启动类型=手动更改, 显示名称=ddd

		sc config aaa start=demand displayname=ddd

	启动/停止/删除 aaa 服务

		sc start/stop/delete aaa

ipconfig

	网络配置

route

    route print :: 打印路由
    route add <ip> mask <mask> <gateway> :: 添加路由
    route delete <ip> :: 删除路由

ping

	外部命令, 通过发送包来检查网络状态.

	向百度发送数据包

		ping www.baidu.com

	不停向 192.168.1.200 发送大小为 65500 byte 的包

		ping -l 65500 -t 192.168.1.200

	ping 自己 10 次, 可用于批处理延时 10 秒 (魔鬼？).
	127.0.0.1 代表本机的 ip, 别名 localhost.

		ping -n 10 127.0.0.1 > nul

netstat /ano | find "1099" :: 查看端口占用
tasklist | find "5104" :: 查看进程
taskkill /f /pid "5104" :: 终止进程

---- 磁盘操作 (危险区) -----------------------------------------------

	警告: 在有丰富经验者的指导下操作. 如果你的电脑上安装了一个以上的系统
	(比如你已经装了个 linux), 那么千万不要在 windows 下划磁盘分区.

vol [disk]

	内部命令
	显示分区的卷标名, 即分区的名字.

label [disk] [newlabel]

	外部命令
	设定磁盘的卷标名, 即为磁盘分区起一个名字.
	卷标名的长度限制为 1 ~ 11 个字符.

	label c: System		设置 C 盘的卷标为 system

subst [disk] [path]

	将一路径映射为磁盘分区

	subst z: c:\my\cnf		这样输入 z: 就可以访问 c:\my\cnf 了
	subst					显示所有映射
	subst z: /d				取消映射

defrag [disk] [option]

	外部命令
	整理磁盘, 消除磁盘碎片

	/f					调整文件在磁盘上的安排, 确保文件间无空隙,
						从而节省磁盘空间, 提高读写效率.

chkdsk [path] [option]

	检查磁盘, 外部命令.
	显示磁盘状态/内存状态和指定路径下指定文件的不连续数目.

	/f					纠正在磁盘上发现的逻辑错误
	/v					显示盘上所有文件和路径

scandisk [disks]

	检查/修复磁盘, 外部命令
	检测磁盘的 fat 表, 目录结构, 文件系统等
	适用于硬盘和软盘, 可自动检测出磁盘中的交叉连接,
	丢失簇和目录结构等逻辑错误, 并加以修复.

	/all				修复所有磁盘

diskcopy [disk1] [disk2]

	整盘复制, 外部命令.
	复制软盘上的所有信息, 目标软盘将自动被格式化, 原有文件会全部丢失.
	如果是单驱动器复制, 系统会适时提示更换软盘.
	操作时务必分清源盘与目标盘.

sys [disk]

	复制系统, 外部命令
	将当前驱动器上的 DOS 系统文件 io.sys, msdos.sys 和 command.com
	传送到指定的驱动器上. 若目标磁盘剩余空间不足以存放系统文件, 则报错.

format [disk]

	格式化, 外部命令
	对磁盘进行格式化, 划分磁道和扇区; 同时检查坏道,
	建立目录区和文件分配表. 被格式化的磁盘分区上所有资料都会丢失,
	是一个极度危险的命令. 格式化前确保你已经做了备份!

	/4					在 1.2MB 的高密度软驱中格式化 360KB 的低密度盘.
	/autotest			自动格式化而不询问
	/c					检测坏道
	/q					(quick) 快速格式化. 并不重新划分磁道和扇区,
						只将磁盘根目录, 文件分配表和引导扇区清空,
						故速度较快
	/s					(sys) 把 dos 系统文件 io.sys\msdos.sys 和
						command.com 复制到磁盘, 使该磁盘可以作为 dos
						启动盘
	/u					(unrecoverable) 不可逆格式化.
						以 F6 覆盖分区的每一字节, 破坏原有的一切数据.

unformat [disk]

	恢复格式化, 外部命令
	用于从误格式化的磁盘中恢复数据. 若格式化时没有使用 /u 参数,
	则默认为安全格式化. 此时系统会先建立一个镜像文件保存原来的 fat
	表和根目录, 故数据是有可能恢复的. 根目录下误删文件或系统扇区受损时,
	用 unformat 抢救也是一种方法.

	对于刚格式化的磁盘, 使用 unformat 可以完全恢复.
	若格式化后做了其它数据的写入, unformat 就不能完整地救回数据了.
	另一方面, 由于 unformat 会重建 fat 与根目录, 所以它也具有较高的危险性.
	如果仅误删了几个文件或子目录, 只需要利用 undelete 就够了.

	/u					不使用 mirror 映像文件的数据, 直接根据磁盘现状进行
						unformat
	/l					列出找到的子目录/文件/修改日期等信息,
						但不实际进行工作
	/p					将屏幕上的信息也送到打印机
	/test				只进行模拟而不实际写入
	/psrtn				修复磁盘分区表

	若使用 /p /L /test 之一, 都相当于使用了 /u 参数, unformat
	会假设此时磁盘没有 mirror 映像文件.

fdisk

	外部命令, 硬盘分区.

	win2000 无此命令. win98 里的 fdisk 不支持 80G 以上大硬盘,
	winme 里的支持 fdisk/mbr 重建硬盘分区表, 一般用于清除引导区病毒.
	命令不能从硬盘启动, 必须软驱或光驱启动后直接运行.

diskpart

	外部命令, 硬盘分区.

========================================================================

windows 如何 echo 多行内容
