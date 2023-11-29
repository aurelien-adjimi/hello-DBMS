/*1.*/
SELECT population FROM world WHERE name = 'Germany';

/*2.*/
SELECT name, population FROM world WHERE name = 'Sweden';
SELECT name, population FROM world WHERE name = 'Norway';
SELECT name, population FROM world WHERE name = 'Denmark';

/*3.*/
SELECT * FROM world WHERE population > 300 000 AND population < 200 000;
SELECT * FROM world WHERE population BETWEEN 200000 AND 300000;
