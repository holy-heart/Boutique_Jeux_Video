create or replace function fn_numero(client_id INT)
returns boolean as $$
declare 
	num varchar(40);
begin
	select numero into num
	from client
	where id=client_id;

	if num !~ '^\+?[0-9]{10,15}$' then
		raise EXCEPTION 'ce format n"est pas valide %', num;
	end if;
	return True;
---EXCEPTION
	---when non_conform then
		---dbms_output.put_line('ce format n"est pas valide');
end $$ LANGUAGE plpgsql;

SELECT fn_numero(1);


select * from client