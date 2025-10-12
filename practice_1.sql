-- practice questions
-- 1. From the Employee table, find the second highest distinct salary
SELECT MAX(salary) AS Second_Highest_Salary FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);

-- 2. Find employees whose salary is greater than the average salary of their department.
SELECT emp_name, dept_id, salary FROM Employee e
WHERE salary > (SELECT AVG(salary) FROM Employee WHERE dept_id = e.dept_id);

-- 3. List each department with the count of employees in it.
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 4. Get employees who joined within the last 6 months
SELECT emp_name, joining_date
FROM Employee
WHERE joining_date >= DATEADD(MONTH, -6, NOW());

-- 5. From the Orders table, get the latest 3 orders
SELECT * FROM Orders ORDER BY order_date DESC LIMIT 3;

-- 6. List all customers who don’t have any orders.
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 7. Show total sales made by each customer, sorted by total amount (highest first).
SELECT c.customer_name, SUM(o.total_amount) AS total_sales
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;



