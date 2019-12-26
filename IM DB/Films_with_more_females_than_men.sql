--Find the films with more women actors than men.

SELECT female.movie_name 
FROM
	(SELECT gender, m.name as movie_name, count(gender) as f_count
	FROM m_cast as mc INNER JOIN actors as a
	ON a.id = mc.pid
	INNER JOIN movie as m
	ON m.id = mc.mid
	GROUP BY gender,m.name
	HAVING gender = 'F'
	) as female
INNER JOIN 
	(SELECT gender, m.name as movie_name, count(gender) as m_count
	FROM m_cast as mc INNER JOIN actors as a
	ON a.id = mc.pid
	INNER JOIN movie as m
	ON m.id = mc.mid
	GROUP BY gender,m.name
	HAVING gender = 'M'
	) as male
	
ON female.movie_name = male.movie_name
WHERE f_count > m_count 






-- M = 513306
-- F = 304412