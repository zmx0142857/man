批处理常用命令及用法大全

==========================================本文来自网络, 由 youxi01整理

阅读本文需要一定的 dos 基础概念, 象: 盘符, 文件, 目录(文件夹), 子目录,
根目录, 当前目录... 在 /? 帮助里, "命令扩展名" 一词会经常出现.
"命令扩展名"是指相对于 win98 的 dos 版本而言, 每个命令新增的功能. 

命令测试环境: win2000proSP4(win98的命令功能太少, 就不作研究了)

  0 :::::::::::::::::::::::::::::::::::::::::::::::::::::::  /? - 帮助

如果对某一命令还不是很熟悉, 可以在命令行窗口下输入: 

	[命令名] /?
	
来获得帮助. 例如: 对dir命令的应用不熟悉, 可以在命令行窗口下输入: 

	dir /?
	
本文内容是示范性的, 更多命令参数请用这里介绍的'/?'命令查看windows帮助. 

  1 ::::::::::::::::::::::::::::::::::::::::::  echo, @ - 回显控制命令

@					:: 关闭单行回显
echo off			:: 从下一行开始关闭回显
@echo off			:: 从本行开始关闭回显. 一般批处理第一行都是这个
echo on				:: 从下一行开始打开回显
echo				:: 显示当前是echo off状态还是echo on状态
echo.				:: 输出一个"回车换行", 一般就是指空白行
echo hello world	:: 输出hello world

"关闭回显" 是指运行批处理文件时, 只显示运行结果, 不显示文件里的每条命
令. 批处理开始和结束时, 系统都会自动打开回显. 

  2 :::::::::::::::::::::::::::::::::::::::::  errorlevel - 程序返回码

echo %errorlevel%	:: 用于判断上一条命令是否执行成功, 默认值为0.
					:: 一般命令执行出错会设 errorlevel 为1. 

  3 :::::::::::::::::::::::::::::::  dir - 列出文件和子目录(directory)

dir					:: 显示当前目录中的文件和子目录
dir /a				:: 同上, 但包括隐藏文件和系统文件
dir c: /a:d			:: 显示 C 盘当前目录中的目录
dir c:\ /a:-d		:: 显示 C 盘根目录中的文件, 与上例相比, 多了一个'\'
dir d:\mp3 /p/b	  	:: 逐屏显示 d:\mp3 目录里的文件, 只显示文件名
dir *.exe /s		:: 显示当前目录和子目录里所有的 .exe 文件

'*' 是通配符, 代表任意字符串. 通配符 '?' 代表任意一个字母或汉字, 如
'c*.*' 代表以 'c' 开头的所有文件, '?.exe' 代表所有文件名是一个字母的
'.exe' 文件. 如果指定的目录或文件不存在, 将返回 errorlevel=1. 使用 dir
可以看到, 每个文件夹都有 2 个子目录 '.' 和 '..', '.' 代表当前目录, 
'..' 代表当前目录的上级目录. 

dir .				:: 显示当前目录中的文件和子目录
dir ..				:: 显示上级目录中的文件和子目录

  4 :::::::::::::::::::::::::::::  cd - 更改当前目录(change directory)
 
cd mp3				:: 进入当前目录中的 mp3 目录
cd ..				:: 进入上级目录
cd\					:: 进入根目录
cd					:: 显示当前目录
cd /d d:\mp3		:: 可以同时更改盘符和目录

文件名带空格时需要加上引号, 如: 

	cd "Documents and Settings"\All users

如果目录不存在, 则返回 errorlevel=1. 

  5 :::::::::::::::::::::::::::::::::::  md - 创建目录(make directory)
 
md abc				:: 在当前目录里建立子目录 'abc'
md d:\a\b\c			:: 如果 'd:\a' 不存在, 将会自动创建

  6 :::::::::::::::::::::::::::::::::  rd - 删除目录(remove directory)
 
