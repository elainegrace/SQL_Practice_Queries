/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls).
*/

SELECT
    job_id,
    job_title,
    name as company_name,
    salary_year_avg,
    job_via
FROM
    job_postings_fact
INNER JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL AND
    job_schedule_type = 'Full-time'
ORDER BY salary_year_avg DESC
LIMIT 10
