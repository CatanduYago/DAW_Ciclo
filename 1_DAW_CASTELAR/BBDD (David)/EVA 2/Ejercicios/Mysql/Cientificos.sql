CREATE SCHEMA ejerciciocienti;
USE ejerciciocienti;

INSERT INTO `cientifico` (`dni`, `nombre`, `apellidos`) VALUES
						 ('11111111', 'Javier', 'Rodríguez'),
					 	 ('22222222', 'Ana', 'Diaz'),
						 ('33333333', 'Juan', 'Perez'),
						 ('44444444', 'David', 'Ortiz'),
						 ('55555555', 'Jennifer', 'Mendoza'),
						 ('66666666', 'Carlos', 'Salgado');

INSERT INTO `proyectos` (`id`, `titulo`, `horas`) VALUES
						('1', 'Vacunación COVID-19', 500),
						('2', 'Tratamiento contra el Cáncer', 1500),
						('3', 'Inteligencia artificial', 200),
						('4', 'Agujeros negros', 250);

INSERT INTO `asignacion` (`cientifico`, `proyecto`) VALUES
						 ('11111111', '1'),
						 ('11111111', '2'),
						 ('22222222', '1'),
						 ('33333333', '2'),
						 ('44444444', '2'),
						 ('44444444', '3'),
						 ('55555555', '2');
-- 1
SELECT c.*,p.* 
	FROM cientifico AS c 
		LEFT JOIN asignacion AS a ON c.dni=a.cientifico  
		LEFT JOIN proyectos AS p ON p.id=a.proyecto;
        
SELECT c.*,p.* FROM proyectos AS p  JOIN asignacion AS a ON p.id=a.proyecto RIGHT JOIN cientifico AS c ON c.dni = a.cientifico; 

 -- 2
SELECT c.*,count(proyecto) FROM cientifico AS c LEFT JOIN asignacion AS a ON dni=cientifico GROUP BY dni;

-- 3 
SELECT id,titulo,count(cientifico) FROM proyectos LEFT JOIN asignacion ON id = proyecto GROUP BY id;

-- 4
SELECT c.*,sum(p.horas) 
	FROM cientifico AS c 
	LEFT JOIN asignacion AS a ON c.dni = a.cientifico 
	LEFT JOIN proyectos AS p ON a.proyecto = p.id GROUP BY c.dni;
    
    SELECT c.*,sum(p.horas) 
	FROM proyectos AS p 
    JOIN asignacion AS a ON id = a.proyecto
	RIGHT JOIN cientifico AS c ON dni = cientifico GROUP BY c.dni;
    
-- 5
SELECT c.*,count(proyecto) AS proyectos ,AVG(horas) AS horasTotales FROM cientifico AS c LEFT JOIN asignacion AS a ON c.dni = a.cientifico 
	LEFT JOIN proyectos AS p ON a.proyecto = p.id GROUP BY c.dni HAVING horasTotales > 850 AND proyectos > 1;

-- 6
SELECT c.*,AVG(horas) AS mediaHoras,count(proyecto) AS proyectos, SUM(horas) AS horastotales FROM cientifico AS c 
		LEFT JOIN asignacion AS a ON dni = cientifico 
		LEFT JOIN proyectos AS p ON proyecto = id GROUP BY dni HAVING mediaHoras < horastotales AND proyectos > 1;
    
SELECT c.*, count(proyecto) AS proyectos, AVG(horas) AS mediaHoras FROM cientifico AS c 
LEFT JOIN asignacion ON dni = cientifico
LEFT JOIN  proyectos ON id = proyecto WHERE horas < (SELECT AVG(horas) FROM proyectos) GROUP BY dni;
    