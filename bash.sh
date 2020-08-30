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
