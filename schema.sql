DROP TABLE tmdb_cast;
DROP TABLE tmdb_crew;
DROP TABLE tmdb_genre;
DROP TABLE tmdb_production_companies;
DROP TABLE tmdb_production_countries;
DROP TABLE tmdb_spoken_languages;
DROP TABLE tmdb_movies;


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
