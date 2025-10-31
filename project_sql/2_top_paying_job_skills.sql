/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
*/

WITH required_skills AS (
    SELECT
        job_id,
        skills_job_dim.skill_id,
        skills
    FROM skills_job_dim
    LEFT JOIN skills_dim ON
        skills_dim.skill_id = skills_job_dim.skill_id
    ORDER BY skill_id
),


company_names AS (
    SELECT
        company_id,
        name AS company_name
    FROM company_dim
)


SELECT
    job_postings_fact.job_id,
    job_title_short,
    company_name,
    salary_year_avg,
    skills
FROM job_postings_fact
INNER JOIN required_skills ON
    required_skills.job_id = job_postings_fact.job_id
INNER JOIN company_names ON
    company_names.company_id = job_postings_fact.company_id
WHERE
    job_title LIKE '%Data%Analyst%' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
ORDER BY salary_year_avg DESC

/*
Key Insights

- SQL is the dominant requirement — appearing in nearly 1 out of 6 postings.
- Data visualization tools (Tableau, Power BI, Looker) collectively appear in ~500 postings — indicating high demand for dashboarding skills.
- Programming languages (Python, R, SAS, Go) are essential for analytical and statistical tasks.
- Excel remains equally as common as Python — highlighting the ongoing need for spreadsheet proficiency.
- Cloud and data warehouse tools (Snowflake, Oracle, SQL Server) show that data infrastructure knowledge is becoming valuable for analysts.
*/

