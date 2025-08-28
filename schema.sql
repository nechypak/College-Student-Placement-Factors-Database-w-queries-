-- Creating table inside my database called college_placement
-- it has colums like: college_id, iq, prev_sem_result, cgpa, academic_perfomance, internship_experience, 
-- extra_curricular_score, communication_skills, projects_completed, placement. 

CREATE TABLE college_placement (
    college_id               TEXT,
    iq                       SMALLINT,
    prev_sem_result          NUMERIC(4,2),
    cgpa                     NUMERIC(4,2),
    academic_performance     SMALLINT,
    internship_experience    TEXT,      
    extra_curricular_score   SMALLINT,
    communication_skills     SMALLINT,
    projects_completed       SMALLINT,
    placement                TEXT       
);

SELECT * FROM college_placement; -- run just created headers