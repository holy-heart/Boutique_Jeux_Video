UPDATE panier p SET total = (
    SELECT SUM(c.unit * jeu.prix * pro.promotion)
    FROM choix c
    INNER JOIN jeu ON c.id_jeu = jeu.id
    INNER JOIN promotion pro ON pro.id = p.id_promotion
    WHERE c.id_panier = p.id
);

UPDATE panier p SET achete = 'Y' where p.id in (2, 3, 4, 5, 8);
UPDATE panier p SET achete = 'N' where p.id not in (2, 3, 4, 5, 8);


update panier set date_achat = current_date where achete = 'Y';
UPDATE panier p SET paiment = 'cb' where p.id in (2, 8);
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

alter table jeu add vendu int;
select * from jeu;
UPDATE jeu j
SET   vendu = (
  SELECT COUNT(*)
  FROM   choix c
  WHERE  c.id_jeu = j.id
);
update jeu set vendu = 0 where vendu is null;

UPDATE panier SET total = REPLACE(total, ',', '.') WHERE INSTR(total, ',') > 0;
UPDATE jeu SET total = REPLACE(prix, ',', '.') WHERE INSTR(total, ',') > 0;
UPDATE promotion SET total = REPLACE(promotion, ',', '.') WHERE INSTR(total, ',') > 0;
select * from promotion

UPDATE promotion SET promotion = 0.1 WHERE id = 2;

