----操作----

浏览器配置：
  chrome://flags
  edge://flags

命令行解决方案：windows terminal + git bash

    * 在商店下载最新的 windows terminal
    * 在镜像下载 git for windows >= v2.29.2. 低版本的 git 套装中 vim 有问题
      最新: 使用包管理器 chocolatey 或 scoop 下载 git, vim 等即可.
    * 从菜单打开 windows terminal 配置, 或找到文件
      `%APPDATA%\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`,
      将 git 安装目录中的 bash 添加为一个 profile
    * 你也可以为 windows terminal 配置喜爱的颜色主题
    * 愉快地在 windows 下使用 bash: ls, git, vim...

输入法默认输入英文

    此设定在微软拼音的选项中，五笔用户应当先开启拼音，
    在拼音选项里将默认模式一项选为英文。
    完成设定后，就可移除拼音输入法，并不影响设定结果。

开机启动项

    任务管理器->"启动"选项卡。选中不希望开机自启动的程序，点击"禁用"。

视觉特效

    控制面板->高级系统设置->"高级"选项卡->性能

环境变量

    控制面板->搜索"环境变量"->编辑。注意环境变量有用户的和系统的之分。
    一般为了在 cmd 中运行程序 （如 gcc），会修改系统的 path 环境变量。
    试试看：新建一个名为 ~ 的用户变量，值为 %USERPROFILE%，
    然后打开资源管理器，在地址栏输入 %~% 并回车。
    一切正常的话，你将跳转到家目录。

    powershell 自带 refreshenv 命令, cmd 中的解决方案则是:
    安装 chocolatey, 就可以使用 C:/ProgramData/chocolatey/bin/RefreshEnv.cmd 

系统配置

    在开始菜单键入"系统配置"。勾选 "隐藏所有Microsoft服务" 后，
    取消不需要的服务。尽量不要取消 intel, nvidia 等开头的服务。

创建扩展名关联

    扩展名关联规定了特定后缀的文件的打开方式。
    控制面板->程序->默认程序
    ftype /?
    assoc /?

自定义右键菜单

    ???

从光盘镜像(iso)安装程序

    在资源管理器中右击第一个镜像文件，选择装载(mount)。
    现在可以从资源管理器左侧目录树中看到装载的光盘。
    运行光盘中的 setup 或 install 程序。
    当需要插入下一张光盘时，弹出当前光盘，再装载下一个镜像文件。

启用 windows 10 的图片与传真查看器 (Photo Viewer)

    参考: https://www.howtogeek.com/225844/how-to-make-windows-photo-viewer-your-default-image-viewer-on-windows-10/

    如果你的 windows 10 是从 win 7 或 win 8 升级而来的，它很可能已经带有
    Photo Viewer。如果你的 windows 10 是全新安装的，Photo Viewer 默认不会启用，
    它以 dll 的形式存在。下面的命令是启动它的一种方法 (%1 表示要查看的图片文件)

        rundll32.exe c:\windows\system32\shimgvw.dll,ImageView_Fullscreen %1

    另一种有风险的方法是修改注册表。参考以上链接。

自动运行 batch 脚本

    在 windows 启动时: 将脚本拷贝到

        C:\Windows\System32\GroupPolicy\Machine\Scripts\Startup

    并打开组策略作相关设定。

    在用户登录时: 将脚本拷贝到

        C:\Windows\System32\GroupPolicy\User\Scripts\Logon

    并打开组策略作相关设定。

    在 cmd 启动时: 修改注册表

    HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun="脚本路径"

压缩文件以节约磁盘空间

    这是 windows 的一个功能，并不是让你手动去用 zip 或 rar 之类的压缩软件。
    不推荐压缩 C 盘以免影响电脑运行效率。
    在磁盘根目录（如 D:\）右击菜单中选择属性，找到
    “压缩文件以节约磁盘空间”勾选框，勾选后点击应用，
    并确认应用到所有子文件夹中。
    如果你想取消压缩，只需按同样的操作，将勾选框去掉即可。
    注意，压缩操作可能比较费时。

查看程序的位数

    以二进制查看器打开 .exe 文件, 找到 "This program cannot be run in DOS mode",
    然后在后面一点找 "PE..L" (32bit) 或 "PE..d" (64bit).

    $ od -A x -c myprogram.exe -N 1000 | grep 'P\s*E'

