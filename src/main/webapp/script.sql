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