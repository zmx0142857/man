// ---------------- 添加 js ----------------

1. 直接嵌入

	<html>
	<head>
		<script>
			var name = prompt('What\'s your name?');
			alert('Hello, ' + name + '!');
		</script>
	</head>
	<body>
		...
	</body>
	</html>

2. 引入 js 文件

	<html>
		<head>
			<script src="/static/js/abc.js"></script>
		</head>
	<body>
		...
	</body>
	</html>

// ---------------- 输出调试信息 ----------------

console.log('some log');

// ---------------- 语句与块 ----------------

	var x = 1;	// undefined

	'some str';	// 'some str'

	if (x < 0) {
		return -x;
	} else {
		return x;
	}

! 警告: javascript 会自动在语句末添加分号, 但这有时令人困扰. 如

		return
			{ x < 0 ? -x : x };

将被解释为

		return;
			{ x < 0 ? -x : x };

这会导致函数总是返回 undefined. 正确写法应该是:

return {
	x < 0 ? -x : x
};

解释器不会在 '{' 之后加分号.

// ---------------- 类型与运算 ----------------

Number

	js 不区分整数与浮点数, Number 的例子有:

		123, 0xff00, 0.456, 1.2345e3, -99, NaN, Infinity

	相关运算:
		
		5 / 2;		// 2.5
		1 / 0;		// Infinity
		-1 / 0;		// -Infinity
		0 / 0;		// NaN, not a number
		10 % 3;		// 1
		10.5 % 3;	// 1.5

String

	用单引号 '' 或双引号 "" 括起来的文本.
	支持 C 语言风格的转义. 另外, '\u####' 表示一个 unicode 字符:

		'\u4e2d\u6587';		// "中文"
	
	`` 括住多行字符串(ES6):

		`这是一个
		多行
		字符串`

	'+' 连接字符串:

		'数学' + '分析';	// "数学分析"
	
	模板字符串(ES6):

		var name = '小明';
		var age = 20;
		var msg = `${name}, 你今年${age}岁了!`;
	
	-----------------------------------------------------------------
	
	[]					获取字符, 对超出范围的下标, 返回 undefined
	str.length			返回 String 的字符数
	str.toUpperCase()	返回全部大写的拷贝
	str.toLowerCase()	返回全部小写的拷贝
	str.indexOf(s)		返回子串 s 首次出现的下标, 找不到时返回 -1
	str.substring(a=begin, b=end)
						返回一个由区间 [a, b) 确定的子串
	parseInt(str)		读取 str, 返回一个整数, str 以数字开头即可
	parseFloat(str)		与上一条类似

	-----------------------------------------------------------------

Boolean

	此类型只有 true, false 两种值.

	相关运算:
		
		&& || !

Array

	Array 可以糅合不同的类型:
		
		var arr = [1, 3.14, 'Tom', null, true];
	
	-----------------------------------------------------------------

	[]					获取元素, 对超出范围的下标, 返回 undefined
	arr.length			返回 arr 的元素数. 给 arr.lenth 赋值会引起
						arr 大小变化. arr 变大时, 新增元素是 undefined
	arr.indexOf(a)		返回元素 a 首次出现的下标, 找不到时返回 -1
	arr.slice(a=begin, b=end)
						返回 arr 的截取 [a, b), 使用 slice() 取得拷贝
						时, 该拷贝与 arr 的 '===' 判断将失败.
	arr.push(...)		向 arr 的末尾添加元素, 返回新的 arr.length
	arr.pop()			返回 arr 末尾元素, 并将它移除. pop 一个空数组
						将返回 undefined
	arr.unshift(...)	向 arr 头部添加元素, 返回新的 arr.length
	arr.shift()			返回 arr 头部元素, 并将它移除. shift 一个空数
						组将返回 undefined
	arr.sort()			排序
	arr.reverse()		反转
	arr.splice(a, b, ...)
						"万能方法", 从指定下标 a 开始删除 b 个元素, 再
						从该位置添加若干元素. 返回被删除的元素的数组.
	arr.concat(...)		返回新数组, 把 arr 与 ... 连接起来. 若 ... 中
						有数组, 把它拆开再连接.
	arr + brr			把 arr 与 brr 的元素转换为字符串, 插入若干逗
						号, 再连接为一个字符串.
	arr.join(str)		把 arr 的元素转换为字符串, 用 str 连接起来

	-----------------------------------------------------------------

Object

	一组无序的键-值对:
		
		var person = {
			name: 'Bob',
			age: 20,
			tags: ['js', 'web', 'mobile'],
			city: 'Beijing',
			'has-car': true,
			zipcode: null
		};

	键的类型是 String, 而值可以是任意类型. 用下面的方法获取属性:
		
		person.name;		// 'Bob'
		person['has-car'];	// true
		person.girlfriend;	// undefined
	
	-----------------------------------------------------------------

	obj.property = value	新增属性
	delete obj.property		删除属性
	'property' in obj		检测 obj 是否有属性 property
	obj.hasOwnProperty('p')	检测 obj 是否有非继承得到的属性 p

	-----------------------------------------------------------------

Map (ES6)

	与 Object 的区别在于, Map 可以用 String 以外的类型作为键.

		var emptyMap = new Map();
		var m = new Map([['Mike', 95], ['Bob', 75], ['Tracy', 85]]);

	-----------------------------------------------------------------

	m.get(key)				取得 key 所对应的 value
	m.set(key, value)		添加 (或改写已有的) 键值对
	m.has(key)				检测 m 是否存在 key
	m.delete(key)			删除键

	------------------------------------------------------------------

