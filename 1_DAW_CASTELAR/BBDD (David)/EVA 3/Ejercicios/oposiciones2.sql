CREATE DATABASE oposiciones1;
USE oposiciones1;

-- ----------------------------
-- Table structure for examenes
-- ----------------------------
DROP TABLE IF EXISTS `examenes`;
CREATE TABLE `examenes` (
  `CODIGOEXA` int NOT NULL DEFAULT '0',
  `DESCRIPCIONEXA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGOEXA`),
  UNIQUE KEY `ix_descripcion` (`DESCRIPCIONEXA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for tribunales
-- ----------------------------
DROP TABLE IF EXISTS `tribunales`;
CREATE TABLE `tribunales` (
  `CODIGOTRIBUNAL` int NOT NULL DEFAULT '0',
  `PRESIDENTE` varchar(50) DEFAULT NULL,
  `SECRETARIO` varchar(50) DEFAULT NULL,
  `VOCAL1` varchar(50) DEFAULT NULL,
  `VOCAL2` varchar(50) DEFAULT NULL,
  `VOCAL3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGOTRIBUNAL`)
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for opositores
-- ----------------------------
DROP TABLE IF EXISTS `opositores`;
CREATE TABLE `opositores` (
  `DNI` varchar(14) NOT NULL DEFAULT '',
  `NOMBRE` varchar(255) DEFAULT NULL,
  `CIUDAD` varchar(255) DEFAULT 'Badajoz',
  `TELEFONO` varchar(14) DEFAULT NULL,
  `TRIBUNALOPOSITOR` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `fk_opo_tri` FOREIGN KEY (`TRIBUNALOPOSITOR`) REFERENCES `tribunales` (`CODIGOTRIBUNAL`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for notas
-- ----------------------------
DROP TABLE IF EXISTS `notas`;
CREATE TABLE `notas` (
  `DNIOPOSITOR` varchar(255) NOT NULL DEFAULT '',
  `CODIGOEXAMEN` int NOT NULL DEFAULT '0',
  `NOTA` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`DNIOPOSITOR`,`CODIGOEXAMEN`),
  CONSTRAINT `fk_notas_opo` FOREIGN KEY (`DNIOPOSITOR`) REFERENCES `opositores` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`CODIGOEXAMEN`) REFERENCES `examenes` (`CODIGOEXA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 1
INSERT INTO tribunales VALUES(2,'PEDRO FERNANDEZ','ISABEL FRESNEDA','LUIS MERLO','ANTONIO ROBLES','VICENTE ROBLES');
INSERT INTO tribunales VALUES(8,'ANA LIMA','TOMAS RODRIGUEZ','ROCIO CINTIA','MODESTA HERMOSO','JUAN ARGUETA');
INSERT INTO tribunales VALUES(1,'ANA MATOS', 'PEDRO RODRIGUEZ','NOA CINTIA','CARMEN HERMOSO','JUANI ARGUETA');
INSERT INTO opositores(dni,nombre,telefono,tribunalopositor) VALUES('AAA1','José Luis Almeida Pérez','666777888',2);
INSERT INTO opositores(dni,nombre,tribunalopositor) VALUES('AAA2','María Almeida Pérez',2);
INSERT INTO opositores(dni,nombre,tribunalopositor) VALUES('AAA3','Carmen Alegría Silva',8);
INSERT INTO opositores(dni,nombre,telefono,tribunalopositor) VALUES('AAA4','Juan Carlos Perdigón Solís','666555444',8);
INSERT INTO opositores(dni,nombre,tribunalopositor) VALUES('AAA5','Javier Ramírez Montero',1);
INSERT INTO examenes (CODIGOEXA, DESCRIPCIONEXA) VALUES (1, 'Examen de Matemáticas'),
														(2, 'Examen de Lengua'),
														(3, 'Examen de Historia');
INSERT INTO notas (DNIOPOSITOR, CODIGOEXAMEN, NOTA) VALUES ('AAA1', 1, 85),
												  		   ('AAA2', 2, 78),
														   ('AAA3', 1, 90);

/* 
Crea un procedimiento que inserte un nuevo opositor en base a los parametros de entrada, si no existe.
Si existe, comprueba si el modo seguro esta habilitado. En cuya caso, deshabilitalo y borra el opositor. 
Fuera del procedimiento inicia una transacción, haz la llamada al procedimiento y visualiza el resultado. 
Confirma o deshaz un ejemplo de cada.
*/ 

DELIMITER &
DROP PROCEDURE IF EXISTS insercion_opositor&
CREATE PROCEDURE insercion_opositor(IN dni_in VARCHAR(14),tribunalopositor_in INT)
BEGIN
IF dni_in NOT IN (SELECT dni FROM opositores) THEN
	INSERT INTO opositores(dni,tribunalopositor) VALUES(dni_in, tribunalopositor_in);
ELSE
		IF @@sql_safe_updates = 1 THEN
			SET sql_safe_updates = 0;
		END IF;
			DELETE FROM opositores WHERE dni = dni_in;

END IF;
END
&
DELIMITER ;

START TRANSACTION;
CALL insercion_opositor('AAA6', 6);
ROLLBACK;
CALL insercion_opositor('AAA1',2);
ROLLBACK;
SET sql_safe_updates = 0;
CALL insercion_opositor('AAA1',2);
ROLLBACK;
SELECT * FROM tribunales;

/* Crea un procedimiento que en función del valor de entrada ('Copiar','Insertar','Nulizar') haga:
 'Copiar': Crea una tabla opo_backup con lo mismos campos y valores que opositores
 'Insertar': Hace una llamada al procedimiento anterior e inserta un nuevo opositor en base a los parametros de entrada.
             Previamente comprueba si existe el nuevo tribunalopositor, sino pone NULL 
 'Nulizar': Pone a NULL el campo Nota de la tabla Nota y el campo Presidente de la tabla Tribunales que esten relacionados
           con el nombre del opositor introducido como entrada. Comprueba si el modo seguro esta habilitado, en cuya caso, deshabilitalo
-- Cualquier entrada: Muestra la tabla opositores
-- ej de llamada:  operacion_case(operacion,dni_in,nombre_in,ciudad_in,telefono_in,tribunalopositor_in)
*/ 
DELIMITER &
DROP PROCEDURE IF EXISTS funciones&
CREATE DEFINER = 'Carlos'@'localhost'
	   PROCEDURE funciones(IN operacion VARCHAR(10),dni_in VARCHAR(14),tribunalopositor_in INT)
	SQL SECURITY INVOKER
BEGIN

CASE operacion 
	WHEN operacion LIKE 'Copiar' THEN
		CREATE TABLE opo_backup LIKE opositores;
        INSERT INTO opo_backup SELECT * FROM opositores;
	WHEN operacion LIKE 'Insertar'THEN
		START TRANSACTION;
			IF tribunalopositor_in NOT IN (SELECT codigotribunal FROM tribunales) THEN
				CALL insercion_opositor(dni_in,tribunalopositor_in);
					UPDATE opositores SET tribunalopositor = NULL WHERE dni = dni_in;
				ELSE 
					COMMIT; 
			END IF;
	WHEN operacion LIKE 'Nulizar' THEN
		-- UPDATE NOTAS JOIN opositores ON dni_in = dni JOIN tribunales ON codigotribunal = tribunalopositor SET nota 
       --  UPDATE notas JOIN opositores ON dni_in = dni JOIN tribunales ON tribunalopositor = codigotribunal SET nota = NULL, presiente = NULL WHERE dni = dni_in;

        UPDATE notas SET nota = NULL WHERE dni_in = dniopositor;
        UPDATE tribunales SET presiente = NULL WHERE codigotribunal = (SELECT tribunalopositor FROM opositores WHERE dni = dni_in);
        IF @@sql_safe_updates = 1 THEN
			SET sql_safe_updates = 0;
		END IF;
    
-- copiar: create opo_backup LIKE opositores;
-- interstar: CALL insercion_opositor('AAA1','2');
-- nulizar: UPDATE notas SET nota = NULL AND (SELECT codigotribunal FROM tribunales JOIN opositores WHERE codigotribunal = tribunalopositor JOIN notas WHERE dniopositor LIKE) = NULL;
-- muestra la tabla opositores
END CASE;


END
&
DELIMITER ;
SELECT * FROM opositores;
SELECT * FROM tribunales;
SELECT * FROM notas;

CALL funciones('Copiar','AAA1',2);

/* Crea una tabla llamada matriz con 6 campos INT, inserta 10 fila con todos los campos NULL. 
	Usa DEFAULT para evitar rellenar fila a fila. Crea un procedimiento que compruebe que el 
	número de columnas no sea 6, en dicho caso borra la columna de más. Y si el numero de filas 
	es mayor que 5 borra las filas de más. Usa SELECT COUNT(*) FROM information_schema.columns 
	WHERE table_name = 'matriz' para obtener el número de columnas. Posteriormente mediante un 
	bucle, modifica cada fila alternando con 0 y 1. Ej: la fila 1 todo 0, la fila 2 todo 1, ...
	Ayudate de LIMIT para hacer las sentencias. */ 

CREATE TABLE matriz (
campo1 INT DEFAULT NULL,
campo2 INT DEFAULT NULL,
campo3 INT DEFAULT NULL,
campo4 INT DEFAULT NULL,
campo5 INT DEFAULT NULL,
campo6 INT DEFAULT NULL
);
TRUNCATE TABLE matriz;
INSERT INTO matriz VALUES(),(),(),(),(),(),(),(),();

DELIMITER &
DROP PROCEDURE IF EXISTS num_cols&
CREATE PROCEDURE num_cols()
BEGIN
	DECLARE cantidad_filas INT;
    DECLARE filas_a_eliminar INT;

	DECLARE nombre_campo INT;
	SET nombre_campo = (SELECT ORDINAL_POSITION FROM information_schema.columns WHERE table_name = 'matriz' ORDER BY column_name DESC LIMIT 1);

IF (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = 'matriz') = 6 THEN
		ALTER TABLE matriz DROP campo6;
    
	ELSEIF (SELECT COUNT(*) FROM matriz) > 5  THEN
		SET cantidad_filas = (SELECT COUNT(*) FROM matriz);
		SET filas_a_eliminar = cantidad_filas - 5;
		DELETE FROM matriz ORDER BY campo1 ASC LIMIT filas_a_eliminar;
    
END IF;

DELIMITER &
DROP PROCEDURE IF EXISTS num_cols&
CREATE PROCEDURE num_cols()
BEGIN
DECLARE total_filas INT;
    DECLARE contador INT;
    DECLARE valor_fila INT;
	DECLARE cantidad_filas INT;
    DECLARE filas_a_eliminar INT;

	DECLARE nombre_campo INT;
	SET nombre_campo = (SELECT ORDINAL_POSITION FROM information_schema.columns WHERE table_name = 'matriz' ORDER BY column_name DESC LIMIT 1);

IF (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = 'matriz') = 6 THEN
		ALTER TABLE matriz DROP campo6;
    
	ELSEIF (SELECT COUNT(*) FROM matriz) > 5  THEN
		SET cantidad_filas = (SELECT COUNT(*) FROM matriz);
		SET filas_a_eliminar = cantidad_filas - 5;
		DELETE FROM matriz ORDER BY campo1 ASC LIMIT filas_a_eliminar;
    
END IF;
SET contador = 1;
WHILE contador <= (SELECT COUNT(*) FROM matriz) DO
IF (contador%2) = 0 THEN
			UPDATE matriz SET campo1 = 1 ,campo2 = 1,campo3 = 1,campo4 =1 ,campo5 = 1 WHERE campo1 IS NULL LIMIT 1;
		ELSE 	
			UPDATE matriz SET campo1 = 0 ,campo2 = 0,campo3 = 0,campo4 =0 ,campo5 = 0 WHERE campo1 IS NULL LIMIT 1;
		END IF;
	SET contador = contador+1;
	END WHILE;


    
END&
DELIMITER ;

CALL num_cols();

SET sql_safe_updates = 0;

SELECT * FROM matriz;