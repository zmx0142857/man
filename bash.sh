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
