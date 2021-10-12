USE master;
DROP DATABASE RegistroNotas03LB;

CREATE DATABASE RegistroNotas03LB;
USE RegistroNotas03LB;

/*Tabla alumno*/
CREATE TABLE Alumno(
	IdAlumno INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(MAX) NOT NULL,
	Grado VARCHAR(15) NOT NULL,
	Seccion VARCHAR(10) NOT NULL
);
/*Tabla Materia*/
CREATE TABLE Materia(
	IdMateria INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(25) NOT NULL,
	Docente VARCHAR(MAX) NOT NULL
);
/*Tabla notas*/
CREATE TABLE Notas(
	IdNotas INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	IdAlumno INT NOT NULL FOREIGN KEY REFERENCES Alumno(IdAlumno),
	IdMateria INT NOT NULL FOREIGN KEY REFERENCES Materia(IdMateria),
	Promedio DECIMAL NOT NULL
);

/*Comandos principales de alumno*/
INSERT INTO Alumno(Nombre,Grado,Seccion) VALUES
('Jonathan Escalante','Segundo Año','Seccion C');

INSERT INTO Alumno(Nombre,Grado,Seccion) VALUES
('Jeniffer Hernandez','Septimo','Seccion D'),
('Luis Almendariz','Octavo','Seccion A'),
('Lucia Rodriguez','Noveno','Seccion B');

UPDATE Alumno
SET Grado='Septimo'
WHERE IdAlumno = 1;

DELETE FROM Alumno WHERE IdAlumno = 5;

SELECT * FROM Alumno;

/*Comandos de materias*/
INSERT INTO Materia(Nombre,Docente) VALUES
('Matematica','Jose Perez'),
('Ciencias Naturales','Alejandra Valladares'),
('Lenguaje y Literatura','Pedro Arenival'),
('Sociales','Samuel Sanchez');

SELECT * FROM Materia;

/*Comandos de notas*/
INSERT INTO Notas(IdAlumno,IdMateria,Promedio) VALUES
(1,1,8),(2,3,7),(3,4,6),(2,2,4),(1,4,6),(1,3,5),
(2,1,9),(3,1,10),(4,1,3),(4,2,5),(4,3,7),(3,2,8.3);

SELECT * FROM Notas;

/*Tablas unidas*/
SELECT a.Nombre as Alumno, n.Promedio as Nota, m.Nombre as Materia
FROM Notas AS n
INNER JOIN Alumno AS a
ON a.IdAlumno = n.IdAlumno
INNER JOIN Materia AS m
ON m.IdMateria = n.IdMateria;