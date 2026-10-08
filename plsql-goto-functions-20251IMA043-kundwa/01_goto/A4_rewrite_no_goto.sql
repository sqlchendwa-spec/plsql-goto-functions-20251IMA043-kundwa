SET SERVEROUTPUT ON;

DECLARE
    v_emp_id    employees.employee_id%TYPE := 103;
    v_salary    employees.salary%TYPE;
    v_last_name employees.last_name%TYPE;
    v_status    VARCHAR2(100);
BEGIN
    SELECT last_name, salary INTO v_last_name, v_salary
    FROM employees
    WHERE employee_id = v_emp_id;

    CASE 
        WHEN v_salary < 5000 THEN
            v_status := v_last_name || ' has a LOW salary ($' || v_salary || '). Eligible for 15% increase.';
        WHEN v_salary BETWEEN 5000 AND 15000 THEN
            v_status := v_last_name || ' has a MEDIUM salary ($' || v_salary || '). Eligible for 10% increase.';
        ELSE
            v_status := v_last_name || ' has a HIGH salary ($' || v_salary || '). No increase required.';
    END CASE;

    DBMS_OUTPUT.PUT_LINE(v_status);
    DBMS_OUTPUT.PUT_LINE('Salary review process completed for Employee ID: ' || v_emp_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_emp_id || ' not found.');
END;
/