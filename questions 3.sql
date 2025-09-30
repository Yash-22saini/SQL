select * from payment;
select max(amount) from payment; 
select staff_id,amount, if (amount<5 , 'low ', 'high') as category from payment;
select staff_id,amount,case when amount<5 then'low 'when amount>=6 and amount<=8 then 'medium' else 'high' end as category from payment;

select student_id,class,marks, case when marks<=20 then 'Grade c' when marks>=20 and marks<=70 then 'grade b' else 'grade a' end as grades from student;

