USE ejercicio3;

SELECT * FROM empleados;
SELECT * FROM departamentos;

-- 5 consultas con uso de funciones y con agrupaciones usando having.
SELECT comision,count(emp_no) FROM empleados GROUP BY comision HAVING comision > 400;
SELECT codDepto, MAX(salario)  FROM empleados GROUP BY codDepto HAVING max(salario)>=30000;
SELECT idemp,nombre,cargo,fecIncorporacion FROM empleados GROUP BY idemp HAVING fecIncorporacion > 2022-05-01 ;
SELECT comision,MIN(salario) FROM empleados GROUP BY comision HAVING min(salario) <=30000;
SELECT codDepto, round(AVG(salario),2) FROM empleados WHERE codDepto IN (SELECT codDepto FROM departamentos) GROUP BY codDepto HAVING AVG(salario) <>625000;
-- 5 consultas con asociación de tablas.
SELECT nombreDpto, d.codDepto FROM departamentos AS d,empleados AS e WHERE e.codDepto = d.codDepto AND d.codDepto GROUP BY codDepto;
SELECT codDepto, (SELECT AVG(salario) FROM empleados WHERE codDepto = d.codDepto) AS Average FROM empleados AS d GROUP BY codDepto;
SELECT nombreDpto, nombre FROM departamentos d, empleados e WHERE d.codDepto = e.codDepto OR d.codDepto IS NULL;
SELECT nombreDpto, COUNT(e.codDepto) AS empleados FROM departamentos d, empleados AS e WHERE d.codDepto = e.codDepto GROUP BY nombreDpto;
SELECT e.codDepto, round(AVG(salario),2) FROM empleados e,departamentos d WHERE e.codDepto = d.codDepto GROUP BY codDepto HAVING AVG(salario) <>625000;

