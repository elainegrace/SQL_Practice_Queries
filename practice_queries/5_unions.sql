WITH combined_job_set AS (
    SELECT
        job_id,
        job_title_short,
        company_id,
        job_location,
        salary_year_avg
    FROM january_jobs

UNION ALL

    SELECT
        job_id,
        job_title_short,
        company_id,
        job_location,
        salary_year_avg
    FROM february_jobs

UNION ALL

    SELECT
        job_id,
        job_title_short,
        company_id,
        job_location,
        salary_year_avg
    FROM march_jobs
)


SELECT
        job_id,
        job_title_short,
        company_id,
        job_location,
        salary_year_avg
FROM job_postings_fact
WHERE job_id IN (SELECT job_id FROM combined_job_set) AND
    salary_year_avg > 70000

;

SELECT
    job_id,
    job_title,
    'With Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL OR
    salary_hour_avg IS NOT NULL

UNION ALL

SELECT
    job_id,
    job_title,
    'Without Salary Info' AS salary_info
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NULL AND
    salary_hour_avg IS NULL

;

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    skill,
    type

FROM
    job_title_short

;

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS q1_jobs

WHERE salary_year_avg > 70000

;

SELECT
    q1_jobs.job_id,
    job_title_short,
    job_location,
    job_via,
    skills,
    type,
    salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS q1_jobs
LEFT JOIN skills_job_dim ON
    skills_job_dim.job_id = q1_jobs.job_id
LEFT JOIN skills_dim ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE salary_year_avg > 70000

;

SELECT
    q1_jobs.job_id,
    skill_id
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS q1_jobs
LEFT JOIN skills_job_dim ON
    skills_job_dim.job_id = q1_jobs.job_id

;

WITH q1_jobs AS (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs 
),

monthly_skill_demand AS (
    SELECT
        skills,
        EXTRACT(YEAR FROM q1_jobs.job_posted_date) AS year,
        EXTRACT(MONTH FROM q1_jobs.job_posted_date) AS month,
        COUNT(q1_jobs.job_id)
    FROM q1_jobs
    INNER JOIN skills_job_dim ON
        skills_job_dim.job_id = q1_jobs.job_id
    INNER JOIN skills_dim ON
        skills_dim.skill_id = skills_job_dim.skill_id
    GROUP BY 
        skills,
        year,
        month
    ORDER BY
        skills,
        year,
        month
)

SELECT *
FROM monthly_skill_demand

;

WITH q1_jobs AS (
    SELECT *
    FROM january_jobs
    UNION ALL

    SELECT *
    FROM february_jobs
    UNION ALL

    SELECT *
    FROM march_jobs
),

quarterly_skill_job_count AS (
    SELECT
        skills,
        EXTRACT(MONTH FROM q1_jobs.job_posted_date) AS month,
        EXTRACT(YEAR FROM q1_jobs.job_posted_date) AS year,
        COUNT(*) AS job_count
    FROM
        q1_jobs
    LEFT JOIN skills_job_dim ON
        skills_job_dim.job_id = q1_jobs.job_id
    LEFT JOIN skills_dim ON
        skills_dim.skill_id = skills_job_dim.skill_id
    GROUP BY 
        skills,
        year,
        month
    ORDER BY
        skills,
        year,
        month
)

SELECT *
FROM quarterly_skill_job_count