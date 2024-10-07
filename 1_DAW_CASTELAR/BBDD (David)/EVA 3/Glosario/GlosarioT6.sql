CREATE SCHEMA T62;
USE T62;

	CREATE TABLE usuarios(
		id INT AUTO_INCREMENT PRIMARY KEY,
		nombre VARCHAR(50),
		correo VARCHAR(100),
		telefono VARCHAR(20)
		);
    
DELIMITER $$														-- Cambia el signo que elimita el fin de linea 

DROP PROCEDURE IF EXISTS InsertarUsuario $$
CREATE DEFINER = 'Carlos'@'localhost'
	PROCEDURE InsertarUsuario (IN nomb VARCHAR(50),  
							   IN corr VARCHAR(100),
							   IN tel VARCHAR(20))
	COMMENT 'Procediimento para insertar un usuario'
    SQL SECURITY DEFINER
    BEGIN 
		INSERT INTO usuarios(nombre,correo,telefono) VALUES(nomb,corr,tel);
	END 
	$$
		DELIMITER ;
    
    
ALTER PROCEDURE InsertarUsuario SQL SECURITY INVOKER; 	-- Esto habilita que todos los usuarios puedan hacer llamadas a ese procedimiento

SELECT * FROM usuarios;
CALL InsertarUsuario('yago','ycatalanoa01@educarex.es','644850136');


CREATE TABLE fabricantes (
codigo int(5) NOT NULL,
nombre varchar(20) NOT NULL,
ciudad varchar(20) NOT NULL,
CONSTRAINT fabricantes_codigo_pk PRIMARY KEY(codigo) 
)engine=innodb;

CREATE TABLE articulos(
codigo int(8) NOT NULL,
nombre varchar(20) NOT NULL,
precio int NOT NULL,
fabricante int(5) NOT NULL,
CONSTRAINT articulos_codigo_pk PRIMARY KEY(codigo),
CONSTRAINT articulos_fabricante_fk FOREIGN KEY(fabricante)
	REFERENCES fabricantes(codigo)
)engine=innodb;


INSERT INTO `fabricantes` (`codigo`, `nombre`, `ciudad`) VALUES
(1, 'Xiaomi', 'Madrid'),
(2, 'Sony', 'Madrid'),
(3, 'LG', 'Sevilla'),
(4, 'Asus', 'Barcelona');

INSERT INTO `articulos` (`codigo`, `nombre`, `precio`, `fabricante`) VALUES
(1, 'Mi band 6', 25, 1),
(2, 'Robot aspirador', 250, 1),
(3, 'Xiaomi 11 Lite 5G NE', 250, 1),
(4, 'Mi Smart Cloc', 45, 1),
(5, 'Sony Auriculares', 205, 2),
(6, 'Sony Xperia 5 III', 999, 2),
(7, 'LG 43UP7500-ALEXA 4K', 354, 3);


DROP PROCEDURE IF EXISTS calcular_max;
CREATE PROCEDURE contar_articulos_out(IN codfabricante int(5), OUT total INT) BEGIN END;
CALL contar_articulos_out(5,@total);

SELECT @total;


SHOW PROCEDURE STATUS WHERE Db='Tema6';
DELIMITER $$ 
DROP PROCEDURE IF EXISTS listar_articulos$$
CREATE PROCEDURE listar_articulos(In codfabricante int(5))
BEGIN 
SELECT * FROM articulos WHERE fabricante = codfabricante;
END
$$
DELIMITER ;
-- 1
DELIMITER $$ 
DROP PROCEDURE IF EXISTS calcular_max$$
CREATE PROCEDURE calcular_max(IN fabricante_nombre VARCHAR(20), OUT precio_max INT)
BEGIN 
SET precio_max =( SELECT MAX(precio) FROM articulos WHERE fabricante = (SELECT codigo FROM fabricantes WHEre nombre = fabricante_nombre));

-- con inner join

SET precio_max=(SELECT MAX(precio) FROM articulos INNER JOIN fabricantes ON codigo = fabricante WHERE fabricante = fabricante_nombre);
	END
	$$
DELIMITER ;

CALL calcular_max('XIAOMI',@max_precio);
SELECT @max_precio;

-- 2
DELIMITER $$ 
DROP PROCEDURE IF EXISTS articulo_max$$
CREATE PROCEDURE articulo_max(IN fabricante_nombre VARCHAR(20))
BEGIN 
SELECT nombre FROM articulos WHERE fabricante = (SELECT codigo FROM fabricantes WHERE nombre = fabricante_nombre) ORDER BY precio DESC ;
END
	$$
return nombre;
DELIMITER ;
    

CALL articulo_max("Xiaomi");

