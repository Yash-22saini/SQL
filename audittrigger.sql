CREATE table employees456(
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

create TABLE employee_audit (
    action_type VARCHAR(20),                 -- insert , update , delete
    emp_id INT,                               -- employee affected
    old_name VARCHAR(50),
    new_name VARCHAR(50),
    old_department VARCHAR(50),
    new_department VARCHAR(50),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    changed_by VARCHAR(100),                -- user who made the change
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE or replace TRIGGER audit_employee_insert
AFTER INSERT ON employees456
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (
        action_type , emp_id , new_name , new_department , new_salary , changed_by
    )
    VALUES(
        :NEW.emp_id,
        :NEW.emp_name,
        :NEW.department,
        :NEW.salary,
        USER 
    );
END;


INSERT into employees456 values(1,'aman','hr',5000);

-- create a trigger for audits in case of update delete or insert for each row;
-- what is procedure and function
-- monday test 
-- correlated windows joins subquery
