-- DCL ( Data control language)
-- Authentication and Authorization 
 
 -- Authentication -- data validation
 -- authorization -- permission to users for accesing data in database

 select * from mysql.user;
 create user test   identified by 'test123';
 
 create user yash   identified by 'yash123';
 
 create database ecommerce;
 use ecommerce;
 create table customer ( id int, cname varchar(20));
 insert into customer values(1,"abhi"),(2,"aman");
 select * from customer;
 
 grant all privileges on ecommerce.* to yash;
show grants for yash;
revoke all privileges on ecommerce.* from yash;





 