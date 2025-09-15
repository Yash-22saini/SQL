-- TCL (transaction control language)
-- trnsaction --> a set of logical statement / opreations.
-- used for consisentency in database.
-- transaction (start / stop - end)
-- transaction (commit) --> to save permanently in database 

-- by default --> auto commit is there

select @@autocommit;
use regex1;
select * from courses;

insert into courses values(777,'abc','science');
set @@autocommit = 0;

insert into courses values(778,'abc','science');
select * from courses;

set @@autocommit = 1;

-- Transaction start:
-- start transaction 
-- or
-- autocommit is disable 

-- dml operation (this operation will temporary when  transaction start ) (transaction pending)

-- transaction stop:
-- commit , roll back 
-- ddl statement 
-- dcl statement 

select @@autocommit;
insert into courses values (900, "kamal", "kamal khan");
update courses set coursename= "regex";
select * from courses;

rollback;                   -- revert the changes or dont save the changes/undo

insert into courses values (900, "kamal", "kamal khan");
select * from courses;
commit;                        -- to save the changes alter

select @@autocommit;
select @@autocommit=1;
start transaction;  -- use ddl/dcl statement to auto save  or we can use commit to save the transaction 
insert into courses values (911, "kamal1", "kamal khan1");
create table tushar123(id int);  -- transaction is saved here -- using ddl statement , autocommit , cant revert back as it is auto saved 
select * from courses ;

start transaction;  
insert into courses values (912, "a", "ab");
insert into courses values (913, "b", "bd");
savepoint courses_insert_chk;
update courses set coursename="regex" where courseid=913;
rollback to courses_insert_chk;    -- only roll back till the save point created , if used only roll back it will revert all the changes
select * from courses ;





