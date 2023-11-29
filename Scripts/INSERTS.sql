/**Insertion de pays dans la table world**/

INSERT INTO world(name, continent, area, population, gdp) VALUES ('Afghanistan', 'Asia', 652230, 25500100, 2034300000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Albania', 'Europe', 28748, 2831741, 12960000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Algeria', 'Africa', 2381741, 37100000, 188681000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Andorra', 'Europe', 468, 78115, 3712000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Angola', 'Africa', 1246700, 20609294, 100990000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('France', 'Europe', 551695, 68042591, 2642000000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Germany', 'Europe', 357592, 83290000, 4260000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Denmark', 'Europe', 42952, 5857000, 398300000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Norway', 'Europe', 385207, 5408000, 482200000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Sweden', 'Europe', 528447, 10420000, 635700000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Russia', 'Europe', 17125191, 143400000, 1779000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Italia', 'Europe', 302073, 59110000, 2108000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('United-Kingdom', 'Europe', 243610, 67330000, 3131000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Austria', 'Europe', 83871, 8956000, 480400000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Estonia', 'Europe', 45339, 1331000, 37190000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Latvia', 'Europe', 64589, 1884000, 39850000000);
INSERT INTO world(name, continent, area, population, gdp) VALUES ('Lithuania.', 'Europe', 65300, 2801000, 66450000000);

/**Insertion d'étudiants dans la table students**/
INSERT INTO students(first_name, last_name, age, grade) VALUES ('Alice', 'Johnson', 22, 'A+');
INSERT INTO students(first_name, last_name, age, grade) VALUES ('Bob', 'Smith', 20, 'B');
INSERT INTO students(first_name, last_name, age, grade) VALUES ('Chalie', 'Williams', 21, 'C');
INSERT INTO students(first_name, last_name, age, grade) VALUES ('David', 'Brown', 23, 'B+');
INSERT INTO students(first_name, last_name, age, grade) VALUES ('Eva', 'Davis', 19, 'A');
INSERT INTO students(first_name, last_name, age, grade) VALUES ('Franck', 'Jones', 22, 'C+');

/**Insertion de prix nobel dans la table nobel**/
INSERT INTO nobel(yr, subject, winner) VALUES (1960, 'Chemistry', 'Willard F. Libby');
INSERT INTO nobel(yr, subject, winner) VALUES (1960, 'Literature', 'Saint-John Perse');
INSERT INTO nobel(yr, subject, winner) VALUES (1960, 'Medicine', 'Sir Frank Macfarlane Burnet');
INSERT INTO nobel(yr, subject, winner) VALUES (1960, 'Medicine', 'Peter Madawar');
INSERT INTO nobel(yr, subject, winner) VALUES (1967, 'Physic', 'Hans Albrecht Bethe');
INSERT INTO nobel(yr, subject, winner) VALUES (1986, 'Chemistry', 'John Polanyi');
INSERT INTO nobel(yr, subject, winner) VALUES (1921, 'Physic', 'Albert Einstein');

/**Insertion de matchs dans la table game**/
INSERT INTO game (id, mdate, stadium, team1, team2) VALUES (1001, '2012-06-08', 'National Stadium, Warsaw', 'POL', 'GRE');
INSERT INTO game (id, mdate, stadium, team1, team2) VALUES (1002, '2012-06-08', 'Stadion Miejski (Wroclaw)', 'RUS', 'CZE');
INSERT INTO game (id, mdate, stadium, team1, team2) VALUES (1003, '2012-06-12', 'Stadion Miejski (Wroclaw)', 'GRE', 'CZE');
INSERT INTO game (id, mdate, stadium, team1, team2) VALUES (1004, '2012-06-12', 'National Stadium, Warsaw', 'POL', 'RUS');

/**Insertion de buts dans la table goal**/
INSERT INTO goal (matchid, teamid, player, gtime) VALUES (1001, 'POL', 'Robert Lewandowski', 17);
INSERT INTO goal (matchid, teamid, player, gtime) VALUES (1001, 'GRE', 'Dimitris Salpingidis', 51);
INSERT INTO goal (matchid, teamid, player, gtime) VALUES (1002, 'RUS', 'Alan Dzagoev', 15);
INSERT INTO goal (matchid, teamid, player, gtime) VALUES (1002, 'RUS', 'Roman Pavlyuchenko', 82);

/**Insertion d'équipes dans la table eteam**/
INSERT INTO eteam (id, teamname, coach) VALUES ('POL', 'Poland', 'Franciszek Smuda');
INSERT INTO eteam (id, teamname, coach) VALUES ('RUS', 'Russia', 'Dick Advocaat');
INSERT INTO eteam (id, teamname, coach) VALUES ('CZE', 'Czech Republic', 'Michal Bilek');
INSERT INTO eteam (id, teamname, coach) VALUES ('GRE', 'Greece', 'Fernando Santos');



