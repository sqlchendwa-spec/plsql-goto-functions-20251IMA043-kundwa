CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_salary IN NUMBER
) RETURN NUMBER IS
    v_tax NUMBER := 0;
BEGIN
    IF p_salary IS NULL OR p_salary <= 0 THEN
        RETURN 0;
    ELSIF p_salary <= 5000 THEN
        v_tax := p_salary * 0.05;
    ELSIF p_salary <= 15000 THEN
        v_tax := p_salary * 0.15;
    ELSE
        v_tax := p_salary * 0.25;
    END IF;
    RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/