/* JSON
[
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "tableau"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "confluence"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "skills": "git"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "gitlab"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "sql"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "html"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "css"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "angular"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "flask"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "fastapi"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "aws"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "windows"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "keras"
  },
  {
    "job_id": 1638595,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "185000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "r"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "skills": "sql"
  },
  {
    "job_id": 813346,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications",
    "salary_year_avg": "181000.0",
    "skills": "python"
  },
  {
    "job_id": 813346,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications",
    "salary_year_avg": "181000.0",
    "skills": "tableau"
  },
  {
    "job_id": 813346,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications",
    "salary_year_avg": "181000.0",
    "skills": "r"
  },
  {
    "job_id": 813346,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications",
    "salary_year_avg": "181000.0",
    "skills": "zoom"
  },
  {
    "job_id": 813346,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications",
    "salary_year_avg": "181000.0",
    "skills": "jira"
  },
  {
    "job_id": 813346,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications",
    "salary_year_avg": "181000.0",
    "skills": "sql"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "jupyter"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "python"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "sql"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "github"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "golang"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "scala"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "rust"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "javascript"
  },
  {
    "job_id": 511999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Fastly",
    "salary_year_avg": "178500.0",
    "skills": "spark"
  },
  {
    "job_id": 1020432,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Omada Health",
    "salary_year_avg": "173000.0",
    "skills": "excel"
  },
  {
    "job_id": 1020432,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Omada Health",
    "salary_year_avg": "173000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1020432,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Omada Health",
    "salary_year_avg": "173000.0",
    "skills": "sql"
  },
  {
    "job_id": 1290878,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "172500.0",
    "skills": "python"
  },
  {
    "job_id": 1290878,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "172500.0",
    "skills": "microstrategy"
  },
  {
    "job_id": 1290878,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "172500.0",
    "skills": "r"
  },
  {
    "job_id": 1290878,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "172500.0",
    "skills": "sql"
  },
  {
    "job_id": 1290878,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "172500.0",
    "skills": "react"
  },
  {
    "job_id": 1290878,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "172500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1290878,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "172500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 332437,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "zoom"
  },
  {
    "job_id": 332437,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "tableau"
  },
  {
    "job_id": 332437,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "sql"
  },
  {
    "job_id": 332437,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "r"
  },
  {
    "job_id": 332437,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Empassion",
    "salary_year_avg": "171000.0",
    "skills": "looker"
  },
  {
    "job_id": 7859,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Arsenault",
    "salary_year_avg": "170000.0",
    "skills": "sql"
  },
  {
    "job_id": 1781684,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "170000.0",
    "skills": "java"
  },
  {
    "job_id": 1781684,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "170000.0",
    "skills": "excel"
  },
  {
    "job_id": 7859,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Arsenault",
    "salary_year_avg": "170000.0",
    "skills": "tableau"
  },
  {
    "job_id": 7859,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Arsenault",
    "salary_year_avg": "170000.0",
    "skills": "nosql"
  },
  {
    "job_id": 1781684,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "170000.0",
    "skills": "go"
  },
  {
    "job_id": 7859,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Arsenault",
    "salary_year_avg": "170000.0",
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "r"
  },
  {
    "job_id": 1525451,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "sql"
  },
  {
    "job_id": 1525451,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "excel"
  },
  {
    "job_id": 1525451,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1525451,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "looker"
  },
  {
    "job_id": 1525451,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "167000.0",
    "skills": "swift"
  },
  {
    "job_id": 1246069,
    "job_title_short": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 1246069,
    "job_title_short": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "matlab"
  },
  {
    "job_id": 1246069,
    "job_title_short": "Data Analyst",
    "company_name": "Plexus Resource Solutions",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "165000.0",
    "skills": "tableau"
  },
  {
    "job_id": 618890,
    "job_title_short": "Data Analyst",
    "company_name": "CEDARS-SINAI",
    "salary_year_avg": "163500.0",
    "skills": "go"
  },
  {
    "job_id": 618890,
    "job_title_short": "Data Analyst",
    "company_name": "CEDARS-SINAI",
    "salary_year_avg": "163500.0",
    "skills": "crystal"
  },
  {
    "job_id": 618890,
    "job_title_short": "Data Analyst",
    "company_name": "CEDARS-SINAI",
    "salary_year_avg": "163500.0",
    "skills": "sas"
  },
  {
    "job_id": 618890,
    "job_title_short": "Data Analyst",
    "company_name": "CEDARS-SINAI",
    "salary_year_avg": "163500.0",
    "skills": "sas"
  },
  {
    "job_id": 618890,
    "job_title_short": "Data Analyst",
    "company_name": "CEDARS-SINAI",
    "salary_year_avg": "163500.0",
    "skills": "tableau"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "couchbase"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "tableau"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "r"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "cognos"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "snowflake"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "watson"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "oracle"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "redshift"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "visio"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "azure"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "linux"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "airflow"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "pyspark"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "ssis"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "sql"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "aws"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "scala"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "postgresql"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "mysql"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "python"
  },
  {
    "job_id": 918213,
    "job_title_short": "Data Analyst",
    "company_name": "DIRECTV",
    "salary_year_avg": "160515.0",
    "skills": "databricks"
  },
  {
    "job_id": 475626,
    "job_title_short": "Data Analyst",
    "company_name": "Realtime Recruitment",
    "salary_year_avg": "160000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 347633,
    "job_title_short": "Data Scientist",
    "company_name": "Y Combinator",
    "salary_year_avg": "160000.0",
    "skills": "python"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "python"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "sql"
  },
  {
    "job_id": 475626,
    "job_title_short": "Data Analyst",
    "company_name": "Realtime Recruitment",
    "salary_year_avg": "160000.0",
    "skills": "looker"
  },
  {
    "job_id": 57065,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "160000.0",
    "skills": "looker"
  },
  {
    "job_id": 420655,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Maven Clinic",
    "salary_year_avg": "160000.0",
    "skills": "looker"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "sas"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "sas"
  },
  {
    "job_id": 420655,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Maven Clinic",
    "salary_year_avg": "160000.0",
    "skills": "html"
  },
  {
    "job_id": 57065,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "160000.0",
    "skills": "tableau"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "sql server"
  },
  {
    "job_id": 420655,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Maven Clinic",
    "salary_year_avg": "160000.0",
    "skills": "r"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "azure"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "r"
  },
  {
    "job_id": 420655,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Maven Clinic",
    "salary_year_avg": "160000.0",
    "skills": "sql"
  },
  {
    "job_id": 57065,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "160000.0",
    "skills": "sql"
  },
  {
    "job_id": 182813,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "160000.0",
    "skills": "power bi"
  },
  {
    "job_id": 420655,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Maven Clinic",
    "salary_year_avg": "160000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 347633,
    "job_title_short": "Data Scientist",
    "company_name": "Y Combinator",
    "salary_year_avg": "160000.0",
    "skills": "sql"
  },
  {
    "job_id": 475626,
    "job_title_short": "Data Analyst",
    "company_name": "Realtime Recruitment",
    "salary_year_avg": "160000.0",
    "skills": "power bi"
  },
  {
    "job_id": 57065,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "160000.0",
    "skills": "jupyter"
  },
  {
    "job_id": 420655,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Maven Clinic",
    "salary_year_avg": "160000.0",
    "skills": "python"
  },
  {
    "job_id": 57065,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "160000.0",
    "skills": "power bi"
  },
  {
    "job_id": 57065,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "160000.0",
    "skills": "airflow"
  },
  {
    "job_id": 57065,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gladly",
    "salary_year_avg": "160000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1426754,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Grow Therapy",
    "salary_year_avg": "157500.0",
    "skills": "python"
  },
  {
    "job_id": 485388,
    "job_title_short": "Data Analyst",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "salary_year_avg": "157500.0",
    "skills": "go"
  },
  {
    "job_id": 485388,
    "job_title_short": "Data Analyst",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "salary_year_avg": "157500.0",
    "skills": "oracle"
  },
  {
    "job_id": 485388,
    "job_title_short": "Data Analyst",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "salary_year_avg": "157500.0",
    "skills": "sql"
  },
  {
    "job_id": 1426754,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Grow Therapy",
    "salary_year_avg": "157500.0",
    "skills": "sql"
  },
  {
    "job_id": 1426754,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Grow Therapy",
    "salary_year_avg": "157500.0",
    "skills": "looker"
  },
  {
    "job_id": 25761,
    "job_title_short": "Data Analyst",
    "company_name": "CaptivateIQ",
    "salary_year_avg": "155485.5",
    "skills": "sql"
  },
  {
    "job_id": 25761,
    "job_title_short": "Data Analyst",
    "company_name": "CaptivateIQ",
    "salary_year_avg": "155485.5",
    "skills": "datarobot"
  },
  {
    "job_id": 25761,
    "job_title_short": "Data Analyst",
    "company_name": "CaptivateIQ",
    "salary_year_avg": "155485.5",
    "skills": "python"
  },
  {
    "job_id": 25761,
    "job_title_short": "Data Analyst",
    "company_name": "CaptivateIQ",
    "salary_year_avg": "155485.5",
    "skills": "r"
  },
  {
    "job_id": 25761,
    "job_title_short": "Data Analyst",
    "company_name": "CaptivateIQ",
    "salary_year_avg": "155485.5",
    "skills": "looker"
  },
  {
    "job_id": 25761,
    "job_title_short": "Data Analyst",
    "company_name": "CaptivateIQ",
    "salary_year_avg": "155485.5",
    "skills": "tableau"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "spark"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "sql"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "java"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "redshift"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "python"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "airflow"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "scala"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "tableau"
  },
  {
    "job_id": 105157,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "155000.0",
    "skills": "c++"
  },
  {
    "job_id": 795614,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "hadoop"
  },
  {
    "job_id": 565646,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "sql"
  },
  {
    "job_id": 565646,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "hadoop"
  },
  {
    "job_id": 795614,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "tableau"
  },
  {
    "job_id": 565646,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "looker"
  },
  {
    "job_id": 565646,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "excel"
  },
  {
    "job_id": 795614,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "looker"
  },
  {
    "job_id": 795614,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "excel"
  },
  {
    "job_id": 565646,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "tableau"
  },
  {
    "job_id": 795614,
    "job_title_short": "Data Analyst",
    "company_name": "Zscaler",
    "salary_year_avg": "152625.0",
    "skills": "sql"
  },
  {
    "job_id": 540057,
    "job_title_short": "Data Analyst",
    "company_name": "Rocket Money",
    "salary_year_avg": "152500.0",
    "skills": "sql"
  },
  {
    "job_id": 540057,
    "job_title_short": "Data Analyst",
    "company_name": "Rocket Money",
    "salary_year_avg": "152500.0",
    "skills": "looker"
  },
  {
    "job_id": 456042,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "151500.0",
    "skills": "sql"
  },
  {
    "job_id": 456042,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "151500.0",
    "skills": "python"
  },
  {
    "job_id": 456042,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "151500.0",
    "skills": "r"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "oracle"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "ms access"
  },
  {
    "job_id": 73304,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "tableau"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "vba"
  },
  {
    "job_id": 591850,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "excel"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "r"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "sql server"
  },
  {
    "job_id": 73304,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "excel"
  },
  {
    "job_id": 591850,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "tableau"
  },
  {
    "job_id": 591850,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "vba"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "python"
  },
  {
    "job_id": 591850,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "oracle"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "sas"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_id": 591850,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "sql"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "tableau"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "sas"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "c++"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "spss"
  },
  {
    "job_id": 357932,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "150000.0",
    "skills": "java"
  },
  {
    "job_id": 591850,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "nosql"
  },
  {
    "job_id": 73304,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "sheets"
  },
  {
    "job_id": 73304,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "excel"
  },
  {
    "job_id": 591850,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "150000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 343681,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Caterpillar",
    "salary_year_avg": "148290.0",
    "skills": "excel"
  },
  {
    "job_id": 343681,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Caterpillar",
    "salary_year_avg": "148290.0",
    "skills": "tableau"
  },
  {
    "job_id": 343681,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Caterpillar",
    "salary_year_avg": "148290.0",
    "skills": "java"
  },
  {
    "job_id": 343681,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Caterpillar",
    "salary_year_avg": "148290.0",
    "skills": "sql"
  },
  {
    "job_id": 343681,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Caterpillar",
    "salary_year_avg": "148290.0",
    "skills": "power bi"
  },
  {
    "job_id": 343681,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Caterpillar",
    "salary_year_avg": "148290.0",
    "skills": "html"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "db2"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "excel"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "tableau"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "r"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "microstrategy"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "nosql"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "vba"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "sql"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "spss"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "sas"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "sas"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "python"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "oracle"
  },
  {
    "job_id": 1402149,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "148238.5",
    "skills": "hadoop"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "sas"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "ssis"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "sas"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "t-sql"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "excel"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "sql"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1694004,
    "job_title_short": "Data Analyst",
    "company_name": "EXL Service",
    "salary_year_avg": "147285.0",
    "skills": "python"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "elasticsearch"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_id": 1014682,
    "job_title_short": "Senior Data Analyst",
    "company_name": "X4 Technology",
    "salary_year_avg": "145000.0",
    "skills": "aws"
  },
  {
    "job_id": 1329162,
    "job_title_short": "Data Analyst",
    "company_name": "Hire With Jarvis",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "excel"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "java"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "sas"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "looker"
  },
  {
    "job_id": 1329162,
    "job_title_short": "Data Analyst",
    "company_name": "Hire With Jarvis",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "javascript"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "aws"
  },
  {
    "job_id": 1014682,
    "job_title_short": "Senior Data Analyst",
    "company_name": "X4 Technology",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1014682,
    "job_title_short": "Senior Data Analyst",
    "company_name": "X4 Technology",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "gcp"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "sas"
  },
  {
    "job_id": 1014682,
    "job_title_short": "Senior Data Analyst",
    "company_name": "X4 Technology",
    "salary_year_avg": "145000.0",
    "skills": "azure"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1329162,
    "job_title_short": "Data Analyst",
    "company_name": "Hire With Jarvis",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "c++"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 1014682,
    "job_title_short": "Senior Data Analyst",
    "company_name": "X4 Technology",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "tableau"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1329162,
    "job_title_short": "Data Analyst",
    "company_name": "Hire With Jarvis",
    "salary_year_avg": "145000.0",
    "skills": "excel"
  },
  {
    "job_id": 712558,
    "job_title_short": "Data Analyst",
    "company_name": "ALTA IT Services",
    "salary_year_avg": "145000.0",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "job_title_short": "Data Analyst",
    "company_name": "Level",
    "salary_year_avg": "145000.0",
    "skills": "golang"
  },
  {
    "job_id": 405581,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "145000.0",
    "skills": "qlik"
  },
  {
    "job_id": 720047,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "unity"
  },
  {
    "job_id": 177295,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "looker"
  },
  {
    "job_id": 720047,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "python"
  },
  {
    "job_id": 177295,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "python"
  },
  {
    "job_id": 177295,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "r"
  },
  {
    "job_id": 177295,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "tableau"
  },
  {
    "job_id": 720047,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "looker"
  },
  {
    "job_id": 720047,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "sql"
  },
  {
    "job_id": 177295,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "qlik"
  },
  {
    "job_id": 720047,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "qlik"
  },
  {
    "job_id": 177295,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "sql"
  },
  {
    "job_id": 720047,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "tableau"
  },
  {
    "job_id": 720047,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "144500.0",
    "skills": "r"
  },
  {
    "job_id": 594118,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Amplify Consulting Partners",
    "salary_year_avg": "142501.0",
    "skills": "sql"
  },
  {
    "job_id": 594118,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Amplify Consulting Partners",
    "salary_year_avg": "142501.0",
    "skills": "sql server"
  },
  {
    "job_id": 594118,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Amplify Consulting Partners",
    "salary_year_avg": "142501.0",
    "skills": "power bi"
  },
  {
    "job_id": 594118,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Amplify Consulting Partners",
    "salary_year_avg": "142501.0",
    "skills": "azure"
  },
  {
    "job_id": 1090975,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "job_id": 1090975,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "140500.0",
    "skills": "r"
  },
  {
    "job_id": 1090975,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "job_id": 1090975,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "140500.0",
    "skills": "excel"
  },
  {
    "job_id": 1090975,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "140500.0",
    "skills": "swift"
  },
  {
    "job_id": 1090975,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "140500.0",
    "skills": "looker"
  },
  {
    "job_id": 149006,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "140500.0",
    "skills": "python"
  },
  {
    "job_id": 149006,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "140500.0",
    "skills": "sql"
  },
  {
    "job_id": 149006,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "140500.0",
    "skills": "oracle"
  },
  {
    "job_id": 1090975,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "140500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1469085,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "go"
  },
  {
    "job_id": 894601,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 108410,
    "job_title_short": "Data Scientist",
    "company_name": "MatchPoint Solutions",
    "salary_year_avg": "140000.0",
    "skills": "oracle"
  },
  {
    "job_id": 894601,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "looker"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 514651,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "c"
  },
  {
    "job_id": 894601,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "c"
  },
  {
    "job_id": 108240,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "looker"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1165589,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 351741,
    "job_title_short": "Senior Data Scientist",
    "company_name": "Lily AI",
    "salary_year_avg": "140000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1165589,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "c"
  },
  {
    "job_id": 1503207,
    "job_title_short": "Senior Data Analyst",
    "company_name": "North Starr",
    "salary_year_avg": "140000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1049000,
    "job_title_short": "Data Analyst",
    "company_name": "Sisense",
    "salary_year_avg": "140000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1165589,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "go"
  },
  {
    "job_id": 1174500,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "c"
  },
  {
    "job_id": 1503207,
    "job_title_short": "Senior Data Analyst",
    "company_name": "North Starr",
    "salary_year_avg": "140000.0",
    "skills": "looker"
  },
  {
    "job_id": 108240,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "c"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "nosql"
  },
  {
    "job_id": 894601,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "tableau"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 514651,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "databricks"
  },
  {
    "job_id": 108240,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 1174500,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "tableau"
  },
  {
    "job_id": 478512,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "databricks"
  },
  {
    "job_id": 1165589,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "databricks"
  },
  {
    "job_id": 514651,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "aws"
  },
  {
    "job_id": 108410,
    "job_title_short": "Data Scientist",
    "company_name": "MatchPoint Solutions",
    "salary_year_avg": "140000.0",
    "skills": "flow"
  },
  {
    "job_id": 351741,
    "job_title_short": "Senior Data Scientist",
    "company_name": "Lily AI",
    "salary_year_avg": "140000.0",
    "skills": "r"
  },
  {
    "job_id": 1174500,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1503207,
    "job_title_short": "Senior Data Analyst",
    "company_name": "North Starr",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 108240,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "tableau"
  },
  {
    "job_id": 478512,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "flow"
  },
  {
    "job_id": 351741,
    "job_title_short": "Senior Data Scientist",
    "company_name": "Lily AI",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 108410,
    "job_title_short": "Data Scientist",
    "company_name": "MatchPoint Solutions",
    "salary_year_avg": "140000.0",
    "skills": "ssis"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "spark"
  },
  {
    "job_id": 108240,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 1503207,
    "job_title_short": "Senior Data Analyst",
    "company_name": "North Starr",
    "salary_year_avg": "140000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1049000,
    "job_title_short": "Data Analyst",
    "company_name": "Sisense",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 478512,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "go"
  },
  {
    "job_id": 1049000,
    "job_title_short": "Data Analyst",
    "company_name": "Sisense",
    "salary_year_avg": "140000.0",
    "skills": "r"
  },
  {
    "job_id": 1165589,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "flow"
  },
  {
    "job_id": 478512,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1165589,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "power bi"
  },
  {
    "job_id": 478512,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 108240,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "go"
  },
  {
    "job_id": 1469085,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 762220,
    "job_title_short": "Data Analyst",
    "company_name": "IT Pros",
    "salary_year_avg": "140000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1469085,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "looker"
  },
  {
    "job_id": 108410,
    "job_title_short": "Data Scientist",
    "company_name": "MatchPoint Solutions",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 108410,
    "job_title_short": "Data Scientist",
    "company_name": "MatchPoint Solutions",
    "salary_year_avg": "140000.0",
    "skills": "sql server"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "redshift"
  },
  {
    "job_id": 478512,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 1049000,
    "job_title_short": "Data Analyst",
    "company_name": "Sisense",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 894601,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "go"
  },
  {
    "job_id": 351741,
    "job_title_short": "Senior Data Scientist",
    "company_name": "Lily AI",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 1174500,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "go"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1165589,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 762220,
    "job_title_short": "Data Analyst",
    "company_name": "IT Pros",
    "salary_year_avg": "140000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1469085,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "tableau"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1174500,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 894601,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 1174500,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 514651,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "go"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "kafka"
  },
  {
    "job_id": 514651,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "python"
  },
  {
    "job_id": 514651,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "flow"
  },
  {
    "job_id": 478512,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "140000.0",
    "skills": "c"
  },
  {
    "job_id": 1469085,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "140000.0",
    "skills": "c"
  },
  {
    "job_id": 35639,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RAZOR",
    "salary_year_avg": "140000.0",
    "skills": "looker"
  },
  {
    "job_id": 1503207,
    "job_title_short": "Senior Data Analyst",
    "company_name": "North Starr",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 762220,
    "job_title_short": "Data Analyst",
    "company_name": "IT Pros",
    "salary_year_avg": "140000.0",
    "skills": "power bi"
  },
  {
    "job_id": 514651,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Block",
    "salary_year_avg": "140000.0",
    "skills": "sql"
  },
  {
    "job_id": 1300702,
    "job_title_short": "Data Analyst",
    "company_name": "Revolut",
    "salary_year_avg": "139000.0",
    "skills": "c++"
  },
  {
    "job_id": 1300702,
    "job_title_short": "Data Analyst",
    "company_name": "Revolut",
    "salary_year_avg": "139000.0",
    "skills": "python"
  },
  {
    "job_id": 1300702,
    "job_title_short": "Data Analyst",
    "company_name": "Revolut",
    "salary_year_avg": "139000.0",
    "skills": "scala"
  },
  {
    "job_id": 1300702,
    "job_title_short": "Data Analyst",
    "company_name": "Revolut",
    "salary_year_avg": "139000.0",
    "skills": "java"
  },
  {
    "job_id": 1300702,
    "job_title_short": "Data Analyst",
    "company_name": "Revolut",
    "salary_year_avg": "139000.0",
    "skills": "sql"
  },
  {
    "job_id": 388392,
    "job_title_short": "Data Analyst",
    "company_name": "United Services Automobile Association",
    "salary_year_avg": "138640.0",
    "skills": "phoenix"
  },
  {
    "job_id": 388392,
    "job_title_short": "Data Analyst",
    "company_name": "United Services Automobile Association",
    "salary_year_avg": "138640.0",
    "skills": "tableau"
  },
  {
    "job_id": 388392,
    "job_title_short": "Data Analyst",
    "company_name": "United Services Automobile Association",
    "salary_year_avg": "138640.0",
    "skills": "javascript"
  },
  {
    "job_id": 388392,
    "job_title_short": "Data Analyst",
    "company_name": "United Services Automobile Association",
    "salary_year_avg": "138640.0",
    "skills": "sql"
  },
  {
    "job_id": 388392,
    "job_title_short": "Data Analyst",
    "company_name": "United Services Automobile Association",
    "salary_year_avg": "138640.0",
    "skills": "snowflake"
  },
  {
    "job_id": 388392,
    "job_title_short": "Data Analyst",
    "company_name": "United Services Automobile Association",
    "salary_year_avg": "138640.0",
    "skills": "nosql"
  },
  {
    "job_id": 388392,
    "job_title_short": "Data Analyst",
    "company_name": "United Services Automobile Association",
    "salary_year_avg": "138640.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1482852,
    "job_title_short": "Data Analyst",
    "company_name": "Overmind",
    "salary_year_avg": "138500.0",
    "skills": "python"
  },
  {
    "job_id": 1482852,
    "job_title_short": "Data Analyst",
    "company_name": "Overmind",
    "salary_year_avg": "138500.0",
    "skills": "sql"
  },
  {
    "job_id": 350382,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "138000.0",
    "skills": "power bi"
  },
  {
    "job_id": 350382,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "138000.0",
    "skills": "sql server"
  },
  {
    "job_id": 350382,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "138000.0",
    "skills": "dax"
  },
  {
    "job_id": 350382,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "138000.0",
    "skills": "azure"
  },
  {
    "job_id": 350382,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "138000.0",
    "skills": "nosql"
  },
  {
    "job_id": 350382,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "138000.0",
    "skills": "sql"
  },
  {
    "job_id": 835092,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global, Inc.",
    "salary_year_avg": "137500.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 531623,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "136000.0",
    "skills": "sql"
  },
  {
    "job_id": 531623,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "136000.0",
    "skills": "excel"
  },
  {
    "job_id": 531623,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "136000.0",
    "skills": "go"
  },
  {
    "job_id": 531623,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "136000.0",
    "skills": "swift"
  },
  {
    "job_id": 531623,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "136000.0",
    "skills": "python"
  },
  {
    "job_id": 777802,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_id": 513988,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "135000.0",
    "skills": "r"
  },
  {
    "job_id": 777802,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "135000.0",
    "skills": "sql server"
  },
  {
    "job_id": 316062,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Rx.Health",
    "salary_year_avg": "135000.0",
    "skills": "tableau"
  },
  {
    "job_id": 513988,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "135000.0",
    "skills": "python"
  },
  {
    "job_id": 316062,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Rx.Health",
    "salary_year_avg": "135000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 513988,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "135000.0",
    "skills": "sas"
  },
  {
    "job_id": 479965,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_id": 479965,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_id": 1347887,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Earnest Analytics",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_id": 513988,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "135000.0",
    "skills": "sas"
  },
  {
    "job_id": 316062,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Rx.Health",
    "salary_year_avg": "135000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1326467,
    "job_title_short": "Data Analyst",
    "company_name": "EPIC Brokers",
    "salary_year_avg": "135000.0",
    "skills": "excel"
  },
  {
    "job_id": 316062,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Rx.Health",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_id": 513988,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "135000.0",
    "skills": "sql"
  },
  {
    "job_id": 777802,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "135000.0",
    "skills": "python"
  },
  {
    "job_id": 479965,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "135000.0",
    "skills": "power bi"
  },
  {
    "job_id": 316062,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Rx.Health",
    "salary_year_avg": "135000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 777802,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "135000.0",
    "skills": "go"
  },
  {
    "job_id": 316062,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Rx.Health",
    "salary_year_avg": "135000.0",
    "skills": "python"
  },
  {
    "job_id": 1347887,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Earnest Analytics",
    "salary_year_avg": "135000.0",
    "skills": "tableau"
  },
  {
    "job_id": 777802,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "135000.0",
    "skills": "c"
  },
  {
    "job_id": 316062,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Rx.Health",
    "salary_year_avg": "135000.0",
    "skills": "azure"
  },
  {
    "job_id": 990420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "132500.0",
    "skills": "python"
  },
  {
    "job_id": 990420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "132500.0",
    "skills": "sql"
  },
  {
    "job_id": 1743115,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "132500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 311931,
    "job_title_short": "Data Analyst",
    "company_name": "SoftDev Incorporated",
    "salary_year_avg": "132500.0",
    "skills": "sql"
  },
  {
    "job_id": 311931,
    "job_title_short": "Data Analyst",
    "company_name": "SoftDev Incorporated",
    "salary_year_avg": "132500.0",
    "skills": "python"
  },
  {
    "job_id": 311931,
    "job_title_short": "Data Analyst",
    "company_name": "SoftDev Incorporated",
    "salary_year_avg": "132500.0",
    "skills": "sheets"
  },
  {
    "job_id": 990420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "132500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1743115,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "132500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1743115,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "132500.0",
    "skills": "azure"
  },
  {
    "job_id": 1743115,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "132500.0",
    "skills": "sql"
  },
  {
    "job_id": 990420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "132500.0",
    "skills": "r"
  },
  {
    "job_id": 311931,
    "job_title_short": "Data Analyst",
    "company_name": "SoftDev Incorporated",
    "salary_year_avg": "132500.0",
    "skills": "r"
  },
  {
    "job_id": 51662,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "130449.5",
    "skills": "oracle"
  },
  {
    "job_id": 51662,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "130449.5",
    "skills": "github"
  },
  {
    "job_id": 51662,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "130449.5",
    "skills": "snowflake"
  },
  {
    "job_id": 51662,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "130449.5",
    "skills": "tableau"
  },
  {
    "job_id": 51662,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "130449.5",
    "skills": "alteryx"
  },
  {
    "job_id": 51662,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "130449.5",
    "skills": "sql"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "jira"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "excel"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "excel"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1531276,
    "job_title_short": "Data Analyst",
    "company_name": "Alpha Silicon",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "github"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "flow"
  },
  {
    "job_id": 21451,
    "job_title_short": "Data Analyst",
    "company_name": "ApTask",
    "salary_year_avg": "130000.0",
    "skills": "flow"
  },
  {
    "job_id": 915066,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Vouch",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1531276,
    "job_title_short": "Data Analyst",
    "company_name": "Alpha Silicon",
    "salary_year_avg": "130000.0",
    "skills": "flow"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "excel"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "git"
  },
  {
    "job_id": 1224288,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Capio Group",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "unix"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "visio"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 915066,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Vouch",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "ms access"
  },
  {
    "job_id": 21451,
    "job_title_short": "Data Analyst",
    "company_name": "ApTask",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "sql"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "ms access"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "spss"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "spss"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "numpy"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "spark"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 1531276,
    "job_title_short": "Data Analyst",
    "company_name": "Alpha Silicon",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "oracle"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "oracle"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "redshift"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "power bi"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 1209798,
    "job_title_short": "Data Analyst",
    "company_name": "Doximity",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 915066,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Vouch",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 21451,
    "job_title_short": "Data Analyst",
    "company_name": "ApTask",
    "salary_year_avg": "130000.0",
    "skills": "python"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "aws"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "aws"
  },
  {
    "job_id": 1224288,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Capio Group",
    "salary_year_avg": "130000.0",
    "skills": "ssis"
  },
  {
    "job_id": 21451,
    "job_title_short": "Data Analyst",
    "company_name": "ApTask",
    "salary_year_avg": "130000.0",
    "skills": "sheets"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "databricks"
  },
  {
    "job_id": 1531276,
    "job_title_short": "Data Analyst",
    "company_name": "Alpha Silicon",
    "salary_year_avg": "130000.0",
    "skills": "sheets"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "azure"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "java"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "java"
  },
  {
    "job_id": 92703,
    "job_title_short": "Data Analyst",
    "company_name": "Launch Consulting Group",
    "salary_year_avg": "130000.0",
    "skills": "dax"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "r"
  },
  {
    "job_id": 1224288,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Capio Group",
    "salary_year_avg": "130000.0",
    "skills": "sql server"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "sql server"
  },
  {
    "job_id": 447569,
    "job_title_short": "Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "130000.0",
    "skills": "r"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "sql server"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "r"
  },
  {
    "job_id": 915066,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Vouch",
    "salary_year_avg": "130000.0",
    "skills": "r"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "sas"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "vba"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "sas"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "sas"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "vba"
  },
  {
    "job_id": 915066,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Vouch",
    "salary_year_avg": "130000.0",
    "skills": "looker"
  },
  {
    "job_id": 1224288,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Capio Group",
    "salary_year_avg": "130000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 915066,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Vouch",
    "salary_year_avg": "130000.0",
    "skills": "go"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "sas"
  },
  {
    "job_id": 9643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "130000.0",
    "skills": "c++"
  },
  {
    "job_id": 961999,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transporation",
    "salary_year_avg": "130000.0",
    "skills": "c++"
  },
  {
    "job_id": 1048812,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gold Coast Health Plan",
    "salary_year_avg": "128625.0",
    "skills": "power bi"
  },
  {
    "job_id": 1048812,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gold Coast Health Plan",
    "salary_year_avg": "128625.0",
    "skills": "excel"
  },
  {
    "job_id": 1048812,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gold Coast Health Plan",
    "salary_year_avg": "128625.0",
    "skills": "word"
  },
  {
    "job_id": 1048812,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gold Coast Health Plan",
    "salary_year_avg": "128625.0",
    "skills": "sql"
  },
  {
    "job_id": 1048812,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gold Coast Health Plan",
    "salary_year_avg": "128625.0",
    "skills": "azure"
  },
  {
    "job_id": 1148444,
    "job_title_short": "Data Analyst",
    "company_name": "Acorns",
    "salary_year_avg": "127000.0",
    "skills": "outlook"
  },
  {
    "job_id": 1791785,
    "job_title_short": "Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "127000.0",
    "skills": "twilio"
  },
  {
    "job_id": 1791785,
    "job_title_short": "Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "127000.0",
    "skills": "go"
  },
  {
    "job_id": 1791785,
    "job_title_short": "Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "127000.0",
    "skills": "c"
  },
  {
    "job_id": 1791785,
    "job_title_short": "Data Analyst",
    "company_name": "Cash App",
    "salary_year_avg": "127000.0",
    "skills": "sql"
  },
  {
    "job_id": 592669,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "126452.0",
    "skills": "python"
  },
  {
    "job_id": 592669,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "126452.0",
    "skills": "r"
  },
  {
    "job_id": 592669,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "126452.0",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "126452.0",
    "skills": "tableau"
  },
  {
    "job_id": 592669,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "126452.0",
    "skills": "spss"
  },
  {
    "job_id": 592669,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "126452.0",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "126452.0",
    "skills": "sql"
  },
  {
    "job_id": 570345,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126250.0",
    "skills": "sas"
  },
  {
    "job_id": 570345,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126250.0",
    "skills": "go"
  },
  {
    "job_id": 570345,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126250.0",
    "skills": "aws"
  },
  {
    "job_id": 570345,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126250.0",
    "skills": "r"
  },
  {
    "job_id": 570345,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126250.0",
    "skills": "python"
  },
  {
    "job_id": 570345,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126250.0",
    "skills": "sql"
  },
  {
    "job_id": 570345,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126250.0",
    "skills": "sas"
  },
  {
    "job_id": 116211,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealthcare",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_id": 502626,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "r"
  },
  {
    "job_id": 116211,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealthcare",
    "salary_year_avg": "126000.0",
    "skills": "ssis"
  },
  {
    "job_id": 841455,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "ssis"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "python"
  },
  {
    "job_id": 841455,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_id": 689373,
    "job_title_short": "Senior Data Analyst",
    "company_name": "OptumRx",
    "salary_year_avg": "126000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 116211,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealthcare",
    "salary_year_avg": "126000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "excel"
  },
  {
    "job_id": 689373,
    "job_title_short": "Senior Data Analyst",
    "company_name": "OptumRx",
    "salary_year_avg": "126000.0",
    "skills": "tableau"
  },
  {
    "job_id": 116211,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealthcare",
    "salary_year_avg": "126000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 502626,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "sas"
  },
  {
    "job_id": 689373,
    "job_title_short": "Senior Data Analyst",
    "company_name": "OptumRx",
    "salary_year_avg": "126000.0",
    "skills": "excel"
  },
  {
    "job_id": 1535354,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "tableau"
  },
  {
    "job_id": 689373,
    "job_title_short": "Senior Data Analyst",
    "company_name": "OptumRx",
    "salary_year_avg": "126000.0",
    "skills": "python"
  },
  {
    "job_id": 1535354,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "tableau"
  },
  {
    "job_id": 502626,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "python"
  },
  {
    "job_id": 689373,
    "job_title_short": "Senior Data Analyst",
    "company_name": "OptumRx",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_id": 841455,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 502626,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "sas"
  },
  {
    "job_id": 502626,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_id": 1535354,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "sql"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1535354,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "looker"
  },
  {
    "job_id": 502626,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "aws"
  },
  {
    "job_id": 841455,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "126000.0",
    "skills": "looker"
  },
  {
    "job_id": 689373,
    "job_title_short": "Senior Data Analyst",
    "company_name": "OptumRx",
    "salary_year_avg": "126000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1304575,
    "job_title_short": "Senior Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "126000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 49108,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "125654.5",
    "skills": "sql"
  },
  {
    "job_id": 49108,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "125654.5",
    "skills": "snowflake"
  },
  {
    "job_id": 748965,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "125500.0",
    "skills": "r"
  },
  {
    "job_id": 748965,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "125500.0",
    "skills": "python"
  },
  {
    "job_id": 802673,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "125500.0",
    "skills": "sql"
  },
  {
    "job_id": 748965,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "125500.0",
    "skills": "go"
  },
  {
    "job_id": 748965,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "125500.0",
    "skills": "sql"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "bash"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "excel"
  },
  {
    "job_id": 400967,
    "job_title_short": "Data Analyst",
    "company_name": "PWR Staffing & Recruiting",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "spss"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "spss"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_id": 285447,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "125000.0",
    "skills": "flow"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_id": 595967,
    "job_title_short": "Data Analyst",
    "company_name": "Starbridge Partners",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "shell"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "databricks"
  },
  {
    "job_id": 595967,
    "job_title_short": "Data Analyst",
    "company_name": "Starbridge Partners",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_id": 1001569,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "125000.0",
    "skills": "tableau"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "tableau"
  },
  {
    "job_id": 595967,
    "job_title_short": "Data Analyst",
    "company_name": "Starbridge Partners",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_id": 595967,
    "job_title_short": "Data Analyst",
    "company_name": "Starbridge Partners",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "javascript"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_id": 595967,
    "job_title_short": "Data Analyst",
    "company_name": "Starbridge Partners",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "spark"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "jupyter"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "spark"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_id": 1001569,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "airflow"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "redshift"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "matlab"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "r"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "looker"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1001569,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "125000.0",
    "skills": "excel"
  },
  {
    "job_id": 900945,
    "job_title_short": "Data Analyst",
    "company_name": "The Walt Disney Company",
    "salary_year_avg": "125000.0",
    "skills": "python"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "postgresql"
  },
  {
    "job_id": 1001569,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "sas"
  },
  {
    "job_id": 828525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "LTIMindtree",
    "salary_year_avg": "125000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1216840,
    "job_title_short": "Data Analyst",
    "company_name": "hims & hers",
    "salary_year_avg": "125000.0",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "125000.0",
    "skills": "airflow"
  },
  {
    "job_id": 1682817,
    "job_title_short": "Data Analyst",
    "company_name": "Blackstone Consulting, Inc.",
    "salary_year_avg": "124500.0",
    "skills": "excel"
  },
  {
    "job_id": 1682817,
    "job_title_short": "Data Analyst",
    "company_name": "Blackstone Consulting, Inc.",
    "salary_year_avg": "124500.0",
    "skills": "microsoft teams"
  },
  {
    "job_id": 1682817,
    "job_title_short": "Data Analyst",
    "company_name": "Blackstone Consulting, Inc.",
    "salary_year_avg": "124500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1682817,
    "job_title_short": "Data Analyst",
    "company_name": "Blackstone Consulting, Inc.",
    "salary_year_avg": "124500.0",
    "skills": "word"
  },
  {
    "job_id": 1682817,
    "job_title_short": "Data Analyst",
    "company_name": "Blackstone Consulting, Inc.",
    "salary_year_avg": "124500.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1682817,
    "job_title_short": "Data Analyst",
    "company_name": "Blackstone Consulting, Inc.",
    "salary_year_avg": "124500.0",
    "skills": "power bi"
  },
  {
    "job_id": 326486,
    "job_title_short": "Senior Data Analyst",
    "company_name": "City National Bank",
    "salary_year_avg": "124497.0",
    "skills": "flow"
  },
  {
    "job_id": 809426,
    "job_title_short": "Senior Data Analyst",
    "company_name": "City National Bank",
    "salary_year_avg": "124497.0",
    "skills": "flow"
  },
  {
    "job_id": 821092,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "124000.0",
    "skills": "tableau"
  },
  {
    "job_id": 821092,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "124000.0",
    "skills": "python"
  },
  {
    "job_id": 821092,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "124000.0",
    "skills": "r"
  },
  {
    "job_id": 821092,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "124000.0",
    "skills": "looker"
  },
  {
    "job_id": 821092,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "124000.0",
    "skills": "sql"
  },
  {
    "job_id": 238020,
    "job_title_short": "Data Analyst",
    "company_name": "Innova Solutions",
    "salary_year_avg": "122500.0",
    "skills": "aws"
  },
  {
    "job_id": 238020,
    "job_title_short": "Data Analyst",
    "company_name": "Innova Solutions",
    "salary_year_avg": "122500.0",
    "skills": "sql"
  },
  {
    "job_id": 238020,
    "job_title_short": "Data Analyst",
    "company_name": "Innova Solutions",
    "salary_year_avg": "122500.0",
    "skills": "confluence"
  },
  {
    "job_id": 95882,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tripadvisor",
    "salary_year_avg": "122500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 95882,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tripadvisor",
    "salary_year_avg": "122500.0",
    "skills": "tableau"
  },
  {
    "job_id": 95882,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tripadvisor",
    "salary_year_avg": "122500.0",
    "skills": "sql"
  },
  {
    "job_id": 95882,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tripadvisor",
    "salary_year_avg": "122500.0",
    "skills": "python"
  },
  {
    "job_id": 238020,
    "job_title_short": "Data Analyst",
    "company_name": "Innova Solutions",
    "salary_year_avg": "122500.0",
    "skills": "jira"
  },
  {
    "job_id": 95882,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tripadvisor",
    "salary_year_avg": "122500.0",
    "skills": "r"
  },
  {
    "job_id": 426033,
    "job_title_short": "Data Analyst",
    "company_name": "CloudFlare",
    "salary_year_avg": "122000.0",
    "skills": "sql"
  },
  {
    "job_id": 1010804,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Grow Therapy",
    "salary_year_avg": "122000.0",
    "skills": "looker"
  },
  {
    "job_id": 298860,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "122000.0",
    "skills": "sheets"
  },
  {
    "job_id": 426033,
    "job_title_short": "Data Analyst",
    "company_name": "CloudFlare",
    "salary_year_avg": "122000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1010804,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Grow Therapy",
    "salary_year_avg": "122000.0",
    "skills": "python"
  },
  {
    "job_id": 426033,
    "job_title_short": "Data Analyst",
    "company_name": "CloudFlare",
    "salary_year_avg": "122000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 298860,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "122000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 298860,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "122000.0",
    "skills": "sql"
  },
  {
    "job_id": 426033,
    "job_title_short": "Data Analyst",
    "company_name": "CloudFlare",
    "salary_year_avg": "122000.0",
    "skills": "sheets"
  },
  {
    "job_id": 298860,
    "job_title_short": "Data Analyst",
    "company_name": "Cloudflare",
    "salary_year_avg": "122000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1010804,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Grow Therapy",
    "salary_year_avg": "122000.0",
    "skills": "sql"
  },
  {
    "job_id": 1180967,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "120000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 20466,
    "job_title_short": "Senior Data Analyst",
    "company_name": "firsthand Health Inc",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 236172,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "120000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 20466,
    "job_title_short": "Senior Data Analyst",
    "company_name": "firsthand Health Inc",
    "salary_year_avg": "120000.0",
    "skills": "power bi"
  },
  {
    "job_id": 236172,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1611348,
    "job_title_short": "Data Analyst",
    "company_name": "M13",
    "salary_year_avg": "120000.0",
    "skills": "sas"
  },
  {
    "job_id": 1111785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "python"
  },
  {
    "job_id": 1180967,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "120000.0",
    "skills": "oracle"
  },
  {
    "job_id": 236172,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "120000.0",
    "skills": "visio"
  },
  {
    "job_id": 20466,
    "job_title_short": "Senior Data Analyst",
    "company_name": "firsthand Health Inc",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1191992,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 1611348,
    "job_title_short": "Data Analyst",
    "company_name": "M13",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 20466,
    "job_title_short": "Senior Data Analyst",
    "company_name": "firsthand Health Inc",
    "salary_year_avg": "120000.0",
    "skills": "looker"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "word"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "excel"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "jira"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "confluence"
  },
  {
    "job_id": 480091,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Super.com",
    "salary_year_avg": "120000.0",
    "skills": "python"
  },
  {
    "job_id": 1180967,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 1111785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "r"
  },
  {
    "job_id": 1191992,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "120000.0",
    "skills": "power bi"
  },
  {
    "job_id": 236172,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "120000.0",
    "skills": "outlook"
  },
  {
    "job_id": 236172,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "120000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1180967,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "120000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1611348,
    "job_title_short": "Data Analyst",
    "company_name": "M13",
    "salary_year_avg": "120000.0",
    "skills": "sas"
  },
  {
    "job_id": 1111785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 480091,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Super.com",
    "salary_year_avg": "120000.0",
    "skills": "looker"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "go"
  },
  {
    "job_id": 1191992,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_id": 480091,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Super.com",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "tableau"
  },
  {
    "job_id": 236172,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "120000.0",
    "skills": "power bi"
  },
  {
    "job_id": 480091,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Super.com",
    "salary_year_avg": "120000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1611348,
    "job_title_short": "Data Analyst",
    "company_name": "M13",
    "salary_year_avg": "120000.0",
    "skills": "spss"
  },
  {
    "job_id": 1180967,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Kforce Technology Staffing",
    "salary_year_avg": "120000.0",
    "skills": "python"
  },
  {
    "job_id": 236172,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "120000.0",
    "skills": "excel"
  },
  {
    "job_id": 1611348,
    "job_title_short": "Data Analyst",
    "company_name": "M13",
    "salary_year_avg": "120000.0",
    "skills": "r"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "sql"
  },
  {
    "job_id": 999820,
    "job_title_short": "Data Analyst",
    "company_name": "LAI",
    "salary_year_avg": "120000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 1132443,
    "job_title_short": "Data Analyst",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "salary_year_avg": "119908.0",
    "skills": "python"
  },
  {
    "job_id": 1132443,
    "job_title_short": "Data Analyst",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "salary_year_avg": "119908.0",
    "skills": "vba"
  },
  {
    "job_id": 1132443,
    "job_title_short": "Data Analyst",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "salary_year_avg": "119908.0",
    "skills": "tableau"
  },
  {
    "job_id": 1132443,
    "job_title_short": "Data Analyst",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "salary_year_avg": "119908.0",
    "skills": "power bi"
  },
  {
    "job_id": 968889,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "119500.0",
    "skills": "jira"
  },
  {
    "job_id": 968889,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "119500.0",
    "skills": "tableau"
  },
  {
    "job_id": 968889,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "119500.0",
    "skills": "power bi"
  },
  {
    "job_id": 876656,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "tableau"
  },
  {
    "job_id": 446029,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "tableau"
  },
  {
    "job_id": 446029,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "sql"
  },
  {
    "job_id": 446029,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "hadoop"
  },
  {
    "job_id": 876656,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "hadoop"
  },
  {
    "job_id": 876656,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "sql"
  },
  {
    "job_id": 446029,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "python"
  },
  {
    "job_id": 876656,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "119200.0",
    "skills": "python"
  },
  {
    "job_id": 945180,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "117713.0",
    "skills": "ms access"
  },
  {
    "job_id": 945180,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "117713.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 945180,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "117713.0",
    "skills": "word"
  },
  {
    "job_id": 945180,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "117713.0",
    "skills": "tableau"
  },
  {
    "job_id": 945180,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "117713.0",
    "skills": "excel"
  },
  {
    "job_id": 685438,
    "job_title_short": "Data Analyst",
    "company_name": "Jobot",
    "salary_year_avg": "117500.0",
    "skills": "sql"
  },
  {
    "job_id": 436153,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "117500.0",
    "skills": "sql"
  },
  {
    "job_id": 436153,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "117500.0",
    "skills": "python"
  },
  {
    "job_id": 1124418,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "117500.0",
    "skills": "sql server"
  },
  {
    "job_id": 1124418,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "117500.0",
    "skills": "python"
  },
  {
    "job_id": 685438,
    "job_title_short": "Data Analyst",
    "company_name": "Jobot",
    "salary_year_avg": "117500.0",
    "skills": "tableau"
  },
  {
    "job_id": 436153,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "117500.0",
    "skills": "go"
  },
  {
    "job_id": 1124418,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "117500.0",
    "skills": "sql"
  },
  {
    "job_id": 685438,
    "job_title_short": "Data Analyst",
    "company_name": "Jobot",
    "salary_year_avg": "117500.0",
    "skills": "python"
  },
  {
    "job_id": 436153,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "117500.0",
    "skills": "c"
  },
  {
    "job_id": 436153,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "117500.0",
    "skills": "sql server"
  },
  {
    "job_id": 131427,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "117000.0",
    "skills": "sql"
  },
  {
    "job_id": 131427,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "117000.0",
    "skills": "looker"
  },
  {
    "job_id": 131427,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "117000.0",
    "skills": "python"
  },
  {
    "job_id": 131427,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "117000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1788827,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "excel"
  },
  {
    "job_id": 1788827,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_id": 1574716,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "excel"
  },
  {
    "job_id": 1574716,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sql"
  },
  {
    "job_id": 1788827,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sql"
  },
  {
    "job_id": 1788827,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_id": 16358,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_id": 1574716,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_id": 16358,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_id": 1574716,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sas"
  },
  {
    "job_id": 16358,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "sql"
  },
  {
    "job_id": 16358,
    "job_title_short": "Data Analyst",
    "company_name": "Kern Health Systems",
    "salary_year_avg": "115791.5",
    "skills": "excel"
  },
  {
    "job_id": 1253710,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Mercury Insurance",
    "salary_year_avg": "115697.5",
    "skills": "sas"
  },
  {
    "job_id": 1253710,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Mercury Insurance",
    "salary_year_avg": "115697.5",
    "skills": "sql"
  },
  {
    "job_id": 1253710,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Mercury Insurance",
    "salary_year_avg": "115697.5",
    "skills": "r"
  },
  {
    "job_id": 1253710,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Mercury Insurance",
    "salary_year_avg": "115697.5",
    "skills": "sas"
  },
  {
    "job_id": 1253710,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Mercury Insurance",
    "salary_year_avg": "115697.5",
    "skills": "python"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "spreadsheet"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "go"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "sheets"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "word"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "windows"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "sas"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "spss"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "r"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "excel"
  },
  {
    "job_id": 21145,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "115442.5",
    "skills": "sas"
  },
  {
    "job_id": 357990,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "azure"
  },
  {
    "job_id": 1772547,
    "job_title_short": "Data Analyst",
    "company_name": "Medasource",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "outlook"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "r"
  },
  {
    "job_id": 51425,
    "job_title_short": "Senior Data Analyst",
    "company_name": "New Directions Staffing",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 24351,
    "job_title_short": "Data Analyst",
    "company_name": "ManyPets",
    "salary_year_avg": "115000.0",
    "skills": "excel"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "vba"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "looker"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "sas"
  },
  {
    "job_id": 1403108,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 51425,
    "job_title_short": "Senior Data Analyst",
    "company_name": "New Directions Staffing",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "power bi"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_id": 1403108,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_id": 357990,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "oracle"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "spark"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "redshift"
  },
  {
    "job_id": 357990,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_id": 51425,
    "job_title_short": "Senior Data Analyst",
    "company_name": "New Directions Staffing",
    "salary_year_avg": "115000.0",
    "skills": "redshift"
  },
  {
    "job_id": 24351,
    "job_title_short": "Data Analyst",
    "company_name": "ManyPets",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 198747,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "aws"
  },
  {
    "job_id": 357990,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "aws"
  },
  {
    "job_id": 357990,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "power bi"
  },
  {
    "job_id": 51425,
    "job_title_short": "Senior Data Analyst",
    "company_name": "New Directions Staffing",
    "salary_year_avg": "115000.0",
    "skills": "aws"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 51425,
    "job_title_short": "Senior Data Analyst",
    "company_name": "New Directions Staffing",
    "salary_year_avg": "115000.0",
    "skills": "nosql"
  },
  {
    "job_id": 357990,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "databricks"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "scala"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 1772547,
    "job_title_short": "Data Analyst",
    "company_name": "Medasource",
    "salary_year_avg": "115000.0",
    "skills": "excel"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "python"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1772547,
    "job_title_short": "Data Analyst",
    "company_name": "Medasource",
    "salary_year_avg": "115000.0",
    "skills": "azure"
  },
  {
    "job_id": 51425,
    "job_title_short": "Senior Data Analyst",
    "company_name": "New Directions Staffing",
    "salary_year_avg": "115000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "excel"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "dax"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 907631,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "115000.0",
    "skills": "vba"
  },
  {
    "job_id": 51425,
    "job_title_short": "Senior Data Analyst",
    "company_name": "New Directions Staffing",
    "salary_year_avg": "115000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "sas"
  },
  {
    "job_id": 991556,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "115000.0",
    "skills": "word"
  },
  {
    "job_id": 907631,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "115000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 24351,
    "job_title_short": "Data Analyst",
    "company_name": "ManyPets",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "r"
  },
  {
    "job_id": 198747,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_id": 198747,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_id": 907631,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "sql"
  },
  {
    "job_id": 944145,
    "job_title_short": "Data Engineer",
    "company_name": "CyberCoders",
    "salary_year_avg": "115000.0",
    "skills": "word"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "r"
  },
  {
    "job_id": 1772547,
    "job_title_short": "Data Analyst",
    "company_name": "Medasource",
    "salary_year_avg": "115000.0",
    "skills": "sql server"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "excel"
  },
  {
    "job_id": 357990,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "115000.0",
    "skills": "sql server"
  },
  {
    "job_id": 751686,
    "job_title_short": "Senior Data Analyst",
    "company_name": "PlanHub",
    "salary_year_avg": "115000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1139755,
    "job_title_short": "Data Analyst",
    "company_name": "Lighthouse Professional Services",
    "salary_year_avg": "115000.0",
    "skills": "r"
  },
  {
    "job_id": 945577,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114956.5",
    "skills": "tableau"
  },
  {
    "job_id": 945577,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114956.5",
    "skills": "sas"
  },
  {
    "job_id": 945577,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114956.5",
    "skills": "sql"
  },
  {
    "job_id": 945577,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114956.5",
    "skills": "spss"
  },
  {
    "job_id": 945577,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114956.5",
    "skills": "r"
  },
  {
    "job_id": 945577,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114956.5",
    "skills": "python"
  },
  {
    "job_id": 945577,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114956.5",
    "skills": "sas"
  },
  {
    "job_id": 857003,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114805.0",
    "skills": "sql"
  },
  {
    "job_id": 857003,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114805.0",
    "skills": "sas"
  },
  {
    "job_id": 857003,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114805.0",
    "skills": "spss"
  },
  {
    "job_id": 857003,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114805.0",
    "skills": "r"
  },
  {
    "job_id": 857003,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114805.0",
    "skills": "python"
  },
  {
    "job_id": 857003,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114805.0",
    "skills": "tableau"
  },
  {
    "job_id": 857003,
    "job_title_short": "Data Analyst",
    "company_name": "ICF",
    "salary_year_avg": "114805.0",
    "skills": "sas"
  },
  {
    "job_id": 1566785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Toast",
    "salary_year_avg": "114500.0",
    "skills": "looker"
  },
  {
    "job_id": 1566785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Toast",
    "salary_year_avg": "114500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1566785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Toast",
    "salary_year_avg": "114500.0",
    "skills": "jira"
  },
  {
    "job_id": 1566785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Toast",
    "salary_year_avg": "114500.0",
    "skills": "asana"
  },
  {
    "job_id": 1566785,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Toast",
    "salary_year_avg": "114500.0",
    "skills": "sql"
  },
  {
    "job_id": 1050042,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "114000.0",
    "skills": "sql"
  },
  {
    "job_id": 1566879,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "114000.0",
    "skills": "sql"
  },
  {
    "job_id": 1050042,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "114000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1566879,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "114000.0",
    "skills": "python"
  },
  {
    "job_id": 1050042,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "114000.0",
    "skills": "databricks"
  },
  {
    "job_id": 1050042,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "114000.0",
    "skills": "looker"
  },
  {
    "job_id": 1050042,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "114000.0",
    "skills": "python"
  },
  {
    "job_id": 1050042,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "114000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1566879,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "114000.0",
    "skills": "looker"
  },
  {
    "job_id": 1566879,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "114000.0",
    "skills": "r"
  },
  {
    "job_id": 1050042,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "114000.0",
    "skills": "r"
  },
  {
    "job_id": 1566879,
    "job_title_short": "Data Analyst",
    "company_name": "Uber",
    "salary_year_avg": "114000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "python"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "oracle"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "sql"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "azure"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "db2"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1354909,
    "job_title_short": "Data Analyst",
    "company_name": "GEICO",
    "salary_year_avg": "113500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 248219,
    "job_title_short": "Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "112850.0",
    "skills": "python"
  },
  {
    "job_id": 248219,
    "job_title_short": "Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "112850.0",
    "skills": "looker"
  },
  {
    "job_id": 248219,
    "job_title_short": "Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "112850.0",
    "skills": "tableau"
  },
  {
    "job_id": 248219,
    "job_title_short": "Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "112850.0",
    "skills": "sql"
  },
  {
    "job_id": 248219,
    "job_title_short": "Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "112850.0",
    "skills": "go"
  },
  {
    "job_id": 248219,
    "job_title_short": "Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "112850.0",
    "skills": "c"
  },
  {
    "job_id": 248219,
    "job_title_short": "Data Analyst",
    "company_name": "Square",
    "salary_year_avg": "112850.0",
    "skills": "flow"
  },
  {
    "job_id": 236397,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "112661.0",
    "skills": "python"
  },
  {
    "job_id": 236397,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "112661.0",
    "skills": "tableau"
  },
  {
    "job_id": 236397,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "112661.0",
    "skills": "sql"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1728,
    "job_title_short": "Data Analyst",
    "company_name": "Segue Technologies Inc",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_id": 180955,
    "job_title_short": "Data Scientist",
    "company_name": "Integrity Consulting Engineering & Security Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "spss"
  },
  {
    "job_id": 576410,
    "job_title_short": "Data Analyst",
    "company_name": "UL Solutions",
    "salary_year_avg": "112500.0",
    "skills": "dax"
  },
  {
    "job_id": 84928,
    "job_title_short": "Data Analyst",
    "company_name": "Seneca Resources, LLC",
    "salary_year_avg": "112500.0",
    "skills": "linux"
  },
  {
    "job_id": 1006256,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "112500.0",
    "skills": "power bi"
  },
  {
    "job_id": 185960,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "r"
  },
  {
    "job_id": 185960,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "112500.0",
    "skills": "r"
  },
  {
    "job_id": 1728,
    "job_title_short": "Data Analyst",
    "company_name": "Segue Technologies Inc",
    "salary_year_avg": "112500.0",
    "skills": "nosql"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "excel"
  },
  {
    "job_id": 1006256,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "112500.0",
    "skills": "tableau"
  },
  {
    "job_id": 185960,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_id": 576410,
    "job_title_short": "Data Analyst",
    "company_name": "UL Solutions",
    "salary_year_avg": "112500.0",
    "skills": "excel"
  },
  {
    "job_id": 1006256,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "112500.0",
    "skills": "r"
  },
  {
    "job_id": 1006256,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_id": 1006256,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "112500.0",
    "skills": "python"
  },
  {
    "job_id": 180955,
    "job_title_short": "Data Scientist",
    "company_name": "Integrity Consulting Engineering & Security Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "spark"
  },
  {
    "job_id": 1728,
    "job_title_short": "Data Analyst",
    "company_name": "Segue Technologies Inc",
    "salary_year_avg": "112500.0",
    "skills": "excel"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "sqlite"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "sas"
  },
  {
    "job_id": 84928,
    "job_title_short": "Data Analyst",
    "company_name": "Seneca Resources, LLC",
    "salary_year_avg": "112500.0",
    "skills": "aws"
  },
  {
    "job_id": 1728,
    "job_title_short": "Data Analyst",
    "company_name": "Segue Technologies Inc",
    "salary_year_avg": "112500.0",
    "skills": "sql server"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "javascript"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "python"
  },
  {
    "job_id": 185960,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "112500.0",
    "skills": "looker"
  },
  {
    "job_id": 185960,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "112500.0",
    "skills": "python"
  },
  {
    "job_id": 1728,
    "job_title_short": "Data Analyst",
    "company_name": "Segue Technologies Inc",
    "salary_year_avg": "112500.0",
    "skills": "aws"
  },
  {
    "job_id": 1728,
    "job_title_short": "Data Analyst",
    "company_name": "Segue Technologies Inc",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "sql"
  },
  {
    "job_id": 71065,
    "job_title_short": "Data Analyst",
    "company_name": "Paratus Solutions LLC",
    "salary_year_avg": "112500.0",
    "skills": "sas"
  },
  {
    "job_id": 147455,
    "job_title_short": "Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "112050.0",
    "skills": "looker"
  },
  {
    "job_id": 147455,
    "job_title_short": "Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "112050.0",
    "skills": "excel"
  },
  {
    "job_id": 147455,
    "job_title_short": "Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "112050.0",
    "skills": "tableau"
  },
  {
    "job_id": 147455,
    "job_title_short": "Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "112050.0",
    "skills": "oracle"
  },
  {
    "job_id": 147455,
    "job_title_short": "Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "112050.0",
    "skills": "sql"
  },
  {
    "job_id": 147455,
    "job_title_short": "Data Analyst",
    "company_name": "Cisco Meraki",
    "salary_year_avg": "112050.0",
    "skills": "sap"
  },
  {
    "job_id": 200335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications, Inc.",
    "salary_year_avg": "112000.0",
    "skills": "sql"
  },
  {
    "job_id": 200335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications, Inc.",
    "salary_year_avg": "112000.0",
    "skills": "zoom"
  },
  {
    "job_id": 200335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications, Inc.",
    "salary_year_avg": "112000.0",
    "skills": "python"
  },
  {
    "job_id": 200335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications, Inc.",
    "salary_year_avg": "112000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 200335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Zoom Video Communications, Inc.",
    "salary_year_avg": "112000.0",
    "skills": "pandas"
  },
  {
    "job_id": 958872,
    "job_title_short": "Data Analyst",
    "company_name": "IBM",
    "salary_year_avg": "111500.0",
    "skills": "jira"
  },
  {
    "job_id": 958872,
    "job_title_short": "Data Analyst",
    "company_name": "IBM",
    "salary_year_avg": "111500.0",
    "skills": "python"
  },
  {
    "job_id": 958872,
    "job_title_short": "Data Analyst",
    "company_name": "IBM",
    "salary_year_avg": "111500.0",
    "skills": "ibm cloud"
  },
  {
    "job_id": 958872,
    "job_title_short": "Data Analyst",
    "company_name": "IBM",
    "salary_year_avg": "111500.0",
    "skills": "tableau"
  },
  {
    "job_id": 958872,
    "job_title_short": "Data Analyst",
    "company_name": "IBM",
    "salary_year_avg": "111500.0",
    "skills": "sql"
  },
  {
    "job_id": 958872,
    "job_title_short": "Data Analyst",
    "company_name": "IBM",
    "salary_year_avg": "111500.0",
    "skills": "azure"
  },
  {
    "job_id": 321727,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1734650,
    "job_title_short": "Senior Data Analyst",
    "company_name": "HyreCar",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_id": 98712,
    "job_title_short": "Data Scientist",
    "company_name": "NFT Text Inc.",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1253476,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1434170,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1352061,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Hubstaff",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1490432,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 409831,
    "job_title_short": "Data Analyst",
    "company_name": "Trinity Solar Careers",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1434170,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_id": 1734650,
    "job_title_short": "Senior Data Analyst",
    "company_name": "HyreCar",
    "salary_year_avg": "110000.0",
    "skills": "jupyter"
  },
  {
    "job_id": 1210470,
    "job_title_short": "Data Analyst",
    "company_name": "Convergenz",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_id": 894317,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_id": 1352061,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Hubstaff",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 321727,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1210470,
    "job_title_short": "Data Analyst",
    "company_name": "Convergenz",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1814437,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 774244,
    "job_title_short": "Data Scientist",
    "company_name": "Elentic Technology Solutions",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 409831,
    "job_title_short": "Data Analyst",
    "company_name": "Trinity Solar Careers",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1490432,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 774244,
    "job_title_short": "Data Scientist",
    "company_name": "Elentic Technology Solutions",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_id": 409831,
    "job_title_short": "Data Analyst",
    "company_name": "Trinity Solar Careers",
    "salary_year_avg": "110000.0",
    "skills": "ssis"
  },
  {
    "job_id": 1814437,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "110000.0",
    "skills": "power bi"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1210470,
    "job_title_short": "Data Analyst",
    "company_name": "Convergenz",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "ssis"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "aws"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "ssis"
  },
  {
    "job_id": 1047698,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "aws"
  },
  {
    "job_id": 98712,
    "job_title_short": "Data Scientist",
    "company_name": "NFT Text Inc.",
    "salary_year_avg": "110000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1734650,
    "job_title_short": "Senior Data Analyst",
    "company_name": "HyreCar",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_id": 1734650,
    "job_title_short": "Senior Data Analyst",
    "company_name": "HyreCar",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 894317,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1734650,
    "job_title_short": "Senior Data Analyst",
    "company_name": "HyreCar",
    "salary_year_avg": "110000.0",
    "skills": "databricks"
  },
  {
    "job_id": 774244,
    "job_title_short": "Data Scientist",
    "company_name": "Elentic Technology Solutions",
    "salary_year_avg": "110000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 98712,
    "job_title_short": "Data Scientist",
    "company_name": "NFT Text Inc.",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1403636,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 1490432,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 1490432,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "flow"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "databricks"
  },
  {
    "job_id": 321727,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 925667,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Angi",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 991817,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 446319,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "110000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1434170,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1403636,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "dax"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "azure"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "azure"
  },
  {
    "job_id": 1814437,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "110000.0",
    "skills": "r"
  },
  {
    "job_id": 1253476,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "dax"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "r"
  },
  {
    "job_id": 409831,
    "job_title_short": "Data Analyst",
    "company_name": "Trinity Solar Careers",
    "salary_year_avg": "110000.0",
    "skills": "dax"
  },
  {
    "job_id": 1210470,
    "job_title_short": "Data Analyst",
    "company_name": "Convergenz",
    "salary_year_avg": "110000.0",
    "skills": "r"
  },
  {
    "job_id": 409831,
    "job_title_short": "Data Analyst",
    "company_name": "Trinity Solar Careers",
    "salary_year_avg": "110000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1403636,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1434170,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "word"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1253476,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1434170,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "word"
  },
  {
    "job_id": 321727,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "word"
  },
  {
    "job_id": 98712,
    "job_title_short": "Data Scientist",
    "company_name": "NFT Text Inc.",
    "salary_year_avg": "110000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1352061,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Hubstaff",
    "salary_year_avg": "110000.0",
    "skills": "looker"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "jira"
  },
  {
    "job_id": 1352061,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Hubstaff",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1210470,
    "job_title_short": "Data Analyst",
    "company_name": "Convergenz",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1047698,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 774244,
    "job_title_short": "Data Scientist",
    "company_name": "Elentic Technology Solutions",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1434170,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 412163,
    "job_title_short": "Data Analyst",
    "company_name": "Apex Systems",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1734650,
    "job_title_short": "Senior Data Analyst",
    "company_name": "HyreCar",
    "salary_year_avg": "110000.0",
    "skills": "r"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 321727,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_id": 774244,
    "job_title_short": "Data Scientist",
    "company_name": "Elentic Technology Solutions",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_id": 1210470,
    "job_title_short": "Data Analyst",
    "company_name": "Convergenz",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_id": 1490432,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1403636,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 446319,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "110000.0",
    "skills": "looker"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "vba"
  },
  {
    "job_id": 382334,
    "job_title_short": "Data Analyst",
    "company_name": "DNV",
    "salary_year_avg": "110000.0",
    "skills": "sas"
  },
  {
    "job_id": 409831,
    "job_title_short": "Data Analyst",
    "company_name": "Trinity Solar Careers",
    "salary_year_avg": "110000.0",
    "skills": "excel"
  },
  {
    "job_id": 774244,
    "job_title_short": "Data Scientist",
    "company_name": "Elentic Technology Solutions",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1814437,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "110000.0",
    "skills": "sql"
  },
  {
    "job_id": 1253476,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "110000.0",
    "skills": "tableau"
  },
  {
    "job_id": 409831,
    "job_title_short": "Data Analyst",
    "company_name": "Trinity Solar Careers",
    "salary_year_avg": "110000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 1814437,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_id": 1734650,
    "job_title_short": "Senior Data Analyst",
    "company_name": "HyreCar",
    "salary_year_avg": "110000.0",
    "skills": "spark"
  },
  {
    "job_id": 1574686,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "110000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 480243,
    "job_title_short": "Data Analyst",
    "company_name": "Cava Connect",
    "salary_year_avg": "110000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 321727,
    "job_title_short": "Data Analyst",
    "company_name": "CREDITSERVE INC",
    "salary_year_avg": "110000.0",
    "skills": "python"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "python"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "bash"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "sql"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "sql server"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "javascript"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "flow"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "powershell"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "db2"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "oracle"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "java"
  },
  {
    "job_id": 991303,
    "job_title_short": "Data Analyst",
    "company_name": "Paradigm",
    "salary_year_avg": "109600.0",
    "skills": "shell"
  },
  {
    "job_id": 1420095,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tokio Marine North America Services",
    "salary_year_avg": "109000.0",
    "skills": "ssis"
  },
  {
    "job_id": 1420095,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tokio Marine North America Services",
    "salary_year_avg": "109000.0",
    "skills": "sql"
  },
  {
    "job_id": 1420095,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Tokio Marine North America Services",
    "salary_year_avg": "109000.0",
    "skills": "flow"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "r"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "sas"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1026200,
    "job_title_short": "Data Analyst",
    "company_name": "Rhino",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1310096,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "107500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "sas"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "word"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "aws"
  },
  {
    "job_id": 65900,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "107500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "python"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "html"
  },
  {
    "job_id": 1795029,
    "job_title_short": "Data Analyst",
    "company_name": "Dice",
    "salary_year_avg": "107500.0",
    "skills": "sap"
  },
  {
    "job_id": 1795029,
    "job_title_short": "Data Analyst",
    "company_name": "Dice",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_id": 1310096,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "107500.0",
    "skills": "dax"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "azure"
  },
  {
    "job_id": 1310096,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "107500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1026200,
    "job_title_short": "Data Analyst",
    "company_name": "Rhino",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1795029,
    "job_title_short": "Data Analyst",
    "company_name": "Dice",
    "salary_year_avg": "107500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1795029,
    "job_title_short": "Data Analyst",
    "company_name": "Dice",
    "salary_year_avg": "107500.0",
    "skills": "python"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "r"
  },
  {
    "job_id": 1026200,
    "job_title_short": "Data Analyst",
    "company_name": "Rhino",
    "salary_year_avg": "107500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "outlook"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "python"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "tableau"
  },
  {
    "job_id": 600392,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_id": 65900,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_id": 1119269,
    "job_title_short": "Data Analyst",
    "company_name": "CODING DOJO INC.",
    "salary_year_avg": "107500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1310096,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "107500.0",
    "skills": "sql"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "sql server"
  },
  {
    "job_id": 255533,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "107500.0",
    "skills": "excel"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "r"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "numpy"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "pandas"
  },
  {
    "job_id": 110542,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "106800.0",
    "skills": "sas"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "tableau"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "python"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "git"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "looker"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "airflow"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "sql"
  },
  {
    "job_id": 1015618,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Codecademy (a Skillsoft company)",
    "salary_year_avg": "106800.0",
    "skills": "jira"
  },
  {
    "job_id": 110542,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "106800.0",
    "skills": "sas"
  },
  {
    "job_id": 110542,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "106800.0",
    "skills": "excel"
  },
  {
    "job_id": 798305,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "106661.5",
    "skills": "sql"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "numpy"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "pandas"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "alteryx"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "python"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "r"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "sql"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "tableau"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "scikit-learn"
  },
  {
    "job_id": 107274,
    "job_title_short": "Data Analyst",
    "company_name": "Cherry Bekaert Advisory, LLC",
    "salary_year_avg": "106562.5",
    "skills": "power bi"
  },
  {
    "job_id": 55833,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "excel"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "python"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "spss"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "spss"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "snowflake"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "sql"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "tableau"
  },
  {
    "job_id": 55833,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 55833,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "vba"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "python"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_id": 55833,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "word"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "r"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "oracle"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "tableau"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "snowflake"
  },
  {
    "job_id": 617583,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "sql"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "oracle"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "sas"
  },
  {
    "job_id": 228239,
    "job_title_short": "Data Analyst",
    "company_name": "Edward Jones",
    "salary_year_avg": "106479.0",
    "skills": "r"
  },
  {
    "job_id": 800017,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "tableau"
  },
  {
    "job_id": 800017,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "sql"
  },
  {
    "job_id": 1454946,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "sql"
  },
  {
    "job_id": 800017,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "git"
  },
  {
    "job_id": 800017,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "python"
  },
  {
    "job_id": 1454946,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "looker"
  },
  {
    "job_id": 800017,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 800017,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "excel"
  },
  {
    "job_id": 1454946,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1454946,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "106000.0",
    "skills": "excel"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "redshift"
  },
  {
    "job_id": 1309967,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "sas"
  },
  {
    "job_id": 936268,
    "job_title_short": "Data Analyst",
    "company_name": "Syndicatebleu",
    "salary_year_avg": "105000.0",
    "skills": "html"
  },
  {
    "job_id": 426601,
    "job_title_short": "Data Analyst",
    "company_name": "Syrup",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_id": 1069248,
    "job_title_short": "Data Analyst",
    "company_name": "Starr And Associates LLC",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_id": 426601,
    "job_title_short": "Data Analyst",
    "company_name": "Syrup",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 426601,
    "job_title_short": "Data Analyst",
    "company_name": "Syrup",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 1069248,
    "job_title_short": "Data Analyst",
    "company_name": "Starr And Associates LLC",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_id": 936268,
    "job_title_short": "Data Analyst",
    "company_name": "Syndicatebleu",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_id": 44786,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Star Cypress Partners",
    "salary_year_avg": "105000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1309967,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 1069248,
    "job_title_short": "Data Analyst",
    "company_name": "Starr And Associates LLC",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "sql server"
  },
  {
    "job_id": 426601,
    "job_title_short": "Data Analyst",
    "company_name": "Syrup",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1069248,
    "job_title_short": "Data Analyst",
    "company_name": "Starr And Associates LLC",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 936268,
    "job_title_short": "Data Analyst",
    "company_name": "Syndicatebleu",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 1091932,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1125527,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "ssis"
  },
  {
    "job_id": 371104,
    "job_title_short": "Data Analyst",
    "company_name": "Modis",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 44786,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Star Cypress Partners",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_id": 1125527,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 659525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 601788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1069248,
    "job_title_short": "Data Analyst",
    "company_name": "Starr And Associates LLC",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_id": 206038,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 1069248,
    "job_title_short": "Data Analyst",
    "company_name": "Starr And Associates LLC",
    "salary_year_avg": "105000.0",
    "skills": "qlik"
  },
  {
    "job_id": 44786,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Star Cypress Partners",
    "salary_year_avg": "105000.0",
    "skills": "word"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 659525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_id": 206038,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "looker"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "aws"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "qlik"
  },
  {
    "job_id": 206038,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_id": 601788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "power bi"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_id": 1309967,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "105000.0",
    "skills": "oracle"
  },
  {
    "job_id": 426601,
    "job_title_short": "Data Analyst",
    "company_name": "Syrup",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "r"
  },
  {
    "job_id": 1309967,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1091932,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "105000.0",
    "skills": "python"
  },
  {
    "job_id": 44786,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Star Cypress Partners",
    "salary_year_avg": "105000.0",
    "skills": "outlook"
  },
  {
    "job_id": 426601,
    "job_title_short": "Data Analyst",
    "company_name": "Syrup",
    "salary_year_avg": "105000.0",
    "skills": "spark"
  },
  {
    "job_id": 44786,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Star Cypress Partners",
    "salary_year_avg": "105000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 371104,
    "job_title_short": "Data Analyst",
    "company_name": "Modis",
    "salary_year_avg": "105000.0",
    "skills": "azure"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "oracle"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "microstrategy"
  },
  {
    "job_id": 936268,
    "job_title_short": "Data Analyst",
    "company_name": "Syndicatebleu",
    "salary_year_avg": "105000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1091932,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 601788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "html"
  },
  {
    "job_id": 426601,
    "job_title_short": "Data Analyst",
    "company_name": "Syrup",
    "salary_year_avg": "105000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 601788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_id": 1125527,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 936268,
    "job_title_short": "Data Analyst",
    "company_name": "Syndicatebleu",
    "salary_year_avg": "105000.0",
    "skills": "looker"
  },
  {
    "job_id": 206038,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 736610,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "105000.0",
    "skills": "sas"
  },
  {
    "job_id": 659525,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 1091932,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "105000.0",
    "skills": "sql"
  },
  {
    "job_id": 1344229,
    "job_title_short": "Data Analyst",
    "company_name": "Vista Global Solutions, LLC",
    "salary_year_avg": "105000.0",
    "skills": "excel"
  },
  {
    "job_id": 748403,
    "job_title_short": "Data Analyst",
    "company_name": "Pitney Bowes",
    "salary_year_avg": "104300.0",
    "skills": "excel"
  },
  {
    "job_id": 748403,
    "job_title_short": "Data Analyst",
    "company_name": "Pitney Bowes",
    "salary_year_avg": "104300.0",
    "skills": "tableau"
  },
  {
    "job_id": 748403,
    "job_title_short": "Data Analyst",
    "company_name": "Pitney Bowes",
    "salary_year_avg": "104300.0",
    "skills": "power bi"
  },
  {
    "job_id": 748403,
    "job_title_short": "Data Analyst",
    "company_name": "Pitney Bowes",
    "salary_year_avg": "104300.0",
    "skills": "go"
  },
  {
    "job_id": 380744,
    "job_title_short": "Data Analyst",
    "company_name": "Health Plan of San Mateo",
    "salary_year_avg": "104106.5",
    "skills": "word"
  },
  {
    "job_id": 380744,
    "job_title_short": "Data Analyst",
    "company_name": "Health Plan of San Mateo",
    "salary_year_avg": "104106.5",
    "skills": "sas"
  },
  {
    "job_id": 380744,
    "job_title_short": "Data Analyst",
    "company_name": "Health Plan of San Mateo",
    "salary_year_avg": "104106.5",
    "skills": "sas"
  },
  {
    "job_id": 380744,
    "job_title_short": "Data Analyst",
    "company_name": "Health Plan of San Mateo",
    "salary_year_avg": "104106.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 380744,
    "job_title_short": "Data Analyst",
    "company_name": "Health Plan of San Mateo",
    "salary_year_avg": "104106.5",
    "skills": "excel"
  },
  {
    "job_id": 380744,
    "job_title_short": "Data Analyst",
    "company_name": "Health Plan of San Mateo",
    "salary_year_avg": "104106.5",
    "skills": "spreadsheet"
  },
  {
    "job_id": 380744,
    "job_title_short": "Data Analyst",
    "company_name": "Health Plan of San Mateo",
    "salary_year_avg": "104106.5",
    "skills": "outlook"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "excel"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "tableau"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "qlik"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "sql"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "javascript"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "r"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "python"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "c++"
  },
  {
    "job_id": 909351,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "104000.0",
    "skills": "looker"
  },
  {
    "job_id": 1559111,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103500.0",
    "skills": "sql"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "oracle"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "python"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "python"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "ssis"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "tableau"
  },
  {
    "job_id": 707689,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "sql"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "sas"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "sql"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "sas"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "r"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "r"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "unix"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "windows"
  },
  {
    "job_id": 1667594,
    "job_title_short": "Data Analyst",
    "company_name": "AIDS Healthcare Foundation",
    "salary_year_avg": "103000.0",
    "skills": "sql"
  },
  {
    "job_id": 13159,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "103000.0",
    "skills": "excel"
  },
  {
    "job_id": 523374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "job_id": 523374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "102500.0",
    "skills": "javascript"
  },
  {
    "job_id": 620917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gannett",
    "salary_year_avg": "102500.0",
    "skills": "tableau"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "confluence"
  },
  {
    "job_id": 523374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "102500.0",
    "skills": "tableau"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "jira"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "github"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "flow"
  },
  {
    "job_id": 620917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gannett",
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "job_id": 949643,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102500.0",
    "skills": "tableau"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "jenkins"
  },
  {
    "job_id": 620917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gannett",
    "salary_year_avg": "102500.0",
    "skills": "datarobot"
  },
  {
    "job_id": 620917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gannett",
    "salary_year_avg": "102500.0",
    "skills": "looker"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "bash"
  },
  {
    "job_id": 949643,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "spark"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "gcp"
  },
  {
    "job_id": 535535,
    "job_title_short": "Data Analyst",
    "company_name": "Orion Groups",
    "salary_year_avg": "102500.0",
    "skills": "python"
  },
  {
    "job_id": 949643,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102500.0",
    "skills": "power bi"
  },
  {
    "job_id": 620917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Gannett",
    "salary_year_avg": "102500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1277458,
    "job_title_short": "Data Analyst",
    "company_name": "ZipRecruiter",
    "salary_year_avg": "102250.0",
    "skills": "python"
  },
  {
    "job_id": 1277458,
    "job_title_short": "Data Analyst",
    "company_name": "ZipRecruiter",
    "salary_year_avg": "102250.0",
    "skills": "sql"
  },
  {
    "job_id": 1749337,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "excel"
  },
  {
    "job_id": 4420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "redshift"
  },
  {
    "job_id": 310259,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "r"
  },
  {
    "job_id": 1526567,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_id": 4420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "aws"
  },
  {
    "job_id": 1378977,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_id": 4420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1046940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1046940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "jira"
  },
  {
    "job_id": 1749337,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_id": 1201885,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "excel"
  },
  {
    "job_id": 1046940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "zoom"
  },
  {
    "job_id": 4420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1749337,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "sap"
  },
  {
    "job_id": 1526567,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "excel"
  },
  {
    "job_id": 1046940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "nosql"
  },
  {
    "job_id": 4420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_id": 1046940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "slack"
  },
  {
    "job_id": 310259,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "python"
  },
  {
    "job_id": 1378977,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "excel"
  },
  {
    "job_id": 1046940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "sql"
  },
  {
    "job_id": 4420,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "102000.0",
    "skills": "python"
  },
  {
    "job_id": 686507,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "azure"
  },
  {
    "job_id": 1690940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "iSeatz",
    "salary_year_avg": "101500.0",
    "skills": "postgresql"
  },
  {
    "job_id": 1592896,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "excel"
  },
  {
    "job_id": 1690940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "iSeatz",
    "salary_year_avg": "101500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1592896,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "word"
  },
  {
    "job_id": 1440,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "sql"
  },
  {
    "job_id": 1234973,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1440,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "excel"
  },
  {
    "job_id": 1234973,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "sql"
  },
  {
    "job_id": 1690940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "iSeatz",
    "salary_year_avg": "101500.0",
    "skills": "looker"
  },
  {
    "job_id": 1690940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "iSeatz",
    "salary_year_avg": "101500.0",
    "skills": "python"
  },
  {
    "job_id": 1690940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "iSeatz",
    "salary_year_avg": "101500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1690940,
    "job_title_short": "Senior Data Analyst",
    "company_name": "iSeatz",
    "salary_year_avg": "101500.0",
    "skills": "express"
  },
  {
    "job_id": 1234973,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "confluence"
  },
  {
    "job_id": 686507,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "python"
  },
  {
    "job_id": 1592896,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 686507,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "sql"
  },
  {
    "job_id": 1234973,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "jira"
  },
  {
    "job_id": 1234973,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 686507,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101500.0",
    "skills": "r"
  },
  {
    "job_id": 938135,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101000.0",
    "skills": "tableau"
  },
  {
    "job_id": 938135,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101000.0",
    "skills": "vba"
  },
  {
    "job_id": 938135,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101000.0",
    "skills": "excel"
  },
  {
    "job_id": 938135,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 938135,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "101000.0",
    "skills": "sql"
  },
  {
    "job_id": 1655315,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "100500.0",
    "skills": "r"
  },
  {
    "job_id": 1655315,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "100500.0",
    "skills": "python"
  },
  {
    "job_id": 1655315,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "100500.0",
    "skills": "sql"
  },
  {
    "job_id": 1655315,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "100500.0",
    "skills": "github"
  },
  {
    "job_id": 159676,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "tableau"
  },
  {
    "job_id": 838504,
    "job_title_short": "Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "c#"
  },
  {
    "job_id": 1519017,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "sql"
  },
  {
    "job_id": 136192,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "sas"
  },
  {
    "job_id": 1519017,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "word"
  },
  {
    "job_id": 838504,
    "job_title_short": "Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "sql server"
  },
  {
    "job_id": 136192,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "go"
  },
  {
    "job_id": 838504,
    "job_title_short": "Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "github"
  },
  {
    "job_id": 838504,
    "job_title_short": "Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "sql"
  },
  {
    "job_id": 1519017,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "ms access"
  },
  {
    "job_id": 1519017,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "outlook"
  },
  {
    "job_id": 159676,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "word"
  },
  {
    "job_id": 159676,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "outlook"
  },
  {
    "job_id": 136192,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "sas"
  },
  {
    "job_id": 838504,
    "job_title_short": "Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "ssrs"
  },
  {
    "job_id": 159676,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "sql"
  },
  {
    "job_id": 1519017,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "excel"
  },
  {
    "job_id": 838504,
    "job_title_short": "Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "ssis"
  },
  {
    "job_id": 1519017,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "visio"
  },
  {
    "job_id": 159676,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Optum",
    "salary_year_avg": "100400.0",
    "skills": "excel"
  },
  {
    "job_id": 1519017,
    "job_title_short": "Data Analyst",
    "company_name": "UnitedHealth Group",
    "salary_year_avg": "100400.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1296687,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "100250.0",
    "skills": "databricks"
  },
  {
    "job_id": 1296687,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "100250.0",
    "skills": "excel"
  },
  {
    "job_id": 1296687,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "100250.0",
    "skills": "sql"
  },
  {
    "job_id": 1296687,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "100250.0",
    "skills": "snowflake"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "tableau"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "qlik"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "c++"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "c"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "sql server"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "oracle"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "visio"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "sql"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "java"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "c#"
  },
  {
    "job_id": 262921,
    "job_title_short": "Data Analyst",
    "company_name": "SAIC",
    "salary_year_avg": "100000.5",
    "skills": "excel"
  },
  {
    "job_id": 175220,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RideCo",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_id": 736533,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "sap"
  },
  {
    "job_id": 1785328,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global Healthcare",
    "salary_year_avg": "100000.0",
    "skills": "qlik"
  },
  {
    "job_id": 327502,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 734020,
    "job_title_short": "Data Analyst",
    "company_name": "Govcio LLC",
    "salary_year_avg": "100000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 175220,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RideCo",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_id": 736533,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_id": 524146,
    "job_title_short": "Data Analyst",
    "company_name": "Hearth",
    "salary_year_avg": "100000.0",
    "skills": "r"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 43545,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 43545,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "r"
  },
  {
    "job_id": 1785328,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global Healthcare",
    "salary_year_avg": "100000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 43545,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "r"
  },
  {
    "job_id": 524146,
    "job_title_short": "Data Analyst",
    "company_name": "Hearth",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 1785328,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global Healthcare",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_id": 1331634,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "java"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 1331634,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_id": 491762,
    "job_title_short": "Senior Data Analyst",
    "company_name": "AscellaHealth",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 491762,
    "job_title_short": "Senior Data Analyst",
    "company_name": "AscellaHealth",
    "salary_year_avg": "100000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 309300,
    "job_title_short": "Data Analyst",
    "company_name": "Scaleai",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 1331634,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "r"
  },
  {
    "job_id": 43545,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "visio"
  },
  {
    "job_id": 43545,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_id": 736533,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 327502,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "100000.0",
    "skills": "go"
  },
  {
    "job_id": 309300,
    "job_title_short": "Data Analyst",
    "company_name": "Scaleai",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 491762,
    "job_title_short": "Senior Data Analyst",
    "company_name": "AscellaHealth",
    "salary_year_avg": "100000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1331634,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 175220,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RideCo",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 420972,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "looker"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "qlik"
  },
  {
    "job_id": 882690,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "sas"
  },
  {
    "job_id": 491762,
    "job_title_short": "Senior Data Analyst",
    "company_name": "AscellaHealth",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_id": 327502,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "100000.0",
    "skills": "sql server"
  },
  {
    "job_id": 309300,
    "job_title_short": "Data Analyst",
    "company_name": "Scaleai",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_id": 524146,
    "job_title_short": "Data Analyst",
    "company_name": "Hearth",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_id": 734020,
    "job_title_short": "Data Analyst",
    "company_name": "Govcio LLC",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 1331634,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "jira"
  },
  {
    "job_id": 175220,
    "job_title_short": "Senior Data Analyst",
    "company_name": "RideCo",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 491762,
    "job_title_short": "Senior Data Analyst",
    "company_name": "AscellaHealth",
    "salary_year_avg": "100000.0",
    "skills": "power bi"
  },
  {
    "job_id": 882690,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "excel"
  },
  {
    "job_id": 736533,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 524146,
    "job_title_short": "Data Analyst",
    "company_name": "Hearth",
    "salary_year_avg": "100000.0",
    "skills": "looker"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 524146,
    "job_title_short": "Data Analyst",
    "company_name": "Hearth",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1785328,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global Healthcare",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 327502,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "100000.0",
    "skills": "c"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 882690,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "sql"
  },
  {
    "job_id": 1280459,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "100000.0",
    "skills": "word"
  },
  {
    "job_id": 1331634,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "tableau"
  },
  {
    "job_id": 736533,
    "job_title_short": "Data Analyst",
    "company_name": "LHH",
    "salary_year_avg": "100000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1558309,
    "job_title_short": "Senior Data Analyst",
    "company_name": "KnowBe4",
    "salary_year_avg": "100000.0",
    "skills": "sas"
  },
  {
    "job_id": 327502,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "100000.0",
    "skills": "python"
  },
  {
    "job_id": 734020,
    "job_title_short": "Data Analyst",
    "company_name": "Govcio LLC",
    "salary_year_avg": "100000.0",
    "skills": "oracle"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "sas"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "spss"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "spreadsheet"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "r"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "python"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "sql"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "windows"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "word"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "sheets"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "oracle"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "sas"
  },
  {
    "job_id": 670899,
    "job_title_short": "Data Analyst",
    "company_name": "Calbright College",
    "salary_year_avg": "99746.90625",
    "skills": "excel"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "c++"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "c#"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "powershell"
  },
  {
    "job_id": 1064019,
    "job_title_short": "Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "sql"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "r"
  },
  {
    "job_id": 1064019,
    "job_title_short": "Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "r"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "java"
  },
  {
    "job_id": 1174052,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "databricks"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "aws"
  },
  {
    "job_id": 1174052,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "python"
  },
  {
    "job_id": 1064019,
    "job_title_short": "Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "python"
  },
  {
    "job_id": 1064019,
    "job_title_short": "Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "excel"
  },
  {
    "job_id": 1174052,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "sql"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "sql"
  },
  {
    "job_id": 1064019,
    "job_title_short": "Data Analyst",
    "company_name": "Ogletree Deakins",
    "salary_year_avg": "99500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1733276,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99500.0",
    "skills": "bash"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "ansible"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "vue.js"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "looker"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "sql"
  },
  {
    "job_id": 867791,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "99000.0",
    "skills": "excel"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "slack"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "tableau"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "gcp"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "flask"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "terraform"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "redis"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "docker"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "python"
  },
  {
    "job_id": 562125,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "99000.0",
    "skills": "r"
  },
  {
    "job_id": 867791,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "99000.0",
    "skills": "sql"
  },
  {
    "job_id": 1332763,
    "job_title_short": "Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "sql"
  },
  {
    "job_id": 1723439,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "sql"
  },
  {
    "job_id": 1581636,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc",
    "salary_year_avg": "98800.0",
    "skills": "tableau"
  },
  {
    "job_id": 1332763,
    "job_title_short": "Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "looker"
  },
  {
    "job_id": 1581636,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc",
    "salary_year_avg": "98800.0",
    "skills": "sql"
  },
  {
    "job_id": 1332763,
    "job_title_short": "Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "python"
  },
  {
    "job_id": 239203,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "slack"
  },
  {
    "job_id": 1723439,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "tableau"
  },
  {
    "job_id": 1723439,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "slack"
  },
  {
    "job_id": 239203,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1332763,
    "job_title_short": "Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "r"
  },
  {
    "job_id": 1332763,
    "job_title_short": "Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "tableau"
  },
  {
    "job_id": 1581636,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc",
    "salary_year_avg": "98800.0",
    "skills": "redshift"
  },
  {
    "job_id": 239203,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "sql"
  },
  {
    "job_id": 1723439,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ad Hoc Team",
    "salary_year_avg": "98800.0",
    "skills": "redshift"
  },
  {
    "job_id": 284410,
    "job_title_short": "Data Analyst",
    "company_name": "Goldbelt, Inc.",
    "salary_year_avg": "98750.0",
    "skills": "sas"
  },
  {
    "job_id": 284410,
    "job_title_short": "Data Analyst",
    "company_name": "Goldbelt, Inc.",
    "salary_year_avg": "98750.0",
    "skills": "flow"
  },
  {
    "job_id": 284410,
    "job_title_short": "Data Analyst",
    "company_name": "Goldbelt, Inc.",
    "salary_year_avg": "98750.0",
    "skills": "sas"
  },
  {
    "job_id": 1149238,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "98500.0",
    "skills": "excel"
  },
  {
    "job_id": 1149238,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "98500.0",
    "skills": "r"
  },
  {
    "job_id": 1149238,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "98500.0",
    "skills": "sql"
  },
  {
    "job_id": 1149238,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "98500.0",
    "skills": "python"
  },
  {
    "job_id": 419550,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Equitable",
    "salary_year_avg": "98000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 117903,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "98000.0",
    "skills": "sql"
  },
  {
    "job_id": 419550,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Equitable",
    "salary_year_avg": "98000.0",
    "skills": "excel"
  },
  {
    "job_id": 117903,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "98000.0",
    "skills": "redshift"
  },
  {
    "job_id": 419550,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Equitable",
    "salary_year_avg": "98000.0",
    "skills": "sql"
  },
  {
    "job_id": 419550,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Equitable",
    "salary_year_avg": "98000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 117903,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "98000.0",
    "skills": "tableau"
  },
  {
    "job_id": 419550,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Equitable",
    "salary_year_avg": "98000.0",
    "skills": "python"
  },
  {
    "job_id": 419550,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Equitable",
    "salary_year_avg": "98000.0",
    "skills": "vba"
  },
  {
    "job_id": 1400824,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Cityblock Health",
    "salary_year_avg": "97517.5",
    "skills": "sql"
  },
  {
    "job_id": 1691565,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "sas"
  },
  {
    "job_id": 630777,
    "job_title_short": "Data Analyst",
    "company_name": "CRED iQ",
    "salary_year_avg": "97500.0",
    "skills": "word"
  },
  {
    "job_id": 630777,
    "job_title_short": "Data Analyst",
    "company_name": "CRED iQ",
    "salary_year_avg": "97500.0",
    "skills": "go"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "r"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "tableau"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "azure"
  },
  {
    "job_id": 1691565,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "power bi"
  },
  {
    "job_id": 630777,
    "job_title_short": "Data Analyst",
    "company_name": "CRED iQ",
    "salary_year_avg": "97500.0",
    "skills": "rust"
  },
  {
    "job_id": 1691565,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "97500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_id": 1714018,
    "job_title_short": "Data Analyst",
    "company_name": "Cognizant Technology Solutions",
    "salary_year_avg": "97500.0",
    "skills": "excel"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "r"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "flow"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "sas"
  },
  {
    "job_id": 630777,
    "job_title_short": "Data Analyst",
    "company_name": "CRED iQ",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "sas"
  },
  {
    "job_id": 1691565,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "97500.0",
    "skills": "tableau"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "flow"
  },
  {
    "job_id": 630777,
    "job_title_short": "Data Analyst",
    "company_name": "CRED iQ",
    "salary_year_avg": "97500.0",
    "skills": "excel"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "sas"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "tableau"
  },
  {
    "job_id": 630777,
    "job_title_short": "Data Analyst",
    "company_name": "CRED iQ",
    "salary_year_avg": "97500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "sql"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "power bi"
  },
  {
    "job_id": 571643,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_id": 1691565,
    "job_title_short": "Data Analyst",
    "company_name": "InvestM Technology LLC",
    "salary_year_avg": "97500.0",
    "skills": "r"
  },
  {
    "job_id": 630777,
    "job_title_short": "Data Analyst",
    "company_name": "CRED iQ",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "databricks"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "spark"
  },
  {
    "job_id": 1709335,
    "job_title_short": "Senior Data Analyst",
    "company_name": "CURO Financial Technologies Corporation",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1714018,
    "job_title_short": "Data Analyst",
    "company_name": "Cognizant Technology Solutions",
    "salary_year_avg": "97500.0",
    "skills": "flow"
  },
  {
    "job_id": 498516,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "97500.0",
    "skills": "python"
  },
  {
    "job_id": 35406,
    "job_title_short": "Data Analyst",
    "company_name": "Central California Alliance for Health (Remote)",
    "salary_year_avg": "97070.5",
    "skills": "sql"
  },
  {
    "job_id": 512472,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "97000.0",
    "skills": "sql"
  },
  {
    "job_id": 339556,
    "job_title_short": "Data Analyst",
    "company_name": "Driscoll's",
    "salary_year_avg": "97000.0",
    "skills": "flow"
  },
  {
    "job_id": 512472,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "97000.0",
    "skills": "looker"
  },
  {
    "job_id": 339556,
    "job_title_short": "Data Analyst",
    "company_name": "Driscoll's",
    "salary_year_avg": "97000.0",
    "skills": "sql"
  },
  {
    "job_id": 1299756,
    "job_title_short": "Data Analyst",
    "company_name": "Respawn Entertainment",
    "salary_year_avg": "96400.0",
    "skills": "power bi"
  },
  {
    "job_id": 1299756,
    "job_title_short": "Data Analyst",
    "company_name": "Respawn Entertainment",
    "salary_year_avg": "96400.0",
    "skills": "sql"
  },
  {
    "job_id": 417970,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "r"
  },
  {
    "job_id": 1786033,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "github"
  },
  {
    "job_id": 417970,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "redshift"
  },
  {
    "job_id": 417970,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "tableau"
  },
  {
    "job_id": 417970,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "python"
  },
  {
    "job_id": 1786033,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "sql"
  },
  {
    "job_id": 1786033,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "python"
  },
  {
    "job_id": 1786033,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "r"
  },
  {
    "job_id": 417970,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "looker"
  },
  {
    "job_id": 417970,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "96000.0",
    "skills": "sql"
  },
  {
    "job_id": 690084,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95900.0",
    "skills": "excel"
  },
  {
    "job_id": 1791218,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95700.0",
    "skills": "sql"
  },
  {
    "job_id": 1791218,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95700.0",
    "skills": "r"
  },
  {
    "job_id": 1791218,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95700.0",
    "skills": "python"
  },
  {
    "job_id": 1791218,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95700.0",
    "skills": "qlik"
  },
  {
    "job_id": 1791218,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95700.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1791218,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95700.0",
    "skills": "tableau"
  },
  {
    "job_id": 1791218,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95700.0",
    "skills": "power bi"
  },
  {
    "job_id": 1601917,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95680.0",
    "skills": "excel"
  },
  {
    "job_id": 703426,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95680.0",
    "skills": "excel"
  },
  {
    "job_id": 1519639,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95650.0",
    "skills": "r"
  },
  {
    "job_id": 1519639,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95650.0",
    "skills": "python"
  },
  {
    "job_id": 1519639,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95650.0",
    "skills": "power bi"
  },
  {
    "job_id": 1519639,
    "job_title_short": "Data Analyst",
    "company_name": "Booz Allen Hamilton",
    "salary_year_avg": "95650.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 911673,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95500.0",
    "skills": "sql"
  },
  {
    "job_id": 735880,
    "job_title_short": "Data Analyst",
    "company_name": "Olympus Corporation of the Americas",
    "salary_year_avg": "95500.0",
    "skills": "unity"
  },
  {
    "job_id": 735880,
    "job_title_short": "Data Analyst",
    "company_name": "Olympus Corporation of the Americas",
    "salary_year_avg": "95500.0",
    "skills": "python"
  },
  {
    "job_id": 911673,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95500.0",
    "skills": "r"
  },
  {
    "job_id": 735880,
    "job_title_short": "Data Analyst",
    "company_name": "Olympus Corporation of the Americas",
    "salary_year_avg": "95500.0",
    "skills": "sql"
  },
  {
    "job_id": 911673,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95500.0",
    "skills": "flow"
  },
  {
    "job_id": 735880,
    "job_title_short": "Data Analyst",
    "company_name": "Olympus Corporation of the Americas",
    "salary_year_avg": "95500.0",
    "skills": "tableau"
  },
  {
    "job_id": 911673,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95500.0",
    "skills": "python"
  },
  {
    "job_id": 735880,
    "job_title_short": "Data Analyst",
    "company_name": "Olympus Corporation of the Americas",
    "salary_year_avg": "95500.0",
    "skills": "excel"
  },
  {
    "job_id": 735880,
    "job_title_short": "Data Analyst",
    "company_name": "Olympus Corporation of the Americas",
    "salary_year_avg": "95500.0",
    "skills": "vba"
  },
  {
    "job_id": 354407,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95329.0",
    "skills": "power bi"
  },
  {
    "job_id": 354407,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95329.0",
    "skills": "sql"
  },
  {
    "job_id": 354407,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95329.0",
    "skills": "oracle"
  },
  {
    "job_id": 354407,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95329.0",
    "skills": "tableau"
  },
  {
    "job_id": 1529069,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Washington University in St Louis",
    "salary_year_avg": "95150.0",
    "skills": "visual basic"
  },
  {
    "job_id": 1529069,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Washington University in St Louis",
    "salary_year_avg": "95150.0",
    "skills": "sql"
  },
  {
    "job_id": 1529069,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Washington University in St Louis",
    "salary_year_avg": "95150.0",
    "skills": "word"
  },
  {
    "job_id": 1529069,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Washington University in St Louis",
    "salary_year_avg": "95150.0",
    "skills": "excel"
  },
  {
    "job_id": 1529069,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Washington University in St Louis",
    "salary_year_avg": "95150.0",
    "skills": "crystal"
  },
  {
    "job_id": 1491918,
    "job_title_short": "Data Analyst",
    "company_name": "IDR, Inc.",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 430230,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "mariadb"
  },
  {
    "job_id": 1355313,
    "job_title_short": "Data Analyst",
    "company_name": "United Site Services",
    "salary_year_avg": "95000.0",
    "skills": "flow"
  },
  {
    "job_id": 369634,
    "job_title_short": "Data Analyst",
    "company_name": "Hays",
    "salary_year_avg": "95000.0",
    "skills": "postgresql"
  },
  {
    "job_id": 1240374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95000.0",
    "skills": "crystal"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "php"
  },
  {
    "job_id": 1643166,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 334078,
    "job_title_short": "Data Analyst",
    "company_name": "American Red Cross",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 78069,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_id": 796604,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 78069,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 1171975,
    "job_title_short": "Senior Data Analyst",
    "company_name": "GoodLeap",
    "salary_year_avg": "95000.0",
    "skills": "flow"
  },
  {
    "job_id": 1240374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 796604,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_id": 1807573,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 796604,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1807573,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "c"
  },
  {
    "job_id": 1240374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95000.0",
    "skills": "qlik"
  },
  {
    "job_id": 328827,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 595228,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leaf Trade",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1230135,
    "job_title_short": "Data Analyst",
    "company_name": "Earnest Analytics",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1359967,
    "job_title_short": "Data Analyst",
    "company_name": "Clark Associates",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_id": 369634,
    "job_title_short": "Data Analyst",
    "company_name": "Hays",
    "salary_year_avg": "95000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1807573,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 796604,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "powershell"
  },
  {
    "job_id": 430230,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 894873,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 1156421,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 334078,
    "job_title_short": "Data Analyst",
    "company_name": "American Red Cross",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 1359967,
    "job_title_short": "Data Analyst",
    "company_name": "Clark Associates",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 328827,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "95000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1491918,
    "job_title_short": "Data Analyst",
    "company_name": "IDR, Inc.",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 78069,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "sheets"
  },
  {
    "job_id": 437566,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_id": 437566,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 369634,
    "job_title_short": "Data Analyst",
    "company_name": "Hays",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_id": 894873,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 430230,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_id": 796604,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_id": 78069,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 595228,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leaf Trade",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 1643166,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "azure"
  },
  {
    "job_id": 796604,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 542425,
    "job_title_short": "Data Analyst",
    "company_name": "Jobot",
    "salary_year_avg": "95000.0",
    "skills": "microstrategy"
  },
  {
    "job_id": 595228,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leaf Trade",
    "salary_year_avg": "95000.0",
    "skills": "airflow"
  },
  {
    "job_id": 437566,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "azure"
  },
  {
    "job_id": 430230,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "azure"
  },
  {
    "job_id": 1240374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95000.0",
    "skills": "sas"
  },
  {
    "job_id": 204667,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1491918,
    "job_title_short": "Data Analyst",
    "company_name": "IDR, Inc.",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_id": 1643166,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_id": 542425,
    "job_title_short": "Data Analyst",
    "company_name": "Jobot",
    "salary_year_avg": "95000.0",
    "skills": "dax"
  },
  {
    "job_id": 894873,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_id": 1240374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95000.0",
    "skills": "sas"
  },
  {
    "job_id": 945198,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "jira"
  },
  {
    "job_id": 430230,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 204667,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95000.0",
    "skills": "oracle"
  },
  {
    "job_id": 437566,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 1807573,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "jira"
  },
  {
    "job_id": 1643166,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 1240374,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_id": 1807573,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 1359967,
    "job_title_short": "Data Analyst",
    "company_name": "Clark Associates",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 369634,
    "job_title_short": "Data Analyst",
    "company_name": "Hays",
    "salary_year_avg": "95000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 369634,
    "job_title_short": "Data Analyst",
    "company_name": "Hays",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 542425,
    "job_title_short": "Data Analyst",
    "company_name": "Jobot",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_id": 204667,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1359967,
    "job_title_short": "Data Analyst",
    "company_name": "Clark Associates",
    "salary_year_avg": "95000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1230135,
    "job_title_short": "Data Analyst",
    "company_name": "Earnest Analytics",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_id": 430230,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "express"
  },
  {
    "job_id": 437566,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "express"
  },
  {
    "job_id": 1643166,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "express"
  },
  {
    "job_id": 1171975,
    "job_title_short": "Senior Data Analyst",
    "company_name": "GoodLeap",
    "salary_year_avg": "95000.0",
    "skills": "word"
  },
  {
    "job_id": 595228,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leaf Trade",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 1807573,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "95000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1171975,
    "job_title_short": "Senior Data Analyst",
    "company_name": "GoodLeap",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_id": 328827,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 1643166,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 78069,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "looker"
  },
  {
    "job_id": 78069,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 78069,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_id": 328827,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "95000.0",
    "skills": "excel"
  },
  {
    "job_id": 1171975,
    "job_title_short": "Senior Data Analyst",
    "company_name": "GoodLeap",
    "salary_year_avg": "95000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 334078,
    "job_title_short": "Data Analyst",
    "company_name": "American Red Cross",
    "salary_year_avg": "95000.0",
    "skills": "r"
  },
  {
    "job_id": 204667,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "95000.0",
    "skills": "sql"
  },
  {
    "job_id": 1467775,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 328827,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "95000.0",
    "skills": "go"
  },
  {
    "job_id": 796604,
    "job_title_short": "Data Analyst",
    "company_name": "Polygence",
    "salary_year_avg": "95000.0",
    "skills": "tableau"
  },
  {
    "job_id": 437566,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "95000.0",
    "skills": "python"
  },
  {
    "job_id": 1171975,
    "job_title_short": "Senior Data Analyst",
    "company_name": "GoodLeap",
    "salary_year_avg": "95000.0",
    "skills": "vba"
  },
  {
    "job_id": 1127339,
    "job_title_short": "Data Analyst",
    "company_name": "Protect Democracy",
    "salary_year_avg": "94871.5",
    "skills": "r"
  },
  {
    "job_id": 1127339,
    "job_title_short": "Data Analyst",
    "company_name": "Protect Democracy",
    "salary_year_avg": "94871.5",
    "skills": "python"
  },
  {
    "job_id": 961597,
    "job_title_short": "Data Analyst",
    "company_name": "The Cigna Group",
    "salary_year_avg": "94400.0",
    "skills": "flow"
  },
  {
    "job_id": 961597,
    "job_title_short": "Data Analyst",
    "company_name": "The Cigna Group",
    "salary_year_avg": "94400.0",
    "skills": "tableau"
  },
  {
    "job_id": 1196971,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Allscripts",
    "salary_year_avg": "94366.75",
    "skills": "sas"
  },
  {
    "job_id": 1196971,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Allscripts",
    "salary_year_avg": "94366.75",
    "skills": "sas"
  },
  {
    "job_id": 1196971,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Allscripts",
    "salary_year_avg": "94366.75",
    "skills": "sql"
  },
  {
    "job_id": 952004,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "94000.0",
    "skills": "sql"
  },
  {
    "job_id": 1243771,
    "job_title_short": "Data Analyst",
    "company_name": "Tactis LLC",
    "salary_year_avg": "94000.0",
    "skills": "jira"
  },
  {
    "job_id": 952004,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "94000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 952004,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "94000.0",
    "skills": "jira"
  },
  {
    "job_id": 952004,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "94000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1243771,
    "job_title_short": "Data Analyst",
    "company_name": "Tactis LLC",
    "salary_year_avg": "94000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1243771,
    "job_title_short": "Data Analyst",
    "company_name": "Tactis LLC",
    "salary_year_avg": "94000.0",
    "skills": "excel"
  },
  {
    "job_id": 255754,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Daily Dev Bytes",
    "salary_year_avg": "93000.0",
    "skills": "tableau"
  },
  {
    "job_id": 133125,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "93000.0",
    "skills": "sas"
  },
  {
    "job_id": 255754,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Daily Dev Bytes",
    "salary_year_avg": "93000.0",
    "skills": "sql"
  },
  {
    "job_id": 133125,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "93000.0",
    "skills": "word"
  },
  {
    "job_id": 133125,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "93000.0",
    "skills": "sas"
  },
  {
    "job_id": 255754,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Daily Dev Bytes",
    "salary_year_avg": "93000.0",
    "skills": "flow"
  },
  {
    "job_id": 133125,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "93000.0",
    "skills": "excel"
  },
  {
    "job_id": 960363,
    "job_title_short": "Data Analyst",
    "company_name": "Medidata Solutions",
    "salary_year_avg": "92750.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 960363,
    "job_title_short": "Data Analyst",
    "company_name": "Medidata Solutions",
    "salary_year_avg": "92750.0",
    "skills": "tableau"
  },
  {
    "job_id": 960363,
    "job_title_short": "Data Analyst",
    "company_name": "Medidata Solutions",
    "salary_year_avg": "92750.0",
    "skills": "r"
  },
  {
    "job_id": 960363,
    "job_title_short": "Data Analyst",
    "company_name": "Medidata Solutions",
    "salary_year_avg": "92750.0",
    "skills": "excel"
  },
  {
    "job_id": 960363,
    "job_title_short": "Data Analyst",
    "company_name": "Medidata Solutions",
    "salary_year_avg": "92750.0",
    "skills": "python"
  },
  {
    "job_id": 960363,
    "job_title_short": "Data Analyst",
    "company_name": "Medidata Solutions",
    "salary_year_avg": "92750.0",
    "skills": "sql"
  },
  {
    "job_id": 1190547,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "92500.0",
    "skills": "sql"
  },
  {
    "job_id": 1103318,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "92500.0",
    "skills": "flow"
  },
  {
    "job_id": 758193,
    "job_title_short": "Data Analyst",
    "company_name": "LeanTaaS",
    "salary_year_avg": "92500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1103318,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "92500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "confluence"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "atlassian"
  },
  {
    "job_id": 1190547,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "92500.0",
    "skills": "excel"
  },
  {
    "job_id": 1190547,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "92500.0",
    "skills": "go"
  },
  {
    "job_id": 1103318,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "92500.0",
    "skills": "excel"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "html"
  },
  {
    "job_id": 1190547,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "92500.0",
    "skills": "tableau"
  },
  {
    "job_id": 758193,
    "job_title_short": "Data Analyst",
    "company_name": "LeanTaaS",
    "salary_year_avg": "92500.0",
    "skills": "sql"
  },
  {
    "job_id": 1103318,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "92500.0",
    "skills": "spreadsheet"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "excel"
  },
  {
    "job_id": 758193,
    "job_title_short": "Data Analyst",
    "company_name": "LeanTaaS",
    "salary_year_avg": "92500.0",
    "skills": "excel"
  },
  {
    "job_id": 1190547,
    "job_title_short": "Data Analyst",
    "company_name": "HopSkipDrive",
    "salary_year_avg": "92500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "sql"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "javascript"
  },
  {
    "job_id": 758193,
    "job_title_short": "Data Analyst",
    "company_name": "LeanTaaS",
    "salary_year_avg": "92500.0",
    "skills": "python"
  },
  {
    "job_id": 1098113,
    "job_title_short": "Data Analyst",
    "company_name": "0nward Select",
    "salary_year_avg": "92500.0",
    "skills": "jira"
  },
  {
    "job_id": 738823,
    "job_title_short": "Data Analyst",
    "company_name": "OUTFITTERY",
    "salary_year_avg": "92000.0",
    "skills": "python"
  },
  {
    "job_id": 738823,
    "job_title_short": "Data Analyst",
    "company_name": "OUTFITTERY",
    "salary_year_avg": "92000.0",
    "skills": "tableau"
  },
  {
    "job_id": 738823,
    "job_title_short": "Data Analyst",
    "company_name": "OUTFITTERY",
    "salary_year_avg": "92000.0",
    "skills": "sql"
  },
  {
    "job_id": 738823,
    "job_title_short": "Data Analyst",
    "company_name": "OUTFITTERY",
    "salary_year_avg": "92000.0",
    "skills": "pascal"
  },
  {
    "job_id": 1178655,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "91000.0",
    "skills": "sql"
  },
  {
    "job_id": 1178655,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "91000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1178655,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "91000.0",
    "skills": "python"
  },
  {
    "job_id": 1178655,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "91000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 680315,
    "job_title_short": "Data Analyst",
    "company_name": "Gotely",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 354417,
    "job_title_short": "Data Analyst",
    "company_name": "EcoCart",
    "salary_year_avg": "90000.0",
    "skills": "redshift"
  },
  {
    "job_id": 514485,
    "job_title_short": "Data Analyst",
    "company_name": "Constant Associates",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 914174,
    "job_title_short": "Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "90000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1244897,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 581546,
    "job_title_short": "Data Analyst",
    "company_name": "Engage Partners Inc.",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 846860,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 196796,
    "job_title_short": "Data Analyst",
    "company_name": "Angi",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 258262,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 581546,
    "job_title_short": "Data Analyst",
    "company_name": "Engage Partners Inc.",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 40622,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Staffosaurus",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1647550,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 680315,
    "job_title_short": "Data Analyst",
    "company_name": "Gotely",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 354417,
    "job_title_short": "Data Analyst",
    "company_name": "EcoCart",
    "salary_year_avg": "90000.0",
    "skills": "aws"
  },
  {
    "job_id": 382064,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "oracle"
  },
  {
    "job_id": 465793,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leeds Professional Resources",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 293077,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1152523,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 391159,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 714930,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 811436,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1768733,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 419649,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 97325,
    "job_title_short": "Senior Data Analyst",
    "company_name": "MAINSAIL Group",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 326110,
    "job_title_short": "Data Analyst",
    "company_name": "Preveta",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 613034,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 354417,
    "job_title_short": "Data Analyst",
    "company_name": "EcoCart",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "aws"
  },
  {
    "job_id": 258262,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 846860,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 354417,
    "job_title_short": "Data Analyst",
    "company_name": "EcoCart",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 1244897,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 116825,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "90000.0",
    "skills": "python"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1152523,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "outlook"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "numpy"
  },
  {
    "job_id": 354417,
    "job_title_short": "Data Analyst",
    "company_name": "EcoCart",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 116825,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "90000.0",
    "skills": "java"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 613034,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 465793,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leeds Professional Resources",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "java"
  },
  {
    "job_id": 116825,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 97325,
    "job_title_short": "Senior Data Analyst",
    "company_name": "MAINSAIL Group",
    "salary_year_avg": "90000.0",
    "skills": "power bi"
  },
  {
    "job_id": 714930,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 391159,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 1186631,
    "job_title_short": "Data Analyst",
    "company_name": "Adaptive Solutions Group",
    "salary_year_avg": "90000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 382064,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 581546,
    "job_title_short": "Data Analyst",
    "company_name": "Engage Partners Inc.",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "plotly"
  },
  {
    "job_id": 1768733,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_id": 811436,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "seaborn"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_id": 680315,
    "job_title_short": "Data Analyst",
    "company_name": "Gotely",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "visio"
  },
  {
    "job_id": 1152523,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "unix"
  },
  {
    "job_id": 1647550,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1244897,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 354417,
    "job_title_short": "Data Analyst",
    "company_name": "EcoCart",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 514485,
    "job_title_short": "Data Analyst",
    "company_name": "Constant Associates",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 613034,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 196796,
    "job_title_short": "Data Analyst",
    "company_name": "Angi",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 514485,
    "job_title_short": "Data Analyst",
    "company_name": "Constant Associates",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 465793,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leeds Professional Resources",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 116825,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 914174,
    "job_title_short": "Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "90000.0",
    "skills": "sql server"
  },
  {
    "job_id": 258262,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 196796,
    "job_title_short": "Data Analyst",
    "company_name": "Angi",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 714930,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 680315,
    "job_title_short": "Data Analyst",
    "company_name": "Gotely",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 581546,
    "job_title_short": "Data Analyst",
    "company_name": "Engage Partners Inc.",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 97325,
    "job_title_short": "Senior Data Analyst",
    "company_name": "MAINSAIL Group",
    "salary_year_avg": "90000.0",
    "skills": "flow"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "word"
  },
  {
    "job_id": 1647550,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "vb.net"
  },
  {
    "job_id": 382064,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 326110,
    "job_title_short": "Data Analyst",
    "company_name": "Preveta",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 391159,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 714930,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "90000.0",
    "skills": "r"
  },
  {
    "job_id": 1186631,
    "job_title_short": "Data Analyst",
    "company_name": "Adaptive Solutions Group",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 648986,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 581546,
    "job_title_short": "Data Analyst",
    "company_name": "Engage Partners Inc.",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 293077,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "90000.0",
    "skills": "microsoft teams"
  },
  {
    "job_id": 680315,
    "job_title_short": "Data Analyst",
    "company_name": "Gotely",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 326110,
    "job_title_short": "Data Analyst",
    "company_name": "Preveta",
    "salary_year_avg": "90000.0",
    "skills": "qlik"
  },
  {
    "job_id": 648986,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 326110,
    "job_title_short": "Data Analyst",
    "company_name": "Preveta",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 468153,
    "job_title_short": "Data Analyst",
    "company_name": "Axelerate",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 1186631,
    "job_title_short": "Data Analyst",
    "company_name": "Adaptive Solutions Group",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 1244897,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 846860,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "shell"
  },
  {
    "job_id": 258262,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 419649,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 196796,
    "job_title_short": "Data Analyst",
    "company_name": "Angi",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 293077,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 1560173,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 514485,
    "job_title_short": "Data Analyst",
    "company_name": "Constant Associates",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 97325,
    "job_title_short": "Senior Data Analyst",
    "company_name": "MAINSAIL Group",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 97325,
    "job_title_short": "Senior Data Analyst",
    "company_name": "MAINSAIL Group",
    "salary_year_avg": "90000.0",
    "skills": "jira"
  },
  {
    "job_id": 1152523,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Real Estate",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 326110,
    "job_title_short": "Data Analyst",
    "company_name": "Preveta",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "jira"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 514485,
    "job_title_short": "Data Analyst",
    "company_name": "Constant Associates",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_id": 1647550,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_id": 1647550,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_id": 811436,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 514485,
    "job_title_short": "Data Analyst",
    "company_name": "Constant Associates",
    "salary_year_avg": "90000.0",
    "skills": "sas"
  },
  {
    "job_id": 1768733,
    "job_title_short": "Senior Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 1186631,
    "job_title_short": "Data Analyst",
    "company_name": "Adaptive Solutions Group",
    "salary_year_avg": "90000.0",
    "skills": "tableau"
  },
  {
    "job_id": 465793,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Leeds Professional Resources",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "confluence"
  },
  {
    "job_id": 811436,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "planner"
  },
  {
    "job_id": 354417,
    "job_title_short": "Data Analyst",
    "company_name": "EcoCart",
    "salary_year_avg": "90000.0",
    "skills": "clickup"
  },
  {
    "job_id": 714930,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "90000.0",
    "skills": "looker"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "excel"
  },
  {
    "job_id": 613034,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "90000.0",
    "skills": "looker"
  },
  {
    "job_id": 116825,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "90000.0",
    "skills": "matlab"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "html"
  },
  {
    "job_id": 116825,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "90000.0",
    "skills": "c#"
  },
  {
    "job_id": 914174,
    "job_title_short": "Data Analyst",
    "company_name": "Home Depot / THD",
    "salary_year_avg": "90000.0",
    "skills": "sql"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "javascript"
  },
  {
    "job_id": 116825,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "90000.0",
    "skills": "c++"
  },
  {
    "job_id": 1228142,
    "job_title_short": "Data Analyst",
    "company_name": "Grant Leading Technology, LLC",
    "salary_year_avg": "90000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1729407,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "90000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 122927,
    "job_title_short": "Data Analyst",
    "company_name": "Heluna Health",
    "salary_year_avg": "89796.0",
    "skills": "r"
  },
  {
    "job_id": 122927,
    "job_title_short": "Data Analyst",
    "company_name": "Heluna Health",
    "salary_year_avg": "89796.0",
    "skills": "sas"
  },
  {
    "job_id": 122927,
    "job_title_short": "Data Analyst",
    "company_name": "Heluna Health",
    "salary_year_avg": "89796.0",
    "skills": "julia"
  },
  {
    "job_id": 122927,
    "job_title_short": "Data Analyst",
    "company_name": "Heluna Health",
    "salary_year_avg": "89796.0",
    "skills": "sas"
  },
  {
    "job_id": 1618146,
    "job_title_short": "Data Analyst",
    "company_name": "Verizon",
    "salary_year_avg": "89500.0",
    "skills": "power bi"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "r"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "python"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "scala"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "sql"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "confluence"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "java"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "jira"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "tableau"
  },
  {
    "job_id": 833662,
    "job_title_short": "Data Analyst",
    "company_name": "World Education Services",
    "salary_year_avg": "89000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1657752,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "88000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1657752,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "88000.0",
    "skills": "excel"
  },
  {
    "job_id": 1657752,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "88000.0",
    "skills": "word"
  },
  {
    "job_id": 1657752,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "88000.0",
    "skills": "outlook"
  },
  {
    "job_id": 66566,
    "job_title_short": "Data Analyst",
    "company_name": "Vatica Health",
    "salary_year_avg": "87500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1618917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "word"
  },
  {
    "job_id": 1618917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_id": 1433360,
    "job_title_short": "Data Analyst",
    "company_name": "SeatGeek",
    "salary_year_avg": "87500.0",
    "skills": "looker"
  },
  {
    "job_id": 30317,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 915649,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_id": 1618917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "sql server"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "oracle"
  },
  {
    "job_id": 1515399,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "87500.0",
    "skills": "r"
  },
  {
    "job_id": 30317,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "87500.0",
    "skills": "sql server"
  },
  {
    "job_id": 352252,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "87500.0",
    "skills": "word"
  },
  {
    "job_id": 66566,
    "job_title_short": "Data Analyst",
    "company_name": "Vatica Health",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 915649,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "power bi"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1433360,
    "job_title_short": "Data Analyst",
    "company_name": "SeatGeek",
    "salary_year_avg": "87500.0",
    "skills": "spring"
  },
  {
    "job_id": 352252,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "87500.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1515399,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "87500.0",
    "skills": "python"
  },
  {
    "job_id": 1618917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1489901,
    "job_title_short": "Data Analyst",
    "company_name": "Predictive Data Lab",
    "salary_year_avg": "87500.0",
    "skills": "azure"
  },
  {
    "job_id": 1433360,
    "job_title_short": "Data Analyst",
    "company_name": "SeatGeek",
    "salary_year_avg": "87500.0",
    "skills": "redshift"
  },
  {
    "job_id": 915649,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 1515399,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "87500.0",
    "skills": "gcp"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "python"
  },
  {
    "job_id": 66566,
    "job_title_short": "Data Analyst",
    "company_name": "Vatica Health",
    "salary_year_avg": "87500.0",
    "skills": "go"
  },
  {
    "job_id": 1515399,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "87500.0",
    "skills": "bigquery"
  },
  {
    "job_id": 30317,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "87500.0",
    "skills": "c#"
  },
  {
    "job_id": 1618917,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1489901,
    "job_title_short": "Data Analyst",
    "company_name": "Predictive Data Lab",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "planner"
  },
  {
    "job_id": 352252,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_id": 1433360,
    "job_title_short": "Data Analyst",
    "company_name": "SeatGeek",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 30317,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_id": 66566,
    "job_title_short": "Data Analyst",
    "company_name": "Vatica Health",
    "salary_year_avg": "87500.0",
    "skills": "tableau"
  },
  {
    "job_id": 30317,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "87500.0",
    "skills": "flow"
  },
  {
    "job_id": 66566,
    "job_title_short": "Data Analyst",
    "company_name": "Vatica Health",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 748524,
    "job_title_short": "Data Analyst",
    "company_name": "Oxfam America",
    "salary_year_avg": "87500.0",
    "skills": "excel"
  },
  {
    "job_id": 1515399,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "87500.0",
    "skills": "sql"
  },
  {
    "job_id": 1515399,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "87500.0",
    "skills": "tableau"
  },
  {
    "job_id": 916210,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "sql"
  },
  {
    "job_id": 961041,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "power bi"
  },
  {
    "job_id": 961041,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "tableau"
  },
  {
    "job_id": 916210,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "flow"
  },
  {
    "job_id": 961041,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "sql"
  },
  {
    "job_id": 916210,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "power bi"
  },
  {
    "job_id": 961041,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "r"
  },
  {
    "job_id": 916210,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "tableau"
  },
  {
    "job_id": 916210,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "python"
  },
  {
    "job_id": 916210,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "r"
  },
  {
    "job_id": 961041,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "87000.0",
    "skills": "python"
  },
  {
    "job_id": 1704094,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86500.0",
    "skills": "sql"
  },
  {
    "job_id": 401243,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86500.0",
    "skills": "sql"
  },
  {
    "job_id": 1704094,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86500.0",
    "skills": "oracle"
  },
  {
    "job_id": 401243,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86500.0",
    "skills": "oracle"
  },
  {
    "job_id": 456839,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86000.0",
    "skills": "python"
  },
  {
    "job_id": 456839,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1460326,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1460326,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86000.0",
    "skills": "postgresql"
  },
  {
    "job_id": 1460326,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86000.0",
    "skills": "looker"
  },
  {
    "job_id": 456839,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86000.0",
    "skills": "sql"
  },
  {
    "job_id": 1460326,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "86000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1782272,
    "job_title_short": "Data Analyst",
    "company_name": "FocusKPI Inc.",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1085007,
    "job_title_short": "Data Analyst",
    "company_name": "DeepIntent",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 1762396,
    "job_title_short": "Data Analyst",
    "company_name": "Impact Genome",
    "salary_year_avg": "85000.0",
    "skills": "terminal"
  },
  {
    "job_id": 1085007,
    "job_title_short": "Data Analyst",
    "company_name": "DeepIntent",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1215316,
    "job_title_short": "Data Analyst",
    "company_name": "Impact Genome",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_id": 196337,
    "job_title_short": "Data Analyst",
    "company_name": "SimioCloud",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 710614,
    "job_title_short": "Data Analyst",
    "company_name": "Envision Staffing Solutions",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 710614,
    "job_title_short": "Data Analyst",
    "company_name": "Envision Staffing Solutions",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1458260,
    "job_title_short": "Data Analyst",
    "company_name": "QSE7, LLC",
    "salary_year_avg": "85000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 384007,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 52176,
    "job_title_short": "Data Analyst",
    "company_name": "Mint Mobile",
    "salary_year_avg": "85000.0",
    "skills": "atlassian"
  },
  {
    "job_id": 1782272,
    "job_title_short": "Data Analyst",
    "company_name": "FocusKPI Inc.",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 196337,
    "job_title_short": "Data Analyst",
    "company_name": "SimioCloud",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "word"
  },
  {
    "job_id": 1640252,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_id": 314738,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 382000,
    "job_title_short": "Data Analyst",
    "company_name": "Prime Team Partners",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 382000,
    "job_title_short": "Data Analyst",
    "company_name": "Prime Team Partners",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 1112585,
    "job_title_short": "Data Analyst",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1458260,
    "job_title_short": "Data Analyst",
    "company_name": "QSE7, LLC",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1085007,
    "job_title_short": "Data Analyst",
    "company_name": "DeepIntent",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 382000,
    "job_title_short": "Data Analyst",
    "company_name": "Prime Team Partners",
    "salary_year_avg": "85000.0",
    "skills": "word"
  },
  {
    "job_id": 52176,
    "job_title_short": "Data Analyst",
    "company_name": "Mint Mobile",
    "salary_year_avg": "85000.0",
    "skills": "chef"
  },
  {
    "job_id": 52176,
    "job_title_short": "Data Analyst",
    "company_name": "Mint Mobile",
    "salary_year_avg": "85000.0",
    "skills": "express"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "visio"
  },
  {
    "job_id": 52176,
    "job_title_short": "Data Analyst",
    "company_name": "Mint Mobile",
    "salary_year_avg": "85000.0",
    "skills": "flow"
  },
  {
    "job_id": 1112585,
    "job_title_short": "Data Analyst",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 710614,
    "job_title_short": "Data Analyst",
    "company_name": "Envision Staffing Solutions",
    "salary_year_avg": "85000.0",
    "skills": "word"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_id": 384007,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "85000.0",
    "skills": "sql server"
  },
  {
    "job_id": 196337,
    "job_title_short": "Data Analyst",
    "company_name": "SimioCloud",
    "salary_year_avg": "85000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 1458260,
    "job_title_short": "Data Analyst",
    "company_name": "QSE7, LLC",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 384007,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "85000.0",
    "skills": "mysql"
  },
  {
    "job_id": 52176,
    "job_title_short": "Data Analyst",
    "company_name": "Mint Mobile",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 382000,
    "job_title_short": "Data Analyst",
    "company_name": "Prime Team Partners",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 50602,
    "job_title_short": "Data Analyst",
    "company_name": "Impact Genome",
    "salary_year_avg": "85000.0",
    "skills": "terminal"
  },
  {
    "job_id": 384007,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "85000.0",
    "skills": "azure"
  },
  {
    "job_id": 710614,
    "job_title_short": "Data Analyst",
    "company_name": "Envision Staffing Solutions",
    "salary_year_avg": "85000.0",
    "skills": "spreadsheet"
  },
  {
    "job_id": 196337,
    "job_title_short": "Data Analyst",
    "company_name": "SimioCloud",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 1112585,
    "job_title_short": "Data Analyst",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1458260,
    "job_title_short": "Data Analyst",
    "company_name": "QSE7, LLC",
    "salary_year_avg": "85000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1085007,
    "job_title_short": "Data Analyst",
    "company_name": "DeepIntent",
    "salary_year_avg": "85000.0",
    "skills": "r"
  },
  {
    "job_id": 314738,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "85000.0",
    "skills": "excel"
  },
  {
    "job_id": 384007,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "85000.0",
    "skills": "jira"
  },
  {
    "job_id": 1782272,
    "job_title_short": "Data Analyst",
    "company_name": "FocusKPI Inc.",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 203851,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 1640252,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1458260,
    "job_title_short": "Data Analyst",
    "company_name": "QSE7, LLC",
    "salary_year_avg": "85000.0",
    "skills": "vba"
  },
  {
    "job_id": 1112585,
    "job_title_short": "Data Analyst",
    "company_name": "BlueLabs Analytics, Inc.",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_id": 27772,
    "job_title_short": "Data Analyst",
    "company_name": "Redwood Strategy Group",
    "salary_year_avg": "85000.0",
    "skills": "outlook"
  },
  {
    "job_id": 1782272,
    "job_title_short": "Data Analyst",
    "company_name": "FocusKPI Inc.",
    "salary_year_avg": "85000.0",
    "skills": "python"
  },
  {
    "job_id": 50602,
    "job_title_short": "Data Analyst",
    "company_name": "Impact Genome",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 314738,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "85000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1762396,
    "job_title_short": "Data Analyst",
    "company_name": "Impact Genome",
    "salary_year_avg": "85000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1215316,
    "job_title_short": "Data Analyst",
    "company_name": "Impact Genome",
    "salary_year_avg": "85000.0",
    "skills": "terminal"
  },
  {
    "job_id": 314738,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "85000.0",
    "skills": "sql"
  },
  {
    "job_id": 314738,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "85000.0",
    "skills": "looker"
  },
  {
    "job_id": 382000,
    "job_title_short": "Data Analyst",
    "company_name": "Prime Team Partners",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1766497,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "84950.0",
    "skills": "tableau"
  },
  {
    "job_id": 1766497,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "84950.0",
    "skills": "db2"
  },
  {
    "job_id": 1766497,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "84950.0",
    "skills": "alteryx"
  },
  {
    "job_id": 1766497,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "84950.0",
    "skills": "sql"
  },
  {
    "job_id": 496663,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "webex"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_id": 547661,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_id": 1813745,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_id": 1813745,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "python"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_id": 1813745,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "r"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "javascript"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "javascript"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql server"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sql server"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "azure"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "aws"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "redshift"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 496663,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "windows"
  },
  {
    "job_id": 1736157,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_id": 133854,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_id": 104800,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "excel"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "power bi"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "looker"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sas"
  },
  {
    "job_id": 133854,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "84500.0",
    "skills": "sap"
  },
  {
    "job_id": 1540216,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sheets"
  },
  {
    "job_id": 398669,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "ssis"
  },
  {
    "job_id": 496663,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 444259,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "spss"
  },
  {
    "job_id": 367476,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "spss"
  },
  {
    "job_id": 547661,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84500.0",
    "skills": "jenkins"
  },
  {
    "job_id": 1544793,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 1544793,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_id": 1155449,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_id": 1683817,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "word"
  },
  {
    "job_id": 858421,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1683817,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "arch"
  },
  {
    "job_id": 1155449,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1558833,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_id": 858421,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "looker"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_id": 1155449,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "java"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "power bi"
  },
  {
    "job_id": 23358,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "power bi"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1544793,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "nosql"
  },
  {
    "job_id": 1558833,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 894665,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "flow"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_id": 1156181,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql server"
  },
  {
    "job_id": 858421,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 894665,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "looker"
  },
  {
    "job_id": 918810,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 894665,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1156181,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 1155449,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "html"
  },
  {
    "job_id": 1544793,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1558833,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_id": 23358,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "azure"
  },
  {
    "job_id": 1155449,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 23358,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 894665,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 918810,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_id": 858421,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_id": 858421,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "excel"
  },
  {
    "job_id": 1761702,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1156181,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 1156181,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "tableau"
  },
  {
    "job_id": 23358,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "dax"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "python"
  },
  {
    "job_id": 858421,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sas"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 1544793,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "r"
  },
  {
    "job_id": 1155449,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "c#"
  },
  {
    "job_id": 1551217,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "spss"
  },
  {
    "job_id": 1155449,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql"
  },
  {
    "job_id": 122796,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "84000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1618469,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "python"
  },
  {
    "job_id": 1632454,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "83500.0",
    "skills": "excel"
  },
  {
    "job_id": 1128758,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "sql"
  },
  {
    "job_id": 1366794,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1618469,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "aws"
  },
  {
    "job_id": 1128758,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "excel"
  },
  {
    "job_id": 1153109,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "javascript"
  },
  {
    "job_id": 1153109,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "node.js"
  },
  {
    "job_id": 1128758,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "python"
  },
  {
    "job_id": 1632454,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "83500.0",
    "skills": "sql"
  },
  {
    "job_id": 1618469,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "sql"
  },
  {
    "job_id": 1366794,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "r"
  },
  {
    "job_id": 197120,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "83500.0",
    "skills": "go"
  },
  {
    "job_id": 197120,
    "job_title_short": "Data Analyst",
    "company_name": "Robert Half",
    "salary_year_avg": "83500.0",
    "skills": "excel"
  },
  {
    "job_id": 309335,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83500.0",
    "skills": "looker"
  },
  {
    "job_id": 457003,
    "job_title_short": "Data Analyst",
    "company_name": "Memorial Sloan Kettering Cancer Center",
    "salary_year_avg": "83200.0",
    "skills": "go"
  },
  {
    "job_id": 457003,
    "job_title_short": "Data Analyst",
    "company_name": "Memorial Sloan Kettering Cancer Center",
    "salary_year_avg": "83200.0",
    "skills": "sql"
  },
  {
    "job_id": 1005824,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "vba"
  },
  {
    "job_id": 1005824,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "excel"
  },
  {
    "job_id": 604141,
    "job_title_short": "Data Analyst",
    "company_name": "Alameda Health Consortium/Community Health Center Network",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_id": 604141,
    "job_title_short": "Data Analyst",
    "company_name": "Alameda Health Consortium/Community Health Center Network",
    "salary_year_avg": "83000.0",
    "skills": "tableau"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "python"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1656466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "redshift"
  },
  {
    "job_id": 604141,
    "job_title_short": "Data Analyst",
    "company_name": "Alameda Health Consortium/Community Health Center Network",
    "salary_year_avg": "83000.0",
    "skills": "sas"
  },
  {
    "job_id": 604141,
    "job_title_short": "Data Analyst",
    "company_name": "Alameda Health Consortium/Community Health Center Network",
    "salary_year_avg": "83000.0",
    "skills": "sas"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1656466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1656466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "qlik"
  },
  {
    "job_id": 604141,
    "job_title_short": "Data Analyst",
    "company_name": "Alameda Health Consortium/Community Health Center Network",
    "salary_year_avg": "83000.0",
    "skills": "excel"
  },
  {
    "job_id": 1656466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1005824,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1005824,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "word"
  },
  {
    "job_id": 1656466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 1005824,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "r"
  },
  {
    "job_id": 1656466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_id": 1005824,
    "job_title_short": "Data Analyst",
    "company_name": "General Dynamics Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "flow"
  },
  {
    "job_id": 373211,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "sql"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 311011,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "excel"
  },
  {
    "job_id": 373211,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "python"
  },
  {
    "job_id": 1656466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "83000.0",
    "skills": "python"
  },
  {
    "job_id": 95123,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 103900,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "looker"
  },
  {
    "job_id": 446559,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Adecco Perm Team",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_id": 103900,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 427343,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 838391,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 1727059,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 446559,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Adecco Perm Team",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 1715658,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 1621876,
    "job_title_short": "Data Analyst",
    "company_name": "Customer Value Partners",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 103900,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_id": 95123,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 1269187,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 1269187,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 672574,
    "job_title_short": "Data Analyst",
    "company_name": "Emotive",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 1795056,
    "job_title_short": "Data Analyst",
    "company_name": "Vitalief Inc.",
    "salary_year_avg": "82500.0",
    "skills": "ms access"
  },
  {
    "job_id": 1795056,
    "job_title_short": "Data Analyst",
    "company_name": "Vitalief Inc.",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 672574,
    "job_title_short": "Data Analyst",
    "company_name": "Emotive",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1715658,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "spss"
  },
  {
    "job_id": 1758551,
    "job_title_short": "Data Analyst",
    "company_name": "Complete HR Solutions",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 244649,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 1621876,
    "job_title_short": "Data Analyst",
    "company_name": "Customer Value Partners",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_id": 427343,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_id": 1727059,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_id": 446559,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Adecco Perm Team",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 1727059,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 838391,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 1269187,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_id": 672574,
    "job_title_short": "Data Analyst",
    "company_name": "Emotive",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_id": 1621876,
    "job_title_short": "Data Analyst",
    "company_name": "Customer Value Partners",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_id": 934891,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 244649,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder",
    "salary_year_avg": "82500.0",
    "skills": "python"
  },
  {
    "job_id": 95123,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sheets"
  },
  {
    "job_id": 103900,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "power bi"
  },
  {
    "job_id": 863059,
    "job_title_short": "Data Analyst",
    "company_name": "Confidential",
    "salary_year_avg": "82500.0",
    "skills": "sap"
  },
  {
    "job_id": 427343,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "r"
  },
  {
    "job_id": 1621876,
    "job_title_short": "Data Analyst",
    "company_name": "Customer Value Partners",
    "salary_year_avg": "82500.0",
    "skills": "plotly"
  },
  {
    "job_id": 1795056,
    "job_title_short": "Data Analyst",
    "company_name": "Vitalief Inc.",
    "salary_year_avg": "82500.0",
    "skills": "r"
  },
  {
    "job_id": 934891,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "82500.0",
    "skills": "word"
  },
  {
    "job_id": 244649,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder",
    "salary_year_avg": "82500.0",
    "skills": "r"
  },
  {
    "job_id": 1795056,
    "job_title_short": "Data Analyst",
    "company_name": "Vitalief Inc.",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_id": 838391,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "tableau"
  },
  {
    "job_id": 863059,
    "job_title_short": "Data Analyst",
    "company_name": "Confidential",
    "salary_year_avg": "82500.0",
    "skills": "oracle"
  },
  {
    "job_id": 1715658,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_id": 1715658,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_id": 934891,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "82500.0",
    "skills": "sql"
  },
  {
    "job_id": 1795056,
    "job_title_short": "Data Analyst",
    "company_name": "Vitalief Inc.",
    "salary_year_avg": "82500.0",
    "skills": "sas"
  },
  {
    "job_id": 1621876,
    "job_title_short": "Data Analyst",
    "company_name": "Customer Value Partners",
    "salary_year_avg": "82500.0",
    "skills": "power bi"
  },
  {
    "job_id": 244649,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder",
    "salary_year_avg": "82500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1727059,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "c#"
  },
  {
    "job_id": 244649,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Ryder",
    "salary_year_avg": "82500.0",
    "skills": "excel"
  },
  {
    "job_id": 1727059,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82500.0",
    "skills": "vba"
  },
  {
    "job_id": 672574,
    "job_title_short": "Data Analyst",
    "company_name": "Emotive",
    "salary_year_avg": "82500.0",
    "skills": "looker"
  },
  {
    "job_id": 879043,
    "job_title_short": "Data Analyst",
    "company_name": "Village Care",
    "salary_year_avg": "82350.5",
    "skills": "sql"
  },
  {
    "job_id": 879043,
    "job_title_short": "Data Analyst",
    "company_name": "Village Care",
    "salary_year_avg": "82350.5",
    "skills": "excel"
  },
  {
    "job_id": 879043,
    "job_title_short": "Data Analyst",
    "company_name": "Village Care",
    "salary_year_avg": "82350.5",
    "skills": "tableau"
  },
  {
    "job_id": 879043,
    "job_title_short": "Data Analyst",
    "company_name": "Village Care",
    "salary_year_avg": "82350.5",
    "skills": "r"
  },
  {
    "job_id": 879043,
    "job_title_short": "Data Analyst",
    "company_name": "Village Care",
    "salary_year_avg": "82350.5",
    "skills": "python"
  },
  {
    "job_id": 499315,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Allscripts",
    "salary_year_avg": "82058.0",
    "skills": "sas"
  },
  {
    "job_id": 499315,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Allscripts",
    "salary_year_avg": "82058.0",
    "skills": "sql"
  },
  {
    "job_id": 499315,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Allscripts",
    "salary_year_avg": "82058.0",
    "skills": "sas"
  },
  {
    "job_id": 1732594,
    "job_title_short": "Data Engineer",
    "company_name": "NCdotGov",
    "salary_year_avg": "82005.5",
    "skills": "sas"
  },
  {
    "job_id": 1732594,
    "job_title_short": "Data Engineer",
    "company_name": "NCdotGov",
    "salary_year_avg": "82005.5",
    "skills": "unix"
  },
  {
    "job_id": 1732594,
    "job_title_short": "Data Engineer",
    "company_name": "NCdotGov",
    "salary_year_avg": "82005.5",
    "skills": "windows"
  },
  {
    "job_id": 1732594,
    "job_title_short": "Data Engineer",
    "company_name": "NCdotGov",
    "salary_year_avg": "82005.5",
    "skills": "javascript"
  },
  {
    "job_id": 1732594,
    "job_title_short": "Data Engineer",
    "company_name": "NCdotGov",
    "salary_year_avg": "82005.5",
    "skills": "sql"
  },
  {
    "job_id": 1732594,
    "job_title_short": "Data Engineer",
    "company_name": "NCdotGov",
    "salary_year_avg": "82005.5",
    "skills": "sas"
  },
  {
    "job_id": 1732594,
    "job_title_short": "Data Engineer",
    "company_name": "NCdotGov",
    "salary_year_avg": "82005.5",
    "skills": "java"
  },
  {
    "job_id": 463381,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1296038,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_id": 318830,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_id": 288466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_id": 906054,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1296038,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_id": 906054,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_id": 288466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_id": 1115037,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "python"
  },
  {
    "job_id": 318830,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_id": 463381,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "sql"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "redshift"
  },
  {
    "job_id": 1115037,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "power bi"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "go"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "looker"
  },
  {
    "job_id": 463381,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 1115037,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "excel"
  },
  {
    "job_id": 1296038,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "python"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1296038,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "excel"
  },
  {
    "job_id": 288466,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "excel"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 906054,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "82000.0",
    "skills": "python"
  },
  {
    "job_id": 906054,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "82000.0",
    "skills": "excel"
  },
  {
    "job_id": 1296038,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "r"
  },
  {
    "job_id": 5174,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "82000.0",
    "skills": "r"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "sql server"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "excel"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "word"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "power bi"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "arch"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "ssrs"
  },
  {
    "job_id": 1638787,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "looker"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "outlook"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "sql"
  },
  {
    "job_id": 223644,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1638787,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81500.0",
    "skills": "sql"
  },
  {
    "job_id": 1436603,
    "job_title_short": "Data Analyst",
    "company_name": "New York State Office of the Attorney General",
    "salary_year_avg": "81047.0",
    "skills": "excel"
  },
  {
    "job_id": 1436603,
    "job_title_short": "Data Analyst",
    "company_name": "New York State Office of the Attorney General",
    "salary_year_avg": "81047.0",
    "skills": "r"
  },
  {
    "job_id": 1637084,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "tableau"
  },
  {
    "job_id": 413083,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "python"
  },
  {
    "job_id": 980665,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "python"
  },
  {
    "job_id": 1637084,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "excel"
  },
  {
    "job_id": 143947,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "scala"
  },
  {
    "job_id": 143947,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "matlab"
  },
  {
    "job_id": 980665,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "tableau"
  },
  {
    "job_id": 143947,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "excel"
  },
  {
    "job_id": 413083,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_id": 980665,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_id": 606788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 143947,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "python"
  },
  {
    "job_id": 1637084,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "python"
  },
  {
    "job_id": 606788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_id": 413083,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "tableau"
  },
  {
    "job_id": 606788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "tableau"
  },
  {
    "job_id": 606788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "sql server"
  },
  {
    "job_id": 143947,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_id": 1637084,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "sql"
  },
  {
    "job_id": 606788,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "ssrs"
  },
  {
    "job_id": 143947,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "81000.0",
    "skills": "r"
  },
  {
    "job_id": 1025744,
    "job_title_short": "Data Analyst",
    "company_name": "InsideHigherEd",
    "salary_year_avg": "80740.0",
    "skills": "sas"
  },
  {
    "job_id": 1025744,
    "job_title_short": "Data Analyst",
    "company_name": "InsideHigherEd",
    "salary_year_avg": "80740.0",
    "skills": "python"
  },
  {
    "job_id": 1025744,
    "job_title_short": "Data Analyst",
    "company_name": "InsideHigherEd",
    "salary_year_avg": "80740.0",
    "skills": "r"
  },
  {
    "job_id": 1025744,
    "job_title_short": "Data Analyst",
    "company_name": "InsideHigherEd",
    "salary_year_avg": "80740.0",
    "skills": "sas"
  },
  {
    "job_id": 1025744,
    "job_title_short": "Data Analyst",
    "company_name": "InsideHigherEd",
    "salary_year_avg": "80740.0",
    "skills": "zoom"
  },
  {
    "job_id": 670376,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "80500.0",
    "skills": "excel"
  },
  {
    "job_id": 670376,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "80500.0",
    "skills": "sql"
  },
  {
    "job_id": 711091,
    "job_title_short": "Data Analyst",
    "company_name": "Automobile Club of Southern California",
    "salary_year_avg": "80250.0",
    "skills": "tableau"
  },
  {
    "job_id": 711091,
    "job_title_short": "Data Analyst",
    "company_name": "Automobile Club of Southern California",
    "salary_year_avg": "80250.0",
    "skills": "vba"
  },
  {
    "job_id": 711091,
    "job_title_short": "Data Analyst",
    "company_name": "Automobile Club of Southern California",
    "salary_year_avg": "80250.0",
    "skills": "bash"
  },
  {
    "job_id": 711091,
    "job_title_short": "Data Analyst",
    "company_name": "Automobile Club of Southern California",
    "salary_year_avg": "80250.0",
    "skills": "java"
  },
  {
    "job_id": 711091,
    "job_title_short": "Data Analyst",
    "company_name": "Automobile Club of Southern California",
    "salary_year_avg": "80250.0",
    "skills": "sql"
  },
  {
    "job_id": 711091,
    "job_title_short": "Data Analyst",
    "company_name": "Automobile Club of Southern California",
    "salary_year_avg": "80250.0",
    "skills": "python"
  },
  {
    "job_id": 566131,
    "job_title_short": "Data Analyst",
    "company_name": "Medix Technology",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_id": 566131,
    "job_title_short": "Data Analyst",
    "company_name": "Medix Technology",
    "salary_year_avg": "80000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 940759,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 794255,
    "job_title_short": "Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_id": 1075985,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "java"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_id": 319413,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1236616,
    "job_title_short": "Data Analyst",
    "company_name": "Peraton",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1075985,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 664113,
    "job_title_short": "Data Analyst",
    "company_name": "CrowdStrike",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1333002,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 550113,
    "job_title_short": "Data Analyst",
    "company_name": "Motion Recruitment",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 1336807,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Seeking Alpha",
    "salary_year_avg": "80000.0",
    "skills": "go"
  },
  {
    "job_id": 794255,
    "job_title_short": "Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1236616,
    "job_title_short": "Data Analyst",
    "company_name": "Peraton",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 6083,
    "job_title_short": "Data Analyst",
    "company_name": "EUCON AMERICAS LLC",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "javascript"
  },
  {
    "job_id": 6083,
    "job_title_short": "Data Analyst",
    "company_name": "EUCON AMERICAS LLC",
    "salary_year_avg": "80000.0",
    "skills": "spss"
  },
  {
    "job_id": 911869,
    "job_title_short": "Data Analyst",
    "company_name": "CBRE",
    "salary_year_avg": "80000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 794255,
    "job_title_short": "Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 319413,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "outlook"
  },
  {
    "job_id": 319413,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 1236616,
    "job_title_short": "Data Analyst",
    "company_name": "Peraton",
    "salary_year_avg": "80000.0",
    "skills": "aws"
  },
  {
    "job_id": 940759,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1333002,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 911869,
    "job_title_short": "Data Analyst",
    "company_name": "CBRE",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 319413,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "ms access"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 276098,
    "job_title_short": "Data Analyst",
    "company_name": "HighGround",
    "salary_year_avg": "80000.0",
    "skills": "spreadsheet"
  },
  {
    "job_id": 1075985,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_id": 794255,
    "job_title_short": "Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "r"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "aws"
  },
  {
    "job_id": 911869,
    "job_title_short": "Data Analyst",
    "company_name": "CBRE",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 794255,
    "job_title_short": "Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 566131,
    "job_title_short": "Data Analyst",
    "company_name": "Medix Technology",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1336807,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Seeking Alpha",
    "salary_year_avg": "80000.0",
    "skills": "flow"
  },
  {
    "job_id": 483152,
    "job_title_short": "Data Analyst",
    "company_name": "New World Now LLC",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 319413,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "word"
  },
  {
    "job_id": 566131,
    "job_title_short": "Data Analyst",
    "company_name": "Medix Technology",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 940759,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "sheets"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "jira"
  },
  {
    "job_id": 1075985,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1236616,
    "job_title_short": "Data Analyst",
    "company_name": "Peraton",
    "salary_year_avg": "80000.0",
    "skills": "qlik"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "jira"
  },
  {
    "job_id": 276098,
    "job_title_short": "Data Analyst",
    "company_name": "HighGround",
    "salary_year_avg": "80000.0",
    "skills": "azure"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 276098,
    "job_title_short": "Data Analyst",
    "company_name": "HighGround",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 6083,
    "job_title_short": "Data Analyst",
    "company_name": "EUCON AMERICAS LLC",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 6083,
    "job_title_short": "Data Analyst",
    "company_name": "EUCON AMERICAS LLC",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_id": 1336807,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Seeking Alpha",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 1236616,
    "job_title_short": "Data Analyst",
    "company_name": "Peraton",
    "salary_year_avg": "80000.0",
    "skills": "python"
  },
  {
    "job_id": 1236616,
    "job_title_short": "Data Analyst",
    "company_name": "Peraton",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_id": 276098,
    "job_title_short": "Data Analyst",
    "company_name": "HighGround",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 664113,
    "job_title_short": "Data Analyst",
    "company_name": "CrowdStrike",
    "salary_year_avg": "80000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 794255,
    "job_title_short": "Data Analyst",
    "company_name": "ATR International",
    "salary_year_avg": "80000.0",
    "skills": "excel"
  },
  {
    "job_id": 6083,
    "job_title_short": "Data Analyst",
    "company_name": "EUCON AMERICAS LLC",
    "salary_year_avg": "80000.0",
    "skills": "sas"
  },
  {
    "job_id": 690454,
    "job_title_short": "Data Analyst",
    "company_name": "Gravy Analytics",
    "salary_year_avg": "80000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 564679,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1354750,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "80000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1333002,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "80000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1336807,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Seeking Alpha",
    "salary_year_avg": "80000.0",
    "skills": "looker"
  },
  {
    "job_id": 664113,
    "job_title_short": "Data Analyst",
    "company_name": "CrowdStrike",
    "salary_year_avg": "80000.0",
    "skills": "sql"
  },
  {
    "job_id": 6083,
    "job_title_short": "Data Analyst",
    "company_name": "EUCON AMERICAS LLC",
    "salary_year_avg": "80000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 430789,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "79968.0",
    "skills": "python"
  },
  {
    "job_id": 430789,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "79968.0",
    "skills": "redshift"
  },
  {
    "job_id": 430789,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "79968.0",
    "skills": "sql"
  },
  {
    "job_id": 430789,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "79968.0",
    "skills": "r"
  },
  {
    "job_id": 430789,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "79968.0",
    "skills": "snowflake"
  },
  {
    "job_id": 430789,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "79968.0",
    "skills": "tableau"
  },
  {
    "job_id": 430789,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Technology",
    "salary_year_avg": "79968.0",
    "skills": "looker"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "go"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "sas"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "spss"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "r"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "python"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "microsoft teams"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "sas"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "tableau"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "sql"
  },
  {
    "job_id": 36488,
    "job_title_short": "Data Analyst",
    "company_name": "Texas Workforce Commission",
    "salary_year_avg": "79415.5",
    "skills": "power bi"
  },
  {
    "job_id": 401772,
    "job_title_short": "Data Analyst",
    "company_name": "Teacher Retirement System of Texas",
    "salary_year_avg": "79060.5",
    "skills": "sql"
  },
  {
    "job_id": 401772,
    "job_title_short": "Data Analyst",
    "company_name": "Teacher Retirement System of Texas",
    "salary_year_avg": "79060.5",
    "skills": "python"
  },
  {
    "job_id": 401772,
    "job_title_short": "Data Analyst",
    "company_name": "Teacher Retirement System of Texas",
    "salary_year_avg": "79060.5",
    "skills": "r"
  },
  {
    "job_id": 189043,
    "job_title_short": "Data Analyst",
    "company_name": "Apex Systems",
    "salary_year_avg": "79000.0",
    "skills": "c++"
  },
  {
    "job_id": 189043,
    "job_title_short": "Data Analyst",
    "company_name": "Apex Systems",
    "salary_year_avg": "79000.0",
    "skills": "c#"
  },
  {
    "job_id": 189043,
    "job_title_short": "Data Analyst",
    "company_name": "Apex Systems",
    "salary_year_avg": "79000.0",
    "skills": "sql"
  },
  {
    "job_id": 189043,
    "job_title_short": "Data Analyst",
    "company_name": "Apex Systems",
    "salary_year_avg": "79000.0",
    "skills": "python"
  },
  {
    "job_id": 1507647,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "78500.0",
    "skills": "excel"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "sas"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "word"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "sas"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "excel"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "r"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "webex"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "cognos"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "sql"
  },
  {
    "job_id": 1723219,
    "job_title_short": "Data Analyst",
    "company_name": "Visual Connections, LLC",
    "salary_year_avg": "78000.0",
    "skills": "python"
  },
  {
    "job_id": 397963,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "77500.0",
    "skills": "mysql"
  },
  {
    "job_id": 397963,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "77500.0",
    "skills": "excel"
  },
  {
    "job_id": 1311958,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "77500.0",
    "skills": "excel"
  },
  {
    "job_id": 397963,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "77500.0",
    "skills": "tableau"
  },
  {
    "job_id": 435726,
    "job_title_short": "Data Analyst",
    "company_name": "JDC",
    "salary_year_avg": "77500.0",
    "skills": "excel"
  },
  {
    "job_id": 704236,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77500.0",
    "skills": "jupyter"
  },
  {
    "job_id": 1236681,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex",
    "salary_year_avg": "77500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 502625,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex.",
    "salary_year_avg": "77500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1311958,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "77500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1236681,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex",
    "salary_year_avg": "77500.0",
    "skills": "azure"
  },
  {
    "job_id": 502625,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex.",
    "salary_year_avg": "77500.0",
    "skills": "azure"
  },
  {
    "job_id": 1236681,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex",
    "salary_year_avg": "77500.0",
    "skills": "sqlite"
  },
  {
    "job_id": 502625,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex.",
    "salary_year_avg": "77500.0",
    "skills": "sqlite"
  },
  {
    "job_id": 1236681,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_id": 1745486,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_id": 502625,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex.",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_id": 397963,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_id": 704236,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77500.0",
    "skills": "python"
  },
  {
    "job_id": 1236681,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_id": 1745486,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_id": 502625,
    "job_title_short": "Data Analyst",
    "company_name": "Simplex.",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_id": 397963,
    "job_title_short": "Data Analyst",
    "company_name": "Coders Data",
    "salary_year_avg": "77500.0",
    "skills": "sql"
  },
  {
    "job_id": 1311958,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "77500.0",
    "skills": "smartsheet"
  },
  {
    "job_id": 1379514,
    "job_title_short": "Data Analyst",
    "company_name": "Wilbur-Ellis Company",
    "salary_year_avg": "77350.0",
    "skills": "python"
  },
  {
    "job_id": 1379514,
    "job_title_short": "Data Analyst",
    "company_name": "Wilbur-Ellis Company",
    "salary_year_avg": "77350.0",
    "skills": "r"
  },
  {
    "job_id": 1379514,
    "job_title_short": "Data Analyst",
    "company_name": "Wilbur-Ellis Company",
    "salary_year_avg": "77350.0",
    "skills": "sql"
  },
  {
    "job_id": 1379514,
    "job_title_short": "Data Analyst",
    "company_name": "Wilbur-Ellis Company",
    "salary_year_avg": "77350.0",
    "skills": "excel"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "excel"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "python"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "powershell"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "outlook"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "sql"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "azure"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "sql server"
  },
  {
    "job_id": 974504,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "77000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 411881,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76842.0",
    "skills": "sas"
  },
  {
    "job_id": 411881,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76842.0",
    "skills": "sql"
  },
  {
    "job_id": 411881,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76842.0",
    "skills": "alteryx"
  },
  {
    "job_id": 411881,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76842.0",
    "skills": "excel"
  },
  {
    "job_id": 411881,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76842.0",
    "skills": "sas"
  },
  {
    "job_id": 411881,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76842.0",
    "skills": "tableau"
  },
  {
    "job_id": 1500082,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76783.0",
    "skills": "sql"
  },
  {
    "job_id": 487133,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76559.0",
    "skills": "sas"
  },
  {
    "job_id": 487133,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76559.0",
    "skills": "sas"
  },
  {
    "job_id": 487133,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76559.0",
    "skills": "sql"
  },
  {
    "job_id": 487133,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76559.0",
    "skills": "vba"
  },
  {
    "job_id": 487133,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76559.0",
    "skills": "excel"
  },
  {
    "job_id": 558598,
    "job_title_short": "Data Analyst",
    "company_name": "Invitae",
    "salary_year_avg": "76500.0",
    "skills": "sheets"
  },
  {
    "job_id": 558598,
    "job_title_short": "Data Analyst",
    "company_name": "Invitae",
    "salary_year_avg": "76500.0",
    "skills": "tableau"
  },
  {
    "job_id": 558598,
    "job_title_short": "Data Analyst",
    "company_name": "Invitae",
    "salary_year_avg": "76500.0",
    "skills": "sql"
  },
  {
    "job_id": 558598,
    "job_title_short": "Data Analyst",
    "company_name": "Invitae",
    "salary_year_avg": "76500.0",
    "skills": "looker"
  },
  {
    "job_id": 558598,
    "job_title_short": "Data Analyst",
    "company_name": "Invitae",
    "salary_year_avg": "76500.0",
    "skills": "spring"
  },
  {
    "job_id": 558598,
    "job_title_short": "Data Analyst",
    "company_name": "Invitae",
    "salary_year_avg": "76500.0",
    "skills": "excel"
  },
  {
    "job_id": 1219618,
    "job_title_short": "Data Analyst",
    "company_name": "Stride inc",
    "salary_year_avg": "76364.5",
    "skills": "excel"
  },
  {
    "job_id": 1219618,
    "job_title_short": "Data Analyst",
    "company_name": "Stride inc",
    "salary_year_avg": "76364.5",
    "skills": "vba"
  },
  {
    "job_id": 1219618,
    "job_title_short": "Data Analyst",
    "company_name": "Stride inc",
    "salary_year_avg": "76364.5",
    "skills": "word"
  },
  {
    "job_id": 1219618,
    "job_title_short": "Data Analyst",
    "company_name": "Stride inc",
    "salary_year_avg": "76364.5",
    "skills": "c"
  },
  {
    "job_id": 1219618,
    "job_title_short": "Data Analyst",
    "company_name": "Stride inc",
    "salary_year_avg": "76364.5",
    "skills": "sql"
  },
  {
    "job_id": 1219618,
    "job_title_short": "Data Analyst",
    "company_name": "Stride inc",
    "salary_year_avg": "76364.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 1219618,
    "job_title_short": "Data Analyst",
    "company_name": "Stride inc",
    "salary_year_avg": "76364.5",
    "skills": "sharepoint"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "sql"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 959874,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "excel"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "sas"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "tableau"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "power bi"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "sas"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "python"
  },
  {
    "job_id": 164596,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "76007.0",
    "skills": "r"
  },
  {
    "job_id": 757196,
    "job_title_short": "Data Analyst",
    "company_name": "UiPath",
    "salary_year_avg": "76000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 757196,
    "job_title_short": "Data Analyst",
    "company_name": "UiPath",
    "salary_year_avg": "76000.0",
    "skills": "go"
  },
  {
    "job_id": 1259256,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "76000.0",
    "skills": "excel"
  },
  {
    "job_id": 1259256,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "76000.0",
    "skills": "sql"
  },
  {
    "job_id": 757196,
    "job_title_short": "Data Analyst",
    "company_name": "UiPath",
    "salary_year_avg": "76000.0",
    "skills": "tableau"
  },
  {
    "job_id": 757196,
    "job_title_short": "Data Analyst",
    "company_name": "UiPath",
    "salary_year_avg": "76000.0",
    "skills": "excel"
  },
  {
    "job_id": 371461,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Marketing",
    "salary_year_avg": "75566.0",
    "skills": "tableau"
  },
  {
    "job_id": 371461,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Marketing",
    "salary_year_avg": "75566.0",
    "skills": "looker"
  },
  {
    "job_id": 371461,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Marketing",
    "salary_year_avg": "75566.0",
    "skills": "sql"
  },
  {
    "job_id": 371461,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Marketing",
    "salary_year_avg": "75566.0",
    "skills": "power bi"
  },
  {
    "job_id": 1068141,
    "job_title_short": "Data Analyst",
    "company_name": "ServiceTitan",
    "salary_year_avg": "75500.0",
    "skills": "azure"
  },
  {
    "job_id": 1068141,
    "job_title_short": "Data Analyst",
    "company_name": "ServiceTitan",
    "salary_year_avg": "75500.0",
    "skills": "sql"
  },
  {
    "job_id": 1068141,
    "job_title_short": "Data Analyst",
    "company_name": "ServiceTitan",
    "salary_year_avg": "75500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1068141,
    "job_title_short": "Data Analyst",
    "company_name": "ServiceTitan",
    "salary_year_avg": "75500.0",
    "skills": "flow"
  },
  {
    "job_id": 1068141,
    "job_title_short": "Data Analyst",
    "company_name": "ServiceTitan",
    "salary_year_avg": "75500.0",
    "skills": "aws"
  },
  {
    "job_id": 1068141,
    "job_title_short": "Data Analyst",
    "company_name": "ServiceTitan",
    "salary_year_avg": "75500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1365513,
    "job_title_short": "Data Analyst",
    "company_name": "Teacher Retirement System of Texas",
    "salary_year_avg": "75296.0",
    "skills": "python"
  },
  {
    "job_id": 1365513,
    "job_title_short": "Data Analyst",
    "company_name": "Teacher Retirement System of Texas",
    "salary_year_avg": "75296.0",
    "skills": "r"
  },
  {
    "job_id": 1365513,
    "job_title_short": "Data Analyst",
    "company_name": "Teacher Retirement System of Texas",
    "salary_year_avg": "75296.0",
    "skills": "sql"
  },
  {
    "job_id": 368638,
    "job_title_short": "Data Analyst",
    "company_name": "Memorial Sloan Kettering Cancer Center",
    "salary_year_avg": "75250.0",
    "skills": "r"
  },
  {
    "job_id": 368638,
    "job_title_short": "Data Analyst",
    "company_name": "Memorial Sloan Kettering Cancer Center",
    "salary_year_avg": "75250.0",
    "skills": "tableau"
  },
  {
    "job_id": 368638,
    "job_title_short": "Data Analyst",
    "company_name": "Memorial Sloan Kettering Cancer Center",
    "salary_year_avg": "75250.0",
    "skills": "sql"
  },
  {
    "job_id": 368638,
    "job_title_short": "Data Analyst",
    "company_name": "Memorial Sloan Kettering Cancer Center",
    "salary_year_avg": "75250.0",
    "skills": "excel"
  },
  {
    "job_id": 368638,
    "job_title_short": "Data Analyst",
    "company_name": "Memorial Sloan Kettering Cancer Center",
    "salary_year_avg": "75250.0",
    "skills": "go"
  },
  {
    "job_id": 479282,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 210881,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "75000.0",
    "skills": "word"
  },
  {
    "job_id": 221984,
    "job_title_short": "Data Analyst",
    "company_name": "MaryRuth's",
    "salary_year_avg": "75000.0",
    "skills": "sap"
  },
  {
    "job_id": 210881,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "75000.0",
    "skills": "ggplot2"
  },
  {
    "job_id": 1241014,
    "job_title_short": "Data Analyst",
    "company_name": "Health Choice Network",
    "salary_year_avg": "75000.0",
    "skills": "word"
  },
  {
    "job_id": 1682598,
    "job_title_short": "Senior Data Analyst",
    "company_name": "BlueLabs Analytics",
    "salary_year_avg": "75000.0",
    "skills": "react"
  },
  {
    "job_id": 240037,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 193923,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1513802,
    "job_title_short": "Data Analyst",
    "company_name": "In Technology Group Inc (US)",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_id": 341807,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1170721,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "vba"
  },
  {
    "job_id": 1241014,
    "job_title_short": "Data Analyst",
    "company_name": "Health Choice Network",
    "salary_year_avg": "75000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1170721,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1517483,
    "job_title_short": "Data Analyst",
    "company_name": "KodeKloud",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1210145,
    "job_title_short": "Data Analyst",
    "company_name": "Health Choice Network",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1406540,
    "job_title_short": "Data Analyst",
    "company_name": "Beyond 12",
    "salary_year_avg": "75000.0",
    "skills": "looker"
  },
  {
    "job_id": 1406540,
    "job_title_short": "Data Analyst",
    "company_name": "Beyond 12",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1065749,
    "job_title_short": "Data Analyst",
    "company_name": "Chicken of the Sea",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 156786,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1170721,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1321085,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 479282,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "75000.0",
    "skills": "matlab"
  },
  {
    "job_id": 1517483,
    "job_title_short": "Data Analyst",
    "company_name": "KodeKloud",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1682598,
    "job_title_short": "Senior Data Analyst",
    "company_name": "BlueLabs Analytics",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 479282,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "75000.0",
    "skills": "c#"
  },
  {
    "job_id": 479282,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "75000.0",
    "skills": "c++"
  },
  {
    "job_id": 210881,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 193923,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "75000.0",
    "skills": "power bi"
  },
  {
    "job_id": 221984,
    "job_title_short": "Data Analyst",
    "company_name": "MaryRuth's",
    "salary_year_avg": "75000.0",
    "skills": "flow"
  },
  {
    "job_id": 1241014,
    "job_title_short": "Data Analyst",
    "company_name": "Health Choice Network",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1406540,
    "job_title_short": "Data Analyst",
    "company_name": "Beyond 12",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1321085,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1682598,
    "job_title_short": "Senior Data Analyst",
    "company_name": "BlueLabs Analytics",
    "salary_year_avg": "75000.0",
    "skills": "ruby"
  },
  {
    "job_id": 555049,
    "job_title_short": "Data Analyst",
    "company_name": "Engage Partners Inc.",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 1170721,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1170721,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1210145,
    "job_title_short": "Data Analyst",
    "company_name": "Health Choice Network",
    "salary_year_avg": "75000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1513802,
    "job_title_short": "Data Analyst",
    "company_name": "In Technology Group Inc (US)",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_id": 156786,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1513802,
    "job_title_short": "Data Analyst",
    "company_name": "In Technology Group Inc (US)",
    "salary_year_avg": "75000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1682598,
    "job_title_short": "Senior Data Analyst",
    "company_name": "BlueLabs Analytics",
    "salary_year_avg": "75000.0",
    "skills": "ruby"
  },
  {
    "job_id": 240037,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Hospitality",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 341807,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 764861,
    "job_title_short": "Data Analyst",
    "company_name": "Chicken of the Sea",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1065749,
    "job_title_short": "Data Analyst",
    "company_name": "Chicken of the Sea",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 764861,
    "job_title_short": "Data Analyst",
    "company_name": "Chicken of the Sea",
    "salary_year_avg": "75000.0",
    "skills": "spark"
  },
  {
    "job_id": 1517483,
    "job_title_short": "Data Analyst",
    "company_name": "KodeKloud",
    "salary_year_avg": "75000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1682598,
    "job_title_short": "Senior Data Analyst",
    "company_name": "BlueLabs Analytics",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_id": 210881,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_id": 479282,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "75000.0",
    "skills": "r"
  },
  {
    "job_id": 1065749,
    "job_title_short": "Data Analyst",
    "company_name": "Chicken of the Sea",
    "salary_year_avg": "75000.0",
    "skills": "spark"
  },
  {
    "job_id": 764861,
    "job_title_short": "Data Analyst",
    "company_name": "Chicken of the Sea",
    "salary_year_avg": "75000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 555049,
    "job_title_short": "Data Analyst",
    "company_name": "Engage Partners Inc.",
    "salary_year_avg": "75000.0",
    "skills": "tableau"
  },
  {
    "job_id": 221984,
    "job_title_short": "Data Analyst",
    "company_name": "MaryRuth's",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1513802,
    "job_title_short": "Data Analyst",
    "company_name": "In Technology Group Inc (US)",
    "salary_year_avg": "75000.0",
    "skills": "excel"
  },
  {
    "job_id": 1406540,
    "job_title_short": "Data Analyst",
    "company_name": "Beyond 12",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_id": 1513802,
    "job_title_short": "Data Analyst",
    "company_name": "In Technology Group Inc (US)",
    "salary_year_avg": "75000.0",
    "skills": "sql"
  },
  {
    "job_id": 479282,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "75000.0",
    "skills": "python"
  },
  {
    "job_id": 1321085,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1210145,
    "job_title_short": "Data Analyst",
    "company_name": "Health Choice Network",
    "salary_year_avg": "75000.0",
    "skills": "word"
  },
  {
    "job_id": 1170721,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1170721,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "nosql"
  },
  {
    "job_id": 156786,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "75000.0",
    "skills": "sheets"
  },
  {
    "job_id": 210881,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "75000.0",
    "skills": "r"
  },
  {
    "job_id": 1517483,
    "job_title_short": "Data Analyst",
    "company_name": "KodeKloud",
    "salary_year_avg": "75000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1513802,
    "job_title_short": "Data Analyst",
    "company_name": "In Technology Group Inc (US)",
    "salary_year_avg": "75000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1682598,
    "job_title_short": "Senior Data Analyst",
    "company_name": "BlueLabs Analytics",
    "salary_year_avg": "75000.0",
    "skills": "r"
  },
  {
    "job_id": 479282,
    "job_title_short": "Data Analyst",
    "company_name": "hackajob",
    "salary_year_avg": "75000.0",
    "skills": "java"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "word"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "sas"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "spss"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "r"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "excel"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "sas"
  },
  {
    "job_id": 813827,
    "job_title_short": "Data Analyst",
    "company_name": "Southern California University",
    "salary_year_avg": "74500.0",
    "skills": "tableau"
  },
  {
    "job_id": 47248,
    "job_title_short": "Data Analyst",
    "company_name": "NCUA",
    "salary_year_avg": "74224.5",
    "skills": "python"
  },
  {
    "job_id": 47248,
    "job_title_short": "Data Analyst",
    "company_name": "NCUA",
    "salary_year_avg": "74224.5",
    "skills": "r"
  },
  {
    "job_id": 47248,
    "job_title_short": "Data Analyst",
    "company_name": "NCUA",
    "salary_year_avg": "74224.5",
    "skills": "c"
  },
  {
    "job_id": 425984,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "74049.0",
    "skills": "sas"
  },
  {
    "job_id": 425984,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "74049.0",
    "skills": "sas"
  },
  {
    "job_id": 425984,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "74049.0",
    "skills": "sql"
  },
  {
    "job_id": 425984,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "74049.0",
    "skills": "python"
  },
  {
    "job_id": 425984,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "74049.0",
    "skills": "jira"
  },
  {
    "job_id": 425984,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "74049.0",
    "skills": "r"
  },
  {
    "job_id": 1338279,
    "job_title_short": "Data Analyst",
    "company_name": "Retriever Medial Dental Payments LLC",
    "salary_year_avg": "74000.0",
    "skills": "vba"
  },
  {
    "job_id": 1726747,
    "job_title_short": "Data Analyst",
    "company_name": "Applied Engineering Management Corporation",
    "salary_year_avg": "74000.0",
    "skills": "python"
  },
  {
    "job_id": 1338279,
    "job_title_short": "Data Analyst",
    "company_name": "Retriever Medial Dental Payments LLC",
    "salary_year_avg": "74000.0",
    "skills": "sql"
  },
  {
    "job_id": 1726747,
    "job_title_short": "Data Analyst",
    "company_name": "Applied Engineering Management Corporation",
    "salary_year_avg": "74000.0",
    "skills": "r"
  },
  {
    "job_id": 1338279,
    "job_title_short": "Data Analyst",
    "company_name": "Retriever Medial Dental Payments LLC",
    "salary_year_avg": "74000.0",
    "skills": "python"
  },
  {
    "job_id": 1726747,
    "job_title_short": "Data Analyst",
    "company_name": "Applied Engineering Management Corporation",
    "salary_year_avg": "74000.0",
    "skills": "excel"
  },
  {
    "job_id": 1338279,
    "job_title_short": "Data Analyst",
    "company_name": "Retriever Medial Dental Payments LLC",
    "salary_year_avg": "74000.0",
    "skills": "r"
  },
  {
    "job_id": 1338279,
    "job_title_short": "Data Analyst",
    "company_name": "Retriever Medial Dental Payments LLC",
    "salary_year_avg": "74000.0",
    "skills": "excel"
  },
  {
    "job_id": 1726747,
    "job_title_short": "Data Analyst",
    "company_name": "Applied Engineering Management Corporation",
    "salary_year_avg": "74000.0",
    "skills": "sas"
  },
  {
    "job_id": 1726747,
    "job_title_short": "Data Analyst",
    "company_name": "Applied Engineering Management Corporation",
    "salary_year_avg": "74000.0",
    "skills": "sas"
  },
  {
    "job_id": 1338279,
    "job_title_short": "Data Analyst",
    "company_name": "Retriever Medial Dental Payments LLC",
    "salary_year_avg": "74000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1338279,
    "job_title_short": "Data Analyst",
    "company_name": "Retriever Medial Dental Payments LLC",
    "salary_year_avg": "74000.0",
    "skills": "tableau"
  },
  {
    "job_id": 669824,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "73696.0",
    "skills": "excel"
  },
  {
    "job_id": 669824,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "73696.0",
    "skills": "tableau"
  },
  {
    "job_id": 669824,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "73696.0",
    "skills": "sql"
  },
  {
    "job_id": 1553132,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "73631.0",
    "skills": "excel"
  },
  {
    "job_id": 1553132,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "73631.0",
    "skills": "alteryx"
  },
  {
    "job_id": 1553132,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "73631.0",
    "skills": "sql"
  },
  {
    "job_id": 1553132,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Healthcare",
    "salary_year_avg": "73631.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1395633,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "73000.0",
    "skills": "vba"
  },
  {
    "job_id": 1395633,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "73000.0",
    "skills": "python"
  },
  {
    "job_id": 1395633,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "73000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1395633,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "73000.0",
    "skills": "excel"
  },
  {
    "job_id": 1395633,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "73000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1395633,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "73000.0",
    "skills": "sql"
  },
  {
    "job_id": 1395633,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "73000.0",
    "skills": "dax"
  },
  {
    "job_id": 93604,
    "job_title_short": "Data Analyst",
    "company_name": "Bluesight",
    "salary_year_avg": "72500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1446024,
    "job_title_short": "Data Analyst",
    "company_name": "CharterUP",
    "salary_year_avg": "72500.0",
    "skills": "erlang"
  },
  {
    "job_id": 93604,
    "job_title_short": "Data Analyst",
    "company_name": "Bluesight",
    "salary_year_avg": "72500.0",
    "skills": "ruby"
  },
  {
    "job_id": 1684855,
    "job_title_short": "Data Analyst",
    "company_name": "Every Body Texas",
    "salary_year_avg": "72500.0",
    "skills": "azure"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "sas"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "sas"
  },
  {
    "job_id": 1446024,
    "job_title_short": "Data Analyst",
    "company_name": "CharterUP",
    "salary_year_avg": "72500.0",
    "skills": "power bi"
  },
  {
    "job_id": 621498,
    "job_title_short": "Data Analyst",
    "company_name": "Global Healthcare Exchange, Inc.",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 93604,
    "job_title_short": "Data Analyst",
    "company_name": "Bluesight",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "plotly"
  },
  {
    "job_id": 1583314,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "72500.0",
    "skills": "sap"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "seaborn"
  },
  {
    "job_id": 1446024,
    "job_title_short": "Data Analyst",
    "company_name": "CharterUP",
    "salary_year_avg": "72500.0",
    "skills": "express"
  },
  {
    "job_id": 1684855,
    "job_title_short": "Data Analyst",
    "company_name": "Every Body Texas",
    "salary_year_avg": "72500.0",
    "skills": "r"
  },
  {
    "job_id": 93604,
    "job_title_short": "Data Analyst",
    "company_name": "Bluesight",
    "salary_year_avg": "72500.0",
    "skills": "ruby"
  },
  {
    "job_id": 1684855,
    "job_title_short": "Data Analyst",
    "company_name": "Every Body Texas",
    "salary_year_avg": "72500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1446024,
    "job_title_short": "Data Analyst",
    "company_name": "CharterUP",
    "salary_year_avg": "72500.0",
    "skills": "sheets"
  },
  {
    "job_id": 621498,
    "job_title_short": "Data Analyst",
    "company_name": "Global Healthcare Exchange, Inc.",
    "salary_year_avg": "72500.0",
    "skills": "python"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "python"
  },
  {
    "job_id": 1684855,
    "job_title_short": "Data Analyst",
    "company_name": "Every Body Texas",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_id": 1583314,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_id": 93604,
    "job_title_short": "Data Analyst",
    "company_name": "Bluesight",
    "salary_year_avg": "72500.0",
    "skills": "python"
  },
  {
    "job_id": 93604,
    "job_title_short": "Data Analyst",
    "company_name": "Bluesight",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_id": 1684855,
    "job_title_short": "Data Analyst",
    "company_name": "Every Body Texas",
    "salary_year_avg": "72500.0",
    "skills": "spss"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "spss"
  },
  {
    "job_id": 1262610,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_id": 621498,
    "job_title_short": "Data Analyst",
    "company_name": "Global Healthcare Exchange, Inc.",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_id": 468876,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Staffing",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_id": 1446024,
    "job_title_short": "Data Analyst",
    "company_name": "CharterUP",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_id": 1446024,
    "job_title_short": "Data Analyst",
    "company_name": "CharterUP",
    "salary_year_avg": "72500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1262610,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_id": 621498,
    "job_title_short": "Data Analyst",
    "company_name": "Global Healthcare Exchange, Inc.",
    "salary_year_avg": "72500.0",
    "skills": "excel"
  },
  {
    "job_id": 621498,
    "job_title_short": "Data Analyst",
    "company_name": "Global Healthcare Exchange, Inc.",
    "salary_year_avg": "72500.0",
    "skills": "gitlab"
  },
  {
    "job_id": 93604,
    "job_title_short": "Data Analyst",
    "company_name": "Bluesight",
    "salary_year_avg": "72500.0",
    "skills": "sql"
  },
  {
    "job_id": 432310,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "72000.0",
    "skills": "nosql"
  },
  {
    "job_id": 432310,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "72000.0",
    "skills": "sql"
  },
  {
    "job_id": 1698696,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "tableau"
  },
  {
    "job_id": 1698696,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "phoenix"
  },
  {
    "job_id": 897644,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "sql"
  },
  {
    "job_id": 361990,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "alteryx"
  },
  {
    "job_id": 361990,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "power bi"
  },
  {
    "job_id": 1698696,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "sql"
  },
  {
    "job_id": 361990,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "excel"
  },
  {
    "job_id": 361990,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "tableau"
  },
  {
    "job_id": 1698696,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "python"
  },
  {
    "job_id": 1698696,
    "job_title_short": "Data Analyst",
    "company_name": "CVS Health",
    "salary_year_avg": "71850.0",
    "skills": "r"
  },
  {
    "job_id": 225308,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "71000.0",
    "skills": "looker"
  },
  {
    "job_id": 225308,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "71000.0",
    "skills": "python"
  },
  {
    "job_id": 225308,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "71000.0",
    "skills": "sql"
  },
  {
    "job_id": 1096460,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70500.0",
    "skills": "sql"
  },
  {
    "job_id": 1128522,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 1625061,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 134039,
    "job_title_short": "Data Analyst",
    "company_name": "Class Action Capital Recovery LLC",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 1527329,
    "job_title_short": "Data Analyst",
    "company_name": "Zelo Digital Recruitment",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 1473524,
    "job_title_short": "Data Analyst",
    "company_name": "Partnership Employment",
    "salary_year_avg": "70000.0",
    "skills": "redshift"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "spss"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 723713,
    "job_title_short": "Data Analyst",
    "company_name": "Amplified Sourcing",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "plotly"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_id": 1397514,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 723713,
    "job_title_short": "Data Analyst",
    "company_name": "Amplified Sourcing",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 723713,
    "job_title_short": "Data Analyst",
    "company_name": "Amplified Sourcing",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 539154,
    "job_title_short": "Data Analyst",
    "company_name": "Pentasia",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_id": 1128522,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "planner"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 1527329,
    "job_title_short": "Data Analyst",
    "company_name": "Zelo Digital Recruitment",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "azure"
  },
  {
    "job_id": 683865,
    "job_title_short": "Data Analyst",
    "company_name": "Global Accounting Network",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 1397514,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "planner"
  },
  {
    "job_id": 134039,
    "job_title_short": "Data Analyst",
    "company_name": "Class Action Capital Recovery LLC",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 539154,
    "job_title_short": "Data Analyst",
    "company_name": "Pentasia",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 1473524,
    "job_title_short": "Data Analyst",
    "company_name": "Partnership Employment",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "flow"
  },
  {
    "job_id": 1264889,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 1264889,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1527329,
    "job_title_short": "Data Analyst",
    "company_name": "Zelo Digital Recruitment",
    "salary_year_avg": "70000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1264889,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 1527329,
    "job_title_short": "Data Analyst",
    "company_name": "Zelo Digital Recruitment",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_id": 539154,
    "job_title_short": "Data Analyst",
    "company_name": "Pentasia",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 1473524,
    "job_title_short": "Data Analyst",
    "company_name": "Partnership Employment",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 339742,
    "job_title_short": "Data Analyst",
    "company_name": "Kermit",
    "salary_year_avg": "70000.0",
    "skills": "excel"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 539154,
    "job_title_short": "Data Analyst",
    "company_name": "Pentasia",
    "salary_year_avg": "70000.0",
    "skills": "sql"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1264889,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 50512,
    "job_title_short": "Data Analyst",
    "company_name": "AdelFi",
    "salary_year_avg": "70000.0",
    "skills": "spreadsheet"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "git"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1264889,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "vba"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "r"
  },
  {
    "job_id": 1264889,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "70000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1527329,
    "job_title_short": "Data Analyst",
    "company_name": "Zelo Digital Recruitment",
    "salary_year_avg": "70000.0",
    "skills": "tableau"
  },
  {
    "job_id": 442024,
    "job_title_short": "Data Analyst",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "70000.0",
    "skills": "seaborn"
  },
  {
    "job_id": 683865,
    "job_title_short": "Data Analyst",
    "company_name": "Global Accounting Network",
    "salary_year_avg": "70000.0",
    "skills": "python"
  },
  {
    "job_id": 723713,
    "job_title_short": "Data Analyst",
    "company_name": "Amplified Sourcing",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_id": 723713,
    "job_title_short": "Data Analyst",
    "company_name": "Amplified Sourcing",
    "salary_year_avg": "70000.0",
    "skills": "sas"
  },
  {
    "job_id": 330595,
    "job_title_short": "Data Analyst",
    "company_name": "Ohio Shared Information Services Inc",
    "salary_year_avg": "70000.0",
    "skills": "crystal"
  },
  {
    "job_id": 683865,
    "job_title_short": "Data Analyst",
    "company_name": "Global Accounting Network",
    "salary_year_avg": "70000.0",
    "skills": "power bi"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "sas"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "sas"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "sql"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "tableau"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "power bi"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "python"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "r"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "go"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "spss"
  },
  {
    "job_id": 865700,
    "job_title_short": "Senior Data Analyst",
    "company_name": "DAVITA",
    "salary_year_avg": "69750.0",
    "skills": "excel"
  },
  {
    "job_id": 482909,
    "job_title_short": "Data Analyst",
    "company_name": "Diversified",
    "salary_year_avg": "69500.0",
    "skills": "sql"
  },
  {
    "job_id": 482909,
    "job_title_short": "Data Analyst",
    "company_name": "Diversified",
    "salary_year_avg": "69500.0",
    "skills": "power bi"
  },
  {
    "job_id": 482909,
    "job_title_short": "Data Analyst",
    "company_name": "Diversified",
    "salary_year_avg": "69500.0",
    "skills": "python"
  },
  {
    "job_id": 297571,
    "job_title_short": "Data Analyst",
    "company_name": "Ambry Genetics Corporation",
    "salary_year_avg": "69000.0",
    "skills": "tableau"
  },
  {
    "job_id": 297571,
    "job_title_short": "Data Analyst",
    "company_name": "Ambry Genetics Corporation",
    "salary_year_avg": "69000.0",
    "skills": "excel"
  },
  {
    "job_id": 297571,
    "job_title_short": "Data Analyst",
    "company_name": "Ambry Genetics Corporation",
    "salary_year_avg": "69000.0",
    "skills": "aws"
  },
  {
    "job_id": 297571,
    "job_title_short": "Data Analyst",
    "company_name": "Ambry Genetics Corporation",
    "salary_year_avg": "69000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "sass"
  },
  {
    "job_id": 605922,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "67500.0",
    "skills": "r"
  },
  {
    "job_id": 243487,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "67500.0",
    "skills": "tableau"
  },
  {
    "job_id": 38696,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "67500.0",
    "skills": "colocation"
  },
  {
    "job_id": 60732,
    "job_title_short": "Data Analyst",
    "company_name": "iTalent Digital",
    "salary_year_avg": "67500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "python"
  },
  {
    "job_id": 60732,
    "job_title_short": "Data Analyst",
    "company_name": "iTalent Digital",
    "salary_year_avg": "67500.0",
    "skills": "python"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "ssrs"
  },
  {
    "job_id": 60732,
    "job_title_short": "Data Analyst",
    "company_name": "iTalent Digital",
    "salary_year_avg": "67500.0",
    "skills": "sql"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "sql server"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "terminal"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "sql"
  },
  {
    "job_id": 243487,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "67500.0",
    "skills": "r"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "power bi"
  },
  {
    "job_id": 60732,
    "job_title_short": "Data Analyst",
    "company_name": "iTalent Digital",
    "salary_year_avg": "67500.0",
    "skills": "excel"
  },
  {
    "job_id": 605922,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "67500.0",
    "skills": "sql"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "flow"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "ssis"
  },
  {
    "job_id": 243487,
    "job_title_short": "Data Analyst",
    "company_name": "CyberCoders",
    "salary_year_avg": "67500.0",
    "skills": "excel"
  },
  {
    "job_id": 605922,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "67500.0",
    "skills": "python"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "c#"
  },
  {
    "job_id": 618426,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "67500.0",
    "skills": "ms access"
  },
  {
    "job_id": 60732,
    "job_title_short": "Data Analyst",
    "company_name": "iTalent Digital",
    "salary_year_avg": "67500.0",
    "skills": "express"
  },
  {
    "job_id": 1400357,
    "job_title_short": "Data Analyst",
    "company_name": "AllianceChicago",
    "salary_year_avg": "67500.0",
    "skills": "azure"
  },
  {
    "job_id": 605922,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "67500.0",
    "skills": "looker"
  },
  {
    "job_id": 1010619,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "66500.0",
    "skills": "python"
  },
  {
    "job_id": 1010619,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "66500.0",
    "skills": "r"
  },
  {
    "job_id": 1010619,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "66500.0",
    "skills": "spss"
  },
  {
    "job_id": 1010619,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "66500.0",
    "skills": "planner"
  },
  {
    "job_id": 1084398,
    "job_title_short": "Data Scientist",
    "company_name": "DOWN Dating & Hookups",
    "salary_year_avg": "66000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1084398,
    "job_title_short": "Data Scientist",
    "company_name": "DOWN Dating & Hookups",
    "salary_year_avg": "66000.0",
    "skills": "ruby on rails"
  },
  {
    "job_id": 1084398,
    "job_title_short": "Data Scientist",
    "company_name": "DOWN Dating & Hookups",
    "salary_year_avg": "66000.0",
    "skills": "aws"
  },
  {
    "job_id": 1084398,
    "job_title_short": "Data Scientist",
    "company_name": "DOWN Dating & Hookups",
    "salary_year_avg": "66000.0",
    "skills": "ruby"
  },
  {
    "job_id": 1084398,
    "job_title_short": "Data Scientist",
    "company_name": "DOWN Dating & Hookups",
    "salary_year_avg": "66000.0",
    "skills": "sql"
  },
  {
    "job_id": 1084398,
    "job_title_short": "Data Scientist",
    "company_name": "DOWN Dating & Hookups",
    "salary_year_avg": "66000.0",
    "skills": "ruby"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1403912,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_id": 1403912,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 394469,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1334734,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sheets"
  },
  {
    "job_id": 1785615,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sheets"
  },
  {
    "job_id": 946898,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_id": 604011,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_id": 384112,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "nosql"
  },
  {
    "job_id": 450752,
    "job_title_short": "Data Analyst",
    "company_name": "Mothership Strategies, LLC",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_id": 1812494,
    "job_title_short": "Data Analyst",
    "company_name": "Bright Power",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_id": 946898,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 179983,
    "job_title_short": "Data Analyst",
    "company_name": "24 Seven Talent",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_id": 604011,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 384112,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1812494,
    "job_title_short": "Data Analyst",
    "company_name": "Bright Power",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1596146,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1812494,
    "job_title_short": "Data Analyst",
    "company_name": "Bright Power",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 179983,
    "job_title_short": "Data Analyst",
    "company_name": "24 Seven Talent",
    "salary_year_avg": "65000.0",
    "skills": "airflow"
  },
  {
    "job_id": 1596146,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_id": 179983,
    "job_title_short": "Data Analyst",
    "company_name": "24 Seven Talent",
    "salary_year_avg": "65000.0",
    "skills": "r"
  },
  {
    "job_id": 450752,
    "job_title_short": "Data Analyst",
    "company_name": "Mothership Strategies, LLC",
    "salary_year_avg": "65000.0",
    "skills": "spark"
  },
  {
    "job_id": 262937,
    "job_title_short": "Data Analyst",
    "company_name": "Citron IT, Inc.",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_id": 179983,
    "job_title_short": "Data Analyst",
    "company_name": "24 Seven Talent",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 450752,
    "job_title_short": "Data Analyst",
    "company_name": "Mothership Strategies, LLC",
    "salary_year_avg": "65000.0",
    "skills": "r"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 262937,
    "job_title_short": "Data Analyst",
    "company_name": "Citron IT, Inc.",
    "salary_year_avg": "65000.0",
    "skills": "python"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 466817,
    "job_title_short": "Data Analyst",
    "company_name": "Aquent Studios",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1596146,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1403912,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_id": 384112,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 394469,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 450752,
    "job_title_short": "Data Analyst",
    "company_name": "Mothership Strategies, LLC",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1812494,
    "job_title_short": "Data Analyst",
    "company_name": "Bright Power",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 604011,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 946898,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 466817,
    "job_title_short": "Data Analyst",
    "company_name": "Aquent Studios",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 946898,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_id": 604011,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_id": 384112,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1596146,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "oracle"
  },
  {
    "job_id": 179983,
    "job_title_short": "Data Analyst",
    "company_name": "24 Seven Talent",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1334734,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1403912,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1785615,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1596146,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "alteryx"
  },
  {
    "job_id": 179983,
    "job_title_short": "Data Analyst",
    "company_name": "24 Seven Talent",
    "salary_year_avg": "65000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "ms access"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "power bi"
  },
  {
    "job_id": 179983,
    "job_title_short": "Data Analyst",
    "company_name": "24 Seven Talent",
    "salary_year_avg": "65000.0",
    "skills": "git"
  },
  {
    "job_id": 1463732,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1705282,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "excel"
  },
  {
    "job_id": 1812494,
    "job_title_short": "Data Analyst",
    "company_name": "Bright Power",
    "salary_year_avg": "65000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1785615,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 262937,
    "job_title_short": "Data Analyst",
    "company_name": "Citron IT, Inc.",
    "salary_year_avg": "65000.0",
    "skills": "azure"
  },
  {
    "job_id": 1403912,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1334734,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1812494,
    "job_title_short": "Data Analyst",
    "company_name": "Bright Power",
    "salary_year_avg": "65000.0",
    "skills": "flow"
  },
  {
    "job_id": 946898,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 604011,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 394469,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 384112,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 262937,
    "job_title_short": "Data Analyst",
    "company_name": "Citron IT, Inc.",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1596146,
    "job_title_short": "Data Analyst",
    "company_name": "Insight Global",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "visual basic"
  },
  {
    "job_id": 466817,
    "job_title_short": "Data Analyst",
    "company_name": "Aquent Studios",
    "salary_year_avg": "65000.0",
    "skills": "sql"
  },
  {
    "job_id": 1403912,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 384112,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_id": 946898,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 604011,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 604011,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_id": 946898,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_id": 384112,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1812494,
    "job_title_short": "Data Analyst",
    "company_name": "Bright Power",
    "salary_year_avg": "65000.0",
    "skills": "jira"
  },
  {
    "job_id": 1403912,
    "job_title_short": "Data Analyst",
    "company_name": "Patterned Learning AI",
    "salary_year_avg": "65000.0",
    "skills": "vba"
  },
  {
    "job_id": 262937,
    "job_title_short": "Data Analyst",
    "company_name": "Citron IT, Inc.",
    "salary_year_avg": "65000.0",
    "skills": "tableau"
  },
  {
    "job_id": 262937,
    "job_title_short": "Data Analyst",
    "company_name": "Citron IT, Inc.",
    "salary_year_avg": "65000.0",
    "skills": "r"
  },
  {
    "job_id": 1441940,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "65000.0",
    "skills": "word"
  },
  {
    "job_id": 1566988,
    "job_title_short": "Data Analyst",
    "company_name": "VetJobs & Military Spouse Jobs",
    "salary_year_avg": "63000.0",
    "skills": "excel"
  },
  {
    "job_id": 1566988,
    "job_title_short": "Data Analyst",
    "company_name": "VetJobs & Military Spouse Jobs",
    "salary_year_avg": "63000.0",
    "skills": "sql"
  },
  {
    "job_id": 43776,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "github"
  },
  {
    "job_id": 43776,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "smartsheet"
  },
  {
    "job_id": 215071,
    "job_title_short": "Data Analyst",
    "company_name": "OZ",
    "salary_year_avg": "62500.0",
    "skills": "redshift"
  },
  {
    "job_id": 329855,
    "job_title_short": "Data Analyst",
    "company_name": "Aegon",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_id": 43776,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1301761,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "sheets"
  },
  {
    "job_id": 376277,
    "job_title_short": "Data Analyst",
    "company_name": "Crescentia GTS",
    "salary_year_avg": "62500.0",
    "skills": "sas"
  },
  {
    "job_id": 1513216,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "62500.0",
    "skills": "word"
  },
  {
    "job_id": 329855,
    "job_title_short": "Data Analyst",
    "company_name": "Aegon",
    "salary_year_avg": "62500.0",
    "skills": "python"
  },
  {
    "job_id": 376277,
    "job_title_short": "Data Analyst",
    "company_name": "Crescentia GTS",
    "salary_year_avg": "62500.0",
    "skills": "sas"
  },
  {
    "job_id": 1650439,
    "job_title_short": "Data Analyst",
    "company_name": "McAllister & Quinn, LLC",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 1301761,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "smartsheet"
  },
  {
    "job_id": 329855,
    "job_title_short": "Data Analyst",
    "company_name": "Aegon",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 1513216,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "62500.0",
    "skills": "tableau"
  },
  {
    "job_id": 553921,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 329855,
    "job_title_short": "Data Analyst",
    "company_name": "Aegon",
    "salary_year_avg": "62500.0",
    "skills": "power bi"
  },
  {
    "job_id": 43776,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_id": 1513216,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "62500.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 376277,
    "job_title_short": "Data Analyst",
    "company_name": "Crescentia GTS",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_id": 43776,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 215071,
    "job_title_short": "Data Analyst",
    "company_name": "OZ",
    "salary_year_avg": "62500.0",
    "skills": "aws"
  },
  {
    "job_id": 376277,
    "job_title_short": "Data Analyst",
    "company_name": "Crescentia GTS",
    "salary_year_avg": "62500.0",
    "skills": "windows"
  },
  {
    "job_id": 1301761,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_id": 215071,
    "job_title_short": "Data Analyst",
    "company_name": "OZ",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_id": 1513216,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 215071,
    "job_title_short": "Data Analyst",
    "company_name": "OZ",
    "salary_year_avg": "62500.0",
    "skills": "bash"
  },
  {
    "job_id": 1301761,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "github"
  },
  {
    "job_id": 376277,
    "job_title_short": "Data Analyst",
    "company_name": "Crescentia GTS",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 1301761,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 215071,
    "job_title_short": "Data Analyst",
    "company_name": "OZ",
    "salary_year_avg": "62500.0",
    "skills": "python"
  },
  {
    "job_id": 215071,
    "job_title_short": "Data Analyst",
    "company_name": "OZ",
    "salary_year_avg": "62500.0",
    "skills": "spark"
  },
  {
    "job_id": 329855,
    "job_title_short": "Data Analyst",
    "company_name": "Aegon",
    "salary_year_avg": "62500.0",
    "skills": "tableau"
  },
  {
    "job_id": 634102,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "62000.0",
    "skills": "excel"
  },
  {
    "job_id": 1138427,
    "job_title_short": "Data Analyst",
    "company_name": "Aflac, Incorporated",
    "salary_year_avg": "60000.0",
    "skills": "r"
  },
  {
    "job_id": 616124,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_id": 1424729,
    "job_title_short": "Data Analyst",
    "company_name": "BLUE STORM ASSOCIATES INC",
    "salary_year_avg": "60000.0",
    "skills": "matlab"
  },
  {
    "job_id": 758435,
    "job_title_short": "Data Analyst",
    "company_name": "SHI International Corp.",
    "salary_year_avg": "60000.0",
    "skills": "power bi"
  },
  {
    "job_id": 697068,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International, Corp.",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_id": 758435,
    "job_title_short": "Data Analyst",
    "company_name": "SHI International Corp.",
    "salary_year_avg": "60000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 616124,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "60000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1424729,
    "job_title_short": "Data Analyst",
    "company_name": "BLUE STORM ASSOCIATES INC",
    "salary_year_avg": "60000.0",
    "skills": "python"
  },
  {
    "job_id": 697068,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International, Corp.",
    "salary_year_avg": "60000.0",
    "skills": "smartsheet"
  },
  {
    "job_id": 1138427,
    "job_title_short": "Data Analyst",
    "company_name": "Aflac, Incorporated",
    "salary_year_avg": "60000.0",
    "skills": "python"
  },
  {
    "job_id": 212308,
    "job_title_short": "Data Analyst",
    "company_name": "El Buen Samaritano",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_id": 212308,
    "job_title_short": "Data Analyst",
    "company_name": "El Buen Samaritano",
    "salary_year_avg": "60000.0",
    "skills": "spss"
  },
  {
    "job_id": 179907,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_id": 1138427,
    "job_title_short": "Data Analyst",
    "company_name": "Aflac, Incorporated",
    "salary_year_avg": "60000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1431520,
    "job_title_short": "Data Analyst",
    "company_name": "Jumpvine",
    "salary_year_avg": "60000.0",
    "skills": "go"
  },
  {
    "job_id": 616124,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "60000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1138427,
    "job_title_short": "Data Analyst",
    "company_name": "Aflac, Incorporated",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_id": 212308,
    "job_title_short": "Data Analyst",
    "company_name": "El Buen Samaritano",
    "salary_year_avg": "60000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1138427,
    "job_title_short": "Data Analyst",
    "company_name": "Aflac, Incorporated",
    "salary_year_avg": "60000.0",
    "skills": "word"
  },
  {
    "job_id": 212308,
    "job_title_short": "Data Analyst",
    "company_name": "El Buen Samaritano",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_id": 616124,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Finance",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_id": 286007,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "60000.0",
    "skills": "sheets"
  },
  {
    "job_id": 758435,
    "job_title_short": "Data Analyst",
    "company_name": "SHI International Corp.",
    "salary_year_avg": "60000.0",
    "skills": "vba"
  },
  {
    "job_id": 758435,
    "job_title_short": "Data Analyst",
    "company_name": "SHI International Corp.",
    "salary_year_avg": "60000.0",
    "skills": "excel"
  },
  {
    "job_id": 697068,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International, Corp.",
    "salary_year_avg": "60000.0",
    "skills": "sheets"
  },
  {
    "job_id": 163009,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Marketing",
    "salary_year_avg": "60000.0",
    "skills": "sheets"
  },
  {
    "job_id": 758435,
    "job_title_short": "Data Analyst",
    "company_name": "SHI International Corp.",
    "salary_year_avg": "60000.0",
    "skills": "visual basic"
  },
  {
    "job_id": 1138427,
    "job_title_short": "Data Analyst",
    "company_name": "Aflac, Incorporated",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_id": 212308,
    "job_title_short": "Data Analyst",
    "company_name": "El Buen Samaritano",
    "salary_year_avg": "60000.0",
    "skills": "mysql"
  },
  {
    "job_id": 212308,
    "job_title_short": "Data Analyst",
    "company_name": "El Buen Samaritano",
    "salary_year_avg": "60000.0",
    "skills": "power bi"
  },
  {
    "job_id": 212308,
    "job_title_short": "Data Analyst",
    "company_name": "El Buen Samaritano",
    "salary_year_avg": "60000.0",
    "skills": "t-sql"
  },
  {
    "job_id": 697068,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International, Corp.",
    "salary_year_avg": "60000.0",
    "skills": "sql"
  },
  {
    "job_id": 719006,
    "job_title_short": "Data Analyst",
    "company_name": "Suncoast Credit Union",
    "salary_year_avg": "59500.0",
    "skills": "excel"
  },
  {
    "job_id": 719006,
    "job_title_short": "Data Analyst",
    "company_name": "Suncoast Credit Union",
    "salary_year_avg": "59500.0",
    "skills": "sql"
  },
  {
    "job_id": 719006,
    "job_title_short": "Data Analyst",
    "company_name": "Suncoast Credit Union",
    "salary_year_avg": "59500.0",
    "skills": "python"
  },
  {
    "job_id": 489565,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "word"
  },
  {
    "job_id": 489565,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 489565,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "excel"
  },
  {
    "job_id": 1117967,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "tableau"
  },
  {
    "job_id": 489565,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1117967,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "excel"
  },
  {
    "job_id": 1117967,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "word"
  },
  {
    "job_id": 1117967,
    "job_title_short": "Data Analyst",
    "company_name": "Ryder System",
    "salary_year_avg": "59000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1091264,
    "job_title_short": "Data Analyst",
    "company_name": "Webstaurant Store",
    "salary_year_avg": "58000.0",
    "skills": "sql"
  },
  {
    "job_id": 1091264,
    "job_title_short": "Data Analyst",
    "company_name": "Webstaurant Store",
    "salary_year_avg": "58000.0",
    "skills": "excel"
  },
  {
    "job_id": 785489,
    "job_title_short": "Data Analyst",
    "company_name": "Stafford Consulting Company, Inc.",
    "salary_year_avg": "57500.0",
    "skills": "microsoft teams"
  },
  {
    "job_id": 785489,
    "job_title_short": "Data Analyst",
    "company_name": "Stafford Consulting Company, Inc.",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1635949,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 346462,
    "job_title_short": "Data Analyst",
    "company_name": "The Difference Card",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1635949,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "57500.0",
    "skills": "sql"
  },
  {
    "job_id": 441975,
    "job_title_short": "Data Analyst",
    "company_name": "FiberFirst",
    "salary_year_avg": "57500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 346462,
    "job_title_short": "Data Analyst",
    "company_name": "The Difference Card",
    "salary_year_avg": "57500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1635949,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "57500.0",
    "skills": "power bi"
  },
  {
    "job_id": 346462,
    "job_title_short": "Data Analyst",
    "company_name": "The Difference Card",
    "salary_year_avg": "57500.0",
    "skills": "sql"
  },
  {
    "job_id": 441975,
    "job_title_short": "Data Analyst",
    "company_name": "FiberFirst",
    "salary_year_avg": "57500.0",
    "skills": "visio"
  },
  {
    "job_id": 346462,
    "job_title_short": "Data Analyst",
    "company_name": "The Difference Card",
    "salary_year_avg": "57500.0",
    "skills": "visio"
  },
  {
    "job_id": 1635949,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "57500.0",
    "skills": "visio"
  },
  {
    "job_id": 441975,
    "job_title_short": "Data Analyst",
    "company_name": "FiberFirst",
    "salary_year_avg": "57500.0",
    "skills": "sql"
  },
  {
    "job_id": 441975,
    "job_title_short": "Data Analyst",
    "company_name": "FiberFirst",
    "salary_year_avg": "57500.0",
    "skills": "excel"
  },
  {
    "job_id": 346462,
    "job_title_short": "Data Analyst",
    "company_name": "The Difference Card",
    "salary_year_avg": "57500.0",
    "skills": "word"
  },
  {
    "job_id": 1635949,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "57500.0",
    "skills": "word"
  },
  {
    "job_id": 1635949,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "57500.0",
    "skills": "sql server"
  },
  {
    "job_id": 346462,
    "job_title_short": "Data Analyst",
    "company_name": "The Difference Card",
    "salary_year_avg": "57500.0",
    "skills": "excel"
  },
  {
    "job_id": 346462,
    "job_title_short": "Data Analyst",
    "company_name": "The Difference Card",
    "salary_year_avg": "57500.0",
    "skills": "sql server"
  },
  {
    "job_id": 441975,
    "job_title_short": "Data Analyst",
    "company_name": "FiberFirst",
    "salary_year_avg": "57500.0",
    "skills": "word"
  },
  {
    "job_id": 441975,
    "job_title_short": "Data Analyst",
    "company_name": "FiberFirst",
    "salary_year_avg": "57500.0",
    "skills": "outlook"
  },
  {
    "job_id": 739541,
    "job_title_short": "Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "57300.0",
    "skills": "word"
  },
  {
    "job_id": 739541,
    "job_title_short": "Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "57300.0",
    "skills": "sas"
  },
  {
    "job_id": 739541,
    "job_title_short": "Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "57300.0",
    "skills": "excel"
  },
  {
    "job_id": 739541,
    "job_title_short": "Data Analyst",
    "company_name": "Ascendo Resources",
    "salary_year_avg": "57300.0",
    "skills": "sas"
  },
  {
    "job_id": 1598725,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "55500.0",
    "skills": "aws"
  },
  {
    "job_id": 1598725,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "55500.0",
    "skills": "snowflake"
  },
  {
    "job_id": 562116,
    "job_title_short": "Data Analyst",
    "company_name": "JARBO Employment Group",
    "salary_year_avg": "55000.0",
    "skills": "flow"
  },
  {
    "job_id": 837423,
    "job_title_short": "Data Analyst",
    "company_name": "State of Georgia",
    "salary_year_avg": "55000.0",
    "skills": "crystal"
  },
  {
    "job_id": 837423,
    "job_title_short": "Data Analyst",
    "company_name": "State of Georgia",
    "salary_year_avg": "55000.0",
    "skills": "sql"
  },
  {
    "job_id": 562116,
    "job_title_short": "Data Analyst",
    "company_name": "JARBO Employment Group",
    "salary_year_avg": "55000.0",
    "skills": "word"
  },
  {
    "job_id": 837423,
    "job_title_short": "Data Analyst",
    "company_name": "State of Georgia",
    "salary_year_avg": "55000.0",
    "skills": "html"
  },
  {
    "job_id": 837423,
    "job_title_short": "Data Analyst",
    "company_name": "State of Georgia",
    "salary_year_avg": "55000.0",
    "skills": "excel"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "cognos"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "word"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "c++"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "sas"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "sql"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "tableau"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "excel"
  },
  {
    "job_id": 486466,
    "job_title_short": "Data Analyst",
    "company_name": "WALGREENS",
    "salary_year_avg": "54540.0",
    "skills": "sas"
  },
  {
    "job_id": 198826,
    "job_title_short": "Data Analyst",
    "company_name": "University of South Florida",
    "salary_year_avg": "53000.0",
    "skills": "outlook"
  },
  {
    "job_id": 198826,
    "job_title_short": "Data Analyst",
    "company_name": "University of South Florida",
    "salary_year_avg": "53000.0",
    "skills": "word"
  },
  {
    "job_id": 198826,
    "job_title_short": "Data Analyst",
    "company_name": "University of South Florida",
    "salary_year_avg": "53000.0",
    "skills": "excel"
  },
  {
    "job_id": 198826,
    "job_title_short": "Data Analyst",
    "company_name": "University of South Florida",
    "salary_year_avg": "53000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1203514,
    "job_title_short": "Data Analyst",
    "company_name": "Acosta, Inc.",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_id": 1203514,
    "job_title_short": "Data Analyst",
    "company_name": "Acosta, Inc.",
    "salary_year_avg": "52500.0",
    "skills": "power bi"
  },
  {
    "job_id": 902110,
    "job_title_short": "Data Analyst",
    "company_name": "Phoenix Capital Group Holdings LLC",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_id": 74841,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "52500.0",
    "skills": "sql"
  },
  {
    "job_id": 74841,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_id": 862094,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "52500.0",
    "skills": "excel"
  },
  {
    "job_id": 1203514,
    "job_title_short": "Data Analyst",
    "company_name": "Acosta, Inc.",
    "salary_year_avg": "52500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 862094,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "52500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1203514,
    "job_title_short": "Data Analyst",
    "company_name": "Acosta, Inc.",
    "salary_year_avg": "52500.0",
    "skills": "windows"
  },
  {
    "job_id": 902110,
    "job_title_short": "Data Analyst",
    "company_name": "Phoenix Capital Group Holdings LLC",
    "salary_year_avg": "52500.0",
    "skills": "julia"
  },
  {
    "job_id": 862094,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "52500.0",
    "skills": "sql"
  },
  {
    "job_id": 74841,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "52500.0",
    "skills": "spreadsheet"
  },
  {
    "job_id": 862094,
    "job_title_short": "Data Analyst",
    "company_name": "Kaye/Bassman International",
    "salary_year_avg": "52500.0",
    "skills": "smartsheet"
  },
  {
    "job_id": 902110,
    "job_title_short": "Data Analyst",
    "company_name": "Phoenix Capital Group Holdings LLC",
    "salary_year_avg": "52500.0",
    "skills": "phoenix"
  },
  {
    "job_id": 1203514,
    "job_title_short": "Data Analyst",
    "company_name": "Acosta, Inc.",
    "salary_year_avg": "52500.0",
    "skills": "word"
  },
  {
    "job_id": 1049427,
    "job_title_short": "Data Analyst",
    "company_name": "Spark451 Inc.",
    "salary_year_avg": "52000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1049427,
    "job_title_short": "Data Analyst",
    "company_name": "Spark451 Inc.",
    "salary_year_avg": "52000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1049427,
    "job_title_short": "Data Analyst",
    "company_name": "Spark451 Inc.",
    "salary_year_avg": "52000.0",
    "skills": "word"
  },
  {
    "job_id": 1049427,
    "job_title_short": "Data Analyst",
    "company_name": "Spark451 Inc.",
    "salary_year_avg": "52000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1049427,
    "job_title_short": "Data Analyst",
    "company_name": "Spark451 Inc.",
    "salary_year_avg": "52000.0",
    "skills": "sql"
  },
  {
    "job_id": 1049427,
    "job_title_short": "Data Analyst",
    "company_name": "Spark451 Inc.",
    "salary_year_avg": "52000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 642310,
    "job_title_short": "Data Analyst",
    "company_name": "University of Maryland, Baltimore",
    "salary_year_avg": "51500.0",
    "skills": "sas"
  },
  {
    "job_id": 642310,
    "job_title_short": "Data Analyst",
    "company_name": "University of Maryland, Baltimore",
    "salary_year_avg": "51500.0",
    "skills": "excel"
  },
  {
    "job_id": 642310,
    "job_title_short": "Data Analyst",
    "company_name": "University of Maryland, Baltimore",
    "salary_year_avg": "51500.0",
    "skills": "spss"
  },
  {
    "job_id": 642310,
    "job_title_short": "Data Analyst",
    "company_name": "University of Maryland, Baltimore",
    "salary_year_avg": "51500.0",
    "skills": "sas"
  },
  {
    "job_id": 1073885,
    "job_title_short": "Data Analyst",
    "company_name": "Jacksonville",
    "salary_year_avg": "51059.0",
    "skills": "java"
  },
  {
    "job_id": 1073885,
    "job_title_short": "Data Analyst",
    "company_name": "Jacksonville",
    "salary_year_avg": "51059.0",
    "skills": "python"
  },
  {
    "job_id": 1073885,
    "job_title_short": "Data Analyst",
    "company_name": "Jacksonville",
    "salary_year_avg": "51059.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1073885,
    "job_title_short": "Data Analyst",
    "company_name": "Jacksonville",
    "salary_year_avg": "51059.0",
    "skills": "ruby on rails"
  },
  {
    "job_id": 1073885,
    "job_title_short": "Data Analyst",
    "company_name": "Jacksonville",
    "salary_year_avg": "51059.0",
    "skills": "ruby"
  },
  {
    "job_id": 1073885,
    "job_title_short": "Data Analyst",
    "company_name": "Jacksonville",
    "salary_year_avg": "51059.0",
    "skills": "ruby"
  },
  {
    "job_id": 1073885,
    "job_title_short": "Data Analyst",
    "company_name": "Jacksonville",
    "salary_year_avg": "51059.0",
    "skills": "mongodb"
  },
  {
    "job_id": 44448,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "51000.0",
    "skills": "sql"
  },
  {
    "job_id": 44448,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "51000.0",
    "skills": "excel"
  },
  {
    "job_id": 44448,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "51000.0",
    "skills": "ssis"
  },
  {
    "job_id": 940139,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Textile Exchange",
    "salary_year_avg": "50500.0",
    "skills": "excel"
  },
  {
    "job_id": 940139,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Textile Exchange",
    "salary_year_avg": "50500.0",
    "skills": "tableau"
  },
  {
    "job_id": 940139,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Textile Exchange",
    "salary_year_avg": "50500.0",
    "skills": "sql"
  },
  {
    "job_id": 940139,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Textile Exchange",
    "salary_year_avg": "50500.0",
    "skills": "vba"
  },
  {
    "job_id": 940139,
    "job_title_short": "Senior Data Analyst",
    "company_name": "Textile Exchange",
    "salary_year_avg": "50500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1672776,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "50000.0",
    "skills": "excel"
  },
  {
    "job_id": 1278164,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "50000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1278164,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "50000.0",
    "skills": "r"
  },
  {
    "job_id": 1278164,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "50000.0",
    "skills": "tableau"
  },
  {
    "job_id": 269335,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "50000.0",
    "skills": "python"
  },
  {
    "job_id": 1278164,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "50000.0",
    "skills": "python"
  },
  {
    "job_id": 269335,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "50000.0",
    "skills": "r"
  },
  {
    "job_id": 1278164,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Transportation",
    "salary_year_avg": "50000.0",
    "skills": "excel"
  },
  {
    "job_id": 1605573,
    "job_title_short": "Data Analyst",
    "company_name": "Allied Technologies & Consulting",
    "salary_year_avg": "48500.0",
    "skills": "excel"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "aws"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "excel"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "c++"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1262617,
    "job_title_short": "Data Analyst",
    "company_name": "Ali Awad Law, P.C.",
    "salary_year_avg": "47500.0",
    "skills": "excel"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "python"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "flow"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "r"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "sql"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1262617,
    "job_title_short": "Data Analyst",
    "company_name": "Ali Awad Law, P.C.",
    "salary_year_avg": "47500.0",
    "skills": "sql"
  },
  {
    "job_id": 229128,
    "job_title_short": "Data Analyst",
    "company_name": "Men's Health Clinic (MHC)",
    "salary_year_avg": "47500.0",
    "skills": "c"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "46500.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "46500.0",
    "skills": "sas"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "46500.0",
    "skills": "sas"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "46500.0",
    "skills": "sql"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "46500.0",
    "skills": "excel"
  },
  {
    "job_id": 1619146,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "46500.0",
    "skills": "oracle"
  },
  {
    "job_id": 473213,
    "job_title_short": "Data Analyst",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "salary_year_avg": "42500.0",
    "skills": "windows"
  },
  {
    "job_id": 473213,
    "job_title_short": "Data Analyst",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "salary_year_avg": "42500.0",
    "skills": "excel"
  },
  {
    "job_id": 473213,
    "job_title_short": "Data Analyst",
    "company_name": "U.S. Wire and Cable Company/ Flexon Industries",
    "salary_year_avg": "42500.0",
    "skills": "wire"
  },
  {
    "job_id": 512966,
    "job_title_short": "Data Analyst",
    "company_name": "BayOne Solutions",
    "salary_year_avg": "41000.0",
    "skills": "sql"
  },
  {
    "job_id": 512966,
    "job_title_short": "Data Analyst",
    "company_name": "BayOne Solutions",
    "salary_year_avg": "41000.0",
    "skills": "tableau"
  },
  {
    "job_id": 994565,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Administrative",
    "salary_year_avg": "39000.0",
    "skills": "excel"
  },
  {
    "job_id": 1349849,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "36000.0",
    "skills": "excel"
  },
  {
    "job_id": 1349849,
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "36000.0",
    "skills": "sql"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "company_name": "Jobmatchingpartner Ltd",
    "salary_year_avg": "35000.0",
    "skills": "spark"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "company_name": "Jobmatchingpartner Ltd",
    "salary_year_avg": "35000.0",
    "skills": "python"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "company_name": "Jobmatchingpartner Ltd",
    "salary_year_avg": "35000.0",
    "skills": "looker"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "company_name": "Jobmatchingpartner Ltd",
    "salary_year_avg": "35000.0",
    "skills": "r"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "company_name": "Jobmatchingpartner Ltd",
    "salary_year_avg": "35000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1178688,
    "job_title_short": "Data Analyst",
    "company_name": "Jobmatchingpartner Ltd",
    "salary_year_avg": "35000.0",
    "skills": "sql"
  }
]
*/