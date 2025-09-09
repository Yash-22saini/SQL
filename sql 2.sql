use sakila;
select * from actor;
-- length == size in bytes 
-- char length  == number in charater 

select first_name , substr(first_name, 3) from actor;
select first_name , substr(first_name,2,3) from actor;
select char_length( trim('  hey  '));
-- aggregate function : function , perform calculations over the rows
-- max min sum count
select * from payment;
select count(amount) from payment;
select sum(amount),avg(amount) from payment;
select sum(amount) as Totalsum, avg(amount) from payment where customer_id=1 ;

-- groupby == collection of similar values 

select customer_id , count(amount) ,sum(amount) , 
  max(amount),min(amount) from payment group by customer_id;

-- get the no. of customer serverd by staaf id 1
-- get the total amount and the avg amount spent by customer id 5
-- get the total amoun spent and the max amount spent in the month of may
-- get the no. of transactuons and the avg transaction amount done by for each month.
select * from payment;
select count(customer_id) from payment where staff_id=1;
select sum(amount) as Totalamount, avg(amount) from payment where customer_id=5 ;
select sum(amount) as Totalamount, max(amount) from payment where month()


select 10.5, round(10.4),round(10.34);
select truncate(76.35,1);

-- date function - get the data from the date 
-- adddate , year ,now, month, extract, date_format
select now(), adddate(now(),20),adddate(now(),interval 2 hour);
select now(), extract(month from now());
select now(),date_format(now() , 'year is %Y  month is %M');

select amount,count(amount) from payment group by amount;
select staff_id,sum(payment_id),count(payment_id) from payment group by staff_id;
select customer_id,sum(amount),count(amount) from payment group by customer_id;
select customer_id,sum(amount) from payment where customer_id>3 group by customer_id;
-- where cannot use to filter aggregate condition
select customer_id,sum(amount) from payment group by customer_id having sum(amount)>100;
select customer_id,sum(amount) from payment where month(payment_date)=6 group by customer_id having sum(amount)>50;

-- multi group 
select customer_id,amount,count(amount),month(payment_date) from payment group by customer_id,amount, month(payment_date)  ;

-- get the avg amount spent in each month by the staff
select staff_id,avg(amount),month(payment_date) from payment group by staff_id,month(payment_date);

-- differnce between where and having, distinct vs group by , types of sql langauges

select staff_id ,amount,count(payment_id) from payment group by staff_id,amount having count(payment_id)>1000;

select * from film_actor;
select count(film_id), count(distinct film_id) from film_actor;
select * from film;
select f.film_id, f.title, f.release_year,fa.actor_id from film as f 
join film_actor as fa 
 where f.film_id=fa.film_id;
 
 
 select a.actor_id , a.first_name,fa.film_id from actor as a 
   join film_actor as fa where a.actor_id = fa.actor_id;
   
  select a.actor_id , a.first_name,fa.film_id from actor as a 
 inner join film_actor as fa on  a.actor_id = fa.actor_id; 
 
select a.actor_id , a.first_name,fa.film_id from actor as a 
   inner join film_actor as fa using (actor_id) ;
    
select * from actor;
select * from film_actor;


 select  a.first_name,count(fa.film_id) from actor as a 
   join film_actor as fa where a.actor_id = fa.actor_id group by a.first_name;
   
select * from film;

select act.actor_id,act.first_name, fa.film_id,film.title from actor as act 
join film_actor as fa 
 join film 
where act.actor_id = fa.actor_id  and fa.film_id=film.film_id;  