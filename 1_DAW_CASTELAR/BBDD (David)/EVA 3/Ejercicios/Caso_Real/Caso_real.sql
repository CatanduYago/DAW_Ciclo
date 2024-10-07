DROP SCHEMA IF EXISTS ej_largo;
CREATE SCHEMA ej_largo;
USE ej_largo;

CREATE TABLE alumno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(9) UNIQUE,
    nombre VARCHAR(25),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25),
    fecha_nac DATE,
    sexo CHAR(1)
);
 
CREATE TABLE departamento (
    id INT PRIMARY KEY,
    nombre VARCHAR(25)
);

CREATE TABLE profesor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) ,
    apellido1 VARCHAR(50) ,
    apellido2 VARCHAR(50),
    fecha_nac DATE,
    sexo CHAR(1),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

 CREATE TABLE grado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) 
);
 
CREATE TABLE asignatura (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    creditos FLOAT,
    id_profesor INT,
    id_grado INT,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
 
CREATE TABLE curso_escolar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ano_inicio YEAR,
    ano_fin YEAR
);

CREATE TABLE alum_asig_cur (
    id_alumno INT,
    id_asignatura INT,
    id_curso_escolar INT,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);

INSERT INTO departamento VALUES (1, 'Dpt. Matemáticas'),
								(2, 'Dpt. Letras');

INSERT INTO profesor (id, nombre, apellido1, apellido2, fecha_nac, sexo, id_departamento) 
			  VALUES (1,'Juan', 'García', 'López', '1980-05-15', 'M', 1),
					 (2,'María', 'Martínez', 'Pérez', '1975-10-20', 'F', 2),
					 (3,'Luis', 'Fernández', 'Rodríguez', '1983-08-10', 'M', NULL);   -- No tiene departamento

INSERT INTO grado (id,nombre) VALUES (1,'Grado en Ingeniería Informática');

INSERT INTO asignatura (id,nombre, creditos, id_profesor, id_grado)
				VALUES (1,'Matemáticas', 4.5, 1, 1), 
					   (2,'Historia',    3.0, 2, 1), 
                       (3,'Biología',    3.5, NULL, 1),  -- No tiene profesor
                       (4,'Literatura',  3.0, 2, NULL),  -- No tiene grado
                       (5,'Programación',4.0, 3, 1);

INSERT INTO curso_escolar (id,ano_inicio, ano_fin)
				   VALUES (1,'2020', '2021'),
						  (2,'2021', '2022'),
						  (3,'2022', '2023'),
						  (4,'2023', NULL);
/*
Automatiza la matriculación por defecto de un alumno en todas las asignaturas del último curso.
Asegurándote de que las asignaturas cumplen unas determinadas condiciones: Estan asociadas a un
grado y tienen un profesor que pertenezca a un departamento.

1º Crea un procedimiento que en base al id de un alumno y el id de un curso, matricule
a dicho alumno en todas las asignaturas que existan (fijate que el id de las asignaturas 
es autoincremental, usa un bucle)

2º Crea un trigger que al insertar un nuevo alumno, automaticamente lo matricule en
todas las asignaturas, para el último curso existente. Usa la función anterior.

3º Crea un trigger que al matricular un alumno en una asignatura para un curso, compruebe
que antes se cumplen unas condiciones. En caso de que la asignatura no tenga un grado
asociado mostrará un error con el nombre de la asig. En caso de que la asignatura no tenga un 
profesor asociado mostrará un error con el nombre de la asig. En caso de que ese profesor no tenga
un departamento asociado mostrará un error con el nombre de la asig y el profesor.

Inicializa una transacción. Pon a prueba todas las casuisticas al intentar insertar un nuevo alumno. 
Ve corrigiendo los datos provistos tras cada intento. Una vez conseguido introducir el alumno,
deshaz la transacción.
*/

-- 1

DELIMITER %&
DROP PROCEDURE IF EXISTS matricular;
CREATE PROCEDURE matricular(IN id_alumno_in INT, id_curso_in INT)
matricular 
BEGIN
	DECLARE contador INT; 
	SET contador = 1;
    
	WHILE contador <= (SELECT COUNT(id) FROM asignatura) DO
	
		INSERT INTO alum_asig_cur VALUES (id_alumno_in,contador,id_curso_in);
		
		SET contador = contador + 1;
            
	END WHILE;
        
END 
%&
DELIMITER ;

-- 2

DELIMITER %&
DROP TRIGGER IF EXISTS matriculacion_autom;
CREATE TRIGGER matriculacion_autom
	AFTER INSERT ON alumno
		FOR EACH ROW
        
			BEGIN
            
				CALL matricular(NEW.id, (SELECT id FROM curso_escolar WHERE ano_inicio = (SELECT MAX(ano_inicio) FROM curso_escolar)));
            
            END 
%&

DELIMITER ;
INSERT INTO alumno VALUES (1,'80169055B', 'Ramon', 'Sanchez', 'Andujar', 'Badajoz', '2004-11-21', 'M');
INSERT INTO alumno VALUES (2,'12345678X', 'Carmen', 'Machi', 'Espabila', 'Caceres', '2003-01-14', 'F');


SELECT * FROM alumno;
SELECT * FROM alum_asig_cur;
SELECT * FROM curso_escolar;

-- 3 
DROP TRIGGER IF EXISTS matricula_curso;
DELIMITER %&
CREATE TRIGGER matricula_curso
    BEFORE INSERT ON alum_asig_cur
    FOR EACH ROW
    BEGIN
        DECLARE nombre_asignatura VARCHAR(255);
        DECLARE nombre_profesor VARCHAR(255);
        DECLARE mensaje VARCHAR(255);
        

        SELECT nombre INTO nombre_asignatura FROM asignatura WHERE id = NEW.id_asignatura;
        
        SELECT nombre INTO nombre_profesor FROM profesor WHERE id = (SELECT id_profesor FROM asignatura WHERE id = NEW.id_asignatura);
        
        IF (SELECT id_grado FROM asignatura WHERE id = NEW.id_asignatura) IS NULL THEN
			SET mensaje = CONCAT('Error: La asignatura ', nombre_asignatura, ' no tiene un grado asociado');
            
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mensaje;
		
        ELSEIF (SELECT id_profesor FROM asignatura WHERE id = NEW.id_asignatura) IS NULL THEN
        
            SET mensaje = CONCAT('Error: La asignatura ', nombre_asignatura, ' no es impartida por ningún profesor');
            
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = mensaje;
		
        ELSEIF (SELECT id_departamento FROM profesor WHERE id = ((SELECT id_profesor FROM asignatura WHERE id = NEW.id_asignatura))) IS NULL THEN
        
            SET mensaje = CONCAT('Error: El profesor ', nombre_profesor, ' de ',nombre_asignatura,' no tiene ningún departamento');
            
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = mensaje;
        
        END IF;
	END;
%&
DELIMITER ;

SELECT * FROM alumno;
SELECT * FROM asignatura;
SELECT * FROM curso_escolar;
SELECT * FROM alum_asig_cur;

START TRANSACTION;

INSERT INTO alum_asig_cur VALUES (1,4,4);
UPDATE asignatura SET id_grado = 1 WHERE id = 4;
INSERT INTO alum_asig_cur VALUES (2,3,3);
UPDATE asignatura SET id_profesor = 3 WHERE id = 3;

INSERT INTO alum_asig_cur VALUES (2,5,4);
UPDATE profesor SET id_departamento = 2 WHERE id = 3;

ROLLBACK;

SELECT * FROM alum_asig_cur;
SELECT * FROM asignatura;





