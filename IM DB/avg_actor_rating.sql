 SELECT (a.fname::text || ' '::text) || a.lname::text AS actor_name,
    count(mc.pid) AS count_films,
    avg(m.rank) AS round,
    a.id
   FROM actors a
     JOIN m_cast mc ON a.id = mc.pid
     JOIN movie m ON m.id = mc.mid
  GROUP BY ((a.fname::text || ' '::text) || a.lname::text), a.id