USE COFFEE;

CREATE USER 'primer_usuario'@'localhost'
IDENTIFIED BY 'contraseña123';

SELECT user, host FROM mysql.user;

ALTER USER 'administrador'@'localhost'
IDENTIFIED BY 'nuevacontraseña123';

GRANT ALL PRIVILEGES ON COFFEE TO 'primer_usuario'@'localhost' WITH GRANT OPTION;

SHOW GRANTS FOR 'primer_usuario'@'localhost';
