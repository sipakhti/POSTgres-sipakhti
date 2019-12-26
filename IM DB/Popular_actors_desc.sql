SELECT actor_name , final_rating
FROM (SELECT aar.actor_name,
    (sum(aar.round) / (count(aar.actor_name) * 10) * 100 + sum(adr.round) / (count(adr.dir_name) * 10) * 100) / 200 * 100 AS sipakhti,
    a.pid,
    ar.count_films,
        CASE
            WHEN a.pid = a.pid THEN (ar.count_films + round((sum(aar.round) / (count(aar.actor_name) * 10) * 100 + sum(adr.round) / (count(adr.dir_name) * 10) * 100) / 200* 100)) / (ar.count_films + 100) * 100
            ELSE NULL
        END AS final_rating
	  
   FROM ( SELECT m_cast.pid,
            m_cast.mid,
            movie_director.did,
            movie_director.mid
           FROM m_cast
             JOIN movie_director 
		 ON m_cast.mid = movie_director.mid) a
     JOIN 
	  ( SELECT (d.fname || ' ') || d.lname AS dir_name,
    avg(m.rank) AS round,
    d.id
   FROM directors d
     JOIN movie_director md 
		   ON d.id = md.did
     JOIN movie m 
		   ON md.mid = m.id
  WHERE m.rank IS NOT NULL
  GROUP BY ((d.fname || ' ') || d.lname), d.id
  ORDER BY (round(avg(m.rank))) DESC) adr 
	  
	  ON adr.id = a.did
	  
     JOIN 
	  (SELECT (a.fname || ' ') || a.lname AS actor_name,
    avg(m.rank) AS round,
    a.id
   FROM actors a
     JOIN m_cast mc 
		   ON a.id = mc.pid
     JOIN movie m 
		   ON mc.mid = m.id
  WHERE m.rank IS NOT NULL
  GROUP BY ((a.fname || ' ') || a.lname), a.id) aar
	  
	  ON aar.id = a.pid
	  
     JOIN 
	  (SELECT (a.fname || ' ') || a.lname AS actor_name,
    count(mc.pid) AS count_films,
    avg(m.rank) AS round,
    a.id
   FROM actors a
     JOIN m_cast mc 
	   ON a.id = mc.pid
		   
     JOIN movie m 
	   ON m.id = mc.mid
  GROUP BY ((a.fname || ' ') || a.lname), a.id) ar 
	  
	  ON ar.id = a.pid
	  
  GROUP BY aar.actor_name, a.pid, ar.count_films) as a
ORDER BY final_rating desc, actor_name 