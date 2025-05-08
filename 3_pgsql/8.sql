create or replace procedure proc_appliquer_promo(client_id INT, promo_id INT)
as $$
declare
	promo numeric:= 1;
	ids_paniers cursor for select id from panier p where p.id_client = client_id;
begin
	select promotion from promotion where id = promo_id into promo;
	
	for ids in ids_paniers loop
		update panier set total = total * promo where panier.id = ids.id;
	end loop;
end $$ LANGUAGE plpgsql;

call proc_appliquer_promo(4 , 3 );

select * from panier
