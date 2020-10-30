// ---- 安装 ------------------------------------------------------------

方法 1. 从 jquery.com 下载 jQuery 库

<head>
	<script src="js/jquery-1.10.2.min.js"></script>
</head>

方法 2. 从 cdn 中载入 jQuery (任选其一)

<head>
	<!-- Staticfile -->
	<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<!-- 百度 -->
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<!-- 又拍云 -->
	<script src="https://upcdn.b0.upaiyun.com/libs/jquery/jquery-2.0.2.min.js"></script>
	<!-- 新浪 -->
	<script src="https://lib.sinaapp.com/js/jquery/2.0.2/jquery-2.0.2.min.js"></script>
	<!-- google -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<!-- microsoft -->
	<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
</head>

使用 CDN 的优势是，许多用户在访问其他站点时，已经从百度、又拍云、新浪、谷歌或微软加载过 jQuery。所以结果是，当他们访问您的站点时，会从缓存中加载 jQuery，这样可以减少加载时间。同时，大多数 CDN 都可以确保当用户向其请求文件时，会从离用户最近的服务器上返回响应，这样也可以提高加载速度。

// ---- 语法 -----------------------------------------------------------

通过 jQuery，您可以选取（查询，query） HTML 元素，并对它们执行"操作"（actions）。

基础语法： $(selector).action()

    美元符号定义 jQuery
    选择符（selector）"查询"和"查找" HTML 元素
    jQuery 的 action() 执行对元素的操作

实例:

    $(this).hide() - 隐藏当前元素

    $("p").hide() - 隐藏所有 <p> 元素

    $("p.test").hide() - 隐藏所有 class="test" 的 <p> 元素

    $("#test").hide() - 隐藏所有 id="test" 的元素

判断选择成功与否

	if ($(selector).length) { ... }

创建元素

	$('<a>', {
		html: 'This is a <strong>new</strong> link',
		'class': 'new',
		href: 'foo.html'
	}).appendTo('body');

按规则修改元素

	$('#mylist li').html(function(i, val) {
		return 'item ' + i + ' ' + val;
	});

设置样式

	var h1 = $('h1');
	h1.css({
		fontSize: "100px",
		color: "red"
	});
	h1.addClass('big');
	h1.removeClass('big');
	h1.toggleClass('big');
	if (h1.hasClass('big')) {...}

// ---- 文档就绪事件 ---------------------------------------------------

您也许已经注意到在我们的实例中的所有 jQuery 函数位于一个 document ready 函数中：

$(document).ready(function(){
 
   // 开始写 jQuery 代码...
 
});

这是为了防止文档在完全加载（就绪）之前运行 jQuery 代码，即在 DOM 加载完成后才可以对 DOM 进行操作。

如果在文档没有完全加载之前就运行函数，操作可能失败。

上面代码的简写：

$(function(){
 
   // 开始写 jQuery 代码...
 
});

jQuery 入口函数:

$(document).ready(function(){
    // 执行代码
});
或者
$(function(){
    // 执行代码
});

JavaScript 入口函数:

window.onload = function () {
    // 执行代码
}

jQuery 入口函数与 JavaScript 入口函数的区别：

jQuery 的入口函数是在 html 所有标签(DOM)都加载之后，就会去执行。
JavaScript 的 window.onload 事件是等到所有内容，包括外部图片之类的文件加载完后，才会执行。

// select

<select class="select">
    <option value="1">选项一</option>
    <option value="2">选项二</option>
    <option value="3">选项三</option>
</select>
$(".select").change(function(){
    console.log($(this).val(), $('option:selected', $(this)).text());
});

// jquery 把数组和对象的遍历形式上统一起来了
// 遍历数组
var arr = [1, 2, 3];
arr.forEach(function(elem, i) { console.log(i, elem); }); // 原生方法返回 undefined
$.each(arr, function(i, elem) { console.log(i, elem); }); // jquery 返回 arr

// 遍历对象
var obj = {name:"bob",age:"23",gender:"male"};
for (var key in obj) { console.log(key, obj[key]); } // 原生方法
$.each(obj, function(key, value) { console.log(key, value); }); // jquery

// ajax
$.ajax({
    type: "POST",
    url: "...",
    data: {user: "Bob", msg: "hello"},
    dataType: "json",
    success: function(data) {
        console.log(data);
    }
});
