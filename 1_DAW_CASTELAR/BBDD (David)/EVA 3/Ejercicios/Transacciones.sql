CREATE SCHEMA transacciones;
USE transacciones;

SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE
);
INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');
-- 1. Comprueba que las filas se han insertado en la tabla de forma correcta.
SELECT * FROM producto;