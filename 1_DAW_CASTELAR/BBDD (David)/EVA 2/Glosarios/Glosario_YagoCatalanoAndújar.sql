CREATE SCHEMA glosario;
USE glosario;

CREATE TABLE prueba( 
	id 		INT AUTO_INCREMENT PRIMARY KEY,
    nombre 	VARCHAR(255),
    edad 	INT,
    sueldo 	INT
    );

INSERT INTO prueba (nombre,edad,sueldo) VALUES ('Yago',20,500),
						  ('Oscar',19,1400),
                          ('Manuel',22,1800),
                          ('Manuel',30,2500),
                          ('Rubén',20,0),
                          ('',31,1e6);

INSERT INTO prueba(edad) VALUES (12);

SELECT * FROM prueba;
SELECT DISTINCT id,nombre,edad FROM prueba;
SELECT DISTINCT nombre,edad FROM prueba;
SELECT DISTINCT nombre AS Nombres_Distinct FROM prueba;								-- Escribe un ALIAS a la visualizacion del campo de la tabla

SELECT DISTINCT nombre AS Nombres_Distinct, edad+10 AS Futuro FROM prueba;			-- Escribe un alias al campo nombre y edad y suma 10 a edad en la visuazlizacion de la tabla

SELECT DISTINCT nombre AS Nombres_Distinct, edad + NULL AS Futuro FROM prueba; 		-- Escribe un alias al campo nombre y edad y establece la visuzalicacion de edad a NULL

SELECT 'Hola' || 'mundo' FROM dual;
SELECT CONCAT (nombre,'-',edad) FROM prueba;										-- Concatena el campo nombre y edad para que se muestren juntos

SELECT * FROM prueba;
SELECT * FROM prueba WHERE sueldo <> 1800; 											-- Hacemos una consulta para que mustre todos los valores donde sueldo sea distinto a 1800. No aparecera el campo 3
SELECT * FROM prueba WHERE sueldo >0;												-- Hacemos que muestre los valores donde sueldo sea mayor que 0. No aparecera el campo 4
SELECT * FROM prueba WHERE nombre LIKE 'Ya%';										-- Hacemos una consulta donde muestra los campos en nombre que empiecen or 'Ya'
SELECT * FROM prueba WHERE nombre = 'Ya%';											-- En este caso no funciona porque estariamos llamano a una cadena de caracateres que no esta entre los cvalores
SELECT * FROM prueba WHERE nombre IS NULL;											-- Consultamos las entradas donde el nombre sea nulo

SELECT sueldo FROM prueba WHERE nombre = 'Yago';

SELECT * FROM prueba
	WHERE sueldo < (SELECT sueldo FROM prueba WHERE nombre='Yago');					-- Muestra un sueldo que sea menor que el sueldo de 'Yago'

SELECT * FROM prueba AS a, (SELECT sueldo FROM prueba WHERE nombre='Oscar') AS b	-- Muestra el sueldo de pruebas que sea menor que el sueldo de b. En este caso 'a' son todos los valoraes y 'b' es el sueldo referencia.
	WHERE a.sueldo <b.sueldo;														-- Al ejecutarlo muestra 2 sueldos, el 'a' y el 'b' ( que esta en todos igual) porque la sentencia pie que mestre el sueldo de los usuarios con suelo 'a' como si fuese el 'b' y uego le pedimos el where
    
SELECT * FROM prueba WHERE sueldo >= (SELECT sueldo FROM prueba WHERE nombre='Manuel');

SELECT MAX(sueldo) FROM prueba;
    
SELECT * FROM prueba WHERE sueldo = (SELECT MAX(sueldo) FROM prueba);
    
SELECT * FROM prueba AS a, (SELECT MAX(sueldo) as sueldo FROM prueba) AS b 
		WHERE a.sueldo=b.sueldo;
        
SELECT * FROM prueba ORDER BY edad DESC;

ALTER DATABASE ejercicios CHARACTER SET utf8mb4_bin COLLATE utf8mb4_0900_as_cs; 				-- Esto sisrve para cambiar el estandar de caracteres para que diferencia entre mayusuclas y minusculas y tildes.

SHOW FULL COLUMNS FROM prueba;																	-- Aqui vemos que el collate no funsiona porque no hace la conversion por seguridad

CREATE TABLE prueba1 (nomb VARCHAR(20));

INSERT INTO prueba1 VALUES ('Yago');
SHOW FULL COLUMNS FROM prueba1;																	-- Creamos otra tabla y vemos que aqui si que aplica el cambio de codificacion y si ahora ejecutamos una sentencia para que nos muestre alores enminusculas, lo hará y no se veran mayusuclas

SET sql_safe_updates = 0;															  			-- Sirve para quitar el modo seguro, lo que en caso de estar activado impide ciertas acciones que puedan perjudicar la tabla

SELECT LENGTH('Oracle') FROM dual;																-- Muestra la cantidad de caracteres en una cadena

SELECT ROUND(3.141592);																			-- Redondea un numero. Si añadimos ,2 redondeará a 2 decimales

SELECT nombre,edad,count(id) FROM prueba GROUP BY nombre,edad;									-- Agrupa datos verticalmente que tengan el mismo registro para realizar calculos a partir de uno solo

