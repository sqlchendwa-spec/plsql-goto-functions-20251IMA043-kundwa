SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- C2: PAYROLL VALIDATOR TEST RESULTS ---');
    DBMS_OUTPUT.PUT_LINE('Emp 100 Status: ' || fn_validate_payroll(100));
    DBMS_OUTPUT.PUT_LINE('Emp 103 Status: ' || fn_validate_payroll(103));
    DBMS_OUTPUT.PUT_LINE('Emp 999 Status: ' || fn_validate_payroll(999));
END;
/