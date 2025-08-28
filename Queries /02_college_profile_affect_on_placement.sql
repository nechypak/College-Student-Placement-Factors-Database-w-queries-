-- Show, per college, how many students at/above average profile
-- split by placement

WITH college_profile AS (
	SELECT DISTINCT college_id,
		AVG(academic_performance) OVER (PARTITION BY college_id) AS avg_academicperformance,
		AVG(extra_curricular_score) OVER (PARTITION BY college_id) AS avg_extracurricular,
		AVG(communication_skills) OVER (PARTITION BY college_id) AS avg_communicationskills,
		AVG(projects_completed) OVER (PARTITION BY college_id) AS avg_projectscompleted
	FROM college_placement
)
SELECT
  cp.college_id,
  cp.placement,
  COUNT(*) AS students_at_or_above_avg
FROM college_placement cp
JOIN college_profile prof USING (college_id)
WHERE (cp.academic_performance + cp.extra_curricular_score +
       cp.communication_skills   + cp.projects_completed)
   >= (prof.avg_academicperformance + prof.avg_extracurricular +
       prof.avg_communicationskills + prof.avg_projectscompleted)
GROUP BY cp.college_id, cp.placement
ORDER BY cp.college_id, cp.placement;
	