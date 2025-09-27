use sakila;
create table studentaccess ( id int , sname varchar(10) ) ; -- ddl
insert into studentaccess values (9,'abc') ; -- dml (method 1) x
insert into studentaccess(id,sname) values (19,'abc');

-- problem 
insert into studentaccess values (11) ; 

-- solution
insert into studentaccess(id) values (22) ; 
select * from studentaccess;
insert into studentaccess(sname) values ('yash') ; 

drop table studentaccess; -- ddl
create table studentaccess ( id int , sname varchar(10) ) ; -- ddl
insert into studentaccess(id) values (22) ; 
insert into studentaccess(sname) values ('yash') ; 
select * from studentaccess;

-- dml (update)
update  studentaccess set sname="raj"; -- all rows are affected
select * from studentaccess;

-- 1 row update with where clause 
update  studentaccess set sname="sameer" where id=22;
select * from studentaccess;

delete from studentaccess where sname ="raj"; -- dml
select * from studentaccess;


-- merge is a dml statement used to inesrt,update,delete based on a conditon ,   not use in mysql
-- syntax
-- merge  into   table   using referncetable
-- when  condition then statement (insert/update/delete)

-- truncate --- only delete data -- structure same -- retain structure of table by just deleting the data of table
-- it first delete structure  + then recreate it -- used to recreate structure of table by droping it first          --  ddl 


-- tiny int -- size is small -- both +ve and -ve numbers ,   tiny it unsigned -  all +ve numbers -- 1byte-- 2^8 --256

-- not null constraint
-- default
use regex1;
create table test2(id int default 0 , salary int not null );
insert into test2 values(10,900);
insert into test2 (salary)values(1078);
select* from test2;

-- unique 
create table test3(id int , salary int default 100 unique );
insert into test3 values(11,800);
insert into test3 values(12,800); -- error here 
insert into test3 (id)values(1078889);
insert into test3 (id)values(20012);
select* from test3;

-- primary 
create table test4(id int primary key , salary int  );
insert into test4 values(10,900);
insert into test4 values(10,800); -- error here 
insert into test4 (id)values(null); -- error
select* from test4;

-- foreign key
drop table studentinfo ;
create table courses1(course_id int primary key , cname varchar(20));
insert into courses1 values (10,'dsa'),(11,'python');
select * from courses1;

create table studentinfo(sid int primary key , sname varchar(20),
courseid int,
foreign key (courseid) references courses1(course_id));

insert into studentinfo values (1, 'yash',10);
insert into studentinfo values (2, 'aashu',11);
insert into studentinfo values (3, 'vani',13); -- error here 
select* from studentinfo;

create table a1 (aid int  , aid2 int , aname varchar(20), primary key (aid,aid2));
insert into a1 values(1,2,'hi');
select * from a1;
create table b1(bid int primary key , bname varchar(20),
aid int, aid2 int ,
foreign key (aid,aid2) references a1(aid,aid2));

-- insert into b1 values (1, 2,'hi'); insert into b1 values (2, 3 , 'abc'); select* from b1;