CREATE OR REPLACE FUNCTION fn_recommandations(id_c IN NUMBER, profondeur IN NUMBER)
RETURN SYS_REFCURSOR
AS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    WITH reco(id__, pro__) AS (
        SELECT DISTINCT pa.id_client, 1
        FROM panier pa 
        INNER JOIN choix ch ON ch.id_panier = pa.id
        WHERE pa.id_client = id_c
    
        UNION ALL
        
        SELECT DISTINCT p2.id_client, re.pro__ + 1
        FROM reco re
        INNER JOIN panier pa ON re.id__ = pa.id_client
        INNER JOIN choix ch ON pa.id = ch.id_panier
        INNER JOIN choix c2 ON c2.id_jeu = ch.id_jeu
        INNER JOIN panier p2 ON p2.id = c2.id_panier
        WHERE c2.id_panier != ch.id_panier AND re.pro__<profondeur
    )
    SELECT DISTINCT j.id, j.nom
    FROM reco re
    INNER JOIN panier pa ON pa.id_client = re.id__
    INNER JOIN choix ch ON ch.id_panier = pa.id
    INNER JOIN jeu j ON j.id = ch.id_jeu
    WHERE j.id NOT IN(
        SELECT c2.id_jeu
        FROM panier p2
        INNER JOIN choix c2 ON p2.id = c2.id_panier
        WHERE p2.id_client = id_c
    );
    
    RETURN result_cursor;
END;
/

VAR rc REFCURSOR
EXEC :rc := fn_recommandations(2, 3);
PRINT rc