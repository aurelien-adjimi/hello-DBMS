/*2.*/
create database CarbonFootprint;

use carbonfootprint;
create table country
(
Country VARCHAR(25),
Coal DECIMAL(4,1),
Gas DECIMAL(4,1),
Oil DECIMAL(4,1),
Hydro DECIMAL(4,1),
Renewable DECIMAL(4,1),
Nuclear DECIMAL(4,1)
)

create table world
(
Region VARCHAR(25),
Coal DECIMAL(4,1),
Gas DECIMAL(4,1),
Oil DECIMAL(4,1),
Hydro DECIMAL(4,1),
Renewable DECIMAL(4,1),
Nuclear DECIMAL(4,1)
)

/*3.*/
/*Classement des régions du monde qui émettent le plus de carbone*/
select region, coal 
from world 
where region <> 'World' 
order by coal desc;

/*Moyenne d'émission des régions du monde*/
select AVG(coal) as Emission_carbone_moyenne_par_régions
from world
where region <> 'World';

/*Région qui émet le plus de carbone*/
select region, coal
from world
where coal = (select MAX(coal) from world);

/*Région qui émet le moins de carbone*/
select region, coal 
from world 
where coal = (select MIN(coal) from world);

/*Somme des émissions de carbone des régions du monde*/
select SUM(coal) as Emission_totale
from world
where region <> 'World';

/*Classement des pays du monde qui émettent le plus de carbone*/
select country, coal 
from country 
order by coal desc;

/*Moyenne d'émission des pays du monde*/
select AVG(coal) as Emission_carbone_moyenne_par_pays
from country

/*Pays qui émet le plus de carbone*/
select country, coal
from country
where coal = (select MAX(coal) from country);

/*Pays qui émet le moins de carbone*/
select country, coal 
from country 
where coal = (select MIN(coal) from country);

/*Somme des émissions de carbone des pays du monde*/
select SUM(coal) as Emission_totale
from country

/*Je peux observer que les données sont cohérentes.
 * Par exemple, les pays qui émettent le moins de carbone sont bien dans la région qui émet le moins de carbone.
 * C'est aussi vérifiable pour ceux qui émettent le plus de carbone.
 * Je peux donc dire que ces données sont propres et utilisables. 
 * */
select * from world

update world set region = "Sub-Saharan Africa" where coal = 51.4