rd abc				:: 删除目录 'abc', 要求为空目录
rd /s/q d:\temp		:: 删除 'd:\temp' 及其下的所有内容, 无需按 Y 确认

注意! 用 'rd' 和 'del' 删除的文件和目录都不会进入回收站! 

  7 ::::::::::::::::::::::::::::::::::::::::::  del - 删除文件(delete)
 
del d:\test.txt		:: 删除指定文件, 不能是隐藏, 系统, 只读文件
del *.*				:: 删除当前目录里的所有文件, 不包括隐藏, 系统, 只
					:: 读文件, 要求按 Y 确认
del /q/a/f d:\temp\*.*
					:: 删除'd:\temp'下的所有文件, 包括隐藏, 只读, 系
					:: 统文件, 不包括子目录
del /q/a/f/s d:\temp\*.*
					:: 删除'd:\temp'及子目录下的所有文件, 包括隐藏,
					:: 只读, 系统文件, 不包括子目录
					 
注意! 用 'rd' 和 'del' 删除的文件和目录都不会进入回收站!

  8 ::::::::::::::::::::::::::::::::::::::::::::  ren - 重命名(rename)
 
ren 1.txt 2.bak		:: 把 1.txt 更名为 2.bak
ren *.txt *.ini		:: 把当前目录里所有.txt文件改成.ini文件
ren d:\temp tmp		:: 重命名文件夹

  9 ::::::::::::::::::::::::::::::::::::::::  cls - 清屏(clear screen)

 10 ::::::::::::::::::::::::::::::::::::::::::::::  type - 显示文件内容
 
type c:\boot.ini	:: 显示文本文件的内容, 只支持 ANSI 和 ASCII 编码
type *.txt			:: 显示当前目录里所有 '.txt' 文件的内容

 11 :::::::::::::::::::::::::::::::::::::::::::::::::::::  copy - 拷贝

copy c:\test.txt d:\
					:: 复制 c:\test.txt 文件到 d:\
copy c:\test.txt d:\test.bak
					:: 复制 c:\test.txt 文件到 d:\ , 重命名为 test.bak
copy c:\*.*			:: 复制 c:\ 所有文件到当前目录, 不含隐藏, 系统文件
copy con test.txt	:: 从屏幕上输入, ctrl+z 结束, 内容存为 test.txt 
					:: con 代表屏幕, prn 代表打印机, nul 代表空设备
copy 1.txt + 2.txt 3.txt
					:: 合并 1.txt 和 2.txt 的内容, 保存为 3.txt. 如果
					:: 不指定 3.txt, 则保存到 1.txt
copy test.txt +		:: 复制文件到自己, 实际上是修改了文件日期

 12 :::::::::::::::::::::::::::::::::::::::  title - 设置 cmd 窗口标题

title 新标题		:: 可以看到 cmd 窗口的标题栏变了

 13 :::::::::::::::::::::::::::::::::::::  ver - 显示系统版本(version)

 14 :::::::::::::::::::::::::::::::::::::::  label, vol - 卷标(volume)

vol					:: 显示卷标
label				:: 显示卷标, 并提示输入新卷标
label c:system		:: 设置 C 盘的卷标为 system

 15 ::::::::::::::::::::::::::::::::::::::::::::::::::::  pause - 暂停

运行该命令时, 将显示下面的消息: 

	请按任意键继续 . . .

一般用于看清楚屏幕上显示的内容. 

 16 ::::::::::::::::::::::::::::::::::::::::::::::::::  rem, :: - 注释

注释行不执行操作. 

 17 :::::::::::::::::::::::::::::::::::::::::  date和time - 日期和时间

date				:: 显示当前日期, 并提示输入新日期, enter 略过输入
date/t				:: 显示当前日期
time				:: 显示当前时间, 并提示输入新时间, enter 略过输入
time/t		  		:: 显示当前时间

 18 ::::::::::::::::::::::::::::::::::::::::::::::::::  goto, : - 跳转

