-- Find the employees who earn more than the average salary.
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


-- Get the employees working in the same department as ‘John’.
SELECT emp_name
FROM employees
WHERE department_id = (
    SELECT department_id FROM employees WHERE emp_name = 'John'
);

-- Display all employees whose salary is greater than the lowest salary in their department.
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees);


-- Find the second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);


-- List employees who earn more than the lowest salary in their department (correlated subquery)
SELECT e1.emp_name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
    SELECT MIN(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);

-- Show employees hired before ‘Alice’
SELECT emp_name, hire_date
FROM employees
WHERE hire_date < (SELECT hire_date FROM employees WHERE emp_name = 'Alice');
