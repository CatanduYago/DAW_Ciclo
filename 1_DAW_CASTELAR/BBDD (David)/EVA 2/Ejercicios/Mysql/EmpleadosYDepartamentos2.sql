USE ejercicio4;

-- 1
SELECT e.*, d.nombreDpto FROM empleados e INNER JOIN departamentos d ON e.codDepto = d.codDepto WHERE cargo IN ('Secretaria', 'Vendedor') AND d.nombreDpto NOT LIKE 'Produccion'  AND salario > 1000000 ORDER BY fecIncorporacion ASC;
-- 2
SELECT e.*,d.nombreDpto FROM empleados e JOIN departamentos d ON nombre LIKE 'M%' AND (salario > 800000 OR comision IS NOT NULL) AND nombreDpto = 'Ventas';
SELECT * FROM empleados e WHERE nombre LIKE 'M%' AND (salario > 800000 OR comision IS NOT NULL) AND e.codDepto = (SELECT codDepto FROM departamentos WHERE nombreDpto='Ventas');
-- 3 
ALTER TABLE departamentos RENAME COLUMN codDpto TO codDepto;

SELECT codDepto,nombreDpto,count(idemp) AS cuentas FROM empleados 
    NATURAL JOIN departamentos  
    GROUP BY codDepto 
    HAVING cuentas >=3;
-- 4
SELECT e.idemp,e.nombre,count(codigo) AS cuenta FROM empleados e NATURAL JOIN (SELECT idemp AS codigo,jefeID AS idemp FROM empleados) AS d GROUP BY e.idemp,e.nombre HAVING cuenta >= 2 ORDER BY cuenta DESC;
-- 5
SELECT d.* FROM departamentos AS d LEFT JOIN empleados AS e ON d.codDepto=e.codDepto WHERE e.codDepto IS NULL; 

-- 7
SELECT a.nombre,b.cargo FROM empleados as a INNER JOIN empleados AS b WHERE a.cargo LIKE b.cargo GROUP BY nombre,cargo;
-- 8
SELECT a.nombre,a.sexo FROM empleados as a INNER JOIN empleados as b WHERE a.sexo LIKE b.sexo AND a.codDepto LIKE (SELECT codDepto FROM departamentos as d WHERE d.nombreDpto LIKE 'VENTAS' AND ciudad LIKE 'Madrid') GROUP BY nombre,sexo;

SELECT * FROM empleados;
SELECT * FROM departamentos;

