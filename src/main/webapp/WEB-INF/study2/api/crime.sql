show tables;

create table crime (
	idx int not null auto_increment primary key,
	year int,
	police varchar(20),
	burglar int,
	murder int,
	theft int,
	violence int
);

select * from crime order by year desc, police;

select year,sum(burglar) as totBurglar, sum(murder) as totMurder, sum(theft) as totTheft, sum(violence) as totViolence from crime group by year order by year desc, police;
select year,avg(burglar) as totBurglar, avg(murder) as totMurder, avg(theft) as totTheft, avg(violence) as totViolence from crime group by year order by year desc, police;
