#!/usr/bin/env python3
# -*- coding: utf-8 -*-

## 卓铭鑫的 Python 学习笔记 ##

##  python                          与  c++
#   通常一行就是一条语句                语句以 ; 结束
#   if for 等语句以 : 引导一个缩进块    {}
#   for i in range(5) 语句不会使i == 5  会
#   and or not                          && || !
#   整数大小没有限制                    最大的整数由所占内存大小决定
#   9/3 = 3.0                           4/3 = 1
#   True False                          true false
#   elif                                else if
#   str, tuple...是不可变对象           声明成 const 才不可变
#   x**2                                x*x
#   不能重载函数, 但有多种灵活的参数    可以重载函数
#   值相同的整数对象其实是同一个对象    声明成引用才是同一个对象
#   但内容相同的 list 其实是不同对象
#   用对象给另一对象赋值时没有发生拷贝  发生了拷贝
#   可以随时添加/删除对象的属性/方法    不能


## 输出:

## print(...) - 输出
## 程序在每个逗号处插入一个空格
#   >>> print('The quick brown fox', 'jumps over', 'the lazy dog.')
#   The quick brown fox jumps over the lazy dog.
#
## 整数大小没有限制
#   >>> print(7744)
#   7744
#   >>> print('88 * 88 =',88*88)
#   88 * 88 = 7744
#
## r''内的字符不转义
#   >>> print(r'\\\t\\')
#   \\\t\\
#
## ''' ''' - 多行内容
#   >>> print('''line1
#   ... line2
#   ... line3''')
#   line1
#   line2
#   line3

## 转义字符一览:
#   \'    '
#   \"    "
#   \\    \
#   \n    换行
#   \t    制表符
#   \u    unicode字符(十六进制)
#   \x    十六进制
#   %%    %

## var = input(strPrompt) - 输入
#   >>> name = input('Please input your name: ')
#   Euler
#   >>> name
#   'Euler'
#   >>> print('Hello, ',name)

## 几个特殊常值:
#   None    空值（注意大小写）None == None
#   True    真值
#   False   假值

## 运算符:
#   >>> 10/3
#   3.3333333333333335
#   >>> 9/3
#   3.0
#   >>> 10//3
#   3

## 字符编码:
## ord(str), chr(int) -  数字——字符换算
#   >>> ord('A')
#   65
#   >>> ord('中')
#   20013
#   >>> chr(66)
#   'B'
#   >>> chr(25991)
#   '文'
#   >>> '\u4e2d\u6587'
#   '中文'
#
## str.encode(charset), bytes.decode(charset) - 字符串——二进制字节换算
#   >>> 'ABC'.encode('ascii')
#   b'ABC'
#   >>> '中文'.encode('utf-8')
#   b'\xe4\xb8\xad\xe6\x96\x87'
#   >>> '中文'.encode('gb2312')
#   b'\xd6\xd0\xce\xc4'
#   >>> '中文'.encode('ascii')
#   Traceback (most recent call last):
#     File "<stdin>", line 1, in <module>
#   UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-1: ordinal not in range(128)
#
#   >>> b'ABC'.decode('ascii')
#   'ABC'
#   >>> b'\xe4\xb8\xad\xe6\x96\x87'.decode('utf-8')
#   '中文'
#
## len(str) - 返回str的字符数或bytes的字节数
#   >>> len('ABC')
#   3
#   >>> len('中文')
#   2
#   >>> len(b'\xe4\xb8\xad\xe6\x96\x87')
#   6
#   >>> len('中文'.encode('utf-8'))
#   6

## 字符串格式化:
## 这就是无缝连接！
#     >>> 'Hello%s' % 'world'
#     'Helloworld'
#     >>> 'Hi, %s, you have $%d.' % ('Michael', 1000000)
#     'Hi, Michael, you have $1000000.'

## 占位符一览:
#   %d    整数
#   %2d   整数，宽度为2
#   %02d  整数，宽度为2，补0
#   %x    十六进制整数
#   %f    浮点数
#   %.2f  浮点数，保留两位小数
#   %s    字符串，适用于任何类型:
#       >>> 'Age: %s. Gender: %s' % (25, True)
#       'Age: 25. Gender: True'

