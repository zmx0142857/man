# install and configure

## ubuntu + mariadb

    $ sudo apt install mariadb-server
    $ sudo apt install mariadb-client-core-10.1 # optional

### secure configuration

    # on first installation run this to configure root password and more:
    $ sudo mysql_secure_installation

    # set root password:
    $ sudo mysqladmin -u root password

    # reset root password:
    $ sudo mysqladmin -u root -p password

    # forget password?
    $ sudo vi /etc/my.cnf
    write: skip-grant-tables

### mysql server

    $ service mysql status                  # 查看服务状态
    $ sudo service mysql start/stop/restart # 启动/停止/重启服务

    # 以下命令也可查看服务状态
    $ systemctl status mysql.service
    $ ps -ef | grep mysqld

    # 以下命令也可启动服务
    $ sudo mysqld_safe

    # 以下命令也可关闭服务
    $ sudo mysqladmin -u root -p shutdown

### files

    /etc/my.cnf              # config file
    /var/log/mysql/error.log # error log

## termux + mariadb

    # install
    $ apt install mariadb
    $ mysql_install_db

    # start
    $ mysqld &
    ^C

    $ mysql -u root # login as root
    $ mysql         # login as user

## windows + mysql

### install

download `mysql-installer-community-8.0.22.0.msi`, follow instructions.

### install (legacy)

download `mysql8.0.zip` from official site and unzip. add `mysql-dir/bin/` to `%path%`

    cmd:admin> mysqld --initialize
    cmd:admin> mysqld --install

if you are not prompted to set root password, you can find a
temporary one in file `mysql-dir/data/DESKTOP-xxx.err`

    cmd:admin> mysql_secure_installation

and enter the temporary password, then you can set your own root password.

### server

start/stop mysql server

    cmd:admin> net start/stop mysql

### files

config file

    C:\ProgramData\MySQL\MySQL Server 8.0\my.ini

## GUI

install workbench (free) or navicat (14 days trial) to work under GUI.

# housework

## administration

### login

    $ mysql -h [host=localhost] -P [port=3306] -u <user> -p

sudo is required when login as root on ubuntu.

### enable foreign access to database

**warning**: this may let others visit your database.

first show current access privileges.
`::3306` means foreign access is already granted.
`127.0.0.1:3306` means only localhost is granted.

    $ netstat -an | grep 3306

/etc/mysql/mysql.conf.d/mysql.cnf

    # bind-address=127.0.0.1'  <--- comment this out

login to mysql as root, then:

    > use mysql;
    > update user set host='%' where user='root' and host='localhost';
    > select host, user from user;
    > flush privileges;

exit and restart mysql service.

### create user

login as root

    -- create user
    -- '%' means 'locahost' but not exactly
    > create user '<user>'@'%' identified by '<password>';
    -- grant privileges
    > grant all privileges on <database>.<table> to '<user>'@'%'
      identified by '<password>' with grant option;
    -- see user's privileges
    > show grants for '<user>'@'%';
    -- revoke (withdraw) privileges
    > revoke create on database.table from '<user>'@'%';
    -- remember to refresh the change
    > flush privileges;
    -- delete user
    > drop user '<user>'@'%';

**NOTE**

1. 'all privileges' can be replaced by SELECT, CREATE, DROP and so on.
2. 'with grant option' allows the new user to grant his privileges to
   others.

## backup

### mysqldump - official tool

    # backup databases
    $ mysqldump -u <user> --databases <db1> <db2> ... -p > backup.sql

    # backup everything
    $ mysqldump -u <user> --all-databases -p > backup.sql

    # restore from backup
    mysql -u <user> -p < backup.sql

### mysqlhotcopy -- a perl tool for mysql backup

download perl support: http://dev.mysql.com/downloads/dbi.html.
this tool supports tables of MyISAM type only,
tables of InnoDB type cannot be copied directory.

    $ mysqlhotcopy [option] <db1> <db2> ... backup_dir/

### import from excel

1. export excel file as .csv file (in utf-8 encoding).
2. in mysql workbench, rightclick table -> import wizard -> next -> next -> next -> waiting... -> ok

### import from text file

each column is separated with a tab, each row is separated with a linebreak

    > load data local infile '<file>' into table <table> [fields terminated by ','];
    > show warnings;

# query

### wildcards

    * for zero or more characters
    % for one or more characters
    _ for one character

### info

    > status;
    > select version();
    > show variables like '%char%'; -- show mysql charset

### see update time of a table

    > use information_schema;
    > select create_time from tables where table_schema='<database>' and
      table_name='<table>';

### show and set

    > show databases;
    > use <database>;
    > show tables;
    > describe <table>; -- or show columns from <table>; show create table <table>;
    > show index from <table>;
    > show table status [from <database>] [like 'pattern'] \g;
    > show warnings;
    > show search_path;
    > set search_path to 'S-T', public;

### create and drop database

    > create database <database>;
    > drop database <database>;

### create and drop schema

    > create schema [<schema>] authorization <user>;
    if <schema> is omitted, use user name.

    > drop schema <schema> cascade/restrict;
    cascade: delete all object related with <schema>
    restrict: deny deletion if anything is related with <schema>

