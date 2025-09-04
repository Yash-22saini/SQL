-- set operation 
-- reccursive cte(common table expression) -- processing of hiearchical or tree like data structure .
with cte as 
(select 1 as num) 
select * from cte ;

with recursive cte  as 
(select 1 as num
union 
select num+1 from cte where num<6
)
select * from cte ;

with recursive cte  as                              -- finding factorial using recurive cte 
(select 1 as i , 1 as factorial
union 
select i+1 , factorial*(i+1) from cte where i<6
)
select * from cte ;



use regex1;
drop table employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;

with recursive cte as
(select employee_id, name, manager_id, 1 as level
from employees where manager_id is null
union 
select e.employee_id , e.name , e.manager_id , level+1
from employees as e join cte  where e.manager_id=cte.employee_id)
select * from cte;



