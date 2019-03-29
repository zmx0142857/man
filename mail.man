reference

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-on-ubuntu-16-04

server side -- postfix

1.	install.  before installing postfix, MAKE SURE TO REMOVE other mail
	servers, like sendmail.

	pass environmental variable DEBIAN_PRIORITY=low to do
	some configuration.

	$ sudo apt update
	$ sudo DEBIAN_PRIORITY=low apt install postfix

2.	answer questions.  arrow keys and tab to move around, enter to
	confirm.

	[General type of mail configuration]		Internet Site
	[System mail name]							<use default>
	[Root and postmaster mail recipient]		<your username>
	[Other destinations to accept mail for]		<use default>
	[Force synchronous updates on mail queue]	No
	[Local networks]							<use default>
	[Mailbox size limit]						0 (this means no limit)
	[Local address extension character]			+
	[Internet protocols to use]					all

	if these questions don't appear, run

	$ sudo dpkg-reconfigure postfix

3.	tweak the postfix configuration

	$ sudo postconf -e 'home_mailbox = .mailbox/' # do not omit slash /
	$ sudo postconf -e 'virtual_alias_maps = hash:/etc/postfix/virtual'

	view settings:

	$ postconf | grep home_mailbox
	$ postconf | grep virtual_alias_maps

4.	map mail address

	$ sudo vi /etc/postifx/virtual

	list any addresses that you wish to accept email for.  for example:

	contact@example.com <username>
	admin@example.com <username>

	close and save file.  apply the mapping by:

	$ sudo postmap /etc/postfix/virtual

	restart postfix to make sure all changes have been applied

	$ sudo systemctl restart postfix

5.	adjust firewall

	if you are running ufw firewall, we'll have to allow an exception for
	Postfix.

	$ sudo ufw allow Postfix

client side -- s-nail

1.	make sure $MAIL envrionmental variable is set correctly

	$ echo 'export MAIL=~/.mailbox' | sudo tee -a /etc/bash.bashrc | sudo tee -a /etc/profile.d/mail.sh
	$ source /etc/profile.d/mail.sh
	$ echo $MAIL
	/home/<username>/.mailbox/

2.	install and configure s-nail

	s-nail is a variant of the BSD xmail client. The GNU mail has some
	frustrating limitations, such as always saving read mail to the mbox
	format regardless of the source format. So just choose s-nail.

	$ sudo apt install s-nail
	$ sudo vi /etc/s-nail.rc

	add following lines to the end of the file:

	# my config
	# allow client to open with empty inbox
	set emptystart
	# set .mailbox/ as your mail directory
	set folder=.mailbox/
	# store sent mail
	set record=+sent

3.	send yourself an initial email!

	$ echo 'init' | s-nail -s 'init' -Snorecord <username>
	$ ls .mailbox
	cur new tmp

check inbox

	$ s-nail

	? <enter>		- display new message
	? h				- go back to message list
	? d				- delete message
	? q				- quit and go back to the terminal
	? file +sent	- view sent email

compose email

	write a text file like:

	~/myemail
	----------------------------------------
	Hello, 你好

	This is a test.  Please confirm receipt!
	如果没有收到，请查看你的垃圾箱！
	----------------------------------------

	$ s-nail -s 'subject: test' -r 'from me!' user@email.com < myemail

	the -r field is optional.


