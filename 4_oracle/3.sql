CREATE OR REPLACE FUNCTION fn_top_vente
RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT c.id_jeu AS idjeu, SUM(c.unit) AS vendu
    FROM choix c
    GROUP BY c.id_jeu
    ORDER BY vendu DESC
    FETCH FIRST 5 ROWS ONLY;
    
    RETURN result_cursor;
END;

VAR rc REFCURSOR
EXEC :rc := fn_top_vente();
PRINT rc