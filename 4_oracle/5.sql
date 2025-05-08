CREATE OR REPLACE FUNCTION fn_nom_complets(client_id INT)
RETURN NUMBER IS
    num VARCHAR(40);
BEGIN
    SELECT numero INTO num
    FROM client
    WHERE id=client_id;

    IF NOT REGEXP_LIKE(num, '^\+?[0-9]{10,15}$') THEN
        RAISE_APPLICATION_ERROR(-20001, 'ce format n"est pas valide ' || num);
    END IF;
    RETURN 1;
--EXCEPTION
    --when non_conform then
        --dbms_output.put_line('ce format n"est pas valide');
END;
/

SELECT fn_nom_complets(1) FROM DUAL;

select * from client;