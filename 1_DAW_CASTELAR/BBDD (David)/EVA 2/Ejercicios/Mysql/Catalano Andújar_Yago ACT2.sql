-- 5 consultas simples y filtradoç
SELECT emp_no,dir,salario,dept_no FROM empleados;
SELECT * FROM empleados WHERE salario >=2000;
SELECT dept_no,dnombre FROM departamentos;
SELECT * FROM empleados WHERE dept_no = 30 AND salario >2000;
SELECT apellido,fecha_alt,comision FROM empleados WHERE comision >1000;

-- 5 consultas con subconsultas
SELECT *  FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados);
SELECT * FROM empleados WHERE emp_no IN (SELECT emp_no FROM empleados WHERE salario <=2000) ;
SELECT emp_no,apellido,dept_no FROM empleados WHERE apellido = (SELECT apellido FROM empleados WHERE apellido = 'Arroyo');
SELECT * FROM empleados WHERE salario = (SELECT MIN(salario) FROM empleados);
SELECT * FROM empleados WHERE salario = (SELECT MIN(salario) FROM empleados WHERE dept_no = 10 );

-- 5 consultas con ordenacion
SELECT * FROM empleados WHERE emp_no = (SELECT MAX(emp_no) FROM empleados ORDER BY dept_no ASC) ; 		-- El max en emp_no está puesto porque sin él da error ya que devuelve más de una fila
SELECT * FROM departamentos ORDER BY dnombre DESC;
SELECT emp_no,apellido,salario,comision,dept_no FROM empleados ORDER BY comision DESC, salario ASC;
SELECT apellido,comision,COUNT(salario) AS salario FROM empleados GROUP BY apellido,comision HAVING salario<2 AND comision BETWEEN 1000 AND 2000 ORDER BY comision ASC;		
SELECT * FROM empleados WHERE comision IS NOT NULL ORDER BY comision ASC;
