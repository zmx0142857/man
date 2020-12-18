# convert - convert images

## enable pdf convert

edit /etc/ImageMagick-6/policy.xml and comment out lines

    <!-- disable ghostscript format types -->
    <policy domain="coder" rights="none" pattern="PS" />
    <policy domain="coder" rights="none" pattern="EPS" />
    <policy domain="coder" rights="none" pattern="PDF" /> <------- Here!!
    <policy domain="coder" rights="none" pattern="XPS" />

## format convert

merge pictures into one pdf

    $ convert *.jpg out.pdf
    $ convert *.jpg +compress out.pdf

pdf to picture

    # -scene 1         输出的图片从 1 开始编号 (默认从 0 开始)
    # [0-9]            pdf 页码范围从 0 到 9 (页码也是从 0 开始)
    # -density         此参数必须在读入 pdf 前指定。convert in.pdf -density 300 out.jpg 是无效的。
    #                  density 越大，图片分辨率越高；代价是花费更多时间。
    # -resample        表示最终的分辨率。一般 density 设为 resample 的两倍。
    # -colorspace RGB  使得彩色图片在浏览器中正常显示
    # -alpha remove    防止图片出现黑色背景

    $ convert -scene 1 -density 360 -colorspace RGB in.pdf[0-9] -resample 180 -alpha remove out%03d.jpg

convert png files to jpg files

```bash
$ for f in *.png; do
$   convert $f ${f%.png}.jpg
$ done
```

## edit picture

picture info

    $ magick identify in.jpg
    $ magick identify 004.jpeg | cut -d ' ' -f 3 # 获取文件大小

resize

    $ convert -resize 50% in.jpg out.jpg
    $ convert -resize 100x100 in.jpg out.jpg

    # better for pixel art:
    $ convert -scale 800% in.png out.png

rotate

    $ convert -rotate 90 in.jpg out.jpg # 正数是顺时针, 负数是逆时针

add border

    $ convert -border 40x40 -bordercolor '#ffffff' in.jpg out.jpg

add text

    $ convert -fill '#114514' -pointsize 20 -font SimSun -draw 'text 50,20 "114514"' in.jpg out.jpg

black white

    $ convert -monochrome in.jpg out.png
    $ convert -threshold 55% in.jpg out.png
    $ convert -alpha set -channel RGBA -fuzz 30% -fill '#ffffff' -opaque '#aaaaaa' -monochrome in.jpg out.png # better

crop

    # crop a mini-picture, width=100, height=80, left=50, top=30
    $ convert -crop 100x80+50+30 in.jpg out.jpg

    # crop grids
    $ convert -crop 100x100 in.jpg out.jpg

    # crop in left/right half
    $ convert in.jpg -crop 50%x100% out.jpg

background

    # add background
    $ convert -background white in.png -flatten out.jpg

    # transparent background
    $ convert -transparent white in.png out.png