-- 3
DELIMITER $$ 
DROP PROCEDURE IF EXISTS articulo_low_cost$$
CREATE PROCEDURE articulo_low_cost()
BEGIN 
SELECT nombre FROM articulos WHERE precio < 100;
END
	$$
return nombre;
DELIMITER ;

CALL articulo_low_cost('XIAOMI');

-- 4
DELIMITER $$ 
DROP PROCEDURE IF EXISTS articulo_precios$$
CREATE PROCEDURE articulo_precios(IN precio1 INT, precio2 INT)
BEGIN 
SELECT nombre, precio FROM articulos WHERE precio BETWEEN precio1 AND precio2;
END
	$$
return nombre;
DELIMITER ;

CALL articulo_precios(100,250);

-- 5
DELIMITER $$ 
DROP PROCEDURE IF EXISTS listado_articulos$$
CREATE PROCEDURE listado_articulos()
BEGIN 
SELECT * FROM articulos as a JOIN fabricantes as f ON a.fabricante = f.codigo;
END
	$$
DELIMITER ;

CALL listado_articulos();

-- 6
DELIMITER $$ 
DROP PROCEDURE IF EXISTS articulo_barato$$
CREATE PROCEDURE articulo_barato(OUT nombre_articulo VARCHAR(80), precio_articulo VARCHAR(80))
BEGIN 
SET nombre_articulo = (SELECT nombre FROM articulos WHERE precio = MIN(precio));
SET precio_articulo = (SELECT MIN(precio) FROM articulos);
END
$$
DELIMITER ;

-- 7
DELIMITER $&
DROP PROCEDURE IF EXISTS buscar_articulo$&
CREATE PROCEDURE buscar_articulo(IN articulo VARCHAR(80))
BEGIN 

SELECT * FROM articulos WHERE nombre LIKE articulo;

END
$&
DELIMITER ;

CALL buscar_articulo('Mi band 6');

-- 8
DELIMITER $&
DROP PROCEDURE IF EXISTS incrementar_precio$&
CREATE PROCEDURE incrementar_precio(IN aumento INT)
BEGIN 

UPDATE articulos SET precio = precio + aumento; 

END
$&
DELIMITER ;

CALL incrementar_precio(10);

SET sql_safe_updates = 0;

SELECT * FROM articulos;

-- 9
DELIMITER $&
DROP PROCEDURE IF EXISTS decrementar_precio$&
CREATE PROCEDURE decrementar_precio(IN decremento INT)
BEGIN 

UPDATE articulos SET precio = precio - decremento;-- WHERE codigo > 0; ó WHERE codigo;

END
$&
DELIMITER ;

SET sql_safe_updates = 0;

SELECT * FROM articulos;
CALL decrementar_precio(10);

/* Funciones 
	- Determinismo: en mysql significa que siempre devuelve el mismo valor con los mismos parametros de entrada
    - todos los parametros son de entrada
    - aqui se usa RETURNS para que devuelva la variable */

-- Esto es lo minimo indispensable para crear una funcion

DELIMITER $$
CREATE FUNCTION contar_articulos (codfabricante int(5)) RETURNS INT UNSIGNED BEGIN RETURN total; END$$	
DELIMITER ;

/* Esta sentencia da error porque no tiene clausula determinista
	El error se trata de que cuando generas una funcion generas un archivo binario que cuando lo ejecutas, ya sabe que resultados debe dar y hace que sea mas rapido.
	Como metodo de seguridad, mysql te obliga a que se cree como determinista para que no arrastre el error al resto de la base de datos */  

SET GLOBAL log_bin_trust_function_creators= 1; -- Esto deshabilita ese "modo seguro"
SET GLOBAL log_bin_trust_function_creators= 0;

DROP FUNCTION contar_articulos;

DELIMITER $$
CREATE FUNCTION contar_articulos (codfabricante int(5)) RETURNS INT UNSIGNED DETERMINISTIC BEGIN RETURN total; END$$
DELIMITER ;

-- Utilizanco SET:

DELIMITER $$
DROP FUNCTION IF EXISTS contar_articulos$$
CREATE FUNCTION contar_articulos(codfabricante int(5))
RETURNS INT UNSIGNED DETERMINISTIC
BEGIN
-- Paso 1. Declaramos una variable local
DECLARE total INT UNSIGNED;
-- Paso 2. Contamos los artículos
SET total = (
SELECT COUNT(*)
FROM articulos
WHERE fabricante = codfabricante);
-- Paso 3. Devolvemos el resultado
RETURN total;
END
$$

DELIMITER ;
SELECT contar_articulos(1);

-- Utilizando SELECT … INTO


