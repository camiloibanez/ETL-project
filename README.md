# ETL Project

We collected data from Kaggle and Data.world on Netflix, TMDB and IMDB movie databases. This data was cleaned and put in a unified database that can be queried along certain parameters to find movies and Netflix shows that fit certain criteria.

## Getting Started

You will need to open pgAdmin4 and create a database. From there you can run schema.sql to load the table structure. After the tables are loaded you can upload the csvs in the data folder to their correspondingly named tables.

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

## Running Tests

The second half of schema.sql holds query examples for searching the database. From here you can query the database for films and shows that meet your criteria such as genre, cast, director, title, release date, etc.

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

## Authors

- Arthur Ibanez - [camiloibanez](https://github.com/camiloibanez)
- Peyton Harsh - [peytonsharsh](https://github.com/peytonsharsh)
- Osvaldo Meza - [omeza3547](https://github.com/omeza3547)

## Acknowledgements

- [Trilogy Education Services](https://www.trilogyed.com/)
