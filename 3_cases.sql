-- ==============================
-- Create monthly job tables
-- ==============================

-- January
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- April
CREATE TABLE april_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

-- May
CREATE TABLE may_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

-- June
CREATE TABLE june_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

-- July
CREATE TABLE july_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

-- August
CREATE TABLE august_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

-- September
CREATE TABLE september_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

-- October
CREATE TABLE october_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

-- November
CREATE TABLE november_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

-- December
CREATE TABLE december_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 12;

SELECT *
FROM march_jobs


SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS average_yearly_salary,
    AVG(salary_hour_avg) AS average_hourly_salary

FROM job_postings_fact

WHERE 
    job_posted_date::DATE > '2023-06-01'
--    EXTRACT(YEAR FROM job_posted_date) >= 2023
--    AND EXTRACT(MONTH FROM job_posted_date) > 6

GROUP BY job_schedule_type

ORDER BY job_schedule_type

SELECT *
FROM job_postings_fact

SELECT
    job_schedule_type,
    AVG(salary_hour_avg),
    AVG(salary_year_avg)
FROM job_postings_fact
WHERE job_posted_date::DATE > '2023-06-01'
GROUP BY job_schedule_type
ORDER BY job_schedule_type;


SELECT
    EXTRACT(MONTH FROM job_posted_date) AS posted_month,
    job_posted_date
        AT TIME ZONE 'UTC' 
        AT TIME ZONE 'America/New_York' AS ny_time,
    COUNT(*)

FROM job_postings_fact
GROUP BY posted_month
ORDER BY posted_month;


SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(*) AS job_count
FROM job_postings_fact
GROUP BY month
ORDER BY month;


SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') as posted_month,
    COUNT(*)
FROM job_postings_fact

GROUP BY posted_month
ORDER BY posted_month;

SELECT
    company_dim.name,
    COUNT(job_id) AS job_count

FROM job_postings_fact

LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id

WHERE job_health_insurance = TRUE
    AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2

GROUP BY company_dim.name
ORDER BY job_count DESC;


SELECT
    COUNT(job_id) AS job_count,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category

FROM job_postings_fact
GROUP BY location_category;


SELECT
    job_title,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High Salary'
        WHEN salary_year_avg <= 100000 AND salary_year_avg >= 60000 THEN 'Standard Salary'
        ELSE 'Low salary'
    END AS salary_category

FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC;


SELECT 
    name,
    COUNT(name)
FROM job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id

WHERE job_postings_fact.job_work_from_home = TRUE
GROUP BY name

SELECT 
    name,
    job_work_from_home
FROM job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id


SELECT
        COUNT (DISTINCT CASE WHEN job_work_from_home = TRUE THEN job_postings_fact.company_id END) AS remote_company,
        COUNT (DISTINCT CASE WHEN job_work_from_home = FALSE THEN job_postings_fact.company_id END) AS non_remote_company

FROM job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id;

SELECT
    COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS remote_companies,
    COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_remote_companies
FROM job_postings_fact;


SELECT
    job_title,
    job_id,
    salary_year_avg,

    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,

    CASE
        WHEN job_work_from_home = TRUE THEN 'Yes'
        ELSE 'No'
    END AS remote_option

FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY job_id;

SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) = 1
) AS january_jobs;

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs


SELECT DISTINCT
    job_postings_fact.company_id,
    name
--    job_no_degree_mention
FROM job_postings_fact
LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id
WHERE job_no_degree_mention = TRUE
ORDER BY company_id;




SELECT
    company_id,
    name
FROM company_dim
WHERE company_id IN (
    SELECT
        company_id
    --    job_no_degree_mention
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE
    ORDER BY company_id
    );


SELECT name
FROM company_dim
WHERE company_id IN (
    SELECT
    company_id,
    COUNT(*) AS job_count
FROM job_postings_fact
GROUP BY company_id
ORDER BY job_count DESC
);

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) as job_count
    FROM job_postings_fact
    GROUP BY company_id
    ORDER BY job_count DESC
)

SELECT *
FROM company_job_count

SELECT DISTINCT company_id
FROM job_postings_fact;

SELECT DISTINCT company_id
FROM company_dim;

-- Sub-queries -- 
SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE
    ORDER BY company_id
);

SELECT skills
FROM skills_dim
WHERE skill_id IN (
    SELECT 
        COUNT(job_postings_fact.job_id),
       skills_job_dim.skill_id
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON
        skills_job_dim.job_id = job_postings_fact.job_id
    GROUP BY skill_id
    );


-- CTEs --
WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date)= 1
)

SELECT *
FROM january_jobs;

WITH company_job_count AS(
        SELECT
        company_id,
        COUNT(*) AS job_count
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT 
    name AS company_name,
    job_count
FROM company_job_count
LEFT JOIN company_dim ON
    company_dim.company_id = company_job_count.company_id
ORDER BY job_count DESC;


WITH top_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim 
    GROUP BY skill_id
    ORDER BY skill_id)

SELECT
    skills_dim.skill_id,
    skill_count,
    skills
FROM top_skills
INNER JOIN skills_dim ON
    skills_dim.skill_id = top_skills.skill_id
LIMIT 10;


WITH top_remote_skills AS (
    SELECT
        job_postings_fact.job_id,
        job_work_from_home,
        skill_id
    FROM job_postings_fact

    INNER JOIN skills_job_dim ON
    skills_job_dim.job_id = job_postings_fact.job_id

    WHERE
        job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
)

SELECT 
    COUNT(skills_dim.skill_id) AS skill_count,
    skills
FROM top_remote_skills

INNER JOIN skills_dim ON
    skills_dim.skill_id = top_remote_skills.skill_id

GROUP BY (skills)
ORDER BY skill_count DESC
LIMIT 5;


