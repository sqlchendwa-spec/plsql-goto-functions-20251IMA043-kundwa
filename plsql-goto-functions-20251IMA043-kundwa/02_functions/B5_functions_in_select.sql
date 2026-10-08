SELECT 
    employee_id,
    first_name || ' ' || last_name AS full_name,
    salary AS monthly_salary,
    fn_annual_salary(salary) AS annual_salary,
    fn_dept_name(department_id) AS department_name
FROM employees;