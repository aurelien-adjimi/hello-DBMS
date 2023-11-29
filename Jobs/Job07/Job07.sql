/* 1.
 * Entre la table goal et la table eteam il y a une relation One To Many
 * Entre la table eteam et la table game il y a une relation One To Many
 * Entre la table goal et la table game il y a une relation One To Many
 */

/*2.*/
SELECT matchid, player FROM goal WHERE teamid = 'GER';

/*3.*/
SELECT id, stadium, team1, team2 FROM game WHERE id = "1012";

/*4.*/
SELECT player,teamid, stadium, mdate FROM game JOIN goal ON game.id = goal.matchid WHERE teamid = 'GER';

/*5.*/
SELECT
    g.team1,
    g.team2,
    gl.player
FROM
    game g
JOIN
    goal gl ON g.id = gl.matchid
WHERE
    gl.player LIKE '%Mario%';
   
/*6.*/
SELECT * FROM goal JOIN eteam ON goal.teamid = eteam.id;


/*7.*/
SELECT 
	gl.player,
	gl.teamid,
	gl.gtime,
	t.coach
FROM 
	goal gl
JOIN
	eteam t ON gl.teamid = t.id
WHERE
	gl.gtime <= 10
	
	
/*8.*/
SELECT
    game.mdate,
    eteam.teamname
FROM
    game
JOIN
    eteam ON game.team1 = eteam.id
WHERE
    eteam.coach = 'Fernando Santos';


/*9.*/
SELECT 
	player 
FROM 
	goal 
JOIN 
	game ON (matchid = game.id) 
WHERE game.stadium = "National Stadium, Warsaw";

/*10.*/
SELECT
    teamid,
    COUNT(*) AS total_goals
FROM
    goal
GROUP BY
    teamid;
   
/*11.*/
SELECT
    game.stadium,
    COUNT(*) AS goals_scored
FROM
    game
JOIN
    goal ON game.id = goal.matchid
GROUP BY
    game.stadium;

/*12.*/
SELECT
    game.id AS match_id,
    game.mdate AS match_date,
    COUNT(*) AS goals_scored_by_FRA
FROM
    game
JOIN
    goal ON game.id = goal.matchid
WHERE
    goal.teamid = 'FRA'
GROUP BY
    game.id, game.mdate;


