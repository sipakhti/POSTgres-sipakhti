--List first name and last name of all the actors who played in selected movie

SELECT fname || ' ' || lname as Actor_name
FROM actors
WHERE id IN (SELECT pid FROM m_cast 
WHERE mid =(SELECT id FROM movie
				WHERE name LIKE 'Matrix Reloaded%'))
				