:label		 		:: 行首为 ':' 表示该行是标签行, 标签行不执行操作
goto label	 		:: 跳转到指定的标签行

 19 :::::::::::::::::::::::::::::::::::::::::::  find - (外部命令)查找

find "abc" c:\test.txt
					:: 在 c:\test.txt 文件里查找含 'abc' 的行. 如果找 >
					:: 不到, 返回 errorlevel=1
find /i "abc" c:\test.txt
					:: 查找含 'abc' 的行, 忽略大小写
find /c "abc" c:\test.txt
					:: 显示含 'abc' 的行的行数

 20 :::::::::::::::::::::::::::::::::::::::  more - (外部命令)逐屏显示

more c:\test.txt	:: 逐屏显示 c:\test.txt 的文件内容

 21 :::::::::::::::::::::::::::::::::::::::::::::  tree - 显示目录结构

tree d:\			:: 显示 D 盘的文件目录结构

 22 ::::::::::::::::::::::::  & - 顺序执行多条命令, 而不管是否执行成功

	c: & cd\ & dir /w

 23 :::::::::::::::::::::::::::    && - 顺序执行多条命令, 遇出错则停止

f: && cd\ && dir >c:\test.txt
					:: 如果 f 盘不存在, 后面 2 条命令将不会执行
find "ok" c:\test.txt && echo 成功
					:: 如果找到了 'ok' 字样, 就显示 '成功', 否则不显示

 24 :::::::::::::::::::::::::::  || - 顺序执行多条命令, 执行正确则停止

find "ok" c:\test.txt || echo 不成功
					:: 如果找不到 'ok' 字样, 显示 '不成功', 否则不显示

 25 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::  | - 管道

将前一个命令的执行结果作为后一个命令的输入, 如: 

	dir *.* /s/a | find /c ".exe"

表示先执行 dir 命令, 对其输出的结果执行后面的 find 命令. 该命令用于输
出当前文件夹及所有子文件夹里的.exe文件的个数. 

前面已经提到, 逐屏输出文件内容, 可以用: 

	more c:\test.txt
	
其实还有一个命令能达到相同效果: 

	type c:\test.txt|more

 26 ::::::::::::::::::::::::::::::::::::::::::::::  >和>> - 输出重定向

> 					:: 清除文件内容再写入. 文件如果不存在, 则自动生成
>> 					:: 追加内容到文件末尾. 文件如果不存在, 则自动生成
echo hello world >c:\test.txt
					:: 生成 c:\test.txt 文件, 内容为 'hello world'
					:: 这个格式在批处理文件里用得很多, 可以生成.reg
					:: .bat .vbs 等临时文件
type c:\test.txt >prn
					:: 输出到打印机, 屏幕上不显示文件内容
echo hello world >con
					:: 在屏幕上显示 'hello world'. 实际上所有输出都默
					:: 认为 >con
copy c:\test.txt f: >nul
					:: 拷贝文件, 不显示 '文件复制成功' 的提示信息. 但
					:: 如果 f 盘不存在, 还是会显示出错信息
copy c:\test.txt f: >nul 2>nul
					:: 不显示 '文件复制成功' 的提示信息. f 盘不存在的
					:: 话, 也不显示错误提示信息
echo ^^ ^> >c:\test.txt
					:: 生成的文件内容为 ^ >
					:: ^ 和 > 是控制命令, 输出时应当在前面加上转义符 ^
echo load "%%1" "%%2" >c:\test.txt
					:: % 也要转义. 生成的文件内容为 load "%1" "%2"
					:: 批处理文件里, 用这个格式把命令行参数输出到文件. 
					:: 参见 28 命令行参数. 

 27 ::::::::::::::::::::::::::::::::::::::::::::::::::::::  < - 读文件

