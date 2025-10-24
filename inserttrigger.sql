-- create trigger execute a task for me 
-- employee 123 ( salary-100)

CREATE TABLE hr.employees123 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL (10,2)
);

select * from hr.EMPLOYEES123;

CREATE or replace TRIGGER check_salary_before_insert
BEFORE INSERT ON employees123
FOR EACH ROW
BEGIN
    if :NEW.salary<0 THEN
        :NEW.salary :=0;
    end if;
END;

INSERT into employees123 (emp_id , emp_name , salary)
VALUES ( 2, 'ajay',-500);