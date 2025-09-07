show tables;

use sakila;
-- seclect coll,col2 from tbn (table name);
describe customer;
select customer_id, first_name, email from customer;
select * from customer;
-- arthmatic operators -- + - * / // %
select 12+4 as result ;


select* from customer where customer_id=1;
select * from customer where store_id = 1 and active =0;
select * from customer where store_id = 1 or active =0;
select*from film_actor where film_id=3;
select*from film_actor where film_id=3 or film_id= 47;
select*from film_actor where actor_id=1 and film_id= 23;
select*from customer where customer_id<=10 and customer_id!=7;
select * from customer where first_name like'a%';
select * from customer where first_name like'_N_';
select * from customer where first_name like'__A%';
select * from customer where first_name like'%A%A%';
select * from customer
limit 10 offset 2;
select * from customer ;
select first_name,last_name,concat(first_name,' ',last_name) as fullname from customer;
select first_name,left(first_name,2) as left_filter from customer;
select locate('a','yash')as position;
select first_name,locate('a',first_name) as position from customer; 
select first_name,substr(first_name,locate('A', first_name)+1,2) as filter from customer;
select trim(' yash ') as removed_space;
select replace ('ababab','b','_') as replace_b;
select reverse('abcd') as reversed_a;
-- order by 
select * from customer order by active asc;
select * from customer order by address_id desc;
select * from customer order by customer_id desc limit 1 offset 1;
-- SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;
-- SELECT customer_id, COUNT(*) AS order_count FROM customer_id GROUP BY customer_id;
-- SELECT department_id, MAX(salary) AS highest_salary FROM employees GROUP BY department_id ORDER BY highest_salary DESC LIMIT 3;
-- SELECT inventory_id, COUNT(film_id) AS film_count FROM inventory GROUP BY inventory_id HAVING COUNT(film_id) > 10;


