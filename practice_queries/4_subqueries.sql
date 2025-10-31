-- Subquery (SELECT, FROM, WHERE, HAVING)

-- Example: SELECT
SELECT
    e.employee_id,
    e.name,
    (SELECT d.department_name 
     FROM departments d 
     WHERE d.department_id = e.department_id) AS department_name,
    (SELECT AVG(salary) 
     FROM employees 
     WHERE department_id = e.department_id) AS avg_department_salary
FROM employees e;

-- Example: FROM
SELECT
    dept_summary.department_id,
    dept_summary.avg_salary,
    dept_summary.employee_count
FROM (
    SELECT
        department_id,
        AVG(salary) AS avg_salary,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
) AS dept_summary
WHERE dept_summary.avg_salary > 60000
ORDER BY dept_summary.avg_salary DESC;

-- Example: WHERE
SELECT
    name,
    department_id,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Example: HAVING
SELECT
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);


--count distinct skill_id for each company. include all companies
WITH 
required_skills AS (
    SELECT
        company_dim.company_id,
        COUNT(DISTINCT skill_id) AS skill_count
    FROM
        company_dim
    LEFT JOIN job_postings_fact ON
        job_postings_fact.company_id = company_dim.company_id
    LEFT JOIN skills_job_dim ON
        skills_job_dim.job_id = job_postings_fact.job_id
    GROUP BY company_dim.company_id
),

company_highest_salary AS (
    SELECT
        company_id,
        MAX(salary_year_avg) AS highest_salary
    FROM job_postings_fact
    WHERE job_id IN (SELECT job_id FROM skills_job_dim)
    GROUP BY company_id
    HAVING MAX(salary_year_avg) IS NOT NULL
)

SELECT
    name,
    skill_count,
    highest_salary
FROM company_dim
INNER JOIN required_skills ON
    required_skills.company_id = company_dim.company_id
INNER JOIN company_highest_salary ON
    company_highest_salary.company_id = company_dim.company_id
ORDER BY name
;


SELECT
    company_dim.company_id,
    COUNT(skills_job_dim.job_id) AS unique_skills_required
FROM company_dim
LEFT JOIN job_postings_fact ON
    job_postings_fact.company_id = company_dim.company_id
LEFT JOIN skills_job_dim ON
    skills_job_dim.job_id = job_postings_fact.job_id
GROUP BY company_dim.company_id
;



SELECT (
    AVG(salary_year_avg)
FROM
    job_postings_fact) AS overall_avg_salary


SELECT *
FROM (
    SELECT
        AVG(salary_year_avg) AS average,
        name
    FROM 
        job_postings_fact
    LEFT JOIN
        company_dim ON
        company_dim.company_id = job_postings_fact.company_id
    GROUP BY name) AS company_avg_salary
WHERE average > overall_avg_salary;


-- Overall average
SELECT
    AVG(salary_year_avg)
FROM
    job_postings_fact


--part 2 
SELECT 
    name,
    company_avg_salary
FROM 
    (SELECT
        AVG(salary_year_avg) AS company_avg_salary,
        company_id
    FROM
        job_postings_fact
    GROUP BY
        company_id) AS company_avg_salaries
LEFT JOIN company_dim ON
    company_dim.company_id = company_avg_salaries.company_id
WHERE company_avg_salary > 
    (SELECT
        AVG(salary_year_avg)
    FROM
        job_postings_fact)


SELECT (
    company_id,
    COUNT(*) as job_count
FROM
    job_postings_fact
GROUP BY
    company_id
ORDER BY
    job_count DESC) AS company_job_count;

SELECT 
    CASE
        WHEN job_count > 50 = THEN 'Large'
        WHEN job_count BETWEEN 50 AND 10 THEN 'Medium'
        ELSE 'Small'
    END AS company_size
FROM company_job_count;


SELECT 
    company_job_count.company_id,
    name,
    CASE
        WHEN job_count > 50 THEN 'Large'
        WHEN job_count BETWEEN 50 AND 10 THEN 'Medium'
        ELSE 'Small'
    END AS company_size

FROM 
    (SELECT 
    company_id,
    COUNT(*) as job_count
    FROM
        job_postings_fact
    GROUP BY
        company_id) AS company_job_count

LEFT JOIN company_dim ON
    company_dim.company_id = company_job_count.company_id
ORDER BY company_id






SELECT
    skills
FROM skills_dim

INNER JOIN (
        SELECT
        COUNT(job_id) as job_count,
        skill_id
        FROM
            skills_job_dim
        GROUP BY
            skill_id
--        ORDER BY
--            job_count DESC
) AS top_skills ON
    top_skills.skill_id = skills_dim.skill_id

ORDER BY job_count DESC
LIMIT 5;


SELECT 
    skills
FROM skills_dim
WHERE skill_id IN (
    SELECT skill_id
        FROM (
            SELECT
            skills_job_dim.skill_id,
            COUNT(*) as job_count
            FROM job_postings_fact
            INNER JOIN skills_job_dim ON
                skills_job_dim.job_id = job_postings_fact.job_id
            GROUP BY skill_id
            ORDER BY job_count DESC
            LIMIT 5
        )
);


