--List all directors in descending order of the number of films they directed

SELECT d.fname || ' ' || d.lname as director_name, count(md.did) as "No. of Films"
FROM movie_director as md INNER JOIN directors as d
ON md.did = d.id
GROup BY director_name
ORDER BY "No. of Films" desc
