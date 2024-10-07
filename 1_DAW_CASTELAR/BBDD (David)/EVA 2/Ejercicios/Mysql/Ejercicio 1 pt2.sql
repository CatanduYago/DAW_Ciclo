-- 1
SELECT DISTINCT apellido,oficio,dept_no FROM empleados;
-- 2 
SELECT DISTINCT dept_no,dnombre,loc FROM departamentos;
-- 3
SELECT DISTINCT oficio FROM empleados;
-- 4
SELECT DISTINCT dept_no AS número, dnombre AS nombre, loc AS localidad_departamento FROM departamentos;
-- 5
SELECT * FROM empleados WHERE dept_no = 10;
-- 6
SELECT * FROM empleados WHERE comision = 0;
-- 7
SELECT * FROM empleados WHERE oficio = 'empleado' AND dept_no = 20;
-- 8
SELECT * FROM empleados WHERE salario > 2000;
-- 9
SELECT * FROM empleados WHERE apellido LIKE 'A%' or apellido LIKE 'a%';
-- 10
ALTER TABLE empleados CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs;
-- 11
SELECT * FROM empleados WHERE apellido COLLATE utf8mb4_bin	 = 'a%';
-- 12
ALTER TABLE departamentos CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs;
SELECT apellido,oficio FROM empleados WHERE salario > 1990 AND comision IS NOT NULL AND comision > 0 ;
-- 13
SET sql_safe_updates = 0;
UPDATE empleados SET apellido = 'arro%yo' WHERE apellido= 'Arroyo';
-- 14
SELECT * FROM empleados WHERE apellido LIKE '%\%%';
-- 15
SELECT * FROM departamentos ORDER BY dnombre DESC;
-- 16
SELECT * FROM empleados ORDER BY salario DESC, comision ASC;
-- 17
SET sql_safe_updates = 0;
UPDATE empleados SET apellido = 'Martín' WHERE apellido = 'Martin';
SELECT * FROM empleados WHERE apellido LIKE '´';
-- 18
SELECT * FROM empleados ORDER BY dept_no DESC;
-- 19
SELECT * FROM empleados ORDER BY dept_no DESC, apellido ASC;
-- 20
SELECT apellido FROM empleados WHERE oficio = 'Analista' ;
-- 21
SELECT * FROM empleados WHERE oficio = 'Vendedor' ORDER BY apellido;
-- 22
SELECT * FROM empleados WHERE apellido NOT LIKE '%a%';
-- 23
SELECT * FROM empleados WHERE salario > 2000 AND (comision > 0 OR dept_no = 20);
-- 24
SELECT * FROM empleados WHERE salario > 2000 AND comision > 0 OR (dept_no = 20);
-- 25
SELECT * FROM empleados ORDER BY oficio, fecha_alt DESC;
-- 26
SELECT emp_no, apellido FROM empleados WHERE salario LIKE '1%';
-- 27
SELECT * FROM empleados WHERE apellido LIKE '%z';
-- 28
SELECT * FROM empleados WHERE apellido LIKE '_o%' AND oficio LIKE '%o_';
-- 29
SELECT * FROM empleados WHERE salario >= 1000 AND salario <= 2000;
SELECT * FROM empleados WHERE salario BETWEEN 1000 AND 2000;
-- 30
SELECT apellido, oficio FROM empleados WHERE oficio = 'Vendedor' OR oficio = 'Empleado' OR oficio = 'Analista';
SELECT apellido, oficio FROM empleados WHERE oficio = 'Vendedor' OR oficio LIKE 'Empleado' OR oficio LIKE  'Analista';
SELECT apellido, oficio FROM empleados WHERE oficio IN ('Vendedor','Empleado','Analista');
-- 31
SELECT * FROM empleados WHERE salario <= 1000 OR salario >= 2000;
SELECT * FROM empleados WHERE salario  NOT BETWEEN 1000 AND 2000;
-- 32
UPDATE empleados SET comision = NULL WHERE apellido = 'Munoz';
-- 33
SELECT * FROM empleados WHERE comision IS NULL;
-- 34
SET sql_safe_updates = 0;
UPDATE empleados SET apellido = 'Arroyo' WHERE apellido= 'arro%yo';
-- 35
SELECT apellido,salario FROM empleados, departamentos WHERE empleados.dept_no=departamentos.dept_no AND dnombre='CONTABILIDAD';
SELECT apellido, salario FROM empleados WHERE dept_no LIKE '10';
-- 36
SELECT *  FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados);
SELECT *  FROM empleados WHERE salario >=ALL(SELECT salario FROM empleados);
-- 37
SELECT *  FROM empleados WHERE salario = (SELECT MIN(salario) FROM empleados);
-- 38
SELECT * FROM empleados WHERE salario >= (SELECT MIN(salario+1000) FROM empleados);
SELECT * FROM empleados WHERE (salario <=(SELECT MIN(salario+1000) ))	 UNION SELECT * FROM empleados WHERE (salario >= ALL(SELECT MAX(salario) FROM empleados));

SELECT * FROM empleados;