SELECT skills
FROM skills_dim
INNER JOIN (
    SELECT
        skill_id,
        COUNT(job_id) AS job_count
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY job_count DESC
    ) AS top_skills
ON top_skills.skill_id = skills_dim.skill_id
ORDER BY job_count DESC
LIMIT 5;


SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

SELECT job_posted_date
FROM january_jobs;



SELECT
    name AS company_name,
    company_id
FROM
    company_dim
WHERE
    company_id IN (
        SELECT company_id
        FROM job_postings_fact
        WHERE job_no_degree_mention = TRUE
    )
ORDER BY company_id


-- CTE (SELECT, INSERT, UPDATE, DELETE)

-- Example: SELECT
WITH department_avg AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.employee_id,
    e.name,
    e.salary,
    d.avg_salary
FROM employees e
JOIN department_avg d ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;

-- Example: INSERT
WITH new_sales AS (
    SELECT
        customer_id,
        SUM(amount) AS total_amount
    FROM orders
    WHERE order_date >= '2025-01-01'
    GROUP BY customer_id
)
INSERT INTO customer_sales_summary (customer_id, total_sales)
SELECT
    customer_id,
    total_amount
FROM new_sales;

-- Example: UPDATE
WITH high_performers AS (
    SELECT
        employee_id
    FROM employees
    WHERE performance_rating = 'Excellent'
)
UPDATE employees
SET bonus = bonus + 1000
WHERE employee_id IN (SELECT employee_id FROM high_performers);

-- Example: DELETE
WITH inactive_customers AS (
    SELECT
        customer_id
    FROM customers
    WHERE last_order_date < '2020-01-01'
)
DELETE FROM customers
WHERE customer_id IN (SELECT customer_id FROM inactive_customers);

;

WITH title_diversity AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS job_count
    FROM
        job_postings_fact
    GROUP BY
        company_id)

SELECT
    name,
    job_count
FROM title_diversity
INNER JOIN company_dim ON
    company_dim.company_id = title_diversity.company_id
ORDER BY
    job_count DESC
LIMIT 10

;

WITH avg_salary_per_country AS
    (SELECT
        AVG(salary_year_avg) AS country_avg_salary,
        job_country
    FROM
        job_postings_fact
    GROUP BY
        job_country)

SELECT
    job_id,
    job_title,
    name,
    salary_year_avg AS salary_rate,
    CASE
        WHEN salary_year_avg > country_avg_salary THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_category,
    EXTRACT(MONTH FROM job_posted_date) AS posted_month

FROM job_postings_fact AS job_postings
INNER JOIN avg_salary_per_country ON
    avg_salary_per_country.job_country = job_postings.job_country
INNER JOIN company_dim ON
    company_dim.company_id = job_postings.company_id

ORDER BY job_id DESC

;


-- gets average job salary for each country
WITH avg_salaries AS (
    SELECT 
        job_country, 
        AVG(salary_year_avg) AS avg_salary
    FROM job_postings_fact
    GROUP BY job_country
)
SELECT
    -- Gets basic job info
    job_postings.job_id,
    job_postings.job_title,
    companies.name AS company_name,
    job_postings.salary_year_avg AS salary_rate,
    -- categorizes the salary as above or below average the average salary for the country
    CASE
        WHEN job_postings.salary_year_avg > avg_salaries.avg_salary
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_category,
    -- gets the month and year of the job posting date
    EXTRACT(MONTH FROM job_postings.job_posted_date) AS posting_month
FROM
    job_postings_fact as job_postings
INNER JOIN
    company_dim as companies ON job_postings.company_id = companies.company_id
INNER JOIN
    avg_salaries ON job_postings.job_country = avg_salaries.job_country
ORDER BY
    -- Sorts it by the most recent job postings
    job_id desc

;

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs;

WITH company_job_count AS (
    SELECT
    company_id,
    COUNT(*) AS job_count
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    name,
    job_count
FROM company_dim
LEFT JOIN company_job_count ON
    company_job_count.company_id = company_dim.company_id
ORDER BY job_count DESC
LIMIT 10;


WITH top_skills AS (
    SELECT
        skills,
        COUNT(skills_dim.skill_id) AS skill_count

    FROM skills_job_dim
    LEFT JOIN skills_dim ON
    skills_dim.skill_id = skills_job_dim.skill_id
    GROUP BY skills
    ORDER BY skill_count DESC
)

SELECT *
FROM top_skills


LEFT JOIN job_postings_fact ON
    job_postings_fact.job_id = top_skills.job_id;


WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS job_postings_count
    FROM job_postings_fact
    LEFT JOIN skills_job_dim ON
        skills_job_dim.job_id = job_postings_fact.job_id
    WHERE 
        job_work_from_home = TRUE AND
        job_title_short = 'Data Analyst'
    GROUP BY skill_id

)

SELECT
    skills_dim.skill_id,
    job_postings_count,
    skills
FROM remote_job_skills
LEFT JOIN skills_dim ON
    skills_dim.skill_id = remote_job_skills.skill_id
ORDER BY job_postings_count DESC
LIMIT 5;





