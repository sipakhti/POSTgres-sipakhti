 SELECT (d.fname::text || ' '::text) || d.lname::text AS dir_name,
    avg(m.rank) AS round,
    d.id
   FROM directors d
     JOIN movie_director md ON d.id = md.did::numeric
     JOIN movie m ON md.mid = m.id
  WHERE m.rank IS NOT NULL
  GROUP BY ((d.fname::text || ' '::text) || d.lname::text), d.id