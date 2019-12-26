--actors who worked with at least 10 distinct directors

SELECT  a.fname || ' ' || a.lname as actor, count(a.fname || ' ' || a.lname) as num_of_directors
FROM actors as a INNER JOIN  m_cast as mc
ON a.id = mc.pid
INNER JOIN movie_director as md
ON md.mid = mc.mid
INNER JOIN directors as d
ON d.id = md.did
GROUP BY actor
HAVING count(a.fname || ' ' || a.lname)  >= 10
ORDER BY num_of_directors 
