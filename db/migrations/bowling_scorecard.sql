CREATE table bowling_scorecard (
	turn SERIAL PRIMARY KEY,
	frame int,
	roll int,
	roll_score int,
	added_bonus int,
	frame_score int,
	total_score int,
	earned_bonus varchar
);