/*List all the actors who acted in at least one film in 2nd half of the 19th century 
and in at least one film in the 1st half of the 20th century*/

SELECT a.fname || ' ' || a.lname as Actor_name, b.name as Movie_name, b.year, 
CASE WHEN b.year BETWEEN 1900 AND 1950 THEN '20th Century'
	 WHEN b.year BETWEEN 1850 AND 1899 THEN '19th Century'
END as CENTURY
FROM actors as a INNER JOIN
(
SELECT mc.pid, mc.mid, m.id, m.name, m.year
FROM m_cast as mc INNER JOIN 
(SELECT * FROM movie
WHERE year BETWEEN 1850 AND 1950) as m ON mc.mid = m.id) as b

ON b.pid = a.id
ORDER BY year
			


