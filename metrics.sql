CREATE TABLE baseball (id int AUTO_INCREMENT PRIMARY KEY,
pitch_type varchar(5), game_date DATE, release_speed float, player_name varchar(30), 
batter varchar(20), pitcher varchar(20), events varchar(50), outs_when_up int, inning int, hit_distance_sc int, 
pitch_number int, pitch_name varchar(20)
);
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