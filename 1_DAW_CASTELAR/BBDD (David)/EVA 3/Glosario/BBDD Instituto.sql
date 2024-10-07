

USE pruebas_datagrip;

CREATE TABLE Alumno (
  NumMatricula INT PRIMARY KEY,
  Nombre VARCHAR(255) NOT NULL,
  FechaNacimiento DATE NOT NULL,
  Telefono VARCHAR(255) NOT NULL
);
CREATE TABLE Profesor (
  IdProfesor INT PRIMARY KEY,
  Nombre VARCHAR(255) NOT NULL,
  NIF VARCHAR(255) UNIQUE NOT NULL,
  Especialidad VARCHAR(255) NOT NULL,
  Telefono VARCHAR(255) NOT NULL
);
CREATE TABLE Asignatura (
  CodAsignatura INT PRIMARY KEY,
  Nombre VARCHAR(255) NOT NULL,
  IDProfesor INT,
	FOREIGN KEY (IDProfesor) REFERENCES Profesor(IdProfesor)

);



CREATE TABLE Recibe (
  NumMatricula INT NOT NULL,
  CodAsignatura INT NOT NULL,
  CursoEscolar INT PRIMARY KEY,
  
  FOREIGN KEY (CodAsignatura) REFERENCES Asignatura(CodAsignatura),
  FOREIGN KEY (NumMatricula) REFERENCES Alumno(NumMatricula));
  
-- 1
INSERT INTO Profesor (IdProfesor, Nombre, NIF, Especialidad, Telefono)
VALUES
  (1, 'Juan Martinez', '12345678A', 'Matemáticas', '123456789'),
  (2, 'Maria Lopez', '87654321B', 'Lengua', '987654321');

INSERT INTO Asignatura (CodAsignatura, Nombre, IdProfesor)
VALUES
  (1, 'BBDD', 1),
  (2, 'Marcas', 2),
  (3, 'Entornos', NULL),
  (4, 'FOL', NULL);

INSERT INTO Alumno (NumMatricula, Nombre, FechaNacimiento, Telefono)
VALUES
  (1, 'Carlos Garcia', '2005-02-10', '111111111'),
  (2, 'Laura Perez', '2006-05-15', '222222222'),
  (3, 'Daniel Rodriguez', '2005-07-20', '333333333'),
  (4, 'Ana Gomez', '2006-01-05', '444444444'),
  (5, 'David Fernandez', '2005-11-30', '555555555'),
  (6, 'Elena Sanchez', '2006-03-25', '666666666'),
  (7, 'Sara Martin', '2005-08-12', '777777777'),
  (8, 'Pablo Ruiz', '2006-04-17', '888888888'),
  (9, 'Lucia Hernandez', '2005-10-08', '999999999'),
  (10, 'Mario Diaz', '2006-02-28', '1010101010');

INSERT INTO Recibe (CodAsignatura, NumMatricula, CursoEscolar)
VALUES
  (1, 1, 1),
  (2, 2, 2), 
  (1, 1, 3), 
  (3, 2, 4), 
  (2, 2, 5),
  (3, 1, 6), 
  (1, 1, 7), 
  (4, 2, 8), 
  (2, 2, 9), 
  (4, 1, 10), 
  (1, 1, 11), 
  (3, 2, 12),
  (3, 2, 13),
  (4, 1, 14), 
  (2, 1, 15), 
  (4, 2, 16), 
  (1, 2, 17),
  (3, 1, 18),
  (1, 2, 19), 
  (4, 1, 20); 


UPDATE alumno SET telefono = 137841872 WHERE NumMatricula = ANY (SELECT NumMatricula FROM alumnos WHERE telefono IS NULL);
UPDATE alumno as a INNER JOIN (SELECT NumMatricula FROM alumno WHERE NumMatricula BETWEEN 11 AND 13) AS b ON a.NumMatricula = b.NumMatricula SET a.Telefono = 23824733;

UPDATE alumno SET FechaNacimiento = DATE_FORMAT(FechaNacimiento, '2000-%m-%d');
SET sql_safe_updates = 0;

UPDATE profesor SET especialidad = 'Informatica' WHERE NIF NOT LIKE '9%' AND Telefono IS NOT NULL;

UPDATE asignatura AS a SET IDProfesor = (SELECT b.IdProfesor FROM profesor AS b WHERE b.IdProfesor != a.IdProfesor);
UPDATE asignatura AS a INNER JOIN asignatura AS b ON a.IDProfesor NOT LIKE b.IDProfesor SET a.IDProfesor = b.IDProfesor;

DELETE FROM Recibe WHERE CodAsignatura IN (SELECT CodAsignatura FROM Asignatura WHERE nombre = 'BBDD');

SELECT * FROM alumno;
