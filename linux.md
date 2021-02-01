----download----

edit apt sources

	export EDITOR=vim
	apt edit-sources
	一定要选择和自己的发行版对应的源

pacman - package manager for arch

    使用 archlinuxcn 镜像

    ----/etc/pacman.conf-------------------------------------------
    [archlinuxcn]
    Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
    ---------------------------------------------------------------

    $ sudo pacman -Sy archlinuxcn-keyring
    $ sudo pacman -Sy

pip - install python third party lib

	$ pip3 install -i https://pypi.doubanio.com/simple/ <package-name>

wget - downloader

	$ wget http://...

aria2c - fast downloader

	$ aria2c -s 10 http://...

----desktop----

customize user folder

	$ vim ~/.config/user-dirs.dirs

hide trash icon

	install gnome tweak from ubuntu software
	start tweaks from application menu
	desktop -> trash

trash - move file to trash through bash

	$ sudo apt-get install trash-cli
	$ trash-put <filename>

settings

	$ sudo apt install ubuntu-desktop

----shell----

set local host name

	$ sudo -H vi /etc/hostname
	$ sudo -H vi /etc/hosts

set locale

	$ LANG=en_US.utf8

	write this at the end of ~/.bashrc:

	$ export LC_ALL=en_US.utf8

print color in terminal

	general format

	\033[<attr1>;<attr2>;...;<attrn>m

	available attributes

	0	reset all attributes
	1	bright
	2	dim
	4	underscore
	5	blink
	7	reverse
	8	hidden

			foreground	background
	black	30			40
	red		31			41
	green	32			42
	yellow	33			43
	blue	34			44
	magenta	35			45
	cyan	36			46
	white	37			47

	example

	$ echo -e '\033[31mred\033[0m'		# red color
	$ echo -e '\033[7mreverse\033[0m'	# reverse color

	same example in C

	printf("\033[31mred\033[0m\n");		// red color
	printf("\033[7mreversed\033[0m\n");	// reverse color

ssh

	$ ssh-keygen
	and copy ~/.ssh/id_rsa.pub to serverside,
	$ cat id_rsa.pub >> ~/.ssh/authorized_keys

	privilege settings:
	$ chmod 700 ~/.ssh
	$ chmod 600 ~/.ssh/authorized_keys

	to login to termux, use port 8022:
	$ ssh user@ip -p 8022

	execute remote command:
	$ ssh user@ip 'command'

	copy remote file:
	$ scp user@ip:path .

	config file /etc/ssh/sshd_config
	-------------------------
	PasswordAuthentication no
	UseDNS no # 提高上传网速
	-------------------------

	user config file ~/.ssh/config
	-------------------------
	Host me
		User username
		Hostname <ip-address>
		Port 8022
	-------------------------

remote ssh

	server side:

	open 192.168.1.1 in browser, enter router admin password.
	advanced options -> advanced user -> add virtual server.
	* external port can be any number greater than 1024, for example 2022.
	* internal port is by default the ssh port 22.
	* to see your WLAN ip, type
	  $ ifconfig | grep inet
	  in terminal. here we suppose it is 192.168.1.100.
	* click save.
	on router admin page, check your external ip, xx.xx.xx.xx.

	client side:

	type
	$ ssh -p 2022 user@xx.xx.xx.xx
	and wow!

ftp

	$ sudo apt install vsftpd
	$ sudo service vsftpd start

mtp - gvfs-mtp

----text-edit----

fbterm - draw Chinese characters under terminal

	add yourself to video group:

	$ sudo gpasswd -a <username> video

	$ sudo chmod u+s /usr/bin/fbterm

	DO NOT try this:

	$ sudo update-initramfs -u
	update-initramfs: Generating /boot/initrd.img-4.10.0-32-generic
	W: Possible missing firmware /lib/firmware/i915/kbl_dmc_ver1_01.bin for module i915

yong - input method for Chinese under fbterm

xelatex - beautifully output pdf for math formulas and documents

	(ubuntu) install necessary packages:

	$ sudo apt install texlive-xetex
	$ sudo apt install texlive-lang-chinese

	or install everything:

	$ sudo apt install texlive-full

    (arch) $ sudo pacman -S texlive-core texlive-langchinese

    ----tmp.tex--------------
    \documentclass{ctexart}
    \setCJKmainfont{SimSun}
    \begin{document}
    test 中文宏包测试 ok
    \end{document}
    ------------------------

    $ xelatex tmp.tex

    tllocalmgr 是 archlinux 提供的 texlive 包管理器, 用于取代 tlmgr

fc-list - list font files in system

	$ fc-list :lang=zh
	$ fc-list LatinModernMath

fc-cache - refresh font

awk - column editing language

sed - line streaming editing language

sort - sort the lines based on column

uniq - remove repeated lines

tee - print to stdout and a file

----file-and-media----

feh - look at picture

merge video files

	1. use ffmpeg

	$ sudo snap install ffmpeg
	$ cd ~/some/path

	rename file extension

	$ for f in *.blv; do mv "$f" "${f%.blv}.flv"; done

	write a tmp file like:
	------------
	file '0.flv'
	file '1.flv'
	...
	------------
	$ for f in *.flv; do echo "file '$f'" >> tmp; done
	$ ffmpeg -f concat -i tmp -c copy output.flv

	2. WARNING: this method has problem with time-line etc.

	$ cat 1.flv 2.flv > new.flv
	$ cat 1.mp4 2.mp4 > new.mp4

	under MS Windows:

	cmd> copy /b 1.flv+2.flv new.flv

merge video with audio

	$ ffmpeg -i video.m4s -i audio.m4s -c:v copy -c:a aac -strict experimental output.mp4

flash - play web videos

	$ sudo apt install flashplugin-installer

ldd - find dependence of a executable file

iconv - convertion between encodings

sha256sum - calculate hash
	
vlc, mpv, totem - video player

pdfunite - merge pdf files

	$ pdfunite *.pdf out.pdf

timidity - play midi file

	$ sudo apt install timidity
	$ timidity mymusic.mid

	if you want a GUI, do
	$ sudo apt install timidity-interfaces-extra
	$ timidity -lg

pavucontrol - deal with sound problem

----network----

ifconfig - network info

	to see your ip:
	$ ifconfig | grep inet

list available ip under WLAN

	$ nmap -sP 192.168.1.0/24
	$ arp | grep ether

DNS service

	$ nslookup www.baidu.com

config DNS server

	# cd /etc
	# mv resolv.conf resolv.conf.bak
	# ls -l resolv.conf.bak
lrwxrwxrwx 1 root root 39 Mar 14 13:43 resolv.conf.bak -> ../run/systemd/resolve/stub-resolv.conf
	# cp /run/systemd/resolve/stub-resolv.conf ./resolv.conf -i

	edit resolv.conf, add some of the following lines:
	--------------------------
	nameserver 114.114.114.114
	nameserver 8.8.8.8
	nameserver 8.8.4.4
	nameserver 198.153.192.1
	nameserver 198.153.194.1
	nameserver 208.67.222.222
	nameserver 208.67.220.220
	--------------------------
	# chattr +i resolv.conf # only root can change this file
	# systemctl start systemd-resolved.service

firewall rules

	$ iptables

sudo unable to resolve host

	 edit /etc/hosts, the username has to be the same as that in
	 /etc/hostname:
	 -----------------------------
	 127.0.0.1	localhost username
	 -----------------------------

----system----

acpi - power manager for laptop

startup accelerate

	$ systemd-analyze # show startup time
	$ systemd-analyze plot > tmp.svg # show startup figure
	$ systemd-analyze blame # show slow services

	think before you try!

	$ sudo systemctl mask plymouth-quit-wait.service
	$ sudo systemctl disable mariadb.service
	$ sudo systemctl disable mysql.service
	$ sudo systemctl disable NetworkManager-wait-online.service

	to resume, use 'enable' or 'unmask'

lsblk - view disks and devices on the computer

mount and umount - open external devices like usb stick

ps - see what programs are running under current user

df - check filesystems

	-T		show filesystem type and used percentage and so on

lsof - view resource occupation status

	$ lsof -i:9999 # check port 9999

get system info

	$ getconf LONG_BIT
	$ uname -a
	$ lsb_release -a

linux mime workaround for markdown

`~/local/share/mime/packages/text-markdown.xml`
```
<?xml version="1.0"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="text/plain">
    <glob pattern="*.md"/>
    <glob pattern="*.mkd"/>
    <glob pattern="*.mkdn"/>
    <glob pattern="*.mdwn"/>
    <glob pattern="*.mdown"/>
    <glob pattern="*.markdown"/>
  </mime-type>
</mime-info> 
```

    $ update-mime-database ~/.local/share/mime

