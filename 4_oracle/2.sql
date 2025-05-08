CREATE OR REPLACE FUNCTION agg_ca_mensuel(anmoi DATE)
RETURN NUMBER IS
    M VARCHAR2(2) := TO_CHAR(anmoi, 'MM');
    Y VARCHAR2(4) := TO_CHAR(anmoi, 'YYYY');
    T NUMBER := 0;
BEGIN
    SELECT SUM(total) INTO T
    FROM panier
    WHERE M = TO_CHAR(date_achat, 'MM') AND Y = TO_CHAR(date_achat, 'YYYY') AND achete = 1;
    
    RETURN T;
END;


SELECT NVL(agg_ca_mensuel(TO_DATE('2025-03-20', 'YYYY-MM-DD')), 0) FROM DUAL;