SELECT nombre,AVG(edad) FROM prueba GROUP BY nombre;											-- Calcula la edad media de los que se llaman igual
SELECT nombre,MAX(edad) FROM prueba GROUP BY nombre;

SELECT nombre,AVG(edad) FROM prueba WHERE nombre='Yago' GROUP BY nombre;						-- Filtra la sentencia para que solo salgan los campso con nombre Yago y luego se hace la media de la edad

SELECT nombre,AVG(edad) FROM prueba GROUP BY nombre HAVING nombre='Yago';						-- Primero se hace la media de todos y luego se hace el filtrado

SELECT nombre,count(edad) AS cuenta FROM prueba GROUP BY nombre HAVING cuenta > 3;				-- Muestra solo los que su nombre se repita mas de X veces

SELECT nombre,edad,COUNT(id) AS cuenta FROM prueba  GROUP BY nombre,edad HAVING cuenta>3 AND edad BETWEEN 19 AND 30;		-- Muestra el nombre y edad de quienes esten entre 19 y 30 y se repitan mas de 3

SELECT nombre,edad,COUNT(id) AS cuenta FROM prueba  GROUP BY nombre,edad HAVING cuenta<2 AND edad BETWEEN 19 AND 30 ORDER BY edad ASC;		

CREATE TABLE empleado(
cod_emp 	INT AUTO_INCREMENT PRIMARY KEY,
nomb_emp 	VARCHAR(50),
telf_emp 	int
);																		-- Creamos dos tablas sencillas para trabajar con ellas ahora que vamos a hacer JOINS
CREATE TABLE tarea(
cod_tar INT AUTO_INCREMENT PRIMARY KEY,
nomb_tar VARCHAR(50),
cod_emp INT,
CONSTRAINT fk_cod_tar FOREIGN KEY (cod_emp) REFERENCES empleado(cod_emp)
);

INSERT INTO empleado(nomb_emp,telf_emp) VALUES
			('David', 1),
            ('Yago',2),
            ('Miguel',10),
            ('Laura',1),
            ('Fer',300),
            ('Post',NULL);
            
INSERT INTO tarea(nomb_tar,cod_emp) VALUES ('Barrer',1),('Cocinar',2),('Pintar',3),('Dormir',2),('Descansar',2);

SELECT nomb_emp,nomb_tar FROM empleado,tarea WHERE empleado.cod_emp=tarea.cod_emp;

SELECT e.nomb_emp, t.nomb_tar
	FROM empleado e 					-- Sentencia con inner join, junta la zona comun de las tablas
    INNER JOIN tarea AS t 
		ON e.cod_emp = t.cod_emp WHERE t.cod_tar IS NULL; 							

CREATE TABLE tabla1(
id INT PRIMARY KEY
);

CREATE TABLE tabla2(
id INT PRIMARY KEY,
nombre2 VARCHAR(10),
nombre1 INT,
FOREIGN KEY (nombre1) REFERENCES tabla1(id));

ALTER TABLE tabla2 ADD nombre3 INT;
ALTER TABLE tabla1 ADD nombre VARCHAR(10);

ALTER TABLE tabla2 ADD CONSTRAINT FOREIGN KEY (nombre3) REFERENCES tabla2(id);

INSERT INTO tabla1 VALUES(1,'Ismael'),
						 (2,'Miguel');
                         
INSERT INTO tabla2 VALUES (1,'Maria',1),
						  (2,'Ana',NULL);
		
INSERT INTO tabla2 VALUES(3,'Laura',NULL);

SELECT a.nombre1,b.nombre2 FROM tabla1 AS a JOIN tabla2 AS b ON a.id=b.nombre1;		-- INNER JOIN
SELECT a.nombre1,b.nombre2 FROM tabla2 AS a JOIN tabla2 AS b ON a.id=b.nombre3;	-- SELF JOIN

SELECT nomb_emp, nomb_tar FROM empleado NATURAL JOIN tarea;

CREATE TABLE a (
idA INT primary key );

CREATE TABLE c (
idC INT primary key );

CREATE TABLE b (
idB INT primary key,
idA INT REFERENCES a(idA),
idC INT REFERENCES c(idC));

SELECT a.idA,b.idB,c.idC FROM a NATURAL JOIN b,c; -- Compara los campos que se llamen igual

SELECT a.nombre1,b.nombre2 FROM tabla1 AS a LEFT JOIN tabla2 ON a.id=b.nombre1;	-- LEFT

SELECT a.nombre1,b.nombre2 FROM tabla2 AS b RIGHT JOIN tabla1 ON a.id=nombre1;	-- RIGHT

SELECT a.nombre1,b.nombre2 FROM tabla2 AS b CROSS JOIN tabla1 AS a;

SELECT  id,nombre1 FROM tabla1 UNION SELECT id,nombre2 FROM tabla2;				-- UNION une dos tablas en orden primero una y luego la otra. los campos repetidos solo se muestran una vez, como un group by

-- Vistas: Genera tablas que no ocupan nada, virtuales.

CREATE VIEW mi_primera_vista AS SELECT * FROM tabla1;		-- Vista para el usuario
CREATE VIEW mi_primera_vista_filtro AS SELECT * FROM tabla1 WHERE id=1;

SELECT * FROM mi_primera_vista;
SELECT * FROM mi_primera_vista_filtro;

SELECT * FROM tabla1 ORDER BY id DESC LIMIT 1;