DELIMITER $$
DROP FUNCTION IF EXISTS contar_articulos$$
CREATE FUNCTION contar_articulos(codfabricante int(5))
RETURNS INT UNSIGNED
BEGIN
-- Paso 1. Declaramos una variable local
DECLARE total INT UNSIGNED;
-- Paso 2. Contamos los artículos
SELECT COUNT(*) INTO total FROM articulos WHERE fabricante = codfabricante;
-- Paso 3. Devolvemos el resultado
RETURN total;
END
$$

DELIMITER ;
SELECT contar_articulos(1);

-- Ejercicios Funciones
-- 1
DELIMITER $$
DROP FUNCTION IF EXISTS calcular_max$$
CREATE FUNCTION calcular_max(nombrefabricante varchar(80))
RETURNS INT /* UNSIGNED */ DETERMINISTIC
BEGIN
DECLARE total INT UNSIGNED;
SET total = (SELECT max(precio) FROM articulos WHERE fabricante=(SELECT codigo FROM fabricantes WHERE nombre=nombrefabricante) LIMIt 1);
RETURN total;
END
$$

DELIMITER ;
SELECT calcular_max('Xiaomi');

DELIMITER $$
DROP FUNCTION IF EXISTS calcular_max$$
CREATE FUNCTION calcular_max(nombrefabricante varchar(80))
RETURNS INT /* UNSIGNED */ DETERMINISTIC
BEGIN
DECLARE total INT UNSIGNED;
SELECT max(precio) INTO total FROM articulos WHERE fabricante=(SELECT codigo FROM fabricantes WHERE nombre=nombrefabricante);
RETURN total;
	END
	$$

DELIMITER ;
SELECT calcular_max('Xiaomi');

-- 2
DELIMITER &
DROP FUNCTION IF EXISTS articulo_lowcost &
CREATE FUNCTION articulo_lowcost()
RETURNS INT DETERMINISTIC
BEGIN
DECLARE articulo INT UNSIGNED;
SELECT count(codigo) INTO articulo FROM articulos WHERE precio < 100;
RETURN articulo;

-- RETURN (SELECT count(codigo) FROM articulos WHERE precio < 100);

END
&

DELIMITER ;
SELECT articulo_lowcost();
SELECT * FROM articulos;

-- 3
DELIMITER &
DROP FUNCTION IF EXISTS articulo_precios &
CREATE FUNCTION articulo_precios( num1 INT, num2 INT)
RETURNS INT DETERMINISTIC
BEGIN

-- RETURN (SELECT count(codigo) FROM articulos WHERE precio BETWEEN num1 AND num2);
UPDATE articulos SET nombre ='NULL' WHERE precio BETWEEN num1 AND num2;
-- UPDATE articulos SET precio = 200 WHERE codigo IN (SELECT codigo FROM articulos WHERE precio BETWEEN num1 AND num2);

RETURN 0 ;
END
&

DELIMITER ;

SELECT articulo_precios(100,700);
SELECT * FROM articulos;

/* Estructuras de control
	Clasico if else pero de SQL 
	CASE 
    WHILE */

-- Ejemplo IF ELSE
-- Utilizando SET:


DELIMITER $$
DROP FUNCTION IF EXISTS minimo_maximo$$
CREATE FUNCTION minimo_maximo(operacion int(1))
RETURNS INT UNSIGNED DETERMINISTIC
BEGIN
-- Paso 1. Declaramos una variable local
DECLARE salida INT UNSIGNED;

-- Paso 2. Contamos los artículos
IF operacion = 0 THEN
SET salida = (
SELECT MIN(precio)
FROM articulos);
ELSEIF operacion = 1 THEN
SET salida = (
SELECT MAX(precio)
FROM articulos);
ELSE
SET salida = NULL;
END IF;

-- Paso 3. Devolvemos el resultado
RETURN salida;

END
$$
DELIMITER ;
SELECT minimo_maximo(0);
SELECT minimo_maximo(1);
SELECT minimo_maximo(2);

-- Ejemplo con CASE

-- Utilizando SET:

DELIMITER $$
DROP FUNCTION IF EXISTS minimo_maximo$$
CREATE FUNCTION minimo_maximo(operacion int(1))
RETURNS INT UNSIGNED DETERMINISTIC
BEGIN
-- Paso 1. Declaramos una variable local
DECLARE salida INT UNSIGNED;

-- Paso 2. Contamos los artículos
CASE operación
WHEN 0 THEN
	SET salida = (SELECT MIN(precio) FROM articulos);
WHEN 1 THEN
	SET salida = (SELECT MAX(precio) FROM articulos);
ELSE
SET salida = NULL;

