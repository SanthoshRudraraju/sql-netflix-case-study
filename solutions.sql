drop table if exists  netflix;
CREATE TABLE NETFLIX (
	SHOW_ID VARCHAR(6),
	TYPE VARCHAR(10),
	TITLE VARCHAR(150),
	DIRECTOR VARCHAR(250),
	CASTS VARCHAR(1000),
	COUNTRY VARCHAR(150),
	DATE_ADDED VARCHAR(50),
	RELEASE_YEAR INT,
	RATING VARCHAR(10),
	DURATION VARCHAR(15),
	LISTED_IN VARCHAR(100),
	DESCRIPTION VARCHAR(250)
);
--1. Count the number of Movies vs TV Shows
SELECT
	TYPE,
	COUNT(*) AS COUNT_BY_CATEGORY
FROM
	NETFLIX
GROUP BY
	TYPE;

--2. Find the most common rating for movies and TV shows
SELECT
	*
FROM
	(
		SELECT
			TYPE,
			RATING,
			COUNT(*),
			RANK() OVER (
				PARTITION BY
					TYPE
				ORDER BY
					COUNT(*) DESC
			) AS R
		FROM
			NETFLIX
		GROUP BY
			TYPE,
			RATING
		ORDER BY
			TYPE,
			COUNT(*) DESC
	) AS SORTED
WHERE
	R = 1;

--3. List all movies released in a specific year (e.g., 2020)
SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND RELEASE_YEAR = 2004;

SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND RELEASE_YEAR = 2020;

--4. Find the top 5 countries with the most content on Netflix
SELECT
	UNNEST(STRING_TO_ARRAY(COUNTRY, ',')) AS COUNTRIES,
	COUNT(SHOW_ID) AS C
FROM
	NETFLIX
GROUP BY
	COUNTRIES
ORDER BY
	C DESC
LIMIT
	5;

--5. Identify the longest movie
WITH movie_durations AS (
    SELECT TITLE, DURATION,
           CAST(SPLIT_PART(DURATION, ' ', 1) AS INT) AS duration_mins
    FROM NETFLIX
    WHERE TYPE = 'Movie'
)
SELECT TITLE, DURATION
FROM movie_durations
WHERE duration_mins = (SELECT MAX(duration_mins) FROM movie_durations);

--6. Find content added in the last 5 years
SELECT
	*
FROM
	NETFLIX
WHERE
	TO_DATE(DATE_ADDED, 'month DD,YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT
	TITLE,
	TYPE
FROM
	NETFLIX
WHERE
	DIRECTOR ilike '%Rajiv Chilaka%';

--8. List all TV shows with more than 5 seasons
SELECT *
FROM NETFLIX
WHERE TYPE = 'TV Show'
  AND CAST(SPLIT_PART(DURATION, ' ', 1) AS INT) > 5;

--9. Count the number of content items in each genre

select unnest(string_to_array(listed_in,',')) as genre, count(*) from netflix group by genre;

--10.Find each year and the average numbers of content release in India on netflix. return top 5 year with highest avg content release!
select country,release_year , count(show_id)
FROM netflix where country='India' group by 1,2 order by 3 desc limit 5;

--11. List all movies that are documentaries

select title,type from netflix where type='Movie' and listed_in ilike '%Documentaries%'  ;

--12. Find all content without a director

select * from netflix where director is null;

--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT
	*
FROM
	NETFLIX
WHERE
	CASTS ILIKE '%Salman Khan%'
	AND RELEASE_YEAR > EXTRACT(
		YEAR
		FROM
			CURRENT_DATE
	) -10;

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select unnest(string_to_array(casts,',')) as actors, count(*) from netflix group by actors order by 2 desc limit 10;

--15.
--Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.
with new_table as (
select *, 
CASE
WHEN description ilike '%kill%' or description ilike '%violence%'
then 'Bad CONTENT'
ELSE 'good CONTENT'
END  category
from netflix
)
select category , count(*) from new_table GROUP by
1 ;