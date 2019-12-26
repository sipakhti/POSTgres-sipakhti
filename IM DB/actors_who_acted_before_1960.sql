--Find all actors who acted only in films before 1960. 

SELECT a.fname || ' ' || a.lname as actor_name, m.year
FROM m_cast as mc INNER JOIN
(SELECT * FROM movie WHERE year <= 1960) as m
ON m.id = mc.mid
INNER JOIN actors as a
ON a.id = mc.pid
ORDER BY m.year desc