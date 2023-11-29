/*1.*/
SELECT SUM(population) FROM world

/*2.*/
SELECT
    continent,
    SUM(population) AS total_population
FROM
    world
GROUP BY
    continent;

/*3.*/
SELECT
	continent,
	SUM(gdp) AS pib_total
FROM
	world
GROUP BY
	continent;

/*4.*/
SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

/*5.*/
SELECT COUNT(name) FROM world WHERE population >= 1000000

/*6.*/
SELECT
    SUM(population) AS total_population
FROM
    world
WHERE
    name IN ('Estonia', 'Latvia', 'Lithuania');
   
 
/*7.*/
SELECT continent, COUNT(name) AS number_of_countries FROM world GROUP BY continent 

/*8.*/
SELECT
    continent,
    SUM(population) AS total_population
FROM
    world
GROUP BY
    continent
HAVING
    SUM(population) > 100000000;
