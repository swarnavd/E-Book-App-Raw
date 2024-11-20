create table registration(
	id int primary key auto_increment,
	name varchar(30),
	email varchar(40),
	password varchar(30)
);

insert into registration(name,email,password,phone) values(?,?,?,?);

create table book(
bookid int primary key auto_increment,
name varchar(30),
author varchar(30),
price varchar(30),
category varchar(30),
status varchar(30),
image varchar(30),
email varchar(30)
);

create table cart(
bid int,
uid int,
bookname varchar(100),
authorname varchar(100),
price double,
total_price double
);

create table orderprod(
id int,
orderid varchar(50),
username varchar(100),
email varchar(100),
address varchar(100),
phone varchar(30),
bookname varchar(100),
author varchar(100),
price double,
payment varchar(30)
);

