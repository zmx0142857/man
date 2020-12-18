install
	
	$ sudo apt install nginx-core

config

	suppose you have an index at local directory: .../some-dir/index.html

	$ cd /var/www
	$ sudo ln -s .../some-dir/ .
	$ sudo vi /etc/nginx/conf.d/nginx.conf

	add following lines:
	-----------------------------------------------------------------
	http {
		...
		server {
			server_name localhost;     # or 192.168.1.100 for example
			listen      80;
			root        /var/www/some-dir;
			index       index.html;
		}
	}
	-----------------------------------------------------------------

	$ sudo nginx -s reload

	now launch browser and type 'locahost' at address bar!

windows

1. download, unzip
2. configure

    $ cd conf
    $ vi zmx.conf
    ----zmx.conf--------------
    server {
        listen 80;
        server_name localhost;
        root C:/Users/zmx/doc;
        index index.html;
    }
    --------------------------
    $ vi nginx.conf
    comment the server{} block, add this line instead:
    ----------------
    include zmx.conf
    ----------------

3. nginx commands

    $ start nginx :: start server
    $ nginx -s reload :: reload conf
    $ nginx -t -c conf/nginx.conf :: test the conf syntax