用命令行删除目录

    $ del /s /q tmp
    $ rmdir /s /q tmp

hosts file

    C:\WINDOWS\System32\drivers\etc\hosts

    修改了 hosts 文件后，用命令 ipconfig /flushdns 刷新它

run history

    regedit:\Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU

----应用精选----

UWP - 通用 windows 平台

    8zip                        压缩/解压
    Hello, UWP                  UWP 漫游指南
    Transcoder                  媒体转码
    WiFi Commander              界面酷炫的 wifi 配置应用

办公

    1Checker                    易改，英语作文批改
    AABBYY Finereader           图像转文字
    Adobe Bridge                Adobe 全家桶控制中心
    Ashampoo Snap               截图/录屏
    Foxit Reader                福昕，pdf阅读
    Picasa                      图片编辑器，google 出品
    Sublime Text                性感的代码/文本编辑器
    VsCode                      代码编辑器，微软良心产品

插件

    Clover                      为资源管理器添加标签，像 chrome 一样
    Ditto                       剪贴板查看器
    WindowTabs                  为任何可能的窗口添加标签，像 chrome 一样

传输

    NetSpeedMonitor             监控网速
    PushBullet                  跨平台文件传输
    Scatter                     跨平台同步剪贴板，亦可传输文件

媒体

    K-Lite Codec Pack           结合 wmplayer 使用，支持多种媒体格式
    KMPlayer                    媒体播放器

输入法

    Rimeime                     小狼毫
    wnwb                        万能五笔

外观

    MacType                     提升字体渲染效果
    f.lux                       屏幕色温调节

文件

    7zip                        压缩/解压
    BandZip                     压缩/解压
    Everything                  本地文件搜索
    FileLocator Pro             检索文档内容
    Listary                     本地文件搜索

系统

    ADSafe                      免费去广告
    AutoHotKey                  脚本语言，自定义系统快捷键
    CCleaner                    系统清理/优化
    Defraggler                  磁盘碎片整理
    Dism++                      系统清理/优化
    Duplicate Cleaner           查找重复文件
    LockHunter                  解决文件/设备占用问题
    RevoUninPro                 强力卸载

游戏

    Google Earth                观看地球与其他天体
    LaserTank                   激光坦克，2d 棋盘 策略
    Celeste                     深蓝，像素 跑跳
    ...


----应用----

记事本 (notepad)

    默认保存成 ANSI 编码，.txt 后缀。
    可以在保存时选择 utf-8 编码，all files。
    另一种快速设定后缀名的方法是在保存的文件名两边加上双引号，如

    "tmp.c"

----快捷键----

    F1                          帮助
    F2                          重命名
    F3                          搜索文件
    F4                          打开地址栏列表
    F5                          刷新
    F6/Tab                      下一选项
    F10/ALT                     激活菜单栏
    F12                         另存为

    End                         显示当前窗口的底端
    Home                        显示当前窗口的顶端
    Backspace                   返回上一页面
    Delete                      删除（移入回收站）
    Shift-Delete                彻底删除
    Tab                         下一选项
    Shift-Tab                   上一选项
    Space                       选中或取消选中复选框

    PrtSc                       截屏到剪贴板
    Alt-PrtSc                   截窗口到剪贴板
    Alt-Shift-PrtSc             跳到前一个窗口
    NumLock- +/-                展开/折叠文件夹
    NumLock-*                   展开所有文件夹

    Win                         开始菜单
    Win-F1                      帮助
    Win-Break                   打开“系统属性”对话框
    Win-Pause                   显示“系统属性”对话框
    Win-B                       选中桌面右下方工具栏
    Win-D                       显示桌面
    Win-E                       资源管理器
    Win-F                       查找
    Win-Ctrl-F                  （网上邻居）搜索计算机
    Win-L                       锁定计算机/切换用户
    Win-M                       最小化所有窗口
    Win-Shift-M                 还原最小化窗口
    Win-Ctrl-M
    Win+R                       打开“运行”对话框
    Win+U                       打开辅助工具管理器

    Win-Number                  启动任务栏上的第 n 个程序
    Win-Shift-Number            启动任务栏锁定程序的新实例
    Win-Alt-Number              打开任务栏锁定程序的跳转列表
    Win-Tab                     通过Aero Flip 3D循环切换任务栏上的程序
    Win-Ctrl-Tab                通过Aero Flip 3D
                                使用方向键循环切换任务栏上的程序 
    Win-Space                   预览桌面 
    Win-Home                    最小化所有非活动窗口
    Win-↑/↓                     最大化/最小化窗口
    Win-←/→                     最大化窗口到屏幕左/右侧
    Win-Shift-↑                 使窗口顶天立地
    Win-Shift-←/→               使窗口在显示器间移动
    Win-G                       循环切换小工具
    Win-P                       演示显示模式
    Win-T                       循环切换任务栏上的程序
    Win-U                       打开轻松访问中心
    Win-X                       打开 Windows 移动中心

    Alt-F4                      关闭程序
    Alt-Backspace               撤销
    Alt-Shift-Backspace         重做
    Alt-Ctrl-Delete             任务管理器
    Alt-Letter                  与该字母匹配的菜单命令
    Alt-Space                   打开程序左上角的菜单
    Alt-Tab/Esc                 切换程序
    Alt-Shift+Tab/Esc           反向切换程序
    Alt-Enter                   查看属性/（命令提示符）全屏
    Alt-DoubleClick             查看属性
    Alt-Drag                    创建快捷方式

