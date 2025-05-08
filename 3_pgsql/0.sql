UPDATE panier p SET total = (
    SELECT SUM(c.unit * jeu.prix * pro.promotion)
    FROM choix c
    JOIN jeu ON c.id_jeu = jeu.id
    JOIN promotion pro ON pro.id = p.id_promotion
    WHERE c.id_panier = p.id
);


UPDATE panier p SET achete = True where p.id in (2, 3, 4, 5, 8)


update panier set date_achat = current_date where achete = True  
UPDATE panier p SET paiment = 'cb' where p.id in (2, 8)
UPDATE panier p SET paiment = 'paypal' where p.id in (3, 4);
UPDATE panier p SET paiment = 'googlepay' where p.id = 5;


select * from panier
---------------- genre
select * from genre





update genre gg set id_best_game = (
	select max(many_)
	from (select g2.id id_, count(c.id_jeu) many_ ,c.id_jeu id_jeu_
		from choix c
		inner join jeu on jeu.id = c.id_jeu
		inner join jeu_genre jg on jg.id_jeu = jeu.id
		inner join genre g2 on jg.id_genre = g2.id
		group by g2.id, c.id_jeu)
	where gg.id = id_
)

alter table genre drop column date_aparition


-------- jeu column nombre de vente : 

alter table jeu add column vendu int;
select * from jeu;
update jeu jj set vendu = jjj.coun from(
	select jeu.id idd, count(jeu.id) coun
	from jeu
	inner join choix c on c.id_jeu = jeu.id
	group by jeu.id
) jjj 
where jj.id = jjj.idd;
update jeu set vendu = 0 where vendu is null;


