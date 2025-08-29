--  tiny byte (1byte) 
-- small int (2 byte)   medium byte(3byte)
-- big int ( 2*64) 
use regex1;
create table yash1(name char(10));
insert into yash1 values ('abc');
insert into yash1 values ('abc     ');
select name , char_length(name) from yash1;

select length('hey abc'), char_length('hey abc');

-- char(10) -- size fixed -- memory fix -- the last wide spaces are truncated
-- varchar(10) -- size not fixed -- memory not fixed  -- it is truncated upto the size of characters
drop table yash1;
create table yash1(name varchar(10));
insert into yash1 values ('abc');
insert into yash1 values ('abc                     ');  -- char , truncate upto the size of column 
insert into yash1 values ('a   bc');

select name , char_length(name) from yash1;
drop table yash1;

-- date 
create table yash1(dob date );
insert into yash1 values (curdate());
insert into yash1 values ('2026-01-30');  -- yy-mm--dd
insert into yash1 values ('2021-13-30');  -- incorrect
insert into yash1 values (now());
select * from yash1 ;

create table yash1(dob date );  -- no specific range -- 8 bytes 
insert into yash1 values (curdate());
insert into yash1 values ('2026-01-30');  -- yy-mm--dd
insert into yash1 values ('2021-13-30');  -- incorrect


create table yash2(dob timestamp ); -- specific range of values -- 4 bytes
insert into yash2 values (now());
select * from yash2;

-- blob -- store pdf,image,audio,video 
-- how to store the image in rdbms -- 

-- float -- to store decimal or numeric values such as 10.4 and deciaml digit is upto 4 decimal places  -- 4 bytes
-- double -- to store large decimal values as compare to float -- 8 bytes
create table yash5(salary double(5,2) );
insert into yash5 values (10.2);
insert into yash5 values (10.234); -- 4 is truncate
insert into yash5 values (10345);  -- error here a 3 scaler values are allowed 
insert into yash5 values (103.4567);
select * from yash5;





