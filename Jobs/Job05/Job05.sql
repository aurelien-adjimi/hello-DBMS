/*1.*/
SELECT * FROM world WHERE population > (SELECT population FROM world WHERE name = 'Russia');

/*2.*/
SELECT * FROM world WHERE continent = 'Europe' AND gdp > (SELECT gdp FROM world WHERE name = 'Italy');

/*3.*/
SELECT * FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'United-Kingdom')
AND population < (SELECT population FROM world WHERE name = 'Germany');

/*4.*/
SELECT
    name,
    (population * 100 / (SELECT population FROM world WHERE name = 'Germany')) AS pourcentage
FROM
    world
WHERE
    continent = 'Europe';
   
/*5.*/
/*Méthode avec RANK & PARTITION BY*/
WITH ranked_countries AS (
    SELECT
        name,
        continent,
        area,
        RANK() OVER (PARTITION BY continent ORDER BY area DESC) AS country_rank
    FROM
        world
)
SELECT
    name,
    continent,
    area
FROM
    ranked_countries
WHERE
    country_rank = 1;

/*Méthode avec MAX & GROUP BY*/   
SELECT
    continent,
    name,
    MAX(area) AS largest_country_area
FROM
    world
GROUP BY
    continent;

/*6.*/
SELECT
    continent
FROM
    world
GROUP BY
    continent
HAVING
    MAX(population) <= 25000000;

