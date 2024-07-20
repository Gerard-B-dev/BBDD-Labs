CREATE DATABASE IF NOT EXISTS peliculas_db;
use peliculas_db;

DROP DATABASE IF EXISTS peliculas_db;

CREATE DATABASE peliculas_db;
use peliculas_db;

-- Creamos la tabla Peliculas
CREATE TABLE Peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio INT NOT NULL,
    director VARCHAR(255) NOT NULL,
    actor_principal VARCHAR(255) NOT NULL,
    actor_secundario VARCHAR(255),
    genero VARCHAR(100)
);

-- Insertamos datos en la tabla Peliculas
INSERT INTO Peliculas (titulo, anio, director, actor_principal, actor_secundario, genero) VALUES
('Avatar', 2009, 'James Cameron', 'Sam Worthington', 'Zoe Saldana', 'Sci-Fi'),
('Titanic', 1997, 'James Cameron', 'Leonardo DiCaprio', 'Kate Winslet', 'Romance'),
('The Avengers', 2012, 'Joss Whedon', 'Robert Downey Jr.', 'Chris Evans', 'Action'),
('Jurassic World', 2015, 'Colin Trevorrow', 'Chris Pratt', 'Bryce Dallas Howard', 'Adventure'),
('The Lion King', 2019, 'Jon Favreau', 'Donald Glover', 'Beyoncé', 'Animation'),
('Furious 7', 2015, 'James Wan', 'Vin Diesel', 'Paul Walker', 'Action'),
('Frozen II', 2019, 'Chris Buck', 'Idina Menzel', 'Kristen Bell', 'Animation'),
('Avengers: Age of Ultron', 2015, 'Joss Whedon', 'Robert Downey Jr.', 'Chris Hemsworth', 'Action'),
('Black Panther', 2018, 'Ryan Coogler', 'Chadwick Boseman', 'Michael B. Jordan', 'Action'),
('Harry Potter and the Deathly Hallows: Part 2', 2011, 'David Yates', 'Daniel Radcliffe', 'Emma Watson', 'Fantasy'),
('Star Wars: The Last Jedi', 2017, 'Rian Johnson', 'Mark Hamill', 'Carrie Fisher', 'Sci-Fi'),
('Jurassic World: Fallen Kingdom', 2018, 'J.A. Bayona', 'Chris Pratt', 'Bryce Dallas Howard', 'Adventure'),
('Frozen', 2013, 'Chris Buck', 'Idina Menzel', 'Kristen Bell', 'Animation'),
('Beauty and the Beast', 2017, 'Bill Condon', 'Emma Watson', 'Dan Stevens', 'Fantasy'),
('Incredibles 2', 2018, 'Brad Bird', 'Craig T. Nelson', 'Holly Hunter', 'Animation'),
('The Fate of the Furious', 2017, 'F. Gary Gray', 'Vin Diesel', 'Dwayne Johnson', 'Action'),
('Iron Man 3', 2013, 'Shane Black', 'Robert Downey Jr.', 'Gwyneth Paltrow', 'Action'),
('Minions', 2015, 'Kyle Balda', 'Sandra Bullock', 'Jon Hamm', 'Animation'),
('Captain America: Civil War', 2016, 'Anthony Russo', 'Chris Evans', 'Robert Downey Jr.', 'Action'),
('Aquaman', 2018, 'James Wan', 'Jason Momoa', 'Amber Heard', 'Action'),
('The Lord of the Rings: The Return of the King', 2003, 'Peter Jackson', 'Elijah Wood', 'Ian McKellen', 'Fantasy'),
('Spider-Man: Far From Home', 2019, 'Jon Watts', 'Tom Holland', 'Jake Gyllenhaal', 'Action'),
('Captain Marvel', 2019, 'Anna Boden', 'Brie Larson', 'Samuel L. Jackson', 'Action'),
('Transformers: Dark of the Moon', 2011, 'Michael Bay', 'Shia LaBeouf', 'Rosie Huntington-Whiteley', 'Action'),
('Skyfall', 2012, 'Sam Mendes', 'Daniel Craig', 'Javier Bardem', 'Action'),
('Transformers: Age of Extinction', 2014, 'Michael Bay', 'Mark Wahlberg', 'Nicola Peltz', 'Action'),
('The Dark Knight Rises', 2012, 'Christopher Nolan', 'Christian Bale', 'Tom Hardy', 'Action'),
('Star Wars: The Rise of Skywalker', 2019, 'J.J. Abrams', 'Daisy Ridley', 'Adam Driver', 'Sci-Fi'),
('Joker', 2019, 'Todd Phillips', 'Joaquin Phoenix', 'Robert De Niro', 'Drama'),
('Toy Story 4', 2019, 'Josh Cooley', 'Tom Hanks', 'Tim Allen', 'Animation'),
('Toy Story 3', 2010, 'Lee Unkrich', 'Tom Hanks', 'Tim Allen', 'Animation'),
('Pirates of the Caribbean: Dead Man\'s Chest', 2006, 'Gore Verbinski', 'Johnny Depp', 'Orlando Bloom', 'Adventure'),
('The Lion King', 1994, 'Roger Allers', 'Matthew Broderick', 'Jeremy Irons', 'Animation'),
('Rogue One: A Star Wars Story', 2016, 'Gareth Edwards', 'Felicity Jones', 'Diego Luna', 'Sci-Fi'),
('Aladdin', 2019, 'Guy Ritchie', 'Will Smith', 'Mena Massoud', 'Fantasy'),
('Pirates of the Caribbean: On Stranger Tides', 2011, 'Rob Marshall', 'Johnny Depp', 'Penélope Cruz', 'Adventure'),
('Despicable Me 3', 2017, 'Kyle Balda', 'Steve Carell', 'Kristen Wiig', 'Animation'),
('Finding Dory', 2016, 'Andrew Stanton', 'Ellen DeGeneres', 'Albert Brooks', 'Animation'),
('Star Wars: The Force Awakens', 2015, 'J.J. Abrams', 'Daisy Ridley', 'John Boyega', 'Sci-Fi'),
('Avengers: Infinity War', 2018, 'Anthony Russo', 'Robert Downey Jr.', 'Chris Hemsworth', 'Action'),
('The Lion King', 2019, 'Jon Favreau', 'Donald Glover', 'Beyoncé', 'Animation'),
('The Avengers', 2012, 'Joss Whedon', 'Robert Downey Jr.', 'Chris Evans', 'Action'),
('Jurassic World', 2015, 'Colin Trevorrow', 'Chris Pratt', 'Bryce Dallas Howard', 'Adventure'),
('Furious 7', 2015, 'James Wan', 'Vin Diesel', 'Paul Walker', 'Action'),
('Frozen II', 2019, 'Chris Buck', 'Idina Menzel', 'Kristen Bell', 'Animation'),
('Avengers: Age of Ultron', 2015, 'Joss Whedon', 'Robert Downey Jr.', 'Chris Hemsworth', 'Action'),
('Black Panther', 2018, 'Ryan Coogler', 'Chadwick Boseman', 'Michael B. Jordan', 'Action'),
('Harry Potter and the Deathly Hallows: Part 2', 2011, 'David Yates', 'Daniel Radcliffe', 'Emma Watson', 'Fantasy');

-- 1. Consulta que devuelve todas las películas
SELECT * FROM Peliculas;

-- 2. Consulta que devuelve las películas de Christopher Nolan
SELECT * FROM Peliculas WHERE director = 'Christopher Nolan';

-- 3. Ordena las películas por año de lanzamiento
SELECT * FROM Peliculas ORDER BY anio DESC;

-- 4. Selecciona todas las películas de un género específico
SELECT * FROM Peliculas WHERE genero = 'Drama';

-- 5. Consulta que devuelve las películas entre los años 1990 y 2000
SELECT * FROM Peliculas WHERE anio BETWEEN 1990 AND 2000;

-- Contar el número de películas por género
SELECT genero, COUNT(*) as num_peliculas FROM Peliculas GROUP BY genero;


