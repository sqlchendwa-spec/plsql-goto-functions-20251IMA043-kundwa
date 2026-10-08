CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN NUMBER
) RETURN VARCHAR2 IS
    v_salary     employees.salary%TYPE;
    v_hire_date  employees.hire_date%TYPE;
    v_dept_id    employees.department_id%TYPE;
    v_dept_count NUMBER;
BEGIN
    SELECT salary, hire_date, department_id 
    INTO v_salary, v_hire_date, v_dept_id
    FROM employees 
    WHERE employee_id = p_emp_id;

    IF v_salary IS NULL OR v_salary <= 0 THEN
        RETURN 'INVALID: Salary must be greater than zero.';
    END IF;

    IF v_hire_date > SYSDATE THEN
        RETURN 'INVALID: Hire date cannot be in the future.';
    END IF;

    SELECT COUNT(*) INTO v_dept_count 
    FROM departments 
    WHERE department_id = v_dept_id;

    IF v_dept_count = 0 THEN
        RETURN 'INVALID: Assigned department does not exist.';
    END IF;

    RETURN 'VALID: Employee payroll record meets all business rules.';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee ID does not exist.';
    WHEN OTHERS THEN
        RETURN 'ERROR: Validation process failed.';
END fn_validate_payroll;
/