B4_fn_dept_name.sql

CREATE OR REPLACE FUNCTION fn_dept_name (
    p_dept_id IN NUMBER
) RETURN VARCHAR2 IS
    v_dept_name departments.department_name%TYPE;
BEGIN
    SELECT department_name INTO v_dept_name
    FROM departments
    WHERE department_id = p_dept_id;
    
    RETURN v_dept_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Unknown Department';
    WHEN OTHERS THEN
        RETURN 'Error Occurred';
END fn_dept_name;
/