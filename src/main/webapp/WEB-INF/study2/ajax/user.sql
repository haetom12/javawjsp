show tables;

create table user (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);

desc user;

insert into user values (default, 'admin', '관리자', 22, '서울');
insert into user values (default, 'haetom', '천해찬', 26, '세종');
insert into user values (default, 'haetom12', '해찬들', 30, '대전');
insert into user values (default, 'haettt', '아이디', 18, '청주');
insert into user values (default, 'haetom1234', '백정광', 24, '괴산');

select * from user;
select * from user order by idx desc;

--delete from user where mid='hahaha';