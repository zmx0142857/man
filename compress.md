tar

    -c      make archive
    -x      extract archive
    -t      view archive content

    -z      use gzip
    -j      use bzip2
    -J      use xz

    -f      specify filename
    -C dir  specify directory

    -v      verbose
    -p      preserve permissions and properties
    -k      do not overwrite file when extracting
    --exclude=file  exclude file

    example:

    $ tar -zxvkpf file.tar.gz [<files>] # extract
    $ tar -zcvpf file.tar.gz <files>    # make

    问题
    $ tar -zxvf notification.tar.gz
    gzip: stdin: not in gzip format
    tar: Child returned status 1
    tar: Error is not recoverable: exiting now
    可能这个包并没有用 gzip 压缩. 去掉参数 -z 试试

zip

    zip file.zip file1 file2 file3

    -y      store symbolic link as they are
    -r      recurse into subdirs
    -t      test zipfile integrity
    -x      exclude file

unzip

    -Z      view archive content
    -Zl     view archive content (fewer)
    -l      view archive content (fewer and fewer)

    -t      test file integrity
    -q      quiet mode
    -n      skip existing file
    -f      overwrite existing file
    -d dir  extract to directory
    -O cp936 extract windows format zip file

rar

    rar <command> [-<switch>] file.rar [files] [path]

    command:
    a       add [files] to file.rar
    e       extract to current directory
    l       list archive content
    t       test file
    x       extract file to [path]

    -r      recurse to subdirs
    -o+     overwrite existing file
    -o-     skip existing file
    -x file exclude file

xz
  -z, --compress      compress
  -d, --decompress    decompress
  -t, --test          test integrity
  -l, --list          list info
  -k, --keep          keep input files
  -f, --force         force overwrite output file and (de)compress links
  -c, --stdout        write to stdout, don't delete input files
  -0 ... -9           compression preset, default 6; take compressor *and*
                      decompressor memory usage into account before using
                      7-9!
  -e, --extreme       try to improve compression ratio by exploiting CPU
                      does not affect decompressor memory requirements
  -T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
                      to use as many threads as there are processor cores
  -q, --quiet         suppress warnings; specify twice to suppress errors
                      too
  -v, --verbose       be verbose; specify twice for even more verbose
  -H, --long-help     display long help & advanced options
  -V, --version       display version

  with no FILE, or when FILE is -, read standard input.

  example:
  $ xz -kd file.xz  # decompress and keep input file
  $ xz -kz file.xz  # compress and keep input file

gzip

    read stdin, output to stdout.

    -c      preserve original file
    -d      extract
    -v      infomation
    -[1-9]  the bigger the number, the smaller the file

    example:

    $ gzip -cdv file.gz > file  # extract
    $ gzip -cv file > file.gz   # make

    gunzip = gzip -d
    zcat = gzip -c

bzip2

    make bzip2 file, remove original file.

    -c      output to stdout
    -d      extract
    -v      infomation
    -k      preserve original file
    -[1-9]  the bigger the number, the smaller the file

    example:

    $ bzip2 -dkv file.bz2   # extract
    $ bzip2 -kv file        # make

    bunzip2 = bzip2 -d
    bzcat = bzip2 -c
