use regex1;
-- Department Table
CREATE TABLE Departments1(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
-- Employee Table
CREATE TABLE Employees1(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT NULL,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments1(dept_id)
);

-- Insert Departments
INSERT INTO Departments1(dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');
-- Insert Employees
INSERT INTO Employees1(emp_id, emp_name, manager_id, salary, dept_id) VALUES
(101, 'Alice', NULL, 90000, 3), -- Alice is IT Head
(102, 'Bob', 101, 60000, 3), -- Bob reports to Alice
(103, 'Charlie', 101, 55000, 3), -- Charlie reports to Alice
(104, 'David', 102, 40000, 3), -- David reports to Bob
(105, 'Eve', NULL, 80000, 2), -- Eve is Finance Head
(106, 'Frank', 105, 50000, 2), -- Frank reports to Eve
(107, 'Grace', NULL, 75000, 1), -- Grace is HR Head
(108, 'Heidi', 107, 45000, 1), -- Heidi reports to Grace
(109, 'Ivan', NULL, 70000, 4), -- Ivan is Marketing Head
(110, 'Judy', 109, 48000, 4); -- Judy reports to Ivan

-- 	2. Find each employee’s manager (if any).
-- 	3. Calculate average salary per department.
-- 	4. Find employees who earn more than the average salary of their department.
-- 	5. Show each employee with manager name, department, and whether they earn
-- above their department average.
-- 	6. Find the highest-paid employee(s) in each department using a subquery  
select* from employees1;
select e.emp_id, e.emp_name, m.emp_name from Employees1 as e
join Employees1 as m on e.manager_id = m.emp_id;

select*from departments1;
select d.dept_name, avg(e.salary) from employees1 as e join departments1  as d on e.dept_id = d.dept_id group by d.dept_name;

select e.emp_name, e.salary, d.dept_name from employees1 as e
join departments1 as d on e.dept_id = d.dept_id
where e.salary > ( select avg(e2.salary) from employees1 as e2 where e2.dept_id = e.dept_id);

select e.emp_name, e.salary, d.dept_name, m.emp_name from employees1 as e
left join employees1 as m on e.manager_id = m.emp_id
join departments1 as d on e.dept_id = d.dept_id
where e.salary>any ( select avg(e2.salary) from employees1 as e2 where e2.dept_id = e.dept_id);



