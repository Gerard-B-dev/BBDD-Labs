CREATE DATABASE IF NOT EXISTS peliculas_complejo;
use peliculas_complejo;

DROP DATABASE IF EXISTS peliculas_complejo;
CREATE DATABASE peliculas_complejo;

use peliculas_complejo;

-- Creamos la tabla Directores
CREATE TABLE Directores (
    id_director INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Creamos la tabla Peliculas
CREATE TABLE Peliculas (
    id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    anio INT NOT NULL,
    id_director INT NOT NULL,
    genero VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_director) REFERENCES Directores(id_director)
);

-- Creams la tabla de actores
CREATE TABLE Actores (
    id_actor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Creamos la tabla de relación entre películas y actores
CREATE TABLE PeliculasActores (
    id_pelicula INT NOT NULL,
    id_actor INT NOT NULL,
    rol VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_pelicula, id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);

-- Insertamos datos en la tabla Directores
INSERT INTO Directores (nombre) VALUES
('James Cameron'),    
('James Cameron'),  
('Joss Whedon'),       
('Colin Trevorrow'),    
('Jon Favreau'),     
('James Wan'),          
('Chris Buck'),       
('Joss Whedon'),       
('Ryan Coogler'),       
('David Yates'),       
('Rian Johnson'),      
('J.A. Bayona'),        
('Chris Buck'),     
('Bill Condon'),        
('Brad Bird'),      
('F. Gary Gray'),     
('Shane Black'),       
('Pierre Coffin'),    
('Anthony Russo'), 
('James Wan'),      
('Peter Jackson'),   
('Jon Watts'),        
('Anna Boden'),    
('Michael Bay'),     
('Sam Mendes'),       
('Michael Bay'),     
('Christopher Nolan'),
('J.J. Abrams'),    
('Todd Phillips'),   
('Josh Cooley'),     
('Lee Unkrich'),    
('Gore Verbinski'),  
('Roger Allers'),     
('Gareth Edwards'),   
('Guy Ritchie'),        
('Rob Marshall'),       
('Pierre Coffin'),     
('Andrew Stanton'),    
('J.J. Abrams'),       
('Anthony Russo'); 


-- Ahora inserta los datos en la tabla Peliculas
INSERT INTO Peliculas (titulo, anio, id_director, genero) VALUES
('Avatar', 2009, 1, 'Sci-Fi'),
('Titanic', 1997, 2, 'Romance'),
('The Avengers', 2012, 3, 'Action'),
('Jurassic World', 2015, 4, 'Adventure'),
('The Lion King', 2019, 5, 'Animation'),
('Furious 7', 2015, 6, 'Action'),
('Frozen II', 2019, 7, 'Animation'),
('Avengers: Age of Ultron', 2015, 8, 'Action'),
('Black Panther', 2018, 9, 'Action'),
('Harry Potter and the Deathly Hallows: Part 2', 2011, 10, 'Fantasy'),
('Star Wars: The Last Jedi', 2017, 11, 'Sci-Fi'),
('Jurassic World: Fallen Kingdom', 2018, 12, 'Adventure'),
('Frozen', 2013, 13, 'Animation'),
('Beauty and the Beast', 2017, 14, 'Fantasy'),
('Incredibles 2', 2018, 15, 'Animation'),
('The Fate of the Furious', 2017, 16, 'Action'),
('Iron Man 3', 2013, 17, 'Action'),
('Minions', 2015, 18, 'Animation'),
('Captain America: Civil War', 2016, 19, 'Action'),
('Aquaman', 2018, 20, 'Action'),
('The Lord of the Rings: The Return of the King', 2003, 21, 'Fantasy'),
('Spider-Man: Far From Home', 2019, 22, 'Action'),
('Captain Marvel', 2019, 23, 'Action'),
('Transformers: Dark of the Moon', 2011, 24, 'Action'),
('Skyfall', 2012, 25, 'Action'),
('Transformers: Age of Extinction', 2014, 26, 'Action'),
('The Dark Knight Rises', 2012, 27, 'Action'),
('Star Wars: The Rise of Skywalker', 2019, 28, 'Sci-Fi'),
('Joker', 2019, 29, 'Drama'),
('Toy Story 4', 2019, 30, 'Animation'),
('Toy Story 3', 2010, 31, 'Animation'),
('Pirates of the Caribbean: Dead Man\'s Chest', 2006, 32, 'Adventure'),
('The Lion King', 1994, 33, 'Animation'),
('Rogue One: A Star Wars Story', 2016, 34, 'Sci-Fi'),
('Aladdin', 2019, 35, 'Fantasy'),
('Pirates of the Caribbean: On Stranger Tides', 2011, 36, 'Adventure'),
('Despicable Me 3', 2017, 37, 'Animation'),
('Finding Dory', 2016, 38, 'Animation'),
('Star Wars: The Force Awakens', 2015, 39, 'Sci-Fi'),
('Avengers: Infinity War', 2018, 40, 'Action');


-- Insertar datos en la tabla de actores
INSERT INTO Actores (nombre) values
('Sam Worthington'),
('Leonardo DiCaprio'),
('Robert Downey Jr.'),
('Chris Pratt'),
('Donald Glover'),
('Vin Diesel'),
('Idina Menzel'),
('Chadwick Boseman'),
('Daniel Radcliffe'),
('Mark Hamill'),
('Idina Menzel'),
('Emma Watson'),
('Craig T. Nelson'),
('Vin Diesel'),
('Sandra Bullock'),
('Chris Evans'),
('Jason Momoa'),
('Elijah Wood'),
('Tom Holland'),
('Brie Larson'),
('Shia LaBeouf'),
('Daniel Craig'),
('Mark Wahlberg'),
('Christian Bale'),
('Daisy Ridley'),
('Joaquin Phoenix'),
('Tom Hanks'),
('Johnny Depp'),
('Matthew Broderick'),
('Felicity Jones'),
('Will Smith'),
('Steve Carell'),
('Ellen DeGeneres'),
('Daisy Ridley'),
('Donald Glover'),
('Chris Pratt'),
('Idina Menzel'),
('Chadwick Boseman'),
('Daniel Radcliffe');


-- Insertar datos en la tabla de relación entre películas y actores
INSERT INTO PeliculasActores (id_pelicula, id_actor, rol) VALUES
(1, 1, 'Principal'),  -- Avatar
(2, 2, 'Principal'),  -- Titanic
(3, 3, 'Principal'),  -- The Avengers
(4, 4, 'Principal'),  -- Jurassic World
(5, 5, 'Principal'),  -- The Lion King (2019)
(6, 6, 'Principal'),  -- Furious 7
(7, 7, 'Principal'),  -- Frozen II
(9, 8, 'Principal'),  -- Black Panther
(10, 9, 'Principal'), -- Harry Potter and the Deathly Hallows: Part 2
(11, 10, 'Principal'),-- Star Wars: The Last Jedi
(12, 4, 'Secundario'),-- Jurassic World: Fallen Kingdom
(13, 7, 'Principal'), -- Frozen
(14, 11, 'Principal'),-- Beauty and the Beast
(15, 12, 'Principal'),-- Incredibles 2
(16, 6, 'Principal'), -- The Fate of the Furious
(17, 3, 'Principal'), -- Iron Man 3
(18, 13, 'Principal'),-- Minions
(19, 14, 'Principal'),-- Captain America: Civil War
(20, 15, 'Principal'),-- Aquaman
(21, 16, 'Principal'),-- The Lord of the Rings: The Return of the King
(22, 17, 'Principal'),-- Spider-Man: Far From Home
(23, 18, 'Principal'),-- Captain Marvel
(24, 19, 'Principal'),-- Transformers: Dark of the Moon
(25, 20, 'Principal'),-- Skyfall
(26, 19, 'Principal'),-- Transformers: Age of Extinction
(27, 21, 'Principal'),-- The Dark Knight Rises
(28, 10, 'Principal'),-- Star Wars: The Rise of Skywalker
(29, 22, 'Principal'),-- Joker
(30, 23, 'Principal'),-- Toy Story 4
(31, 23, 'Principal'),-- Toy Story 3
(32, 24, 'Principal'),-- Pirates of the Caribbean: Dead Man's Chest
(33, 25, 'Principal'),-- The Lion King (1994)
(34, 26, 'Principal'),-- Rogue One: A Star Wars Story
(35, 27, 'Principal'),-- Aladdin
(36, 24, 'Principal'),-- Pirates of the Caribbean: On Stranger Tides
(37, 13, 'Principal'),-- Despicable Me 3
(38, 28, 'Principal'),-- Finding Dory
(39, 10, 'Principal'),-- Star Wars: The Force Awakens
(40, 14, 'Principal'),
(1, 2, 'Secundario'),  -- Titanic
(3, 14, 'Secundario'), -- Captain America: Civil War
(4, 6, 'Secundario'),  -- Furious 7
(6, 3, 'Secundario'),  -- Iron Man 3
(8, 8, 'Secundario'),  -- Black Panther
(11, 18, 'Secundario'),-- Captain Marvel
(13, 26, 'Secundario'),-- Rogue One: A Star Wars Story
(15, 11, 'Secundario');-- Beauty and the Beast-- Avengers: Infinity War


-- Realizar consultas y funciones:
-- Realiza consultas y funciones que afecten a varias tablas a la vez.

-- Una consulta que devuelva todas las películas:
SELECT * FROM Peliculas;

-- Una consulta que devuelva las películas entre el 1980 y 2000:
SELECT * FROM Peliculas 
WHERE anio BETWEEN 1980 AND 2000;

-- Una consulta que devuelva la cantidad de películas de un género bajo el nombre de "num_peliculas":
SELECT genero, COUNT(*) AS num_peliculas 
FROM Peliculas 
GROUP BY genero;

-- Una consulta que devuelva todas las películas con sus actores principales y secundarios (deberían ser 3 tablas distintas)
SELECT P.titulo, P.anio, A.nombre AS actor, PA.rol 
FROM Peliculas P
JOIN PeliculasActores PA ON P.id_pelicula = PA.id_pelicula
JOIN Actores A ON PA.id_actor = A.id_actor;

-- Una consulta que seleccione todas las películas que tengan un actor específico (Por ejemplo: Tom Hanks)
SELECT P.titulo, P.anio, A.nombre AS actor 
FROM Peliculas P
JOIN PeliculasActores PA ON P.id_pelicula = PA.id_pelicula
JOIN Actores A ON PA.id_actor = A.id_actor
WHERE A.nombre = 'Tom Hanks';

-- Inserta datos en varias tablas a la vez usando START TRANSACTION y COMMIT. Recuerda usar también SET @variable
START TRANSACTION;
INSERT INTO Directores (nombre) VALUES ('New Director');
SET @id_director = LAST_INSERT_ID();
INSERT INTO Peliculas (titulo, anio, id_director, genero) VALUES ('New Movie', 2024, @id_director, 'Drama');
SET @id_pelicula = LAST_INSERT_ID();
INSERT INTO Actores (nombre) VALUES ('New Actor');
SET @id_actor = LAST_INSERT_ID();
INSERT INTO PeliculasActores (id_pelicula, id_actor, rol) VALUES (@id_pelicula, @id_actor, 'Principal');
COMMIT;

