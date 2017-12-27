create database jsp4;
use jsp4;
create table user_info(
	userno int AUTO_INCREMENT PRIMARY key,
	username varchar(200) not null,
	userid varchar(200) not null,
	userpwd varchar(200) not null,
	userage int not null,
	useraddress varchar(400)
);
select * from user_info;
select * from user_info where userno>2 && username='홍길동';
select * from user_info where useraddress like '%강%';
select * from user_info where username like '홍__';
insert into user_info(
	username,userid,userpwd,userage,useraddress
) values (
	'홍길동','hong','1234',22,'서울시 강남구 역삼동'
);
insert into user_info(
	username,userid,userpwd,userage,useraddress
) values (
	'홍길동2','hong2','1234',22,'서울시 마포구 도화동'
);
delete from user_info where userno=2;
update user_info set userno=2 where userno=4;
select @@autocommit; /*자동저장 true(1)*/
set @@autocommit = 0; /*자동저장 false(0)*/
commit;
rollback;
/*AUTO_INCREMENT은 transaction 작용해도 적용됨*/
/*※내가 수정하고 있는 거 남이 수정못하게 rock*/
drop table user_info;

/*20171205*/
create table depart_info(
	dino int AUTO_INCREMENT PRIMARY key,
	diname varchar(200) not null,
	dietc varchar(300)
);
select * from depart_info;
insert into depart_info(
	diname,dietc
) values (
	'개발팀','맨날야근팀'
);
insert into depart_info(
	diname,dietc
) values (
	'디자인팀','맨날야근야근팀'
);
alter table user_info add column dino int;
update user_info set dino=1;
select ui.userno as `번호`, ui.username as `이름` from user_info ui;
/*두 테이블 조인(교집합)*/
select ui.userno, ui.username, di.diname from user_info ui, depart_info di where ui.dino=di.dino;
select ui.userno, ui.username, di.diname from user_info ui, depart_info di where ui.dino=di.dino and ui.dino=2;
/*두 테이블 조인(합집합)*/
select ui.userno, ui.username, di.diname from user_info ui, depart_info di;
/*subQuery(교집합)*/
select ui.userno, ui.username, (select di.diname from depart_info di where di.dino=ui.dino) as `diname` from user_info ui;
select ui.userno, ui.username, (select di.diname from depart_info di where di.dino=ui.dino) as `diname`, ui.dino from user_info ui where (select di.diname from depart_info di where di.dino=ui.dino)='디자인팀';
select * from (select ui.userno, ui.username, (select di.diname from depart_info di where di.dino=ui.dino) as `diname`, ui.dino from user_info ui) tmp where diname='디자인팀';
insert into user_info(
	username,userid,userpwd,userage,useraddress
) values (
	'홍길동','hong','1234',33,'서울시 강남구 역삼동'
);
select * from user_info where userage in(33,44);
select * from user_info where userage not in(33,44);

select * from user_info;
update user_info set userpwd='red' where userage in(33,44);


/*20171206 jsp query*/
select * from user_info ui, 
depart_info di 
where ui.dino=di.dino;

/*20171211 jsp query*/
select * from user_info ui, 
depart_info di 
where ui.dino=di.dino
and ui.userid='test' and ui.userpwd='1234';

/*20171212 jsp query*/
select userid, count(1) from user_info
group by userid having count(1)>=2;
select * from user_info
where userid in (select userid from user_info
group by userid having count(1)>=2);
select min(userno), max(userno) from user_info
where userid='hong';
update user_info set dino='2' where userno=4;
select * from user_info;
alter table user_info add unique index idx_unique_userid (userid);

/*20171214 jsp query*/
select * from
	user_info ui
left outer join
	depart_info di 
on ui.dino=di.dino
;

/*20171227 jsp query*/
alter table user_info
add foreign key(dino)
REFERENCES depart_info(dino);

select * from user_info
where dino not in(select dino from depart_info);
select * from user_info;
commit;

