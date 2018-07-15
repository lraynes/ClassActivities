CREATE database miscellaneous_db;
use miscellaneous_db;

-- to import: schemas>database name> right click tables>table data import wizard>select your csv>next>finish
SELECT * FROM birdsong;

-- doesn't yet know what the primary key is
-- right click birdsong>alter table>check the boxes for primary key and not null>apply

-- one condition
select * from birdsong where genus = "Acanthis";

-- two conditions
select * from birdsong where genus = "Acanthis" and country = "Netherlands";

-- either condition
select * from birdsong where genus = "Acanthis" or genus = "Acrocephalus";

-- where condition is not met
select * from birdsong where not genus = "Acanthis";

-- -------------------------------------------------------------

create database comcast;
use comcast;
-- still have to import data, so big
select * from comcastfcccomplaints;

-- ------------------------------------

create database joinstuff;
use joinstuff;

select players.first_name, players.last_name, players.hand, matches.loser
from matches
INNER JOIN players ON 
players.player_id = matches.loser_id;