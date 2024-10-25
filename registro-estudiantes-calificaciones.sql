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
