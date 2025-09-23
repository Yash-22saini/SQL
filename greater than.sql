use sakila ;
select * from payment;
-- find the paymentid,customer-id,amount
-- where amount is same as payment id=5

select payment_id,customer_id,amount from payment where amount=(select amount from payment where payment_id=5);

select payment_id,customer_id,amount from payment where amount in (select amount from payment where payment_id=2 or payment_id=3);

select payment_id,customer_id,amount from payment where amount =any (select amount from payment where payment_id=2 or payment_id=3);

select payment_id,customer_id,amount from payment where amount >any (select amount from payment where payment_id=2 or payment_id=3);
-- > any - greater than the minimum value of subquery 

select payment_id,customer_id,amount from payment where amount <=any  (select amount from payment where payment_id=2 or payment_id=3);

select payment_id,customer_id,amount from payment where amount <= any (select amount from payment where payment_id=2 or payment_id=3 or payment_id =5);
-- <=0.99  ,<=5.99 or <=9.99

select payment_id,customer_id,amount from payment where amount <all(select amount from payment where payment_id=2 or payment_id=3 or payment_id=5);

select payment_id,customer_id,amount from payment where amount >all(select amount from payment where payment_id=2 or payment_id=3 or payment_id=5);

