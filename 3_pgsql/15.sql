create or replace function ftrigger1()
returns trigger  as $$
declare 
	em int;
begin 
	select count(email) into em from client where email = new.email;
	if em > 0 then 
		raise exception 'lemail existe deja';
	end if;
	return new;
end; $$ LANGUAGE plpgsql;

create trigger trigger1
before insert on client
for each row
execute function ftrigger1();


INSERT INTO client (id, prenom, nom, date_naiss, adress, email, mpd, date_creation, numero) 
VALUES (2000, 'John', 'Doe', '1990-01-01', 'Adresse 1', 'johndoe@example.com', 'password123', CURRENT_DATE, '0123456789');

INSERT INTO client (id, prenom, nom, date_naiss, adress, email, mpd, date_creation, numero) 
VALUES (2001, 'Jane', 'Doe', '1992-02-02', 'Adresse 2', 'johndoe@example.com', 'password456', CURRENT_DATE, '0987654321');


