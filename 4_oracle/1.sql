CREATE OR REPLACE FUNCTION fn_total_achats(client_id IN NUMBER)
RETURN NUMBER IS
    T NUMBER := 0;
BEGIN
    SELECT SUM(total) INTO T
    FROM panier
    WHERE id = client_id AND achete = 1;
    
    RETURN NVL(T, 0);
END;


SELECT NVL(fn_total_achats(1), 0) FROM DUAL;
select * from panier 