Set (ES6)

	与 Map 的区别在于, Set 只存储 key.

		var emptySet = new Set();
		var s = new Set([1, 2, 3]);
	
	在 Set 中, 重复元素只保留一个.

	------------------------------------------------------------------

	s.add(key)				添加 key
	s.delete(key)			删除 key

	------------------------------------------------------------------

//! ---------------- 专栏: 变量 ----------------

	变量名是大小写英文字母, 数字, $ 和 _ 的组合, 且不能以数字开头, 亦
	不能是 if, while 等关键字. 未初始化的变量的值是 undefined:
		
		var a;		// undefined
	
	可以给同一个变量先后赋以不同的类型:

		var a = 123;
		var a = 'abc';
	
	在代码首行写上 'use strict'; 来要求变量先申明后使用.

	函数中, 可以引用下文申明的变量, 但那不是你想要的效果:
		
		function foo() {
			var x = 'hello, ' + y;
			alert(x);		// 'hello, undefined'
			var y = 'Bob';
		}

//! ---------------- 专栏: 比较运算符 ----------------
	
	js 允许对任意数据类型做比较, '==' 会自动转换数据类型再比较, 而
	'===' 在数据类型不一致时返回 false.
		
		false == 0;			// true
		false === 0;		// false
		undefined == null;	// true
		undefined === null;	// false
		NaN === NaN;		// false
		[] === [];			// false
		'' === '';			// true

	唯一能判断 NaN 的方法是通过 isNaN() 函数.


// ---------------- 分支与循环 ----------------

条件判断:

		if (stmt1) {
			stmt2;
		} else {
			stmt3;
		}

	stmt1 是 null, undefined, 0, NaN 和 '' 时视为 false, 其他值视为
	true. 当 stmt2 或 stmt3 只有一条语句时, {} 可省, 但不推荐.

for 循环:

		var arr = [...];
		for (var i = 0; i < arr.length; i++) {
			...
		}

for-in 循环:
	
		var obj = {name:'Jack', age:20, city:'Beijing'};
		for (var key in obj) {	// 'name', 'age', 'city'
			...
		}
	
		var arr = ['a', 'b', 'c'];
		for (var i in a) {	// '0', '1', '2'
			...
		}

while 与 do-while:

	(与 C 语言一样)

for-of 循环 (ES6):

		var a = ['a', 'b', 'c'];
		for (var x of a) {	// 'a', 'b', 'c'
			...
		}

	用 for-of 遍历 Map 时, 得到的是 [key, value]:

		var m = new Map([[1, 'x'], [2, 'y'], [3, 'z']]);
		for (var x of m) {
			alert(x[0] + '=' + x[1]);
		}

forEach() 方法 (ES5.1)

		var s = new Set(['a', 'b', 'c']);
		s.forEach( function (element, sameElement, set) {
			...
		});

		var m = new Map([[1, 'x'], [2, 'y'], [3, 'z']]);
		m.forEach( function (value, key, map) {
			...
		});

// ---------------- 函数 ----------------

函数的定义

	两种等价的定义方式:

		function foo(...) {
			...
		}
		
		var foo = function(...) {
			...
		};

	允许传入的参数个数多于或少于函数所要求的参数.

	函数可以嵌套.

arguments

	在函数内部, argument 是一个 tuple, 表示调用者传入的所有参数.
	用下标取得各个参数:
		
		function abs() {
			if (arguments.length === 0) {
				return 0;
			}
			var x = arguments[0];
			return x >= 0 ? x : -x;
		}

rest (ES6)
	
	传入的参数少于 3 个时, 下面这个函数的 rest === []

		function foo(a, b, ...rest) {
			console.log('a = ' + a);
			console.log('b = ' + b);
			console.log(rest);
		}

//! ---------------- 专栏: 作用域 ----------------

	全局变量与函数都绑定到 window 对象:

		'use strict';
		var course = 'learn js';
		function foo() {
			alert('foo');
		}

		alert(window.course);	// 'learn js'
		window.foo();			// 'foo'
		window.alert = function(){}; // 无法使用 alert() 了!
	
	为了减少命名冲突, 把定义的全局变量与函数绑定到一个全局变量:
	
		var MYAPP = {};

		MYAPP.name = 'myapp';
		MYAPP.version = 1.0;

		MYAPP.foo = function () {
			return 'foo';
		};

	js 中的局部作用域是函数级的:
		
		function foo() {
			for (var i = 0; i < 100; i++)
				...
			}
			i += 100; // i 仍然可用
		}

	用 let 代替 var 申明块级作用域的变量 (ES6).
	用 const 定义常量 (ES6). 常量也是块级作用域的.

// ---------------- 方法 ...! ----------------

	为小明定义一个 age() 方法:

		var xiaoming = {
			name: '小明',
			birth: 1990,
			age: function () {
				var y = new Date().getFullYear();
				return y - this.birth;
			}
		};

		xiaoming.age;	// function xiaoming.age()
		xiaoming.age();	// 返回小明的年龄

	也可以这么写:

		function getAge() {
			var y = new Date().getFullYear();
			return y - this.birth;
		}

		var xiaoming = {
			name: '小明',
			birth: 1990,
			age: getAge
		};

		xiaoming.age(); // 25, 正常结果
		getAge(); // NaN
