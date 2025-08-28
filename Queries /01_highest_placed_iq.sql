-- Select colleges with the highest placed iq (ties included)

SELECT college_id, iq, placement 
FROM (
	SELECT college_id, iq, placement,
		RANK() OVER (PARTITION BY college_id ORDER BY iq DESC) as rnk
	FROM college_placement
	WHERE placement = 'Yes'
		AND iq IS NOT NULL) t  -- subquery t ranks iq for placed students in descending order for each college 
WHERE t.rnk = 1
ORDER BY college_id;