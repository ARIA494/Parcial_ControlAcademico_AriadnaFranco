CREATE DATABASE control_academico;

USE control_academico;

-- =========================
-- TABLA ALUMNO
-- =========================
CREATE TABLE Alumno (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    carnet VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(100) NOT NULL,
    activo BOOLEAN NOT NULL
);

-- =========================
-- TABLA CURSO
-- =========================
CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    creditos INT NOT NULL
);

-- =========================
-- TABLA INSCRIPCION
-- =========================
CREATE TABLE Inscripcion (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- =========================
-- INSERTAR ALUMNOS
-- =========================
INSERT INTO Alumno (nombre, apellido, carnet, correo, activo) VALUES
('Ana', 'Lopez', 'A001', 'ana@correo.com', TRUE),
('Carlos', 'Martinez', 'A002', 'carlos@correo.com', TRUE),
('Lucia', 'Hernandez', 'A003', 'lucia@correo.com', FALSE);

-- =========================
-- INSERTAR CURSOS
-- =========================
INSERT INTO Curso (nombre, codigo, creditos) VALUES
('Base de Datos', 'BD101', 4),
('Programacion Web', 'PW102', 5),
('Redes', 'RD103', 3);

-- =========================
-- INSERTAR INSCRIPCIONES
-- =========================
INSERT INTO Inscripcion (id_alumno, id_curso, fecha_inscripcion) VALUES
(1, 1, '2026-03-01'),
(1, 2, '2026-03-02'),
(2, 1, '2026-03-03'),
(3, 3, '2026-03-04');


-- =========================
-- CONSULTA 1
-- Mostrar todos los alumnos activos
-- =========================
SELECT *
FROM Alumno
WHERE activo = TRUE;

-- =========================
-- CONSULTA 2
-- Mostrar los cursos con más de 3 créditos
-- =========================
SELECT *
FROM Curso
WHERE creditos > 3;

-- =========================
-- CONSULTA 3
-- Mostrar alumnos inscritos con nombre del curso
-- =========================
SELECT 
    Alumno.nombre,
    Alumno.apellido,
    Curso.nombre AS nombre_curso
FROM Inscripcion
JOIN Alumno ON Inscripcion.id_alumno = Alumno.id_alumno
JOIN Curso ON Inscripcion.id_curso = Curso.id_curso;

-- =========================
-- CONSULTA 4
-- Cantidad de alumnos inscritos por curso
-- =========================
SELECT 
    Curso.nombre,
    COUNT(Inscripcion.id_alumno) AS cantidad_alumnos
FROM Curso
JOIN Inscripcion ON Curso.id_curso = Inscripcion.id_curso
GROUP BY Curso.nombre;
