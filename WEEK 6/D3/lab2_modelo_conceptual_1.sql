CREATE DATABASE IF NOT EXISTS lab2_modelo_conceptual;
USE lab2_modelo_conceptual;

DROP DATABASE IF EXISTS lab2_modelo_conceptual;

CREATE DATABASE lab2_modelo_conceptual;

use lab2_modelo_conceptual;


-- Tabla Aulas
CREATE TABLE Aulas (
    Nombre CHAR(1) PRIMARY KEY
);

-- Tabla Alumnos
CREATE TABLE Alumnos (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Nacionalidad VARCHAR(50),
    Aula CHAR(1),
    FOREIGN KEY (Aula) REFERENCES Aulas(Nombre)
);

-- Tabla Asignaturas
CREATE TABLE Asignaturas (
    Nombre VARCHAR(100) PRIMARY KEY
);

-- Tabla Profesores
CREATE TABLE Profesores (
    DNI VARCHAR(9) PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100)
);

-- Tabla de relación para Alumno-Profesor
CREATE TABLE Alumno_Profesor (
    Alumno_DNI VARCHAR(9),
    Profesor_DNI VARCHAR(9),
    PRIMARY KEY (Alumno_DNI, Profesor_DNI),
    FOREIGN KEY (Alumno_DNI) REFERENCES Alumnos(DNI),
    FOREIGN KEY (Profesor_DNI) REFERENCES Profesores(DNI)
);

-- Tabla de relación para Alumno-Asignatura
CREATE TABLE Alumno_Asignatura (
    Alumno_DNI VARCHAR(9),
    Asignatura_Nombre VARCHAR(100),
    PRIMARY KEY (Alumno_DNI, Asignatura_Nombre),
    FOREIGN KEY (Alumno_DNI) REFERENCES Alumnos(DNI),
    FOREIGN KEY (Asignatura_Nombre) REFERENCES Asignaturas(Nombre)
);



-- Hemos diiseñado la BBDD de un colegio.


/*  
 
Entidades y Atributos:

Aula: Tiene el atributo Nombre.
Alumno: Tiene los atributos DNI, Nombre, Apellido, Nacionalidad.
Asignatura:  Tiene el atributo Nombre.
Profesor: Tiene los atributos DNI, Nombre, Apellido.

Relaciones:

Entre Aula y Alumno, representa la asignación de aulas a alumnos.
Entre Alumno y Profesor , representa la relación entre alumnos y profesores.
Entre Alumno y Asignatura , representa las asignaturas que cursan los alumnos.

 
 
Cardinalidades:

Aula - Alumno : Uno a Uno (1:1) --> Cada aula está asignada a un alumno y cada alumno está asignado a una aula
Alumno - Profesor : Muchos a Muchos (N:M) --> Un alumno puede tener varios profesores y un profesor puede tener varios alumnos --> de la tabla Alumno_Profesor
Alumno - Asignatura : Muchos a Muchos (N:M) --> Un alumno puede cursar varias asignaturas y una asignatura puede tener varios alumnos inscritos --> de la tabla Alumno_Asignatura

*/