Alt-Space→ X表示先按下Alt-Space组合键，然后松开组合键，再按下X键。下同。

    Alt-Space→ X                最大化窗口
    Alt-Space→ N                最小化窗口

    Menu→ I→ N                  按名称排列图标
    Menu→ I→ T                  按类型排列图标
    Menu→ I→ Z                  按大小排列图标
    Menu→ I→ D                  按日期排列图标
    Menu→ W→ F                  新建文件夹
    Menu→ R                     属性
    Menu→ E                     刷新
    Menu→ S                     创建快捷方式
    Menu→ O                     打开
    Menu→ T→ A                  发送到软盘
    Menu→ M                     重命名
    Menu→ U                     撤消
    Menu→ P                     粘贴
    Menu→ A                     全选

    Ctrl-F4                     关闭标签
    Ctrl-F6                     切换到当前应用程序中的下一个文本
    Ctrl-Esc                    打开开始菜单
    Ctrl-Shift-Esc              打开任务管理器
    Ctrl-Tab                    选项卡前移
    Ctrl-Shift-Tab              选项卡后移
    Ctrl-Arrow                  滚动屏幕
    Ctrl-Alt-Arrow              滚动屏幕
    Ctrl-Shift                  切换输入法
    Ctrl-Space                  切换输入法
    Ctrl-Insert                 复制
    Ctrl-A                      全选
    Ctrl-C                      复制
    Ctrl-F                      查找
    Ctrl-N                      新建
    Ctrl-Shift-N                新建文件夹
    Ctrl-O                      打开
    Ctrl-P                      打印
    Ctrl-S                      保存
    Ctrl-V                      粘贴
    Ctrl-W                      关闭窗口
    Ctrl-X                      剪切
    Ctrl-Y                      重做
    Ctrl-Z                      撤消
    Ctrl-Drag                   复制
    Ctrl-Shift-Drag             创建快捷方式

    Shift-Insert                粘贴
    Shift-F10                   右键菜单
    Shift(hold)                 跳过自动播放的CD/跳过自启动的宏

浏览器

    F1                          帮助
    F4                          打开地址栏列表
    F5                          刷新
    Ctrl-F5                     强行刷新
    F6                          选中地址栏
    F10                         激活菜单栏 
    F11                         全屏

    Alt-←/→                     后退/前进
    Alt-Space                   显示系统菜单
    Alt- -                      显示多文档界面程序的系统菜单
    Ctrl-F4                     关闭标签
    Ctrl-D                      添加到收藏夹
    Ctrl-Click                  后台打开
    Shift-Click                 新窗口打开

文字编辑

    Ctrl-→                      移动插入点到下一个单词的起始处
    Ctrl-←                      移动插入点到前一个单词的起始处
    Ctrl-↓                      移动插入点到下一段落的起始处
    Ctrl-↑                      移动插入点到前一段落的起始处
    Ctrl-Shift-Arrow            突出显示文本
    Shift-Arrow                 选择文本