### create and drop table

    > create table <table> (
        <attr1> <type1> [constraint],
        <attr2> <type2> [constraint],
        ...
        <attrn> <typen> [constraint],
        [table-level constraint]
    );

    > create table select ...;

    ===========
    constraint
    -----------
    primary key
    unique
    not null
    ===========

    ===================================================================
    type                                byte    description
    -------------------------------------------------------------------
    char(n)/character(n)                n
    varchar(n)/charactervarying(n)      <= n
    clob                                        big char obj
    blob                                        big binary obj
    tinyint                             1
    smallint                            2
    int/integer                         4
    bigint                              8
    dec(p,d)/decimal(p,d)/                      p total digits, with
      numeric(p,d)                              d digits after dot
    real                                        single float
    double[precision]
    float(n)                                    float of precision >= n
    boolean
    date                                        yyyy-mm-dd
    time                                        hh:mm:ss
    timestamp
    interval                                    time interval
    ===================================================================

    > drop table <table> [cascade/restrict];

### alter table -- add and drop columns

    > alter table <table> add <attr> <type> [constraint];
    > alter table <table> add [table-level constraint];
    > alter table <table> alter <attr> <type>;
    > alter table <table> change column <attr> <newname> <type>;
    > alter table <table> drop <attr> [cascade/restrict];
    > alter table <table> drop constraint <constraint> [cascade/restrict];

### add delete and update rows

    > insert into <table> (<attr1>, <attr2>, ..., <attrn>)
      values (<val1>, <val2>, ..., <valn>);
    > insert into select ...;

    > replace into ...;
    > insert into ... on duplicate key update ...;
    > insert ignore into ...;

    use 'value' instead of 'values' is also acceptable

    > update <table> set <attr>=<val> where <condition>;

    > delete from <table> where <condition>;

### select from table

    > select [all/distinct] <attr1>, <attr2>, ..., <attrn> from <table>
      [as <alias>]
      [where <condition>]
      [limit <n>]
      [group by <attr> [having <condition>]
      [order by <attr> <order>];

    order: asc/desc, defaults to asc

    example:
    > select * from <table>;        # show everything from table
    > select count(*) from <table>; # show total line count of the table

### create and drop view

    > create view <view> as select ...;

### create alter and drop index

    > create [unique] [cluster] index <index> on <table> (
        <attr> [<order>],
        <attr> [<order>],
        ...
        <attr> [<order>]
      );

    unique: each index value corresponds to unique data record
    cluster: cluster index
    order: asc/desc, defaults to asc

    > alter index <index> rename to <newname>;
    > drop index <index>;

    force index
    > select ... from <table> force index <index> where ...;

### example

    > create database company;
    > use company;
    > create table people (
        name varchar(50),
        gender varchar(6),
        age int(3),
        address varchar(50)
    );

    add/delete columns
    > alter table people add id int(10);
    > alter table people drop address;

    add a new record
    > insert into people (name, gender, age) value ('Adam', 'male', 20);

    change an existing record
    > update people set id=1 where name='Adam';

    then insert more columns:
    > insert into people (name, gender, age, id) values
      ('Bob', 'male', 20, 2),
      ('Alice', 'female', 18, 3),
      ('Dalia', 'female', 22, 4),
      ('db\_design', 'female', 23, 6);

### advanced select example

    * where

    > select * from people where gender='female';
    > select * from people where age between 18 and 20;
    > select * from people where age >= 18 and age <= 20;
    > select * from people where name like 'db\_design' escape '\';

    ====================================
    relational operators

    =           euqal
    <>          inequal
    <           ┐
    >           │
    <=          ├→ you know
    >=          ┘
    between     a <= x <= b
    like        search for char pattern
    [not] in
    ====================================

    * order (default ascend)

    > select * from people order by age asc;
    > select * from people order by age desc, id desc;

    * concat

    > select concat(name, ' is ', age, ' years old') from people;

    * group by

    > select continent, sum(GNP) from country group by continent;
    > select continent, sum(GNP) from country group by continent having
        sum(GNP) > 1000000;

    ==================================================================
    statistics functions    sum count avg max min
    other functions         lower upper
    ==================================================================

    * A join B on condition

    select from more than one tables

    > select district, continent from city join country
      on city.countrycode = country.code
      where city.name = 'Wuhan';

### primary key

    used to identify a record. id must distinct from each other.
    set primary key on creating table:

    > create table people(
        id int(18) primary key,
        ...
    );

    or alter it later:

    > alter table people add primary key(id);

### save result in a new table

    > create table result(
        city varchar(50),
        population int(11),
        countrycode varchar(4)
    );

    > insert into result
        select name, population, countrycode from city
        where population between 2000000 and 5000000;

### transaction

    begin;
    ...
    commit;

    begin;
    ...
    rollback;

    set transaction isolation level <level>;

    =======================
    level
    -----------------------
    read uncommitted
    read committed
    repeatable read
    serializable
    =======================


# FAQs

## login without sudo

sudo is required when login as root on ubuntu. to login without sudo:

    $ sudo mysql -u root
    > select user, host from mysql.user;
    > drop user 'root'@'localhost';
    > create user 'root'@'%' identified by '';
    > grant all privileges on *.* to 'root'@'%' with grant option;
    > flush privileges;

## 数据库编码

    > show variables like 'character%'; -- 查看编码
    > set character_set_client=utf8; -- 重新登陆后失效

    windows 下修改配置无效:
    ----配置文件--------------
    [client]
    default-character-set=utf8

    [mysqld]
    character-set-server=utf8
    --------------------------

    $ mysql --default-character-set=utf8 -- 有效

## 新版 mysql 的加密算法不能被 node 识别

    报错:
    client does not support authentication protocol requested by server;
    consider upgrading mysql client

    解决:
    mysql> alter user 'username'@'%' identified with mysql_native_password by 'password';
    mysql> flush privileges;

