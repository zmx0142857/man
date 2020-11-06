# ---- loop ----------------------------------------------------------

echo {1..5}   # 1 2 3 4 5
echo {01..05} # 01 02 03 04 05
seq 1 2 9     # 1 3 5 7 9
for i in {1..5}; do echo $i; done # 1 2 3 4 5
for f in *; do echo $f; done      # iterate over files in ./

# ----- io & word processing -----------------------------------------

cat                # repeater
cat > file         # read stdin and write to file
wc -c file         # count bytes of file
wc -l file         # count lines of file
cat file | wc -l   # count lines of file (2)
touch `cat file`   # create files batch
tail -100f log     # print last 100 lines of log, and follow new lines
sed -n 10p file    # print 10th line of file
grep -r 'str'      # find 'str' in ./ recursively
./startup.sh 2>&1  # redirect stderr to stdout
expand             # tab -> space
unexpand           # space -> tab

# ---- find ----------------------------------------------------------

ls -lt                   # list files by modified time
find -mtime -3           # files modified within 3 days
find -empty              # empty files & dirs
find -empty -type f      # empty files
find -empty -type d      # empty dirs
rm `find -empty -type f` # rm empty files
find -size +500M         # files that >= 500M

# ---- version control -----------------------------------------------

git status | grep : | sort     # sort git status
git status | grep -c modified: # git count files modified
svn status | grep -c ^M        # svn count files modified

# ---- encode & decode -----------------------------------------------

printf "%x\n" 12288 # hex
date +%Y/%m/%d      # 2020/10/30
xxd, od, hexdump    # binary viewers
base64              # base64 enc & dec
qrencode -I M -t UTF8 -k "文字内容" # generate QR code

# iconv
iconv -f gbk <file>                               # gbk -> utf-8
echo '��' | iconv -f gbk                          # 锟斤拷
echo -e '\xef\xbf\xbd\xef\xbf\xbd' | iconv -f gbk # 锟斤拷
echo -e '\xcc\xcc\xcc\xcc\xcc\xcc' | iconv -f gbk # 烫烫烫
echo '你好' | iconv -t gbk | iconv -f latin1      # ÄãºÃ
echo 'ÄãºÃ' | iconv -t latin1 | iconv -f gbk      # 你好

# opencc
$ echo '歐幾里得 西元前三世紀的希臘數學家' | opencc -c t2s
$ echo '欧几里得 西元前三世纪的希腊数学家' | opencc -c s2t
$ opencc -i zhwiki_raw.txt -o zhwiki_t2s.txt -c t2s.json

# ---- misc ----------------------------------------------------------

df -H            # diskusage
time read        # stopwatch
factor 2077      # factor a number

# set title of terminal
echo -ne "\033]0;New Title\a"

# 压缩 files/ 下除了 path-to-exclude/ 目录的所有文件
# 引号不可省略，排除的文件必须放在最后
zip -r files.zip files/ -x 'files/path-to-exclude/*'

# 解压到指定目录
unzip files.zip -d files/

# 运行命令, 登出仍不挂断, 日志记入 tmp.log
    ----tmp.sh---------
    sleep 5
    echo 'hello, nohup'
    -------------------
$ nohup ./tmp.sh > tmp.log &

# 发送 http 请求
curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -d '{json-string}' 'http://url'

# 合并 pdf
echo `ls Ch?.pdf` `ls Ch??.pdf` `ls -Q --quoting-style=shell A*` 算法导论答案.pdf | xargs pdfunite
