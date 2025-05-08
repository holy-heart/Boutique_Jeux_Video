create or replace function ftrigger3()
returns trigger  as $$
declare 
	un int;
	jeu_id int;
begin 
	if new.achete = True and old.achete = False then
		select unit, j.id into un, jeu_id from choix c inner join jeu j on j.id = c.id_jeu where c.id_panier = new.id;
		update jeu set stock = stock-un where id = jeu_id;
	end if;
	return new;
end; $$ LANGUAGE plpgsql;

create trigger trigger3
after update on panier
for each row
execute function ftrigger3();



select * from panier where id = 6;
select * from choix where id_panier = 6;
select * from jeu where id = 5; --   -5



update panier set achete = True where id = 6;

select * from panier where id = 6;
select * from choix where id_panier = 6;
select * from jeu where id = 5; --   -5