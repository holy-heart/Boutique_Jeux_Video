CREATE OR REPLACE FUNCTION ftrigger1()
RETURN TRIGGER AS
DECLARE
    em INT;
BEGIN
    SELECT COUNT(email) INTO em FROM client WHERE email = :NEW.email;
    IF em > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'lemail existe deja');
    END IF;
    RETURN :NEW;
END;

CREATE TRIGGER trigger1
BEFORE INSERT ON client
FOR EACH ROW
BEGIN
    ftrigger1();
END;

INSERT INTO client (id, prenom, nom, date_naiss, adress, email, mpd, date_creation, numero)
VALUES (2000, 'John', 'Doe', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Adresse 1', 'johndoe@example.com', 'password123', SYSDATE, '0123456789');

INSERT INTO client (id, prenom, nom, date_naiss, adress, email, mpd, date_creation, numero)
VALUES (2001, 'Jane', 'Doe', TO_DATE('1992-02-02', 'YYYY-MM-DD'), 'Adresse 2', 'johndoe@example.com', 'password456', SYSDATE, '0987654321');