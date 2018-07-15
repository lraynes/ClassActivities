create database second_international_bank;

use second_international_bank;

CREATE TABLE Customers (
	id INTEGER(11) AUTO_INCREMENT NOT NULL,
    primary key(id),
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Loan BOOLEAN,
    Checking DECIMAL(18,2),
    Savings DECIMAL(19,2)
);

INSERT INTO Customers (FirstName, LastName, Loan, Checking, Savings) 
VALUES 
("Laura", "Raynes", true, "500.34", "6400.55"),
("Mark", "Dizon", true, "100.54", "8000.98"),
("Reza", "Ghassemi", false, "500.34", "200.78"),
("Julie", "Nguyen", false, "34.04", "10002.43"),
("Evan", "White", true, "34.59", "115.30");

SELECT * FROM Customers;

-- ---------------------------------------------
create database hideseek;
use hideseek;

ALTER TABLE wordassociation_ac
ADD primary key(id),
ADD id INTEGER(11) AUTO_INCREMENT NOT NULL;

-- find authors 0-20
select * from wordassociation_ac where author BETWEEN 0 AND 20;

-- find instances of "pie"
select * from wordassociation_ac where word1 = "pie" OR word2 = "pie";

-- Find lowest id whose source is cc
select MIN(id) from wordassociation_ac
WHERE source = "cc";

-- find how many rows have an author of 12
select count(author) from wordassociation_ac
WHERE author = 12;

-- ----------------------------------------------
DROP DATABASE IF EXISTS military;

create database military;
use military;

SELECT * FROM globalfirepower;

ALTER TABLE globalfirepower
ADD column id INT auto_increment primary key first;

-- turn safe updates on
set sql_safe_updates = 0;


Delete from globalfirepower
where ReservePersonnel = 0;

UPDATE globalfirepower
SET FighterAircraft = FighterAircraft + 1
WHERE FighterAircraft = 0;
-- ^ v bottom overwrites one where aircraft already equaled 1
UPDATE globalfirepower
SET TotalAircraftStrength = TotalAircraftStrength + 1
WHERE FighterAircraft = 1;

select 
avg(TotalMilitaryPersonnel),
avg(TotalAircraftStrength),
avg(TotalHelicopterStrength),
avg(TotalPopulation) 
from globalfirepower;

insert into globalfirepower (Country, TotalMilitaryPersonnel, TotalAircraftStrength, TotalHelicopterStrength, TotalPopulation)
values("Lauraland", 741101, 639.2778,256.6806, 85175106.333);

-- -------------------------------------------

create database nba;
use nba;

SELECT * FROM players;
SELECT * FROM seasons_stats;

select players.player, players.height, players.weight, players.college, seasons_stats.pos, seasons_stats.tm
from players
inner join seasons_stats on
players.player = seasons_stats.player;

select players.player, seasons_stats.year, seasons_stats.pos, `seasons_stats`.`2P%`, `seasons_stats`.`FG%`
from seasons_stats
inner join players on
players.player = seasons_stats.player;

-- ------------------

create database witchcraft;
use witchcraft;

