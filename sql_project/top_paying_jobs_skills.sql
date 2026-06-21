/*
Question: What are the top-paying data analyst jobs, and what skills are required?** 

- Identify the top 10 highest-paying Data Analyst jobs in whch the skills asscoiated are recorded
  and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries.
 */
-- Gets the top 10 paying Data Analyst jobs 
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg
        -- name AS company_name
    FROM
        job_postings_fact
    -- LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_id IN (SELECT job_id FROM skills_job_dim)
        AND job_title_short = 'Data Analyst'
				AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
-- Skills required for data analyst jobs
SELECT
    top_paying_jobs.job_id,
    job_title,
    salary_year_avg,
    skills
FROM
    top_paying_jobs
	INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
	INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*Here are the key insights from the skills data across these 10 top-paying roles:
SQL and Python dominate. SQL appears in 9 of 10 roles, making it effectively non-negotiable. Python follows closely at 8 roles. If you're aiming at high-paying analyst positions, these two are your foundation.
Tableau is the visualization standard. It shows up in 6 roles — far ahead of Power BI (2 roles) and Excel (4 roles). Knowing Tableau gives you a meaningful edge.
Cloud skills are a differentiator. Azure, AWS, Snowflake, and Databricks appear across the higher-paying roles. The top-salaried position (Associate Director at $255K) required all of Azure, AWS, and Databricks together.
More skills ≠ always higher pay. The bubble chart shows this clearly — the Director (Hybrid) role required 14 skills but paid $189K, while the Marketing Analyst role paid $232K with only 5. Breadth alone doesn't drive salary; seniority and domain matter more.
Collaboration tooling clusters in specific roles. Jira, Confluence, Atlassian, and Bitbucket appear together only in roles that also require deeper technical stacks — suggesting those positions are embedded in engineering-heavy orgs.
The core stack for maximum job reach: SQL + Python + Tableau covers the vast majority of requirements and gets you into nearly every one of these roles.*/