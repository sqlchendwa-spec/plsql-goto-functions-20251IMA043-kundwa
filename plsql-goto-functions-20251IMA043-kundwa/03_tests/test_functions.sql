SET SERVEROUTPUT ON;

DECLARE
    v_annual NUMBER;
    v_years  NUMBER;
    v_tax    NUMBER;
    v_dept   VARCHAR2(50);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TESTING INDIVIDUAL STORED FUNCTIONS ---');
    
    v_annual := fn_annual_salary(5000);
    DBMS_OUTPUT.PUT_LINE('Annual Salary (5000/mo): $' || v_annual);
    
    v_years := fn_years_of_service(TO_DATE('2020-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Years of Service (2020-01-01): ' || v_years || ' years');
    
    v_tax := fn_calculate_tax(12000);
    DBMS_OUTPUT.PUT_LINE('Calculated Tax ($12000 salary): $' || v_tax);
    
    v_dept := fn_dept_name(20);
    DBMS_OUTPUT.PUT_LINE('Department Name (ID 20): ' || v_dept);
END;
/