--create database OnlineShopDb

create table users(
	user_id bigint identity(1,1) not null primary key,
	user_email nvarchar(255) null,
	user_pass nvarchar(255) null,
	user_role bit null
)

create table category(
	category_id bigint identity(1,1) not null primary key,
	category_name nvarchar(255) null,
	category_img nvarchar(255) null
)

create table product (
	product_id bigint not null primary key,
	category_id bigint null,
	product_name nvarchar(255) null,
	product_image nvarchar(255) null,
	product_price float null,
	product_description nvarchar(255) null
)

create table bill(
	bill_id bigint not null primary key,
	user_id bigint null,
	total float null,
	payment nvarchar(255) null,
	address nvarchar(255) null,
	date datetime null
)

create table bill_detail(
	bill_detail_id bigint identity(1,1) not null primary key,
	bill_id bigint null,
	product_id bigint null,
	price float null,
	quantity int null
)