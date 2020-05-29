DROP TABLE tmdb_cast;
DROP TABLE tmdb_crew;
DROP TABLE tmdb_genre;
DROP TABLE tmdb_production_companies;
DROP TABLE tmdb_production_countries;
DROP TABLE tmdb_spoken_languages;
DROP TABLE tmdb_movies;

DROP TABLE FMLD_cast;
DROP TABLE FMLD_crew;
DROP TABLE FMLD_genre;
DROP TABLE FMLD_production_companies;
DROP TABLE FMLD_production_countries;
DROP TABLE FMLD_spoken_languages;
DROP TABLE FMLD_movies;


CREATE TABLE tmdb_movies (
	id DECIMAL PRIMARY KEY,
	budget DECIMAL,
	homepage VARCHAR(300),
	original_language VARCHAR(100),
	overview VARCHAR(5000),
	popularity DECIMAL,
	release_date DATE,
	revenue DECIMAL,
	runtime DECIMAL,
	tagline VARCHAR(1000),
	title VARCHAR(1000),
	vote_average DECIMAL,
	vote_count DECIMAL
);

CREATE TABLE tmdb_cast (
	id DECIMAL,
	character VARCHAR(1000),
	cast_name VARCHAR(1000),
	FOREIGN KEY (id) REFERENCES tmdb_movies(id)
);

CREATE TABLE tmdb_crew (
	id DECIMAL,
	department VARCHAR(100),
	job VARCHAR(100),
	crew_name VARCHAR(100),
	FOREIGN KEY (id) REFERENCES tmdb_movies(id)
);

CREATE TABLE tmdb_genre (
	id DECIMAL,
	genre VARCHAR(100),
	FOREIGN KEY (id) REFERENCES tmdb_movies(id)
);

CREATE TABLE tmdb_production_companies (
	id DECIMAL,
	production_company VARCHAR(100),
	FOREIGN KEY (id) REFERENCES tmdb_movies(id)
);

CREATE TABLE tmdb_production_countries (
	id DECIMAL,
	country VARCHAR(200),
	FOREIGN KEY (id) REFERENCES tmdb_movies(id)
);

CREATE TABLE tmdb_spoken_languages (
	id DECIMAL,
	spoken_languages VARCHAR(100),
	FOREIGN KEY (id) REFERENCES tmdb_movies(id)
);

CREATE TABLE FMLD_movies (
	id DECIMAL PRIMARY KEY,
	imdb_id VARCHAR(100),
	tmdbId INT,
	title VARCHAR(500),
	release_date DATE,
	revenue DECIMAL,
	budget DECIMAL,
	runtime DECIMAL,
	original_language VARCHAR(100),
	vote_average DECIMAL,
	vote_count DECIMAL,
	homepage VARCHAR(1000),
	tagline VARCHAR(1000)
);

CREATE TABLE FMLD_cast (
	id DECIMAL,
	character varchar,
	cast_name varchar,
	FOREIGN KEY (id) REFERENCES FMLD_movies(id)
);

CREATE TABLE FMLD_crew (
	id DECIMAL,
	department VARCHAR(100),
	job VARCHAR(100),
	crew_name VARCHAR(100),
	FOREIGN KEY (id) REFERENCES FMLD_movies(id)
);

CREATE TABLE FMLD_genre (
	id DECIMAL,
	genre VARCHAR(100),
	FOREIGN KEY (id) REFERENCES FMLD_movies(id)
);

CREATE TABLE FMLD_production_companies (
	id DECIMAL,
	production_company VARCHAR(1000),
	FOREIGN KEY (id) REFERENCES FMLD_movies(id)
);

CREATE TABLE FMLD_production_countries (
	id DECIMAL,
	country VARCHAR(200),
	FOREIGN KEY (id) REFERENCES FMLD_movies(id)
);

CREATE TABLE FMLD_spoken_languages (
	id DECIMAL,
	spoken_languages VARCHAR(100),
	FOREIGN KEY (id) REFERENCES FMLD_movies(id)
);

CREATE TABLE netflix (
	title VARCHAR(250),
	duration VARCHAR(250),
	mpaa_rating VARCHAR(250),
	listed_in VARCHAR(250),
	release_year INT,
	media_type VARCHAR(250)
);

CREATE TABLE netflix_cast (
	id INT PRIMARY KEY,
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

CREATE TABLE Netflix_movies (
	title VARCHAR(250),
	duration VARCHAR(250),
	mpaa_rating VARCHAR(250),
	genre VARCHAR(250),
	release_date DATE,
	user_rating DECIMAL,
	rating_count DECIMAL,
	budget DECIMAL,
	gross DECIMAL
);

SELECT 
tmdb_movies.id,
fmld_cast.cast_name,
fmld_movies.title,
fmld_movies.release_date,
fmld_movies.revenue,
fmld_movies.budget,
fmld_movies.runtime
FROM tmdb_movies
INNER JOIN fmld_movies
ON tmdb_movies.id = fmld_movies.id
INNER JOIN FMLD_cast
ON fmld_movies.id = fmld_cast.id
WHERE fmld_cast.cast_name = 'Jim Carrey'
LIMIT 20;

SELECT 
tmdb_movies.id,
fmld_crew.crew_name,
fmld_movies.title,
fmld_movies.release_date,
fmld_movies.revenue,
fmld_movies.budget,
fmld_movies.runtime
FROM tmdb_movies
INNER JOIN fmld_movies
ON tmdb_movies.id = fmld_movies.id
INNER JOIN FMLD_crew
ON fmld_movies.id = fmld_crew.id
WHERE fmld_crew.job = 'Director' AND fmld_crew.crew_name = 'John Lasseter'
LIMIT 20;


SELECT 
	netflix.title,
	netflix.duration,
	netflix.release_year,
	netflix_cast.mpaa_rating,
	netflix_cast.netflix_cast
FROM netflix
INNER JOIN netflix_cast
ON netflix.title = netflix_cast.title
WHERE netflix.title = 'District 9'
LIMIT 20;

SELECT
	fmld_movies.title,
	fmld_movies.release_date,
	netflix.mpaa_rating,
	fmld_movies.runtime
FROM fmld_movies
INNER JOIN netflix
ON fmld_movies.title = netflix.title
WHERE fmld_movies.release_date > '2015-01-01'
LIMIT 20;