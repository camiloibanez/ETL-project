CREATE TABLE netflix (
	title VARCHAR(250),
	duration VARCHAR(250),
	mpaa_rating VARCHAR(250),
	listed_in VARCHAR(250),
	release_year INT,
	media_type VARCHAR(250)
);

CREATE TABLE netflix_cast (
	id SERIAL PRIMARY KEY,
	title VARCHAR(250),
	duration VARCHAR(250),
	mpaa_rating VARCHAR(250),
	listed_in VARCHAR(250),
	release_year INT,
	media_type VARCHAR(250),
	director VARCHAR(250),
	netflix_cast VARCHAR(250),
	country VARCHAR(250),
	date_added VARCHAR(250)
);

CREATE TABLE movies (
	id SERIAL PRIMARY KEY,
	title VARCHAR(250),
	duration VARCHAR(250),
	mpaa_rating VARCHAR(250),
	genre VARCHAR(250),
	release_date DATE,
	user_rating INT,
	rating_count INT,
	budget BIGINT,
	gross BIGINT
);