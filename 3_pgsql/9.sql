create or replace procedure proc_valider_panier(panier_id INT, mode_paiement TEXT)
as $$
declare
	ids_jeux cursor for 
		select c.id id, c.unit unit, j.stock
		from choix c inner join panier p on p.id  = c.id_panier inner join jeu j on j.id = c.id_jeu 
		where p.id = panier_id;
begin
	for ids in ids_jeux loop
		if ids.stock<ids.unit then
			raise EXCEPTION 'desolé mais il faut revoir le panier';
		end if;
	end loop;
	update panier set achete = True where panier.id = panier_id;
	update panier set date_achat = CURRENT_DATE where panier.id = panier_id;
	update panier set paiment = mode_paiement where panier.id = panier_id;
end $$ LANGUAGE plpgsql;

call proc_valider_panier(7 , 'cb');

select * from panier