CREATE TABLE baseball (id int AUTO_INCREMENT PRIMARY KEY,
pitch_type varchar(5), game_date DATE, release_speed float, player_name varchar(30), 
batter varchar(20), pitcher varchar(20), events varchar(50), outs_when_up int, inning int, hit_distance_sc int, 
pitch_number int, pitch_name varchar(20)
);
--prevent duplicate entries
ALTER TABLE baseball
ADD CONSTRAINT uc_baseball UNIQUE (pitch_type, game_date, release_speed, player_name, batter, pitcher, events, outs_when_up, inning, hit_distance_sc, pitch_number, pitch_name);
-- Get the ratio of fast pitches from total pitches in large data set.
SELECT
	fastpitch,
	pitches,
	(fastpitch / pitches)* 1.0 ratio
FROM
	(
	SELECT
		COUNT(*) fastpitch
	FROM
		baseball
	WHERE
		release_speed > 92
) a,
	(
	SELECT
		COUNT(id) pitches
	FROM
		baseball
) b;

fastpitch|pitches|ratio  |
---------+-------+-------+
     3120|   7287|0.42816|
-- Get all the pitchers and the pitch_type where the AVG speed of the pitch is
-- greater than 86
SELECT
	player_name,
	release_speed,
	pitch_type
FROM
	baseball
GROUP BY
	pitcher,
	pitch_type
HAVING
	AVG(release_speed) > 86
ORDER BY
	player_name;
-- select avg number of outs when the outcome is a strikeout
SELECT
	AVG(outs_when_up) AS numouts
FROM
	(
	SELECT
		*
	FROM
		baseball
	WHERE
		events = 'strikeout'
) a;