## list:
#   >>> classmates = ['Michael', 'Bob', 'Tracy']
#   >>> classmates
#   ['Michael', 'Bob', 'Tracy']
#
## list(Iterable) - 转化为list
#   >>> list(range(6))
#   [0, 1, 2, 3, 4, 5]
#   >>> g = (x*x for x in range(6))
#   >>> list(g)
#   [0, 1, 4, 9, 16, 25]
#
## len(L) - 取得元素数:
#   len(classmates)
#
## 索引访问:
#   >>> classmates[2]
#   'Tracy'
#   >>> classmates[-1]
#   'Tracy'
#
## L.append() - 追加元素
#   >>> classmates.append('Adam')
#   >>> classmates
#   ['Michael', 'Bob', 'Tracy', 'Adam']
#
## L.insert - 插入元素
#   >>> classmates.insert(1, 'Jack')
#   >>> classmates
#   ['Michael', 'Jack', 'Bob', 'Tracy', 'Adam']
#
## L.pop() - 删除元素
#   >>> classmates.pop()
#   'Adam'
#   >>> classmates
#   ['Michael', 'Jack', 'Bob', 'Tracy']
#
#   >>> classmates.pop(1)
#   'Jack'
#   >>> classmates
#   ['Michael', 'Bob', 'Tracy']
#
## list中的数据类型可以不同; list可以包含另一个list; 空list的长度为0.

## tuple:
#   t1 = (1, )
#   t2 = ()
#
## tuple(Iterable) - 转化为tuple
#
## tuple和list类似, 但tuple的元素不可变;
## 可以令list为tuple的元素来达到'改变'tuple内容的目的.

## list-or-tuple[begin=0(step>0),-1(step<0): end=-1(step>0),0(step<0): step=1] - 切片
#   >>> L = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#   >>> L[0:3]
#   [0, 1, 2]
#   >>> L[:3]
#   [0, 1, 2]
#   >>> L[-3:]
#   [7, 8, 9]
#   >>> L[::2]
#   [0, 2, 4, 6, 8]
#   >>> L[::-1]
#   [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
#   >>> L[:2:-1]
#   [9, 8, 7, 6, 5, 4, 3]

## [stmt1 for var in Iterable if stmt2] - 列表生成式
#   >>> [x*x for x in range(1, 6)]
#   [1, 4, 9, 16, 25]
#
#   >>> [s.lower() for s in ('ULTRA MAN', 'UTF-8', 42, 'English') if isinstance(s, str)]
#   ['ultra man', 'utf-8', 'english']
#
#   >>> [m + n for m in 'ABC' for n in 'XYZ']
#   ['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']
#
## 把列表生成式中的[]换成()就得到迭代器

## dict
#   >>> d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
#   >>> d['Michael']
#   95
#
## key in d- 判断key是否存在
#   >>> 'Thomas' in d
#   False
#
## d.get(key, value=None) - 获取元素, 如果key不存在, 返回value.
#
## d.pop(key) - 删除元素
#
## 遍历dict
#   >>> d = {'a': 1, 'b': 2, 'c': 3}
#   >>> for key in d:
#   ...    print(key)
#   ...
#   c
#   a
#   b
#   >>> for value in d.values():
#   ...     print(value)
#   ...
#   3
#   1
#   2
#   >>> for key,value in d.items():
#   ...     print("%s: %d" % (key, value))
#   ...
#   c: 3
#   a: 1
#   b: 2

## set
## 与dict相似, 但set中没有重复的key.
#   >>> s = set([1, 2, 3])
#   >>> s
#   {1, 2, 3}
#
## s.add(key) - 添加元素
## s.remove(key) - 删除元素
## s1 & s2 - 集合的交
## s1 | s2 - 集合的并

## 判断: 有且只有一个分支被执行
#   if <条件1>:
#       <执行1>
#   elif <条件2>:
#       <执行2>
#   elif <条件3>:
#       <执行3>
#   else:
#       <执行4>

## for:
#   for num in (a, b, c):
#       print(num)
#
## 迭代tuple
#   >>> for x, y in [(1, 1), (2, 4), (3, 9)]:
#   ...     print(x, y)
#   ...
#   1 1
#   2 4
#   3 9
#
## range(begin=0, end, step=1) - 生成 [begin, end) 间的整数序列
#   sum = 0
#   for n in range(101):
#       sum = sum + n
#       print(sum)
#
## enumerate(Iterable, start=0) - 取得下标
#    >>> for i, value in enumerate(['A', 'B', 'C']):
#    ...     print(i, value)
#    ...
#    0 A
#    1 B
#    2 C

