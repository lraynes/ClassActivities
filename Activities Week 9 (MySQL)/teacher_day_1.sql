CREATE DATABASE animals_db;

USE animals_db;

-- not null means this is a required field
CREATE TABLE people (
	name varchar(30) NOT NULL,
    has_pet BOOLEAN NOT NULL,
    pet_name varchar(30),
    pet_age integer(10)
);

-- Create the table peoples within animals_db
CREATE TABLE peoples (
	-- Create numeric collumn called id, automatically increments default value
    id INTEGER(11) AUTO_INCREMENT NOT NULL,
    name VARCHAR(30) NOT NULL,
    has_pet BOOLEAN NOT NULL,
    pet_name VARCHAR(30),
    pet_age INTEGER(10),
    -- Set the ID as this table's primary key (all data contained w/in it will be unique)
	PRIMARY KEY(id)
);

SELECT * FROM peoples;


-- drop database if it already exists
-- DROP DATABASE IF EXISTS favorite_db;

USE animals_db;
select * from peoples;

INSERT INTO peoples (name, has_pet, pet_name, pet_age) VALUES ("Laura", true, "Penny", 11);
INSERT INTO peoples (name, has_pet, pet_name, pet_age) VALUES ("Caren", true, "Buddy", 15);
INSERT INTO peoples (name, has_pet) VALUES ("Mark", false);

-- Now Mark has 1 pet
UPDATE peoples 
SET has_pet = 1 
WHERE id = 3;

-- BOOKS LESSON

DROP DATABASE IF EXISTS books_db;
CREATE DATABASE books_db;
USE books_db;

CREATE TABLE books(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  authorId INTEGER(11),
  title VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE authors(
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  firstName VARCHAR(100),
  lastName VARCHAR(100),
  PRIMARY KEY (id)
);

INSERT INTO authors (firstName, lastName) values ('Jane', 'Austen');
INSERT INTO authors (firstName, lastName) values ('Mark', 'Twain');
INSERT INTO authors (firstName, lastName) values ('Lewis', 'Carroll');
INSERT INTO authors (firstName, lastName) values ('Andre', 'Asselin');

INSERT INTO books (title, authorId) values ('Pride and Prejudice', 1);
INSERT INTO books (title, authorId) values ('Emma', 1);
INSERT INTO books (title, authorId) values ('The Adventures of Tom Sawyer', 2);
INSERT INTO books (title, authorId) values ('Adventures of Huckleberry Finn', 2);
INSERT INTO books (title, authorId) values ('Alice''s Adventures in Wonderland', 3);
INSERT INTO books (title, authorId) values ('Dracula', null);

SELECT * FROM authors;
SELECT * FROM books;

-- show ALL books with authors
-- INNER JOIN will only return all matching values from both tables
SELECT title, firstName, lastName
FROM books
INNER JOIN authors ON books.authorId = authors.id;

-- show ALL books, even if we don't know the author
-- LEFT JOIN returns all of the values from the left table, and the matching ones from the right table
SELECT title, firstName, lastName
FROM books
LEFT JOIN authors ON books.authorId = authors.id;

-- show ALL books, even if we don't know the author
-- RIGHT JOIN returns all of the values from the right table, and the matching ones from the left table
SELECT title, firstName, lastName
FROM books
RIGHT JOIN authors ON books.authorId = authors.id;
