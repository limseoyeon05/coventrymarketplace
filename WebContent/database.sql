create database shop;
use shop;
create user 'shop'@'localhost' identified by '1234';

grant all privileges on *.* to 'shop'@'localhost';

create table t_shopmember (
	id varchar(20) PRIMARY KEY,
	name varchar(200),
	password varchar(200),
	email varchar(20),
	gender char(1),
	address varchar(2000)
);

create table t_product(
	idx int AUTO_INCREMENT primary key,
	producttype varchar(20),
	title varchar(1000),
	contents varchar(2000),
	price varchar(10),
	filename varchar(200),
	writedate varchar(20)
);

create table t_order(
	orderno int AUTO_INCREMENT primary key,
	productidx int,
	price varchar(10),
	qty varchar(10),
	develiyaddress varchar(2000),
	userid varchar(20),
	writedate varchar(20)
);
