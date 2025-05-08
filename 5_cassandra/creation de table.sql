create table cass as
select j.id id_jeu, ch.id id_choix ,c.id id_client, j.nom nom_jeu, j.date_sortie date_sortie, j.prix prix, j.stock stock, j.vendu vendu, g.nom_complet nom_genre, con.nom nom_consol, e.nom editor, e.region region, ch.unit unit, pa.total total, pa.achete achete, pa.date_achat date_achat, pa.paiment paiment, pro.promotion promotion,
 c.prenom prenom, c.nom nom_client, c.date_naiss date_naiss, c.adress adress, c.email email, c.numero num
from client c
INNER JOIN panier pa ON pa.id_client = c.id
INNER JOIN promotion pro ON pro.id = pa.id_promotion
INNER JOIN choix ch ON ch.id_panier = pa.id
INNER JOIN jeu j ON j.id = ch.id_jeu
INNER JOIN editor e ON e.id = j.id_editor
INNER JOIN jeu_genre jg ON jg.id_jeu = j.id
INNER JOIN genre g ON g.id = jg.id_genre
INNER JOIN jeu_consol jc ON jc.id_jeu = j.id
INNER JOIN consol con ON con.id = jc.id_consol;


