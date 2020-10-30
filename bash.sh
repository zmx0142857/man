# echo 1 to 10
echo {1..10}
# echo 01 to 10
echo {01..10}
# echo 1 3 5 7 9
seq 1 2 9
# iterate from 1 to 10
for i in {1..10}; do echo $i; done
# iterate over all files of current dir
for f in *; do echo $f; done
# repeater
cat
# write a file
cat > filename
# count lines
cat file | wc -l
# touch files listed in file
touch `cat file`
# diskusage
df -H
# timer
time read
# find empty files & dirs
find -empty
# find empty files
find -empty -type f
# find empty dirs
find -empty -type d
# rm empty files
rm `find -empty -type f`
# find files that >= 500M
find -size +500M
# print Nth line of file
sed -n <N>p file

iconv -f gbk <file> # gbk 转 utf-8
grep -r 'string' # 在当前目录递归查找
git status | grep -c modified: # git 查看修改的文件数
svn status | grep -c ^M # svn 查看修改的文件数
svn diff > diff # 比较修改的文件
find -mtime -3 # 3 天内修改过的文件
ls -lt # 按时间倒序列出文件
# 压缩 myfolder/ 下除了 path-to-exclude/ 目录的所有文件
# 引号不可省略，排除的文件必须放在最后
zip -r myfolder.zip myfolder/ -x 'myfolder/path-to-exclude/*'
unzip file.zip -d myfolder/ # 解压到指定目录
factor 2077 # 素因子分解

# 运行命令，登出仍不挂断，日志记入 tmp.log
----tmp.sh---------
sleep 5
echo 'hello, nohup'
-------------------
$ nohup ./tmp.sh > tmp.log &

git status | grep : | sort # git status 排序
tail -100f log.log # 打印 log.log 的最后100行, 并跟踪新增的行
vim -R file # 以只读方式打开
echo -ne "\033]0;New Title\a" # 设置终端标题

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{json-string}' 'http://url' # 发送 http 请求
echo '��' | iconv -f gbk # 锟斤拷
echo -e '\xef\xbf\xbd\xef\xbf\xbd' | iconv -f gbk # 锟斤拷
echo -e '\xcc\xcc\xcc\xcc\xcc\xcc' | iconv -f gbk # 烫烫烫
echo '你好' | iconv -t gbk | iconv -f latin1 # ÄãºÃ
echo 'ÄãºÃ' | iconv -t latin1 | iconv -f gbk # 你好

./startup.sh 2>&1 # 把 stderr 重定向到 stdout
printf "%x\n" 12288 # 16进制
# 合并 pdf
echo `ls Ch?.pdf` `ls Ch??.pdf` `ls -Q --quoting-style=shell A*` 算法导论答案.pdf | xargs pdfunite
# 格式化日期
date +%Y/%m/%d
expand # tab 转空格
unexpand # 空格转 tab
xxd, od, hexdump # 二进制查看器
base64 # base64 编码解码
qrencode -I M -t UTF8 -k "文字内容" # 生成二维码

# opencc
$ echo '歐幾里得 西元前三世紀的希臘數學家' | opencc -c t2s
$ echo '欧几里得 西元前三世纪的希腊数学家' | opencc -c s2t
$ opencc -i zhwiki_raw.txt -o zhwiki_t2s.txt -c t2s.json
