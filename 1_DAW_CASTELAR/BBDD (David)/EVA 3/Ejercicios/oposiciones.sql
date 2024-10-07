SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS oposiciones;
CREATE DATABASE oposiciones;
USE oposiciones;

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
  CONSTRAINT `fk_notas_opo` FOREIGN KEY (`DNIOPOSITOR`) REFERENCES `opositores` (`DNI`),
  CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`CODIGOEXAMEN`) REFERENCES `examenes` (`CODIGOEXA`)
) ENGINE=InnoDB;

-- Insertar datos en la tabla `tribunales`
INSERT INTO tribunales (CODIGOTRIBUNAL, PRESIDENTE, SECRETARIO, VOCAL1, VOCAL2, VOCAL3) VALUES
					(2, NULL, NULL, 'PEDRO FERNANDEZ', 'ISABEL FRESNEDA', 'LUIS MERLO'),
					(8, NULL, NULL, 'ANA LIMA', 'TOMAS RODRIGUEZ', 'ROCIO CINTIA'),
					(1, NULL, NULL, 'ANA MATOS', 'PEDRO RODRIGUEZ', 'NOA CINTIA');

-- Insertar datos en la tabla `opositores` 
INSERT INTO opositores (DNI, NOMBRE, CIUDAD, TELEFONO, TRIBUNALOPOSITOR) VALUES
						('AAA1', 'José Luis Almeida Pérez', 'Badajoz', '666777888', 2),
						('AAA2', 'María Almeida Pérez', 'Badajoz', NULL, 2),
						('AAA3', 'Carmen Alegría Silva', 'Badajoz', NULL, 8),
						('AAA4', 'Juan Carlos Perdigón Solís', 'Badajoz', '666555444', 8),
						('AAA5', 'Javier Ramírez Montero', 'Badajoz', NULL, 1);

-- Ejercicio de clase: pasar todos los datos de una tabla a otra sin hacer los insert
CREATE TABLE opositores_backup LIKE opositores;

INSERT INTO opositores_backup SELECT * FROM opositores; 

TRUNCATE opositores;

-- 2
INSERT INTO examenes (CODIGOEXA,DESCRIPCIONEXA) VALUES 
					(100,'Base de datos'),
					(200,'Programacion');

INSERT INTO notas(dniopositor,codigoexamen) 
	SELECT o.dni,e.codigoexa 
		FROM opositores AS o 
		JOIN examenes AS e;
        
-- 3
SET sql_safe_updates = 0;

UPDATE notas SET nota = FLOOR(RAND() * 10) + 1 WHERE nota IS NULL;

-- 4
SET sql_safe_updates = 0;

UPDATE opositores SET ciudad = 'Mérida' WHERE tribunalopositor LIKE 8;

-- 5
UPDATE opositores SET tribunalopositor = 8 WHERE dni LIKE 'AAA1';

-- 6
UPDATE opositores SET telefono = 777888999 WHERE dni LIKE 'AAA2';

-- 7
SET sql_safe_updates = 0;

UPDATE notas SET nota= 10 WHERE codigoexamen LIKE (SELECT codigoexa FROM examenes WHERE descripcionexa LIKE 'Base de datos');

-- 8
UPDATE notas SET nota = 0 WHERE codigoexamen LIKE (SELECT codigoexa FROM examenes WHERE descripcionexa LIKE 'Programacion') AND dniopositor LIKE 'AAA3';

-- 9
DELETE opositores,notas FROM opositores JOIN notas ON DNI = DNIOPOSITOR WHERE NOMBRE LIKE  'José Luis Almeida Pérez';

-- 10
DELETE opositores FROM opositores WHERE DNI = (SELECT DNIOPOSITOR FROM notas WHERE nota < 4);

DELETE opositores, c FROM opositores JOIN notas ON opositores.DNI = notas.DNIOPOSITOR, opositores b JOIN notas c ON b.DNI = c.DNIOPOSITOR WHERE notas.NOTA < 4 AND c.NOTA < 4;


-- 11
DELETE opositores FROM opositores;

-- 12
INSERT INTO opositores (DNI, NOMBRE, CIUDAD, TELEFONO, TRIBUNALOPOSITOR) VALUES
						('AAA1', 'José Luis Almeida Pérez', 'Badajoz', '666777888', 2),
						('AAA2', 'María Almeida Pérez', 'Badajoz', NULL, 2),
						('AAA3', 'Carmen Alegría Silva', 'Badajoz', NULL, 8),
						('AAA4', 'Juan Carlos Perdigón Solís', 'Badajoz', '666555444', 8),
						('AAA5', 'Javier Ramírez Montero', 'Badajoz', NULL, 1);

-- 13
DELETE opositores FROM opositores WHERE TRIBUNALOPOSITOR LIKE (SELECT CODIGOTRIBUNAL FROM tribunales WHERE VOCAL1 LIKE 'PEDRO FERNANDEZ');

-- 14
UPDATE opositores SET telefono = 666666666 WHERE telefono IS NULL;

-- 15
UPDATE examenes SET codigoexa = 50 AND descripcionexa = 'Módulo de BBDD'  WHERE descripcionexa LIKE 'Base de datos' ;

-- 17 (no hay 16, no me he fumao na)
UPDATE opositores SET telefono = NULL WHERE telefono ORDER BY nombre ASC LIMIT 1  ;

-- 18
UPDATE opositores SET telefono = NULL WHERE telefono ORDER BY nombre DESC LIMIT 1  ;

TRUNCATE notas;

SELECT * FROM notas;


