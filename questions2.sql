select * from customer;
select min(address_id) from customer;
-- finding the customer name who is having minimum address id
select first_name from customer where address_id =(select min(address_id) from customer);
-- find the customer name having higher address id
select first_name from customer where address_id =(select max(address_id) from customer);
-- find the customer who is having second highest adress id 
select * from customer where address_id < (select max(address_id) from customer) ;
select * from customer where address_id = (select max(address_id) from customer where address_id < (select max(address_id) from customer));
-- find the sum of sales region wise
-- select region, sum(quantity) as total from sales group by region ;
-- find the sum of second highest region
-- select region, sum(quantity) as total from sales group by region having max(total)<(select max(total) from sales 

