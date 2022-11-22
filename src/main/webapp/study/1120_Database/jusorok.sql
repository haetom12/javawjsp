show tables;

select * from bank;

select * from gogek;

create table jusorok (
	idx int not null auto_increment primary key,  /* 고유번호 */
	mid varchar(20) not null,  								 /* 아이디 */
	pwd varchar(20) not null, 								 /* 비밀번호 */
	name varchar(20) not null, 								 /* 성명 */
	point int default 100, 										 /* 방문포인트 */
	lastDate datetime default now(), 					 /* 최종방문날짜 */
	daycount int default 0 				          	 /* 하루 카운트 */
);

desc jusorok;

insert into jusorok values (default, 'admin', '1454', '관리자', default, default, default); /* table 값 넣기 */

select * from jusorok;

--delete from jusorok where mid='haetom';

--drop table jusorok;

