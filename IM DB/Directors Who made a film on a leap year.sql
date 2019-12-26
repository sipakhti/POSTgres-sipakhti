SELECT DISTINCT directors.fname || ' ' || directors.lname as "Director Name" FROM directors INNER JOIN movie_director 
ON directors.id = movie_director.did INNER JOIN movie 
ON movie.id = movie_director.mid
WHERE (movie.year) % 4 = 0
