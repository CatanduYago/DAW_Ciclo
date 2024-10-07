SHOW ENGINES; 
/*
Comentario en bloque 
*/
-- Comentario en linea

CREATE USER catandu IDENTIFIED BY '1234';	-- Creamos un usuario 
SELECT * FROM mysql.user;					-- Mostramos los usuarios 
DROP USER catandu; 							-- Eliminamos el usuario creado anteriormente

CREATE USER catandu@'127.0.0.%'  IDENTIFIED BY '1234' PASSWORD EXPIRE INTERVAL 90 DAY;				-- Creamos el usuario para que solo se abra desde un servidor y cuya contraseña caduque a los 3 meses
DROP USER catandu@'127.0.0.%';

GRANT ALL PRIVILEGES ON *.* TO catandu@'127.0.0.%';				-- Le damso todos los privilegios al usuario
SHOW GRANTS FOR catandu@'127.0.0.%';

CREATE SCHEMA daw;												-- Crea un Schema

USE daw;														-- selecciona la base de datos daw creada antes
CREATE TABLE usuarios( 										-- esto es una tbala sin mas de ejemplo
nombre	CHAR(30),
clave 	VARCHAR(10),
telefono 	INT,
saldo 	FLOAT,
cumpleanos	DATE,
hora		TIME,
fecha		TIMESTAMP,
falso		BOOLEAN,
imagen		BLOB
);

DESCRIBE usuarios;
ALTER TABLE usuarios MODIFY nombre VARCHAR(255) NOT NULL;		-- Cambiamos el campo nombre a varchar y establecemos que no puede ser nulo
ALTER TABLE usuarios ADD id INT AUTO_INCREMENT PRIMARY KEY;		-- Añadimos el campo id que es PK y autoincremental
SELECT * FROM usuarios;

ALTER TABLE usuarios DROP id;

SHOW TABLES FROM information_schema;
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE table_name='usuarios';
ALTER TABLE usuarios ADD CONSTRAINT pk_id_usu PRIMARY KEY (clave);
TRUNCATE TABLE usuarios;

INSERT INTO usuarios(nombre) VALUES ('Yago'); 					-- Agregamos datos al campo usuario

CREATE TABLE usuarios1 (id VARCHAR (8) PRIMARY KEY,							-- Creamos otra tabla para poder tener una FK 
	CONSTRAINT fk_id_usu1 FOREIGN KEY (id) REFERENCES usuarios(clave));
SELECT * FROM usuarios1;
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE table_name='usuarios1';

INSERT INTO usuarios(nombre, clave, telefono) VALUES ('Yago','001',10);

INSERT INTO usuarios(nombre, clave, telefono) VALUES ('Borja','002',11),			-- Integramos varios datos a la vez
													 ('Daniel','003',13),
													 ('Manueh','004',15);

INSERT INTO usuarios1(id) VALUES('005');	-- No dejará porque no existe este valor en la tabla usuarios
SET FOREIGN_KEY_CHECKS=0;					-- Sentencia de mysql que deshabilita la integridad referencial 
SET FOREIGN_KEY_CHECKS=1;					-- Sentencia de mysql que habilita la integridad referencial 
INSERT INTO usuarios1(id) VALUES('006');	

SELECT * FROM usuarios1;

TRUNCATE usuarios1; 

RENAME TABLE usuarios TO usuario; -- Renombramos la tabla 

DROP TABLE usuarios;
SET FOREIGN_KEY_CHECKS=0; 				-- Volvemos a deshabilitar la integridad referencial para oder borrar la tabla
SET FOREIGN_KEY_CHECKS=1; 				-- Volvemos a habilitar la integridad referencial 
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE table_name='usuarios1';
ALTER TABLE usuarios1 DROP CONSTRAINT fk_id_usu1;

SHOW ENGINES;
SHOW TABLES;
SHOW DATABASES;
