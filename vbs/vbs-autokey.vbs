set ws = wscript.createObject("Wscript.Shell")
dim res
res = msgBox("请切换到天龙八部", 64, "提示")

do
  wscript.sleep 2000
  do while ws.appActivate("《新天龙八部》永恒经典版 3.65.6106 (双线-超级双线:天龙)")=true
    ws.sendKeys "^{TAB}"	' 按键
    wscript.sleep 100		' 间隔时间
    ws.sendKeys "{F1}"	' 按键
    wscript.sleep 1000		' 打怪时间
  loop
  res = msgBox("退出自动按键？", 65, "提示")
loop while res = vbcancel