一般用于 date time label 等需要等待输入的命令, 如: 

	@echo off
	echo 2005-05-01 >temp.txt
	date <temp.txt
	del temp.txt
	
这样就可以不等待输入, 直接修改当前日期. 

 28 ::::::::::::::::::::::::::::::::::::  %0 %1 ... %9 %* - 命令行参数

%0 					:: 批处理文件本身
%1 					:: 第一个参数
%9 					:: 第九个参数
%* 					:: 从第一个参数开始的所有参数

在 C 盘根目录新建 test.bat, 内容如下: 

	@echo off
	echo %0
	echo %1
	echo %2
	echo %*

运行cmd, 输入 c:\test.bat "/a" /b /c /d, 可以看出每个参数的含义. 
修改test.bat内容如下: 

	@echo off
	echo %1
	echo %~1
	echo %0
	echo %~f0
	echo %~d0
	echo %~p0
	echo %~n0
	echo %~x0
	echo %~s0
	echo %~a0
	echo %~t0
	echo %~z0

再运行cmd, 输入 c:\test.bat "/a" /b /c /d, 可以参照 call/? 或 for/? 看
出每个参数的含义. 注意这里可以对文件进行日期比较和大小比较. 

 29 ::::::::::::::::::::::::::::::::::::::::::::::::::  set - 设置变量

引用变量可在变量名前后加 % , 即 %变量名%

set					:: 显示目前可用的变量, 包括系统变量和自定义的变量
echo %SystemDrive%	:: 显示系统盘盘符. 系统变量可以直接引用
set p				:: 显示所有以 p 开头的变量, 没有则 errorlevel=1

set p=aa1bb1aa2bb2	:: 设置变量 p, 并赋值为 aa1bb1aa2bb2
echo %p%			:: 显示变量 p 代表的字符串, 即 aa1bb1aa2bb2
echo %p:~6%			:: 显示变量 p 中第 6 个字符后的所有字符, 即 aa2bb2
echo %p:~6,3%		:: 显示第 6 个字符以后的 3 个字符, 即 aa2
echo %p:~0,3%		:: 显示前 3 个字符, 即 aa1
echo %p:~-2%		:: 显示最后面的 2 个字符, 即 b2
echo %p:~0,-2%		:: 显示除最后 2 个字符外的其它字符, 即 aa1bb1aa2b
echo %p:aa=c%		:: 用 c 替换变量 p 中所有的 aa, 即 c1bb1c2bb2
echo %p:aa=%		:: 将 p 中的所有 aa 字符串置换为空, 即 1bb12bb2
echo %p:*bb=c%		:: 首个 bb 及其之前的所有字符被换为 c, 即 c1aa2bb2
set p=%p:*bb=c%		:: 设置变量 p, 赋值为 %p:*bb=c% , 即 c1aa2bb2

set /a p=39			:: 设置 p 为数值型变量, 值为 39
set /a p=39/10		:: 舍去小数部分, 39/10=3
set /a p=p/10		:: 用 /a 参数时, '=' 后面的变量可以不加 % 直接引用
set /a p="1&0"		:: "与" 运算, 要加引号. 其它支持的运算符参见 set/?

set p=				:: 取消 p 变量
set /p p=请输入		:: 屏幕上显示 '请输入', 并将输入的字符串赋给变量 p 
					:: 这可以取代 choice 命令
					  
变量在 if 和 for 的复合语句里是一次性全部替换的, 如: 

	@echo off
	set p=aaa
	if %p%==aaa (
	echo %p%
	set p=bbb
	echo %p%	)

结果显示: 

	aaaaaa

因为在读取 if 语句时已经将所有 %p% 替换为 aaa. 这里的 "替换", 在 /? 帮
助里就是指 "扩充", "环境变量扩充" 可以启用 "延缓环境变量扩充", 用 ! 来
引用变量, 即 !变量名!: 

	@echo off
	SETLOCAL ENABLEDELAYEDEXPANSION
	:: Enable delayed expansion
	set p=aaa
	if %p%==aaa (
	echo %p%
	set p=bbb
	echo !p!	)
	ENDLOCAL

