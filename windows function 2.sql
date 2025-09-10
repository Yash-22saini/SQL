-- windows function 
-- row_number
use tushar;
select * from employeesales;

select * , row_number() over() from employeesales;

select * , row_number() over(partition by department) from employeesales;

-- rank
select * , rank() over(order by saleamount) from employeesales;

select * , rank() over(partition by department order by saleamount desc) from employeesales;

-- dense rank
select * , rank() over(partition by department order by saleamount desc), 
dense_rank() over(partition by department order by saleamount desc)
from employeesales;

select * , dense_rank() over(partition by department order by saleamount desc) as `rank`
from employeesales;

with datarank as 
(select * ,
 dense_rank() over( order by saleamount desc) as `ranks` from employeesales )
 
 select * from datarank where ranks=10;

with datarank as 
(select * ,
 dense_rank() over(partition by department order by saleamount desc) as `ranks` from employeesales )
 
 select * from datarank where ranks=2;

-- lag and lead 
select* , lead(saleamount) over() from employeesales;

select* , lag(saleamount) over() from employeesales;

INSERT INTO EmployeeSales  VALUES
(1, 'Alice', 'Sales', '2025-06-21', 600.00);

select* , lag(saleamount)  over(partition by department , employeename),
saleamount- lag(saleamount)  over(partition by department , employeename ) from employeesales;


select* , 
saleamount- lag(saleamount)  over(partition by department , employeename order by saledate) 
from employeesales where employeename = 'Alice';

select* , 
lead(saledate) over(partition by department , employeename order by saledate) 
from employeesales where employeename = 'Alice';

select* , 
lead(saledate) over(partition by department , employeename order by saledate) as nextdate ,
datediff(lead(saledate) over(partition by department , employeename order by saledate),saledate)
from employeesales where employeename = 'Alice';


