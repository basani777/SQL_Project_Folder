/*
Question: What are the top-paying Analyst jobs?

- Identify the top 10 highest-paying Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    cd.name as company_name,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact jpf
LEFT JOIN company_dim cd ON
    jpf.company_id = cd.company_id
WHERE
    job_title_short LIKE '%Analyst%' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
