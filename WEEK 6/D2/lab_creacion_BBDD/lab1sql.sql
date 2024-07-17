CREATE DATABASE IF NOT EXISTS lab1;
use lab1;

DROP DATABASE IF EXISTS lab1;
CREATE DATABASE lab1;
USE lab1;

-- Ejercicio 1: Normalización de la Base de Datos de Películas

-- Crear tabla Directores
CREATE TABLE Directores (
    id_director INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);


-- Crear tabla Generos
CREATE TABLE Generos (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla Actores
CREATE TABLE Actores (
    id_actor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla Paises
CREATE TABLE Paises (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);


-- Crear tabla Peliculas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    id_director INT,
    año_estreno INT NOT NULL,
    id_genero INT,
    id_pais INT,
    FOREIGN KEY (id_director) REFERENCES Directores(id_director),
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero),
    FOREIGN KEY (id_pais) REFERENCES Paises(id_pais)
);

-- Crear tabla Peliculas_Actores para la relación muchos a muchos entre Peliculas y Actores
CREATE TABLE Peliculas_Actores (
    id_pelicula INT,
    id_actor INT,
    tipo_actor VARCHAR(255), -- principal o secundario
    PRIMARY KEY (id_pelicula, id_actor, tipo_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);

-- Insertar datos en la tabla Directores
INSERT INTO Directores (nombre) VALUES
('Frank Darabont'),
('Francis Ford Coppola'),
('Christopher Nolan'),
('Robert Zemeckis'),
('Quentin Tarantino'),
('James Cameron'),
('The Wachowskis'),
('Ridley Scott');

-- Insertar datos en la tabla Generos
INSERT INTO Generos (nombre) VALUES
('Drama'),
('Crime'),
('Action'),
('Sci-Fi'),
('Romance');

-- Insertar datos en la tabla Actores
INSERT INTO Actores (nombre) VALUES
('Tim Robbins'),
('Morgan Freeman'),
('Marlon Brando'),
('Al Pacino'),
('Christian Bale'),
('Heath Ledger'),
('Tom Hanks'),
('Robin Wright'),
('John Travolta'),
('Samuel L. Jackson'),
('Leonardo DiCaprio'),
('Joseph Gordon-Levitt'),
('Kate Winslet'),
('Keanu Reeves'),
('Laurence Fishburne'),
('Sam Worthington'),
('Zoe Saldana'),
('Russell Crowe'),
('Joaquin Phoenix');

-- Insertar datos en la tabla Paises
INSERT INTO Paises (nombre) VALUES
('USA');

-- Insertar datos en la tabla Peliculas
INSERT INTO Peliculas (titulo, id_director, año_estreno, id_genero, id_pais) VALUES
('The Shawshank Redemption', 1, 1994, 1, 1),
('The Godfather', 2, 1972, 2, 1),
('The Dark Knight', 3, 2008, 3, 1),
('Forrest Gump', 4, 1994, 1, 1),
('Pulp Fiction', 5, 1994, 2, 1),
('Inception', 3, 2010, 4, 1),
('Titanic', 6, 1997, 5, 1),
('The Matrix', 7, 1999, 4, 1),
('Avatar', 6, 2009, 4, 1),
('Gladiator', 8, 2000, 3, 1);

-- Insertar datos en la tabla Peliculas_Actores
INSERT INTO Peliculas_Actores (id_pelicula, id_actor, tipo_actor) VALUES
(1, 1, 'Principal'),
(1, 2, 'Secundario'),
(2, 3, 'Principal'),
(2, 4, 'Secundario'),
(3, 5, 'Principal'),
(3, 6, 'Secundario'),
(4, 7, 'Principal'),
(4, 8, 'Secundario'),
(5, 9, 'Principal'),
(5, 10, 'Secundario'),
(6, 11, 'Principal'),
(6, 12, 'Secundario'),
(7, 11, 'Principal'),
(7, 13, 'Secundario'),
(8, 14, 'Principal'),
(8, 15, 'Secundario'),
(9, 16, 'Principal'),
(9, 17, 'Secundario'),
(10, 18, 'Principal'),
(10, 19, 'Secundario');



-- Ejercicio 2: Normalización de la Base de Datos de Coches

-- Crear tabla Propietarios
CREATE TABLE Propietarios (
    id_propietario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL
);

-- Crear tabla Talleres
CREATE TABLE Talleres (
    id_taller INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Crear tabla Coches
CREATE TABLE Coches (
    id_coche INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    año INT NOT NULL,
    id_propietario INT,
    id_taller INT,
    FOREIGN KEY (id_propietario) REFERENCES Propietarios(id_propietario),
    FOREIGN KEY (id_taller) REFERENCES Talleres(id_taller)
);

-- Insertar datos en la tabla Propietarios
INSERT INTO Propietarios (nombre, direccion, telefono) VALUES
('Juan Pérez', 'Calle Principal 123', '123-456-7890'),
('María López', 'Avenida Libertad 456', '987-654-3210'),
('Pedro García', 'Calle Sur 789', '456-789-0123'),
('Ana Martínez', 'Calle Este 567', '321-654-0987'),
('Luisa Torres', 'Avenida Central 789', '789-012-3456'),
('Carlos Ruiz', 'Calle Norte 345', '210-987-6543'),
('Sofía Rodríguez', 'Avenida Oeste 890', '543-210-9876'),
('Javier Gómez', 'Calle Este 789', '012-345-6789'),
('Laura Sánchez', 'Avenida Libertad 678', '876-543-2109'),
('Diego Martín', 'Calle Principal 567', '234-567-8901');

-- Insertar datos en la tabla Talleres
INSERT INTO Talleres (nombre, direccion) VALUES
('Taller Juan', 'Avenida Central 456'),
('Taller Martínez', 'Calle Independencia 789'),
('Taller Rodríguez', 'Avenida Norte 123'),
('Taller Sánchez', 'Avenida Oeste 567'),
('Taller Gómez', 'Calle Principal 234'),
('Taller López', 'Avenida Sur 890'),
('Taller Martín', 'Calle Este 678'),
('Taller Pérez', 'Avenida Norte 345'),
('Taller Hernández', 'Calle Sur 456'),
('Taller Ruiz', 'Avenida Central 678');

-- Insertar datos en la tabla Coches
INSERT INTO Coches (marca, modelo, año, id_propietario, id_taller) VALUES
('Toyota', 'Corolla', 2018, 1, 1),
('Honda', 'Civic', 2017, 2, 2),
('Ford', 'Mustang', 2020, 3, 3),
('Chevrolet', 'Camaro', 2019, 4, 4),
('Nissan', 'Altima', 2016, 5, 5),
('BMW', 'X5', 2021, 6, 6),
('Mercedes-Benz', 'C-Class', 2019, 7, 7),
('Audi', 'A4', 2018, 8, 8),
('Hyundai', 'Elantra', 2017, 9, 9),
('Kia', 'Optima', 2019, 10, 10);



-- Ejercicio 3 Solución: Normalización de la Base de Datos de Equipos de Fútbol

-- Creación de la tabla Equipos
CREATE TABLE Equipos (
    id_equipo INT PRIMARY KEY,
    nombre_equipo VARCHAR(255),
    estadio VARCHAR(255),
    entrenador VARCHAR(255),
    ciudad VARCHAR(255)
);

-- Creación de la tabla Jugadores
CREATE TABLE Jugadores (
    id_jugador INT PRIMARY KEY,
    nombre_jugador VARCHAR(255),
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- Creación de la tabla Estadios (opcional, solo si es necesario almacenar más detalles sobre los estadios)
CREATE TABLE Estadios (
    id_estadio INT PRIMARY KEY,
    nombre_estadio VARCHAR(255),
    capacidad INT,
    ubicacion VARCHAR(255),
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- Insertar datos en la tabla Equipos
INSERT INTO Equipos (id_equipo, nombre_equipo, estadio, entrenador, ciudad) VALUES
(1, 'Real Madrid', 'Santiago Bernabéu', 'Carlo Ancelotti', 'Madrid'),
(2, 'FC Barcelona', 'Camp Nou', 'Ronald Koeman', 'Barcelona');

-- Insertar datos en la tabla Jugadores
INSERT INTO Jugadores (id_jugador, nombre_jugador, id_equipo) VALUES
(1, 'Karim Benzema', 1),
(2, 'Luka Modric', 1),
(3, 'Sergio Ramos', 1),
(4, 'Lionel Messi', 2),
(5, 'Gerard Piqué', 2),
(6, 'Sergio Busquets', 2);


-- Ejercicio 4 Solución: Normalización de la Base de Datos de Canciones

-- Creación de la tabla Artistas
CREATE TABLE Artistas (
    id_artista INT PRIMARY KEY,
    nombre_artista VARCHAR(255),
    nacionalidad VARCHAR(255),
    fecha_nacimiento DATE
);

-- Creación de la tabla Álbumes
CREATE TABLE Albumes (
    id_album INT PRIMARY KEY,
    titulo_album VARCHAR(255),
    año_lanzamiento INT,
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);

-- Creación de la tabla Compositores
CREATE TABLE Compositores (
    id_compositor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_compositor VARCHAR(255),
    nacionalidad VARCHAR(255),
    fecha_nacimiento DATE
);

-- Creación de la tabla Canciones
CREATE TABLE Canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo_cancion VARCHAR(255),
    duracion TIME,
    id_album INT,
    id_compositor INT,
    FOREIGN KEY (id_album) REFERENCES Albumes(id_album),
    FOREIGN KEY (id_compositor) REFERENCES Compositores(id_compositor)
);