## while:
# while <条件>:
#     语句块

## 函数定义:
# isinstance() - 检查类型
#   def my_abs(x):
#       if not isinstance(x, (int, float)):
#           raise TypeError('bad operand type')
#       if x >= 0:
#           return x
#       else:
#           return -x
## 无 return 语句则返回 None; return None 也可写作 return.
#
## 返回多值(tuple):
#   import math
#   def move(x, y, step, angle=0):
#       nx = x + step * math.cos(angle)
#       ny = y - step * math.sin(angle)
#       return nx, ny
#
## 空函数:
#   def nop():
#       pass
#
## 例 一元二次方程:
#   import math
#
#   def quadratic(a, b, c):
#       for num in (a, b, c):
#           if not isinstance(num, (int,float)):
#               raise TypeError('bad operand type')
#
#       if a == 0:
#           if b == 0:
#               return None
#           else:
#               return -c / b
#
#       delta = b**2 - 4*a*c
#
#       if delta < 0:
#           return None
#       else:
#           var1 = -0.5 * b / a
#           var2 = 0.5 * math.sqrt(J) / a
#           return var1 + var2, var1 - var2
#
## 不按顺序传入的参数:
# 如果定义:
#   def enroll(name, gender, age=6, city='Beijing'):
#       ...
# 可以这样调用:
#   enroll('Adam', 'M', city='Tianjin')
#
## 默认参数必须指向不变对象!
#
## 例 Hanoi Tower:
#   >>> def move(n, a, b, c):
#   ...     if n == 1:
#   ...             print(a, '-->', c)
#   ...     else:
#   ...             move(n-1, a, c, b)
#   ...             print(a, '-->', c)
#   ...             move(n-1, b, a, c)
#   ...
#   >>> move(3, 'A', 'B', 'C')
#   A --> C
#   A --> B
#   C --> B
#   A --> C
#   B --> A
#   B --> C
#   A --> C

## 传入不定数目的参数
## 例 获得十六进制颜色
#   from functools import reduce
#   def hexcolor(*args):
#       return reduce(lambda x,y: x+y, tuple(map(lambda n: hex(n)[2:], args)))
#
#   print(hexcolor(130,125,104))

## generator - 生成器
#
## 判断一个对象是否可迭代:
#   >>> from collections import Iterable
#   >>> isinstance('abc', Iterable)
#   True
#   >>> isinstance([1,2,3], Iterable)
#   True
#   >>> isinstance(123, Iterable)
#   False
#
## next(generator) - 获取generator的下一个返回值
#
## 用循环输出
#   >>> g = (x*x for x in range(5))
#   >>> for n in g:
#   ...     print(n)
#   ...
#   0
#   1
#   4
#   9
#   16
#   >>> next(n)
#   Traceback (most recent call last):
#     File "<stdin>", line 1, in <module>
#   StopIteration
#
## yield 关键字 - 定义generator函数
#
## 例 斐波纳契数列
#   def fibonacci(max):
#       n, a, b = 0, 0, 1
#       while n < max:
#           yield b
#           a, b = b, a+b
#           # this equals to:
#           # t = (b, a+b)
#           # a = t[0]
#           # b = t[1]
#           n += 1
#       return 'done'
#
#   >>> for n in fibonacci(5):
#   ...     print(n)
#   ...
#   1
#   1
#   2
#   3
#   5
#
## 例 输出杨辉三角
#   def YangHuiTriangle(n):
#       L = []
#       for i in range(n):
#           for j in range(i-1):
#               L[j] = L[j] + L[j+1]
#           L.insert(0, 1)  # insert 1 to the beginning
#           yield L
#
#   for L in YangHuiTriangle(10):
#       print(L)
#
## 另一版本
#   def YangHuiTriangle2(n):
#       L = [1]
#       for x in range(n):
#           yield L
#           L = [1] + [L[i]+L[i+1] for i in range(x)] + [1]

