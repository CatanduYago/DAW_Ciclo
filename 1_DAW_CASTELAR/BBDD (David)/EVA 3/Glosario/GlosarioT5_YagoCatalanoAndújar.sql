CREATE SCHEMA glosarioT5;
USE glosarioT5;
CREATE TABLE empleados (
COD INT PRIMARY KEY,
NOMBRE VARCHAR(50) NOT NULL,
LOCALIDAD VARCHAR(50) DEFAULT 'Badajoz',	-- Default sugiere que se inserte un mismo valor siempre que no se le diga de insertar otro
FECHANAC DATE
);

-- Se pueden insertar todos los datos o se pueden insertar solo los datos que sean requeridos:
INSERT INTO empleados(NOMBRE, COD) VALUES ('Ana', 5); -- El INTO no es obligatorio SOLAMENTE en MySql
INSERT INTO empleados(COD,NOMBRE,LOCALIDAD,FECHANAC) VALUES (1,'Pepe','Osuna','1970-01-01');
INSERT INTO empleados(COD,NOMBRE,LOCALIDAD,FECHANAC) VALUES (2,'Juan',DEFAULT,NULL);
INSERT INTO empleados(NOMBRE, COD) VALUES ('Juan', 3);
INSERT INTO empleados(COD,NOMBRE,LOCALIDAD,FECHANAC) VALUES (4,'Sara',NULL,NULL);

-- 
CREATE TABLE solicitantes (
NUM INT PRIMARY KEY,
NOMBRE VARCHAR(50),
CIUDAD VARCHAR(50),
NACIMIENTO DATE,
ESTUDIOS VARCHAR(50)
);

INSERT INTO solicitantes VALUES (6,'Alicia','Mérida', NULL, 'BBDD');
INSERT INTO solicitantes VALUES (7,'Fer',NULL, '1970-01-01', 'ASIR');

-- Se pueden insertar a una tabla datos de otra tabla distinta siempre que el numero y tipo de registros sean iguales.

INSERT INTO empleados SELECT num,nombre,ciudad,nacimiento FROM solicitantes WHERE estudios = 'BBDD';

-- Tambien podemos hacer lo mismo de antes de insertar datos solo a campos requeridos. 
-- Al no especificar el campo de localidad, aunque en solicitantes sea null en empleados va a ser el default.
INSERT INTO empleados(FechaNac,Nombre,COD) SELECT nacimiento, nombre, num FROM solicitantes WHERE estudios = 'ASIR';

UPDATE empleados SET nombre = UPPER (NOMBRE), LOCALIDAD= 'Estepa' WHERE nombre = 'JUAN' AND cod; 	-- updatea campos de una tabla donde se cumpla una condicion

CREATE TABLE secciones(
id_seccion INT PRIMARY KEY,
nom_seccion VARCHAR(50) DEFAULT 'Produccion');

INSERT INTO secciones (id_seccion) VALUES(1);

ALTER TABLE empleados ADD id_seccion INT DEFAULT 1;		-- Aunque ya hubiese campos en la tabla, se rellenarian todos los cmapos nuevos con el default
ALTER TABLE empleados ADD sueldo FLOAT DEFAULT 1000;

UPDATE empleados SET sueldo = sueldo * 1.10 WHERE id_seccion = (SELECT id_seccion FROM secciones WHERE nom_seccion = 'Produccion') AND cod ;
-- Este update añade un 10% a los sueldos de los empleados que sean de produccion

DELETE FROM EMPLEADOS WHERE LOCALIDAD = 'Osuna' AND cod;

ALTER TABLE empleados ADD CONSTRAINT emp_fk_1 FOREIGN KEY (id_seccion) REFERENCES secciones(id_seccion) ON DELETE CASCADE ON UPDATE CASCADE;

UPDATE secciones SET id_seccion = 2 WHERE id_seccion = 1;

DELETE FROM secciones WHERE id_seccion = 2;

-- Transacciones 

SHOW VARIABLES LIKE 'autocommit';
SELECT @@autocommit; -- 
SET autocommit = 0; -- deshabilita;
SET autocommit = 1; -- Habilita


DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE cliente (
id INT PRIMARY KEY,
nombre CHAR (20)
);

START TRANSACTION;
INSERT INTO cliente VALUES (1, 'Pepe');
COMMIT;

-- 1. ¿Qué devolverá esta consulta?
-- Se habrá insertado 1 Pepe

SELECT * FROM cliente;

SET sql_safe_updates =0;

INSERT INTO cliente VALUES (2, 'Maria');
INSERT INTO cliente VALUES (20, 'Juan');
DELETE FROM cliente WHERE nombre = 'Pepe';

-- 2. ¿Qué devolverá esta consulta?
-- Hemos insertado dos datos nuevos y hemos borrado el que habiamos metido antes.

SELECT * FROM cliente;
ROLLBACK;

-- 3. ¿Qué devolverá esta consulta?
-- Al hacer el rollback, los values metidos y el delete despues del commit se desharan, volviendo a solo tener 1 Pepe en la tabla


SELECT * FROM cliente;

SELECT * FROM empleados;
TRUNCATE empleados;

-- 

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
CREATE TABLE cuentas (
id INTEGER UNSIGNED PRIMARY KEY,
saldo DECIMAL(11,2) CHECK (saldo >= 0)
);

INSERT INTO cuentas VALUES (1, 1000);
INSERT INTO cuentas VALUES (2, 2000);
INSERT INTO cuentas VALUES (3, 0);

-- 1. Consultamos el estado actual de las cuentas

SELECT * FROM cuentas;
SET AUTOCOMMIT=0;

-- 2. Suponga que queremos realizar una transferencia de dinero entre dos cuentas bancarias con la siguiente transacción

START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

-- 3. ¿Qué devolverá esta consulta?
-- Añadira 100 al campo con id 2 y restara 100 al campo con id 1

SELECT * FROM cuentas;

-- 4. Suponga que queremos realizar una transferencia de dinero entre doscuentas bancarias con la siguiente transacción y una de las dos cuentas no existe:


START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 9999;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

-- 5. ¿Qué devolverá esta consulta?
-- Solo añadira 100 al campo de id 2, ya que no hay un campo con id 9999

SELECT * FROM cuentas;

-- 6. Suponga que queremos realizar una transferencia de dinero entre dos cuentas bancarias con la siguiente transacción y la cuenta origen no tiene saldo:

START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 3;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

-- 7. ¿Qué devolverá esta consulta?
-- Cambiara el campo con id 2 añadiendo 100, pero no restara 100 al campo con id 3 poruqe resultaria en un digito negativoy no es posible ya que lo indicamos anterioremente en l creacion 
-- de la tabla con el unsigned.

SELECT * FROM cuentas;