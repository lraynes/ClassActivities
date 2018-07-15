use sakila;

select * from film;

select avg(rental_rate) as 'Average Rental Rate'
from film;

select rating, avg(rental_rate) as 'Average Rental Rate'
from film
group by rating;

select sum(replacement_cost) as 'Total Replacement Cost'
from film;

select rating, sum(replacement_cost) as 'Replacement Cost by Rating'
from film
group by rating;

select min(length) from film;

select max(length) from film;

select * from payment;

select customer_id, sum(amount) from payment
group by customer_id
having customer_id < 5;


select * from city;

select city_id
from city
where city in ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilm');


select city_id, district
from address
where city_id in(
	select city_id
	from city
	where city in ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilm')
);

-- % represents zero one or multiple characters
-- underscore represents single character
-- in this case the first letter starts with Q
select first_name, last_name
from customer cus
where address_id in(
	select address_id
    from address a
    where city_id in(
		select city_id
        from city
        where city like 'Q%'
	)
);



select * from film;
select * from inventory;

create view test_view as
select title, (
	select count(*) -- returns number of rows
	from inventory
	where film.film_id = inventory.film_id)
    as 'Number of Copies'
from film;

select * from test_view;

select * from actor;

select first_name, last_name
from actor
where actor_id in (
	select actor_id
    from film_actor
    where film_id in (
		select film_id
        from film
        where title = "alter victory"
	)
);
	


select title, (
	select first_name, last_name
    from actor
    where actor.actor_id = film_actor.actor_id
)
from film;

select title
from film
where film_id in
(
	select film_id
    from rental
    where staff_id in
    (
		select staff_id
        from staff where last_name = "Stephens"
	)
    and rental_date like '%05-31%'
)
and title like 'C%';




-- Let's create a new database
CREATE DATABASE customer_data;

USE customer_data;

-- Let's make a new table
CREATE TABLE customer (
    id INTEGER(11) AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

-- And then populate that table
INSERT INTO customer (first_name, last_name, email, phone)
VALUES
("Bob", "Smith", "bobsmith@email.com", "435-344-2245"),
("Jane", "Davidson", "jdavids@email.com", "332-776-4678"),
("Jimmy", "Bell", "jimmyb@email.com", "221-634-7753"),
("Stephanie", "Duke", "sd@email.com", "445-663-5799");

-- View our table
SELECT * FROM customer;

/*
TO DO:
  1. Create a new table to hold customers' emails with a foreign key that references the customer table
  2. Populate the email table with data from the customer table
  3. Create a new table to hold customers' phones with a foreign key that references the customer table
  4. Populate the phone table with data from the customer table
*/

create table customer_email(
	id integer(11) auto_increment not null,
    email varchar(30) not null,
    customer_id integer(10) not null,
    primary key(id),
    foreign key (customer_id) references customer(id)
);

insert into customer_email (email, customer_id)
select email, id
from customer;

select * from customer_email;

create table customer_phone(
	id integer(11) auto_increment not null,
    phone varchar(30) not null,
    customer_id integer(10) not null,
    primary key(id),
    foreign key (customer_id) references customer(id)
);

insert into customer_phone (phone, customer_id)
select phone, id
from customer;

select * from customer_phone;


use sakila;

select actor_id as id, first_name
from actor where actor_id between 1 and 5
union
select customer_id as id, first_name
from customer
where customer_id between 6 and 10;