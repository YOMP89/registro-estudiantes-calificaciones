CREATE DATABASE RegistroEstudiantes;
USE RegistroEstudiantes;

-- Tabla de Estudiantes
CREATE TABLE Estudiantes (
    estudiante_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(255)
);

-- Tabla de Asignaturas
CREATE TABLE Asignaturas (
    asignatura_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla de Calificaciones
CREATE TABLE Calificaciones (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    asignatura_id INT,
    calificacion DECIMAL(4, 2) CHECK (calificacion >= 0 AND calificacion <= 10),
    fecha_evaluacion DATE,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(estudiante_id),
    FOREIGN KEY (asignatura_id) REFERENCES Asignaturas(asignatura_id)
);

-- Insertando estudiantes
INSERT INTO Estudiantes (nombre, fecha_nacimiento, direccion) VALUES 
('Ana Pérez', '2008-04-15', 'Calle Falsa 123'),
('Luis Gómez', '2009-06-22', 'Av. Principal 456');

-- Insertando asignaturas
INSERT INTO Asignaturas (nombre, descripcion) VALUES 
('Matemáticas', 'Estudio de las operaciones aritméticas y álgebra'),
('Historia', 'Estudio de los hechos históricos importantes');

-- Insertando calificaciones
INSERT INTO Calificaciones (estudiante_id, asignatura_id, calificacion, fecha_evaluacion) VALUES 
(1, 1, 8.5, '2024-10-23'),
(1, 2, 9.0, '2024-10-23'),
(2, 1, 7.8, '2024-10-23'),
(2, 2, 8.2, '2024-10-23');

-- Listar todos los estudiantes
SELECT * FROM Estudiantes;

-- Consultar asignaturas disponibles
SELECT * FROM Asignaturas;

-- Consultar calificaciones de los estudiantes
SELECT C.calificacion_id, E.nombre AS Estudiante, A.nombre AS Asignatura, C.calificacion, C.fecha_evaluacion
FROM Calificaciones C
JOIN Estudiantes E ON C.estudiante_id = E.estudiante_id
JOIN Asignaturas A ON C.asignatura_id = A.asignatura_id;

-- Consultar promedio de calificaciones por estudiante
SELECT E.nombre AS Estudiante, AVG(C.calificacion) AS Promedio
FROM Calificaciones C
JOIN Estudiantes E ON C.estudiante_id = E.estudiante_id
GROUP BY E.nombre;

-- Buscar calificaciones por asignatura
SELECT E.nombre AS Estudiante, C.calificacion, A.nombre AS Asignatura
FROM Calificaciones C
JOIN Estudiantes E ON C.estudiante_id = E.estudiante_id
JOIN Asignaturas A ON C.asignatura_id = A.asignatura_id
WHERE A.nombre = 'Matemáticas';

