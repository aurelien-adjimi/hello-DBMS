/*1.*/
SELECT * FROM nobel WHERE yr = 1986;

/*2.*/
SELECT * FROM nobel WHERE subject = 'Literature' AND yr = 1967;

/*3.*/
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';

/*4.*/
SELECT * FROM nobel WHERE yr BETWEEN 1980 AND 1989;

/*5.*/
SELECT * FROM nobel WHERE subject = 'Mathematics';
SELECT COUNT(*) FROM nobel WHERE subject = 'Mathematics';