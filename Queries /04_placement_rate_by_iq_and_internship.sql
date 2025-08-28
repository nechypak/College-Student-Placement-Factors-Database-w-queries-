-- Placement rate by IQ group and internship experience

WITH iq_groups AS (
	SELECT college_id, placement, internship_experience,
		CASE WHEN iq >= 120 THEN 'High IQ (>=120)'
		WHEN iq >= 100 THEN 'Average IQ(100-119)'
		ELSE 'Below 100 IQ'
		END AS iq_sep
	FROM college_placement
)

SELECT iq_sep, internship_experience, 
	COUNT(*) FILTER (WHERE placement = 'Yes')::numeric
		/ COUNT(*) AS placement_rate,
	COUNT(*) AS total_students,
	COUNT(*) FILTER (WHERE placement = 'Yes') AS placed_students
	FROM iq_groups
	GROUP BY iq_sep, internship_experience
	ORDER BY iq_sep, internship_experience; 