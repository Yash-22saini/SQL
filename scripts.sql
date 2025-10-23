

-- 3. Run the PL/SQL block
SET SERVEROUTPUT ON;

BEGIN
    UPDATE test
    SET first_name = 'yash'
    WHERE employee_id BETWEEN 100 AND 104;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Rows affected: ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No rows updated.');
    END IF;
END;
/





-- explixit cursor
----------
set SERVEROUTPUT on;
    DECLARE
     -- cursor declaration 
        cursor emp_cur is select * from test2;
    emp_data test2%row type ;

    begin 
    -- open cursor
    open emp_cur;
    fetch emp_cur into emp_data;             -- fetch into the variable
    
    while emp_cur%found LOOP           -- checking connection
     DBMS_OUTPUT.PUT_LINE(emp_data.first_name  || in_stock || emp_data.employee_id);
        fetch emp_cur into emp_data;              -- fetching next row 
    end loop; 

    close emp_cur;

    end;
