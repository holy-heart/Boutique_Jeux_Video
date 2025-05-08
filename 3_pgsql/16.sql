create or replace function ftrigger2()
returns trigger  as $$
declare 
	em numeric;
begin 
	IF TG_OP = 'INSERT' THEN
		select j.prix into em from jeu j where new.id_jeu = j.id;  
		update panier set total = (new.unit * em) + total where id = new.id_panier;
	ELSIF TG_OP = 'UPDATE' THEN
		if new.unit <> old.unit then
			select j.prix into em from jeu j where new.id_jeu = j.id;  
			update panier set total = (new.unit*em - old.unit*em) + total where id = new.id_panier;	
		end if;
	end if;
	return new;
end; $$ LANGUAGE plpgsql;

create trigger trigger2
after insert or update on choix
for each row
execute function ftrigger2();

INSERT INTO choix (id, id_panier, id_jeu, unit) 
VALUES (1005, 1, 44, 4); 

select * from panier