结果显示: 
	
	aaabbb
	
还有几个动态变量, 运行 set 看不到

%CD%				:: 代表当前目录的字符串
%DATE%				:: 当前日期
%TIME%				:: 当前时间
%RANDOM%			:: 0~32767 的随机整数
%ERRORLEVEL%		:: 当前 ERRORLEVEL 值
%CMDEXTVERSION%		:: 当前命令处理器扩展名版本号
%CMDCMDLINE%		:: 调用命令处理器的原始命令行. echo 查看每个变量值
					:: 如 echo %time% . 注意 %time% 精确到毫秒, 在批处
					:: 理需要延时处理时可以用到

 30 ::::::::::::::::::::::::::::::::::::::::::::  start - 调用外部程序
 
批处理中调用外部程序的命令, 等外部程序完成后才继续执行剩下的指令. 

调用图形界面打开D盘: 
	
	start explorer d:\

启动"劲舞团": 

	@echo off
	cd /d %~dp0regedit /s 劲舞团.reg
	start patcher.exe

不加 start 命令的话, "劲舞团" 运行时, 后面会有个黑乎乎的 cmd 窗口. 

 31 :::::::::::::::::::::::::::::::::::::::::::::::  call - 调用批处理

批处理中调用另外一个批处理的命令, 否则剩下的批处理指令将不会被执行. 有
时应用程序用 start 调用出错, 也可以 call 调用. 

 32 ::::::::::::::::::::::::::::::::::::::::  choice (外部命令) - 选择

让用户输入一个字符, 从而运行不同的命令, errorlevel 为 1, 2, 3...
win98 里是 choice.com. win2000pro 里没有, 可以从 win98 里拷过来.
win2003 里是 choice.exe. 

choice /N /C y /T 5 /D y>nul
					:: 延时5秒

下面是个 choice 语句的例子

	@echo off
	rem 以下在 win2000pro 运行通过, 从 win98 里拷的 chioce.com 文件
	choice /c:abc aaa,bbb,ccc
	if errorlevel 3 goto ccc
	if %errorlevel%==2 goto bbb
	if errorlevel==1 goto aaa
	rem 必须先判断数值高的返回码
	rem 可以看到 errorlevel 值的判断有 3 种写法
	rem 直接运行 chioce 相当于运行
	
	choice /c:yn:aaa
	echo aaa
	goto end
	:bbb
	echo bbb
	goto end
	:ccc
	echo ccc
	goto end
	:end

 33 :::::::::::::::::::::::::::::::::::::::::  assoc, ftype - 文件关联

assoc 设置 "文件扩展名" 关联, 关联到 "文件类型";
ftype 设置 "文件类型" 关联, 关联到 "执行程序和参数". 
当你双击一个 .txt 文件时, windows 并不是根据 .txt 直接判断用
notepad.exe 打开, 而是先判断 .txt 属于 txtfile "文件类型", 再调用
txtfile 关联的命令行
	
	txtfile=%SystemRoot%\system32\NOTEPAD.EXE %1

可以在 "文件夹选项" -> "文件类型" 里修改这 2 种关联. 

assoc				:: 显示所有 "文件扩展名"关联
assoc .txt			:: .txt代表的 "文件类型", 显示 .txt=txtfile
assoc .doc			:: 显示 .doc=Word.Document.8
assoc .exe			:: 显示 .exe=exefile
ftype				:: 显示所有 "文件类型" 关联
ftype exefile		:: 显示 exefile 类型关联的命令行, exefile="%1" %*
assoc .txt=Word.Document.8
					:: 设置 .txt 为 word 类型的文档, 可以看到 .txt 文
					:: 件的图标都变了

如果该关联已经被破坏, 可以运行 command.com , 再输入这条命令

