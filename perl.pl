#!/usr/bin/env perl

# ---- basic ----

print "hello world\n";
print("hello world\n");		# same as above
print 'hello world\n';		# \n not escaped
print '
';							# output a newline

$a = 10;
print "a = $a\n";			# interpolation

$a = <<"EOF";
这是一个 Here 文档
允许引用变量：a = $a
EOF

print "a = $a\n";

print "file: " . __FILE__ . "\n";
print "line: " . __LINE__ . "\n";
print "package: " . __PACKAGE__ . "\n";

=pod
\cx 控制字符，x可以是任何字符
\u 	将下一字符转为大写
\l 	将下一字符转为小写
\U 	将到 \E 为止的字符转为大写
\L 	将到 \E 为止的字符转为小写
\Q 	将到 \E 为止的非单词 (non-word) 字符加上反斜线
\E 	结束 \L, \U, \Q
=cut

print v9786.10;					# smile
print v102.111.111.10;			# foo
print v77.97.114.116.105.110.10;# martin

# ---- array ----

@a = (1, "two", 3);
print @a;
print "\n";
print "@a\n";
print "($a[0], $a[1], $a[2])\n";
$size = @a;
print "size = $size\n";
print "$a\n";

@a = qw/array of strings/; # 用括号代替 / 也可以
print "($a[0], $a[1], $a[-1])\n";
$a[10] = "hahaha";	# ok
print "@a\n";
print "@a[0, 1, 10]\n";
print "@a[0..2, 10]\n";

print (1..10);
print "\n";
print (a..z);
print "\n";

=pod
push @array, list		将列表的值放到数组的末尾
pop @array				弹出数组最后一个值，并返回它
shift @array			弹出数组第一个值，并返回它
unshift @array, list	将列表放在数组前面，并返回新数组的元素个数。
splice @array, offset [, length, [list]]
					用 list 替换 array 从 offset 开始的 length 个元素
split [pattern [, expr [, limit]]]
					用 pattern 分隔 expr, 最多 limit 次, 返回分隔后的数组
join expr, list		将 list 中的字符串用 expr 连接起来
sort [subroutine] list	用 subroutine 规则排序
=cut

# ---- hash table ----

%a = ('x' => "one", 'y' => 240);
print %a;			# the order of x, y may differ on each run
print "\n";
print "('x' => $a{'x'}, 'y' => $a{'y'})\n";
