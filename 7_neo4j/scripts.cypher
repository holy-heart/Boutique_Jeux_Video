//Top 5 des jeux les plus vendus
match (c:choix)
return c.id_jeu as jeu, sum(c.unit) as vendu
order by vendu desc
limit 5

//Numéro de téléphone invalide
match (c:client {id : 102})
with c.numero as num
where not num =~ '^\+?[0-9]{10,15}$'
return 'ce fromat de num est invalide' + num as erreur 


//Total dépensé par le client 1
match (c:client {id:1})<- [:ATTRIBUE_A]-(p:panier)
where p.achete = "t"
RETURN COALESCE(SUM(p.total), 0) AS total_client


//Liste des clients (nom, prénom)
match (c:client)
return c.nom || ', ' || c.prenom as id
order by c.nom
limit 10


//Retirer du stock d’un jeu
WITH -20 AS moins, 4 AS id_jeu
MATCH (j:jeu {id: id_jeu})
WITH  moins, id_jeu, j , j.stock as avant
SET j.stock = j.stock + moins
RETURN j.stock AS apres, avant

//Créer un nouveau jeu et lier à un éditeur
with 'need for speed 4' as nom,
    1000 as stock, 30.2 as prix, 2 as id_editor
match (j:jeu)
with  nom, stock, prix, id_editor, coalesce(max(j.id)+1,1) as new_id
create (j2:jeu {
    id : new_id,
    nom: nom,
    stock: stock,
    prix: prix,
    id_editor:id_editor
})
with new_id , id_editor
match (j3:jeu {id : new_id}), (e:editor {id : j3.id_editor})
merge (j3)-[:produit_par]->(e)


//Augmenter le prix des jeux récents
with 1.2 as pc, 25 as yy
match (j:jeu)
where duration.between(date(),date(j.date_sortie)).years < yy
with pc, yy, j, j.prix as avant
set j.prix = avant * pc
return j.prix as now, avant


// Valider un achat
with 10 as panier_id, 'cb' as mode_paiment
match (p:panier {id: panier_id})
set p.achete = 't' ,p.Date_achat = date(), p.paiment=mode_paiment
return p


//Appliquer une promotion à un panier
with 8 as id_panier
match (pr:promotion)<-[:reduit_par]-(p:panier {id : id_panier})
with p.total as avant, pr, p
set p.total = avant*pr.promotion
return p.total as  apres, avant


//Revenus du mois (avril 2025)
with date("2025-04-05") as anmoi
match (p:panier)
where p.achete = 't'
    and date(p.date_achat).year = anmoi.year
    and date(p.date_achat).month = anmoi.month
return coalesce(sum(p.total), 0) as total_month