assoc .txt=txtfile
					:: 恢复 .txt 的正确关联
ftype exefile="%1" %*
					:: 恢复 exefile 的正确关联


 34 ::::::::::::::::::::::::::::::::::::::  pushd, popd - 切换当前目录

@echo off
c: & cd\ & md mp3	:: 在 C:\ 建立 mp3 文件夹
md d:\mp4			:: 在 D:\ 建立 mp4 文件夹
cd /d d:\mp4		:: 更改当前目录为 d:\mp4
pushd c:\mp3		:: 保存当前目录, 并切换当前目录为 c:\mp3
popd				:: 恢复当前目录为刚才保存的 d:\mp4

一般用处不大, 在当前目录名不确定时, 会有点帮助. 

 35 :::::::::::::::::::::::::::::::::::::  subst (外部命令) - 映射磁盘

subst z: \\server\d	:: 这样输入 z: 就可以访问 \\server\d 了
subst z: /d			:: 取消该映射
subst				:: 显示目前所有的映射

 36 :::::::::::::::::::::::::::::::::::::  xcopy (外部命令) - 文件拷贝

xcopy d:\mp3 e:\mp3 /s/e/i/y
					:: 复制 d:\mp3 文件夹, 所有子文件夹和文件到 e:\,
					:: 覆盖已有文件. /i 表示如果 e:\ 没有 mp3 文件夹就
					:: 自动新建一个, 否则会询问. 

 37 ::::::::::::::::::::::::::::::::::::::::::::::::::::  其他内部命令

shift				:: 传递给批处理的参数不止 9 个时, 用以切换参数
color				:: 设置 cmd 窗口的显示颜色
pormpt				:: 更改命令提示符号

 38 ::::::::::::::::::::::::::::::::::  format (外部命令) - 格式化硬盘

format c: /q/u/autotest/q
					:: 快速格式化, /autotest 表示自动格式化, 不需按 Y
					:: 确认. /u 表示每字节用 F6 覆盖硬盘数据, 使其不可
					:: 用软件恢复
format c: /c		:: 格式化 C 盘, 并检测坏道

 39 :::::::::::::::::::::::::::::::::::::  fdisk (外部命令) - 硬盘分区

win2000 无此命令. win98 里的 fdisk 不支持 80G 以上大硬盘, winme 里的支
持 fdisk/mbr 重建硬盘分区表, 一般用于清除引导区病毒, 还原精灵. 注意该
命令不能从硬盘启动, 必须软驱或光驱启动后直接运行. 

 40 :::::::::::::::::::::::::::::::::::::::::::::::::  ping (外部命令)
 
ping -l 65500 -t 192.168.1.200
					:: 不停向 192.168.1.200 发送大小为 65500 byte 的数
					:: 据包
ping -n 10 127.0.0.1>nul
					:: ping自己10次, 可用于批处理延时 10 秒

 41 ::::::::::::::::::::::::::::::::::::::::  sc (外部命令) - 服务控制

sc create aaa displayname=bbb start=auto
	binpath="C:\WINDOWS\System32\alg.exe"
					:: 创建服务, 服务名称:aaa; 显示名称:bbb;
					:: 启动类型:自动; 可执行文件的路径
					:: "C:\WINDOWS\System32\alg.exe"
sc description aaa "ccc"
					:: 更改 aaa 的描述为ccc
sc config aaa start=disabled
	binpath="C:\WINDOWS\System32\svchost.exe -k netsvcs"
					:: 更改 aaa 的启动类型:已禁用; 可执行文件路径为
					:: "C:\WINDOWS\System32\svchost.exe -k netsvcs"
sc config aaa start=demand displayname=ddd
					:: 更改 aaa 的启动类型:手动更改; 显示名称:ddd
sc start aaa		:: 启动 aaa 服务
sc stop aaa			:: 停止 aaa 服务
sc delete aaa		:: 删除 aaa 服务
