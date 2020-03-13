#!/usr/bin/env lua

print("hello world")
-- 格式化输出很麻烦的样子
print(string.format('result = %d', 1))

--[=[
  多行注释
--]=]
print('version:')

--[[
  另一种多行注释
--]]

---[[ 多加一条横线可以使代码得以运行
print(_VERSION)
--]]

-- 如同 python, 给变量赋值即创建了变量
-- 给其赋值 nil 则删除了变量
-- 如同 python, lua 支持对多变量同时赋值
a, b = b, a -- 交换两变量的值
-- lua 的迷惑行为: 值少于变量时, 剩下的变量取 nil
a, b, c = 0 --> 0 nil nil

print(type(x)) -- 查看变量 x 的类型

-- 条件语句中, false 和 nil 是 false, 其它是 true.
-- lua 的迷惑行为: 0 和空表都是 true
if 0 and {} then
	print('0 and {} are true')
elseif false or nil then
	print("you won't see this")
end

-- lua 的数字是双精度类型
print(0.1+0.2) -- 0.3
print(1 ~= 2) -- 1 不等于 2, true
print(2^0.5) -- 根号 2

-- 与 js 不同, lua 尝试把字符串转换为数字
print('1'+1) -- 2

-- 字符串连接应该用 ..
print('hello '..'world') -- hello world
--print(1..2) 报错
print(1 .. 2) -- 12

-- 取字符串长度, 只需加前缀 #
str = 'hello'
print(#str) -- 5
print(#'字') -- 由你的编码决定, gbk 为 2, utf-8 为 3

-- 多行字符串
print([[<html>
<head></head>
<body>
</body>
</html>]])
print([[
<html>
<head></head>
<body>
</body>
</html>
]])

-- 表 (table) 的下标从 1 开始.
-- 数组, 哈希表, 对象等都可以用表实现
tab = {1, key='value', 2, nil, 4}
print(tab.key)
print(tab[1])
print(tab[2])
for k, v in pairs(tab) do -- 遍历所有键值对
	print(k..': '..v)
end
for i, v in ipairs(tab) do -- 只遍历数字下标, 遇 nil 停止
	print(i..': '..v)
end
-- 表中含有 nil 时, 表长是迷惑的
print(#tab)
print(#{1, nil, 3})
print(#{1, nil, 3, nil})

-- 函数
function foo()
	print('foooooo!')
	return 1
end

-- 匿名函数
print((function() return 'anonymous'; end)())

function echo(...) -- 这里 ... 可以理解为逗号隔开的一串变量
	local arg = {...}
	print(arg)
end

-- lua 的迷惑行为: 变量默认为全局, 哪怕在语句块或者函数中.
-- 用关键字 local 声明局部变量 (推荐)
do
	a = 666
	local b = 233
end
print(a, b) -- 666	nil

-- 循环语句
while condition do
	print('something')
end

repeat
	print('我只说一次')
until true

for i = 1,10 do
	print(i)
	i = i+1 -- 在循环内改变它, 不影响循环次数.
end

for i = 10,0,-2 do
	print(i)
end
-- 循环变量是局部的.
print(i) -- nil

-- 迭代器
function square(n, i)
	if i < n then
		i = i+1
		return i, i^2
	end
end
for i,s in square,3,0 do
	print(i,s)
end

-- 又一个迭代器
arr = {'a', 'b', 'c'}
function iter(arr)
	local i = 0
	local len = #arr
	print('init')
	return function()
		print('iter')
		i = i+1
		if i <= len then
			return arr[i]
		end
	end
end
for e in iter(arr) do
	print(e)
end

print('lua 的教程就这么多了') -- 鲁迅
