CREATE TABLE world
(
name VARCHAR(25),
continent VARCHAR(25),
area INT(11),
population INT(11),
gdp INT(15)
)

CREATE TABLE students
(
student_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(25),
last_name VARCHAR(25),
age INT(11),
grade VARCHAR(25)
)

CREATE TABLE nobel
(
yr INT(11),
subject VARCHAR(25),
winner VARCHAR(255)
)

CREATE TABLE game
(
id INTEGER PRIMARY KEY,
mdate DATE,
stadium VARCHAR(255),
team1 VARCHAR(25),
team2 VARCHAR(25)
)

CREATE TABLE goal
(
matchid INTEGER(11),
teamid VARCHAR(25),
player VARCHAR(25),
gtime INT(11)
)

CREATE TABLE eteam
(
id VARCHAR(25),
teamname VARCHAR(25),
coach VARCHAR(25)
)