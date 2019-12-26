SELECT * FROM movie
WHERE year = (SELECT year FROM movie WHERE name = 'Shrek (2001)')
AND rank > (SELECT rank FROM movie WHERE name = 'Shrek (2001)')
ORDER BY rank desc
