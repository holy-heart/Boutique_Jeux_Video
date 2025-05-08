create or replace function fn_recommandations(id_c int, profondeur int)
returns table(id_jeu int, nom_jeu varchar) as $$
begin
	return query
	with RECURSIVE reco(id__, pro__) as (
		select distinct pa.id_client, 1
		from panier pa 
		inner join choix ch on ch.id_panier = pa.id
		where pa.id_client = id_c
	
	
		union
	
		
		select distinct p2.id_client, re.pro__ + 1
		from reco re
		inner join panier pa on re.id__ = pa.id_client
		inner join choix ch on pa.id = ch.id_panier
		inner join choix c2 on c2.id_jeu = ch.id_jeu
		inner join panier p2 on p2.id = c2.id_panier
		where c2.id_panier != ch.id_panier and re.pro__<profondeur
		
	)
	select distinct j.id, j.nom
	from reco re
	inner join panier pa on pa.id_client = re.id__
	inner join choix ch on ch.id_panier = pa.id
	inner join jeu j on j.id = ch.id_jeu
	where j.id not in(
		select c2.id_jeu
		from panier p2
		inner join choix c2 on p2.id = c2.id_panier
		where p2.id_client = id_c
	);
end;
$$ LANGUAGE plpgsql;


select * from fn_recommandations(2, 3);