辅助功能

    右Shift(hold)               筛选键
    左Alt-左Shift-Printscreen   高对比度
    左Alt-左Shift-NumLock       鼠标键
    Shift(5times)               粘滞键
    NumLock(hold)               切换键


----运行----

win-r, 然后输入:

    cmd                         命令提示符
    control                     控制面板
    explorer                    资源管理器
    mspaint                     画图
    netplwiz                    用户账户管理
    taskmgr                     任务管理器
    wmplayer                    windows media player
    cmd /k shutdown /s /t 0     关机
    cmd /k shutdown /r /t 0     重启

更多

    calc                        计算器
    certmgr.msc                 证书管理实用程序
    charmap                     字符映射表
    chkdsk                      Chkdsk磁盘检查
    ciadv.msc                   索引服务程序
    cleanmgr                    垃圾整理
    cliconfg                    SQL SERVER 客户端网络实用程序
    clipbrd                     剪贴板查看器
    cmd                         命令提示符
    compmgmt.msc                计算机管理
    conf                        netmeeting

    dcomcnfg                    打开系统组件服务
    ddeshare                    打开DDE共享设置
    devmgmt.msc                 设备管理器
    dfrg.msc                    磁盘碎片整理程序
    diskmgmt.msc                磁盘管理实用程序
    drwtsn32                    系统医生
    dvdplay                     DVD播放器口
    dxdiag                      检查DirectX信息

    eudcedit                    造字程序
    eventvwr                    事件查看器
    explorer                    资源管理器

    fsmgmt.msc                  共享文件夹管理器

    gpedit.msc                  组策略

    iexpress                    木马捆绑工具，系统自带

    logoff                      注销
    lusrmgr.msc                 本机用户和组

    magnify                     放大镜
    mem                         显示内存使用情况
    mip                         数学公式编辑器
    mmc                         控制台
    mobsync                     同步命令
    mplayer2                    媒体播放机
    msconfig                    系统配置
    mspaint                     画图
    mstsc                       远程桌面连接

    narrator                    屏幕“讲述人”
    net start messenger         开始信使服务
    net stop messenger          停止信使服务
    netstat -an                 (TC)命令检查接口
    notepad                     记事本
    nslookup                    网络管理的工具向导
    ntbackup                    系统备份和还原
    ntmsmgr.msc                 移动存储管理器
    ntmsoprq.msc                移动存储管理员操作请求

    odbcad32                    ODBC数据源管理器
    oobe/msoobe /a              检查XP是否激活
    osk                         屏幕键盘

    packager                    对象包装程序
    perfmon.msc                 计算机性能监测程序
    progman                     程序管理器
    psr                         步骤记录器

    regedit.exe                 注册表
    regedt32                    注册表编辑器
    regsvr32 /u *.dll           停止dll文件运行
    regsvr32 /u zipfldr.dll     取消ZIP支持
    rononce -p                  15秒关机
    rsop.msc                    组策略结果集

    secpol.msc                  本地安全策略
    services.msc                本地服务设置
    sfc /scannow                windows文件保护
    sfc.exe                     系统文件检查器
    shrpubw                     创建共享文件夹
    sigverif                    文件签名验证程序
    sndrec32                    录音机
    sndvol32                    音量控制程序
    snippingtool                截图程序
    syncapp                     创建一个公文包
    sysedit                     系统配置编辑器
    syskey                      系统加密, 一旦加密就不能解开.
                                保护 windows xp 系统的双重密码

    taskmgr                     任务管理器
    tourstart                   xp简介（安装完成后出现的漫游xp程序）
    tsshutdn                    60秒倒计时关机命令

    utilman                     辅助工具管理器

    wiaacmgr                    扫描仪和照相机向导
    winchat                     XP自带局域网聊天
    winmsd                      系统信息
    winver                      检查Windows版本
    wmimgmt.msc                 打开windows管理体系结构(WMI)
    write                       写字板
    wscript                     windows脚本宿主设置
    wupdmgr                     windows更新程序

神秘序列码
    我的电脑    explorer.exe ::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
    网上邻居    explorer.exe ::{208D2C60-3AEA-1069-A2D7-08002B30309D}
    回收站  explorer.exe ::{645FF040-5081-101B-9F08-00AA002F954E}
