create database CDC_Demo

create table People
(
	id int primary key not null,
	first_name varchar(100),
	last_name varchar(100),
	email varchar(100));

exec sys.sp_cdc_enable_db

exec sys.sp_cdc_enable_table
@source_schema='dbo',
@source_name='People',
@role_name=NULL,
@supports_net_changes=1;


insert into People values(1001,'Ripa','Shah','ripashah89@gmail.com');
insert into People values(1002,'Yash','Shah','yashshah1943@gmail.com');
insert into People values(1003,'Krupa','Shah','krupashah2000@gmail.com');
insert into People values(1005,'Archil','Shah','archilshah99@gmail.com');
insert into People values(1006,'Mohit','Darji','mohitdarji@gmail.com');
update people set email='krupa2001@gmail.com' where id='1003';
update people set email='archil1999@gmail.com' where id='1005';
update people set id='1004' where first_name='Archil';

delete from People where id='1006';
