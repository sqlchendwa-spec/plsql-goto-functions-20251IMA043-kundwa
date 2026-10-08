SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER := -7;
BEGIN
    IF v_num > 0 THEN
        GOTO positive_label;
    ELSIF v_num < 0 THEN
        GOTO negative_label;
    ELSESET SERVEROUTPUT ON;
