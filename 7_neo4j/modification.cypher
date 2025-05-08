load csv with headers from 'file:///panier.csv' as row
match (c:panier {id : row.id})
set c.Date_achat  = row.Date_achat


MATCH (n:panier) RETURN n LIMIT 25

load csv with headers from 'file:///panier.csv' as row
match (c:panier {id : tointeger(row.id)})
set c.Date_achat  = row.Date_achat


with 10 as panier_id, 'cb' as mode_paiment
match (p:panier {id: panier_id})
set p.achete = 't' ,p.Date_achat = date(), p.paiment=mode_paiment
return p


with 1.2 as pc, 25 as yy
match (j:jeu {id : 50})
where j.
with j, pc, yy



load csv with headers from 'file:///jeu.csv' as row
match (j:jeu {id:tointeger(row.id)})
set j.date_sortie = row.date_sortie


with 1.2 as pc, 25 as yy
match (j:jeu)
where duration.between(date(),date(j.date_sortie)).years < yy
with pc, yy, j, j.prix as avant
set j.prix = avant * pc
return j.prix as now, avant


match (c:choix)
return c.id_jeu as jeu, sum(c.unit) as vendu
order by vendu desc
limit 5



match (c:client {id : 102})
with c.numero as num
where not num =~ '^\+?[0-9]{10,15}$'
return 'ce fromat de num est invalide' + num as erreur 


WITH -20 AS moins, 4 AS id_jeu
MATCH (j:jeu {id: id_jeu})
WITH  moins, id_jeu, j , j.stock as avant
SET j.stock = j.stock + moins
RETURN j.stock AS apres, avant


MATCH (n:client) RETURN n LIMIT 25