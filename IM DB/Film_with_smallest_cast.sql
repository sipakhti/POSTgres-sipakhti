--Find the film(s) with the smallest cast.

SELECT  m.name as movie_name,  count(mc.pid) as cast_strength
FROM m_cast as mc INNER JOIN movie as m
ON mc.mid = m.id
GROUP BY mc.mid, m.name
ORDER BY cast_strength asc
LIMIT 1