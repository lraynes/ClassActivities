CREATE DATABASE favorite_db;

USE favorite_db;

CREATE TABLE favorite_foods (
	food varchar(50) NOT NULL,
    score INTEGER(10)
);

CREATE TABLE favorite_songs (
	song varchar(100) NOT NULL,
    artist varchar(50),
    score INTEGER(10)
);

CREATE TABLE favorite_movies (
	film varchar(100) NOT NULL,
    five_times BOOLEAN default false,
    score INTEGER(10)
);

SELECT * FROM favorite_movies;

INSERT INTO favorite_foods (food, score) 
VALUES ("Pasta", 9), ("Burgers", 8), ("Sushi", 10);


INSERT INTO favorite_songs (song, artist, score) 
VALUES ("Dreams", "Fleetwood Mac", 10);
INSERT INTO favorite_songs (song, artist, score) 
VALUES ("Across the Universe", "The Beatles", 8);

INSERT INTO favorite_movies (film, five_times, score) 
VALUES ("V for Vendetta", true, 9), ("Harry Potter", true, 10), ("The Avengers", false, 6);

DELETE FROM favorite_movies
WHERE film = "The Avengers";

UPDATE favorite_movies
SET five_times = true, score = 10 WHERE film = "V for Vendetta";

SELECT * FROM favorite_movies;


CREATE DATABASE programming_db;

USE programming_db;

CREATE TABLE programming_languages (
	id INTEGER(11) AUTO_INCREMENT NOT NULL,
    primary key(id),
    languages varchar(30),
    rating integer(10)
);

INSERT INTO programming_languages (languages, rating)
VALUES ("python", 10), ("javascript", 8), ("C++", 4);

UPDATE programming_languages
SET rating = 6
WHERE id = 3;

SELECT * FROM programming_languages