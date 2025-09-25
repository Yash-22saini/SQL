create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);


-- employess have the same salary as that of their department avg.salary
select * from employees;
select empid , empname , deptid , salary from employees 
where (salary,deptid) in 
	(select avg (salary) , deptid from employees group by deptid);
    
-- a correlated subquery is nested sql query that depends on the outer query for iits values and is executed repeatedly for each row processed by the outer query 
-- correlated subquery for each row but nested query executes repeatedly

select e1.empid, e1.empname , e1.deptid,e1.salary 
from employees as e1
where e1.salary   > 
( select avg(salary) from employees as e2 where e1.deptid=e2.deptid);

use regex1;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);


select * from students;
select * from courses;
select * from enrollments;
-- get the stuid , stuname, deptname, and the courses name for the students who  has enrolled
-- select s.studentid , s.studentname , s.department , c.coursename from students as s join courses as c on c.department = s.department; -- incorrect

-- get the student name , and the avg grade the person has recieved
select s.studentname , avg(e.grade) from students as s join enrollments as e   on s.studentid = e.studentid group by s.studentname;


use sakila;
select* from payment;
select * from customer;
-- get the payment id , customername , month , last working day of month where the amount spent by the customer is greater then the avg amount spended by the user itself only after the year 2004
select p.payment_id,c.first_name,month(p.payment_date), last_day(p.payment_date)
from payment as p join customer as c join on p.customer_id = c.customer_id
 where year(p.payment_date>2004) and p.amount>( select avg(p2.amount) from payment p2 where p2.customerid = p.customerid and year(p2.payment_date) > 2004);
 
   select p.amount>( select avg(p2.amount) from payment p2 where p2.customerid = p.customerid ) from payment as p;