END CASE;

-- Paso 3. Devolvemos el resultado
RETURN salida;
END
$$
DELIMITER ;
SELECT minimo_maximo(0);
SELECT minimo_maximo(1);
SELECT minimo_maximo(2);

-- WHILE


DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle_while$$
CREATE PROCEDURE ejemplo_bucle_while(IN tope INT, OUT suma INT)
BEGIN
DECLARE contador INT;

SET contador = 1;
SET suma = 0;

WHILE contador <= tope DO

SET suma = suma + contador;
SET contador = contador + 1;

END WHILE;
END
$$
DELIMITER ;

CALL ejemplo_bucle_while(10, @contador);
SELECT @resultado;

-- 1
DELIMITER &
DROP PROCEDURE IF EXISTS descontador&
CREATE PROCEDURE descontador(IN cod INT, OUT descuento INT)
BEGIN
DECLARE precio_articulo INT UNSIGNED;

SET precio_articulo = (SELECT precio FROM articulos WHERE codigo = cod);

IF precio_articulo > 50 THEN
	UPDATE articulos SET precio = precio_articulo - (precio_articulo * 0.02) WHERE codigo = cod;
ELSEIF precio_articulo <= 50 THEN
	UPDATE articulos SET precio = precio_articulo - (precio_articulo * 0.05) WHERE codigo = cod;
END IF;
END
&
DELIMITER ;

SET sql_safe_updates = 0;
CALL descontador(1,@descuento);

SELECT @descuento;

SELECT * FROM articulos;

-- 2
DELIMITER &
DROP PROCEDURE IF EXISTS eliminador_mostrador&
CREATE PROCEDURE eliminador_mostrador(IN accion INT, articulo_aplicar INT)
BEGIN
START TRANSACTION; -- para poder deshacer el procedimineto
CASE accion
WHEN 1 THEN
	SELECT * FROM articulos WHERE codigo = articulo_aplicar;
WHEN 2 THEN
	DELETE FROM articulos WHERE codigo = articulo_aplicar;
ELSE
	SELECT * FROM articulos WHERE codigo = articulo_aplicar;
END CASE;

END
&
DELIMITER ;

ROLLBACK;

CALL eliminador_mostrador(2,3);
SELECT * FROM articulos;

-- 3

DELIMITER &

DROP PROCEDURE IF EXISTS suma_contador&

CREATE PROCEDURE suma_contador(IN contador INT, OUT suma INT)
BEGIN

    DECLARE suma_total INT;
    DECLARE temp_contador INT;
    
    SET suma_total = 0;
    SET temp_contador = contador;

    WHILE temp_contador > 0 DO
        SET suma_total = suma_total + temp_contador;
        SET temp_contador = temp_contador - 1;
    END WHILE;

    SET suma = suma_total;
END&

DELIMITER ;


CALL suma_contador(10, @resultado);
SELECT @resultado;

-- 4

DELIMITER &
DROP FUNCTION IF EXISTS minimo_maximo&
CREATE FUNCTION minimo_maximo(operacion int(1))
RETURNS INT UNSIGNED DETERMINISTIC
BEGIN


END
&
DELIMITER ;
	
    CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(255)
);
    
DELIMITER //
CREATE TRIGGER before_insert_usuario 
	BEFORE INSERT ON usuarios
	FOR EACH ROW
    BEGIN
		IF EXISTS (SELECT 1 FROM usuarios WHERE correo = NEW.correo) THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El correo ya existe crack';
		END IF;
	END; //
DELIMITER ;

SELECT * FROM usuarios;
TRUNCATE TABLE usuarios;
INSERT INTO usuarios VALUE(1, 'yago', 'ycatalanoa01@educarex.es', 644850136);



SHOW TRIGGERS; -- Visualizar los triggers
SELECT * FROM information_schema.triggers WHERE TRIGGER_SCHEMA = "oposiciones1";

CREATE TABLE regirstro_update (
	new_id INT,
    old_id INT,
    fecha DATE);
    
DELIMITER //
DROP TRIGGER IF EXISTS after_update_usuario//
CREATE TRIGGER after_update_usuario
		AFTER UPDATE ON usuarios
        FOR EACH ROW
        BEGIN 
			INSERT INTO registro_update VALUES(NEW.id,OLD.id,NOW());
		END;//
DELIMITER ;

SELECT * FROM usuarios;
UPDATE usuarios SET id = 3 WHERE id = 1; -- esto siver para mantener un registro de cuando se cambio y de cual a cual
SELECT * FROM registro_update;

TRUNCATE TABLE registro_update;
TRUNCATE TABLE usuarios;
DROP TRIGGER after_update_usuario;


