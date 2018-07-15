use sakila;

select * from actor;

select address, city
from address a
join city c
on (a.city_id = c.city_id);

select address, city
from address join city
using (city_id);

select count(film_id)
from film;

-- Creates an alias, variable
select count(film_id) as 'Total Films'
from film;

-- creates a groupby, buckets
select rating, count(film_id) as 'Total Films'
from film
group by rating;

select avg(rental_duration) as 'Average Rental Period'
from film;

select rental_duration, ROUND(avg(rental_rate),2) 'average rental period'
from film 
group by rental_duration;

select rental_duration, ROUND(avg(rental_rate),2) 'average rental period'
from film 
group by rental_duration
having rental_duration < 7;

-- -------------------------------

select title, film_id
from film
where title = 'Early Home';

select * from inventory where film_id = 268;

select i.inventory_id, i.film_id, i.store_id
from inventory i
join film f
on (i.film_id = f.film_id)
where f.title = 'Early Home';

-- subquery
select * from inventory
where film_id in (
	select film_id  -- this code here returns 268
    from film
    where title = 'Early Home'
);

-- create view
create view total_sales as
select s.store_id, sum(amount) as gross
from payment p
join rental r
on (p.rental_id = r.rental_id)
join inventory i
on (i.inventory_id = r.inventory_id)
join store s
on (s.store_id = i.store_id)
group by s.store_id;

select * from total_sales;

-- delete a view
drop view total_sales;




CREATE TABLE animals_all (
id INTEGER(11) AUTO_INCREMENT NOT NULL,
animal_species VARCHAR(30) NOT NULL,
owner_name VARCHAR(30) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO animals_all (animal_species, owner_name)
VALUES ("Dog", "Bob");

INSERT INTO animals_all (animal_species, owner_name)
VALUES ("Fish", "Bob");

INSERT INTO animals_all (animal_species, owner_name)
VALUES ("Cat", "Kelly");

INSERT INTO animals_all (animal_species, owner_name)
VALUES ("Dolphin", "Aquaman");

SELECT * FROM animals_all;


CREATE TABLE animals_location (
id INTEGER(11) AUTO_INCREMENT NOT NULL,
location VARCHAR(30) NOT NULL,
animal_id INTEGER(10) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (animal_id) REFERENCES animals_all(id)
);

INSERT INTO animals_location (location, animal_id)
VALUES ("Doghouse", 1);

INSERT INTO animals_location (location, animal_id)
VALUES ("Fish tank", 2);

INSERT INTO animals_location (location, animal_id)
VALUES ("Bed", 3);

INSERT INTO animals_location (location, animal_id)
VALUES ("Ocean", 4);

SELECT * FROM animals_location;

-- below errors out because the animal_id column is a foreign key that is pegged to the id column in the animals_all table. 
-- So why, exactly, can't we insert the row above? It's because id 5 doesn't exist in the animals_all table!
INSERT INTO animals_location (location, animal_id)
VALUES ("River", 5);

-- this works
INSERT INTO animals_location (location, animal_id)
VALUES ("River", 4);