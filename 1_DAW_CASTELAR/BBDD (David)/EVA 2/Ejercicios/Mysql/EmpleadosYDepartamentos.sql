CREATE SCHEMA ejerciciocienti;
USE ejerciciocienti;

CREATE TABLE departamentos (
  codDpto VARCHAR(4) NOT NULL,
  nombreDpto VARCHAR(20) NOT NULL,
  ciudad VARCHAR(15),
  PRIMARY KEY (codDpto)
);

CREATE TABLE empleados (
  idemp VARCHAR(12) NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  sexo CHAR(1) NOT NULL,
  fecNac DATE NOT NULL,
  fecIncorporacion DATE NOT NULL,
  salario FLOAT NOT NULL,
  comision FLOAT NOT NULL,
  cargo VARCHAR(15) NOT NULL,
  jefeID VARCHAR(12),
  codDepto VARCHAR(4),
  PRIMARY KEY (idemp),
  FOREIGN KEY (jefeID) REFERENCES empleados (idemp),
  FOREIGN KEY (codDepto) REFERENCES departamentos (codDpto)
);
INSERT INTO departamentos (codDpto, nombreDpto, ciudad) VALUES
('001', 'Ventas', 'Madrid'),
('002', 'Marketing', 'Barcelona'),
('003', 'Finanzas', 'Sevilla'),
('004', 'Desarrollo', 'Badajoz');


INSERT INTO empleados VALUES
('78019046X', 'Oscar Arroyo', 'M', '2003-10-11', '2024-01-01', 500000, 0, 'Empleado', NULL , NULL),
('96745432B', 'María Fernandez', 'F', '1995-03-02', '2022-02-05', 900000, 700, 'Empleado', '96745432B', '002'),
('12345678A', 'Juan Pérez', 'M', '1980-01-01', '2023-01-01', 50000, 1000, 'Director', NULL, '001'),
('98765432B', 'María López', 'F', '1985-02-02', '2022-02-02', 40000, 500, 'Empleado', '12345678A', '002'),
('65432109C', 'Pedro Sánchez', 'M', '1990-03-03', '2021-03-03', 30000, 250, 'Empleado', '98765432B', '003'),
('6226432T', 'Ana López', 'F', '1980-01-01', '2023-01-01', 1200000, 100, 'Secretaria', '12345678A', '001'),
('9236332Z', 'Juan García', 'M', '1975-05-15', '2022-05-01', 1500000, 2000, 'Vendedor', NULL, '002');

-- 23 
SELECT * FROM empleados WHERE nombre LIKE 'M%' AND (salario > 800000 OR comision IS NOT NULL) AND codDepto = (SELECT codDepto FROM departamentos WHERE nombreDpto='Ventas');
SELECT * FROM empleados,departamentos WHERE nombre LIKE 'M%' AND (salario > 800000 OR comision IS NOT NULL) AND nombreDpto='Ventas';
SELECT * FROM empleados AS a,departamentos AS b WHERE nombre LIKE 'M%' AND (salario > 800000 OR comision IS NOT NULL) AND a.codDepto = b.codDepto AND nombreDpto ='Ventas';
-- 24
SELECT nombre,salario,comision FROM empleados WHERE salario > (comision/2) AND salario < comision;
-- 25
SELECT *  FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados);
-- 26
SELECT comision,count(nombre) FROM empleados WHERE comision > 0 GROUP BY comision;
-- 27
SELECT * FROM empleados ORDER BY nombre DESC LIMIT 1;
SELECT MAX(nombre) FROM empleados;
SELECT * FROM empleados WHERE nombre = (SELECT MAX(nombre) FROM empleados );

-- 28
SELECT MIN(salario) AS sueldo_minimo,MAX(salario) AS sueld_maximo, MAX(salario)-MIN(salario) AS diferencia FROM empleados;
-- 29
SELECT codDepto, (SELECT COUNT(sexo) FROM empleados WHERE sexo = 'F' AND codDepto = d.codDepto) AS num_mujeres, (SELECT COUNT(sexo) FROM empleados WHERE sexo = 'M' AND codDepto = d.codDepto) AS num_hombres FROM empleados AS d GROUP BY codDepto;

-- 30
SELECT codDepto,AVG(salario),d.codDepto FROM empleados, departamentos AS d GROUP BY salario;
SELECT codDepto, (SELECT AVG(salario) FROM empleados WHERE codDepto = d.codDepto) FROM empleados AS d GROUP BY codDepto;
SELECT e.codDepto, round(AVG(salario),2), d.nombreDpto FROM empleados AS e, departamentos AS d WHERE e.codDepto=d.codDepto GROUP BY e.codDepto;
SELECT codDepto, round(AVG(salario),2) FROM empleados WHERE codDepto IN (SELECT codDepto FROM departamentos) GROUP BY codDepto;
-- 31
SELECT * FROM empleados WHERE salario >= (SELECT AVG(salario) FROM empleados);
-- 32
SELECT nombreDpto,departamentos.codDepto,num_emp FROM departamentos, ( SELECT count(idemp) AS num_emp, codDepto FROM empleados GROUP BY codDepto HAVING num_emp > 1) AS tabla2 WHERE departamentos.codDepto=tabla2.codDepto;
-- 33 
SELECT idemp AS idJefe, nombre, (SELECT count(idemp) FROM empleados WHERE jefeId =idJefe) AS jefeDe FROM empleados WHERE idemp = ANY(SELECT jefeID from empleados) HAVING jefeDe >1;
-- 34 
SELECT nombreDpto,d.codDepto FROM departamentos as d LEFT JOIN empleados e ON d.codDepto = e.codDepto WHERE e.codDepto IS NULL;
-- 35
SELECT d.nombreDpto, SUM(e.salario) AS SalarioTotal FROM departamentos AS d INNER JOIN empleados AS e ON d.codDpto = e.codDepto GROUP BY d.codDpto ORDER BY SalarioTotal DESC LIMIT 1;


SELECT * FROM empleados;
SELECT * FROM departamentos;

