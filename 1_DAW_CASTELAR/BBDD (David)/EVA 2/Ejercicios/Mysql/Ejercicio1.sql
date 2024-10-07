CREATE SCHEMA empresa;
USE empresa;

CREATE TABLE empleados(
	emp_no		INT,										-- Poner como PK un INT es mucho mejor porque ocupa menos y es más rapido
    apellido 	VARCHAR(255),
    oficio 		VARCHAR(255),
    dir 		INT,
    fecha_alt 	DATE, 
    salario		INT,
    comision 	INT,
    dept_no		INT
);

CREATE TABLE departamentos(
	dept_no		INT,
	dnombre		VARCHAR(255),
    loc			VARCHAR(255)
);

SHOW TABLES;

INSERT INTO empleados(emp_no,apellido,oficio,dir,fecha_alt,salario,comision,dept_no) VALUES 
			(7369, 'Sanchez', 'Empleado', 7902, '1980-12-17', 1040,NULL, 20),
			(7499, 'Arroyo', 'Vendedor', 7698, '1980-02-20', 2080, 390, 30),
			(7521, 'Sala', 'Vendedor', 7698, '1981-02-22', 1625, 1625, 30),
			(7566, 'Jimenez', 'Director', 7839, '1981-04-02', 3867, NULL, 20),
			(7654, 'Martin', 'Vendedor', 7698, '1981-09-28', 1625, 1820, 30),
			(7698, 'Negro', 'Director', 7839, '1981-05-01', 3705, NULL, 30),
			(7788, 'Gil', 'Analista', 7566, '1981-11-09', 3900, NULL, 20),
			(7839, 'Rey', 'Presidente', NULL, '1981-11-17', 6500, NULL, 10),
			(7844, 'Tovar', 'Vendedor', 7698, '1981-09-08', 1950, 0, 30),
			(7876, 'Alonso', 'Empleado', 7788, '1981-09-23', 1430, NULL, 20),
			(7900, 'Jimeno', 'Empleado', 7698, '1981-09-23', 12350, NULL, 30),
			(7902, 'Fernandez', 'Analista', 7566, '1981-12-03', 3900, NULL, 20),
			(7934, 'Munoz', 'Empleado', 7788, '1982-01-23', 3900, NULL, 10);

INSERT INTO departamentos VALUES
(10,'CONTABILIDAD','SEVILLA'),
(20,'INVESTIGACION','MADRID'),
(30,'VENTAS','BARCELONA'),
(40,'PRODUCCIÓN','BILBAO');

ALTER TABLE empleados ADD CONSTRAINT pk_no_emp PRIMARY KEY (emp_no) ; 
ALTER TABLE empleados MODIFY emp_no INT NOT NULL;
ALTER TABLE empleados MODIFY apellido VARCHAR(20) NOT NULL ; 
ALTER TABLE empleados MODIFY oficio VARCHAR(20) NOT NULL; 
ALTER TABLE empleados MODIFY fecha_alt DATE NOT NULL; 
ALTER TABLE empleados MODIFY salario INT NOT NULL; 
ALTER TABLE empleados MODIFY dept_no INT NOT NULL; 
ALTER TABLE empleados ADD CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departamentos(dept_no) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE departamentos ADD CONSTRAINT pk_no_emp PRIMARY KEY (dept_no);

ALTER TABLE empleados ENGINE INNODB;				
ALTER TABLE departamentos ENGINE INNODB;		-- Cambia el motor de almacenamiento en ambas tablas

SHOW SCHEMAS;
SHOW TABLES;

ALTER TABLE empleados ADD CONSTRAINT fk_dir_emp FOREIGN KEY (dir) REFERENCES empleados(emp_no);

SELECT * FROM departamentos;
SELECT * FROM empleados;

SET sql_safe_updates = 0;

UPDATE departamentos SET dept_no=50 WHERE dept_no = 20;
 