## Iterator - 迭代器
#
## 能够不断调用 next() 并返回值, 直到抛出 StopIteration  错误的对象，叫做 Iterator. generator 是 Iterator, str, dict, list, tuple 则不是.
#
## iter(Iterable) - 把一个 Iterable 转化为 Iterator

## map(function, Iterable) -> Iterator
#   >>> def f(x):
#   ... return x**2
#   ...
#   >>> r = map(f, list(range(6)))
#   >>> r
#   <map object at 0x000000B7112BA080>
#   >>> list(r)
#   [0, 1, 4, 9, 16, 25]

## functools.reduce(function, Iterable[, initial]) -> value
#   >>> from functools import reduce
#   >>> def f(x, y):
#   ...     return 10*x + y
#   ...
#   >>> reduce(f, (1,3,5,7,9))
#   13579

## lambda - 无名函数
#   lambda x,y: 10*x + y    # 和上面的 f(x,y) 作用相同

## filter(func, sequence) - 返回惰性序列
#
## 例 输出素数
#   def _odd_iter():
#       n = 3
#       while True:
#           yield n
#           n += 2
#
#   def _not_divisible(n):  # 这是个返回函数的函数
#       return lambda x: x % n != 0
#
#   def primes(count = None):
#       yield 2
#       it = _odd_iter()    # 初始序列
#       i = 1
#       while i != count:   # 如果 count == None, 此处判断永真
#           p = next(it)    # 返回序列的第一个数
#           yield p
#           it = filter(_not_divisible(p), it) # 构造新序列, 保留原序列中不能被 p 整除的数
#           i += 1
#
#   while True:
#       n = input('How many prime numbers do you want? ')
#       if n.isdecimal() and int(n) > 0:
#           print(tuple(primes(int(n))))
#           break
#       else:
#           print('Invalid input, please try again.')

## decorator - 赋予函数额外功能
#   import functools
#   def log(text1 = 'begin call', text2 = 'end call'):
#       def decorator(func):
#           @functools.wraps(func) # 将 wrapper(func).__name__ 设为func
#           def wrapper(*args, **kw):
#               print('\n----%s %s----\n' % (text1, func.__name__))
#               ret = func(*args, **kw)
#               print('\n----%s %s----\n' % (text2, func.__name__))
#               return ret
#           return wrapper
#       return decorator
#
#   @log('execute', 'finish') # 相当于 f = log('execute', 'finish')(f)
#   def f():
#       print('hello?')
#       return 'A', 'B'
#
#   print(f.__name__, 'returned:', f())

## 类
#   class Animal(object):
#   
#       def __init__(self, name, age):
#           self.name = name
#           self.age = age
#   
#       def get_name(self):
#           return self.name
#   
#       def get_age(self):
#           return self.age
#   
#       def set_name(self, name):
#           self.name = name
#   
#       def set_age(self, age):
#           self.age = age
#   
#       def acting(self):
#           print('%d-year-old animal %s is running.' % (self.age, self.name))
#   
#   # cpython 会把 __xx 替换成 _classname__xx, 所以如果把 name 和 age 换成私有属性, 则所有与这两个属性相关的方法的继承都会失效:
#   # AttributeError: 'Pig' object has no attribute '_Animal__name'
#   
#   class Pig(Animal):
#   
#       def acting(self):
#           print('%d-year-old pig %s is eating.' % (self.age, self.name))
#   
#   class Spider(Animal):
#   
#       def acting(self):
#           print('%d-year_old spider %s is weaving.' % (self.age, self.name))
#   
#   wibur = Pig('Wibur', 1)
#   wibur.weight = 120 # 赋予对象特有属性
#   print('\nname = %s, age = %d, weight = %d' % (wibur.get_name(), wibur.get_age(), wibur.weight))
#   wibur.acting()
#   print('wibur\'s attributes & methods:', dir(wibur))
#   
#   charlotte = Spider('Charlotte', 2)
#   charlotte.legs = 8 # 特有属性
#   print('\nname = %s, age = %d, legs = %d' % (charlotte.get_name(), charlotte.get_age(), charlotte.legs))
#   charlotte.acting()
#   print('charlotte\'s attributes & methods:', dir(charlotte))

## del object.attribute - 删除对象属性
## del class.attribute - 删除类属性

## 为一个对象绑定新方法
#   from types import MethodType
#   def new_method(self):
#       pass
#  
#   object.new_method = MethodType(new_method, object)

