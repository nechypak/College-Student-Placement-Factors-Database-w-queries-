# College student placement factors Database DEMO 
### PostgreSQL

This repository contains a PostgreSQL database schema, sample data (.csv) and SQL queries to manipulate with the given sample data.
This is practice database to demonstrate proficiency in SQL with **joins, subqueries, window functions, conditional aggregation, and analytical queries**.

---

## Project Structure
<pre>
├── schema.sql
├── data/
│   └── college_student_placement_dataset.csv
└── queries/
    ├── 01_highest_placed_iq.sql
    ├── 02_college_profile_affect_on_placement.sql
    ├── 03_placement_depend_on_iq_and_cgpa.sql
    └── 04_placement_rate_by_iq_and_internship.sql
</pre>

---

## Schema.sql
The database consists of one main table: **`college_placement`**

| Column                  | Type      | Description                                       |
|--------------------------|-----------|---------------------------------------------------|
| `college_id`            | TEXT      | Unique college ID                                 |
| `iq`                    | SMALLINT  | Student IQ                                        |
| `prev_sem_result`       | NUMERIC   | Previous semester GPA                             |
| `cgpa`                  | NUMERIC   | Cumulative GPA                                    |
| `academic_performance`  | SMALLINT  | Annual rating                                     |
| `internship_experience` | TEXT      | Whether student had internship                    |
| `extra_curricular_score`| SMALLINT  | Extracurricular score                             |
| `communication_skills`  | SMALLINT  | Soft skills rating                                |
| `projects_completed`    | SMALLINT  | Number of projects completed                      |
| `placement`             | TEXT      | Final placement result                            |

---

## Queries

### 1. Highest IQ Among Placed Students: 
Finds the student(s)  with the highest IQ per college, considering only those who were placed. Ties are included via `RANK()`.

### 2. College Profile vs. Placement:
Evaluates whether a student’s overall profile (academic performance, extracurricular score, communication skills, projects) is above or below the college average* and counts how that correlates with placement.

### 3. Placement Depending on IQ and CGPA:
Selects records where students have **IQ ≥ 120** and a CGPA above their college’s average, split by placement outcome.

### 4. Placement Rate by IQ Band and Internship:
Groups students into IQ categories (High, Average, Below Average) and compares placement rates based on whether they had an internship.

> basic comments provided in .sql files


