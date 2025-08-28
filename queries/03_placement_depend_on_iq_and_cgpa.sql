-- Select records for each college with hiqh iq >= 120 and cgpa >= avg 
-- split by placement 

WITH avg_cgpa_plac AS (   -- avg_cgpa_plac subquery caculates average cgpa for placed and not placed students 
	SELECT DISTINCT college_id,
		AVG (cgpa) FILTER (WHERE placement = 'Yes') AS avg_cgpa_placed,
		AVG (cgpa) FILTER (WHERE placement = 'No') AS avg_cgpa_not_placed
	FROM college_placement
	GROUP BY college_id
) 

SELECT cp.college_id, cp.iq, cp.cgpa, cp.placement
FROM college_placement cp
JOIN avg_cgpa_plac a USING (college_id)
WHERE cp.iq >= 120
  AND (
        (cp.placement = 'Yes' AND cp.cgpa >= a.avg_cgpa_placed)
     OR (cp.placement = 'No'  AND cp.cgpa >= a.avg_cgpa_not_placed)
      )
ORDER BY cp.college_id, cp.placement, cp.cgpa;