## 为一个类绑定新方法
#   class.new_method = new_method

## __slots__ = tuple - 限定一个类的属性
#   class SomeClass(object):
#       __slots__ = tuple
#
## 若子类未定义 __slots__ 则这一做法对子类不起作用
## 若子类定义了 __slots__ 则子类实例允许定义的属性是自身与父类的 __slots__ 之和

# File Operation
# --------------
# 
# import sys, os, shutil
# 
# os.getcwd()             # current working directory
# os.chdir()              # change current directory
# os.listdir(dir)         # list files and dirs under current directory
# os.remove(file)         # remove file
# os.rmdir(empty_dir)     # remove EMPTY directories
# os.removedirs(dirs)     # remove directories
# os.system('shell')      # run system shell command
# os.getenv(env)          # returns environment variable
# os.putenv(env)          # set environment variable
# os.linesep              # returns '\n' for unix, '\r' for mac os, '\r\n' for windows
# os.name                 # returns 'posix' for unix and 'nt' for windows
# os.rename(old, new)     # rename file
# os.mkdir(dir)           # make a directory
# os.makedirs(dirs)       # make multiple directories
# os.stat(file)           # get file property
# os.chmod(file)          # change file property
# os.exit()               # exit current process
# 
# shutil.copy(dir, file_or_dir)
# shutil.copyfile(file, file)
# shutil.copytree(dir, dir)               # newdir must not exist
# shutil.move(file_or_dir, file_or_dir)
# shutil.rmtree(dir)                      # this is awesome and dangerous
# 
# os.path.isfile()        # check if this is a file
# os.path.isdir()         # check if this is a dir
# os.path.isabs()         # check if this path is absolute
# os.path.exists()        # check if this path exists
# os.path.split()         # returns tuple(dirname, filename)
# os.path.splitext()      # returns extension name
# os.path.dirname()       # returns directory name
# os.path.basename()      # returns filename with extension
# os.path.getsize(file)   # get file size
# 
# os.mknod(file)          # make empty file
# 
# fp = open('filename', 'mode')
#     # Here are available modes:
#     #   r       read
#     #   w       write   
#     #   a       append
#     #   r+      read and write
#     #   w+      read and write
#     #   a+      read and write
#     #   rb      read binary
#     #   wb      write binary
#     #   ab      appand binary
#     #   rb+     read and write binary
#     #   wb+     read and write binary
#     #   ab+     read and write binary
# 
# fin.read([size])            # read size bytes
# fin.readline([size])        # read size bytes in a line
# fin.readlines([size])       # returns [line1, line2, ...], only reads size bytes
# fout.write(str)             # write str, won't add '\n'
# fout.writelines(seq)        # write the sequence, won't add '\n'
# fp.flush()                  # force write content from buffer to disk
# fp.fileno()                 # returns int
# fp.isatty()                 # check if this file is a tty (unix)
# fp.tell()                   # returns current position of file
# fp.seek(offset[,whence])    # move current position to offset
#                             #   whence 0:from head, 1:from cur, 2:from tail
#                             #   under mode a or a+, the cur pos always returns to tail
#                             #   after each write
# fp.truncate([size])         # truncate file into desired size, default is truc to cur pos
# fp.next()                   # returns next line
# fp.close()                  # close file
# 
# # you can auto close file like this:
# with open('filename', 'mode') as fp:
#     pass
# 
# Regular Expression
# ------------------
# 
# import re
# 
# re.match(r'...', str, flags) -> str or None
#     """Returns first match from begin. Returns None if failed"""
# 
# re.search(r'...', str, flags) -> str or None
#     """Returns first match. Returns None if failed to find a single
#     match"""
# 
# re.sub(r'...', replacement, str, count=0) -> str
#     """Returns the replaced str. count=0 means replace each match"""
# 
# re.split(r'...', str) -> list
#     """Seperate str by match"""
# 
# re.findall(r'...', str) -> list(str)
#     """Find all matches"""
# 
# re.compile(r'...') -> regex object
# # use re.xxx().group(n) to get nth match

# Example:
import re
text = 'JGood is a handsome boy, he is cool, clever, and so on...'
match = re.search(r'\shan(ds)ome\s', text)
if match:
    print(match.group(0), match.group(1))
else:
    print('not found')
