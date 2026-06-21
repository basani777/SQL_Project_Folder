/*Answer: What are the top skills based on salary? 

- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts 
and helps identify the most financially rewarding skills to acquire or improve.
*/
SELECT skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
      --AND job_location = 'Anywhere'
      AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 30;

/* This is the analysis from the data.
Three tiers emerge:

Premium niche skills ($150K–179K): Solidity, DataRobot, Golang, MXNet — specialized or emerging tech
Infrastructure/DevOps ($124K–147K): Terraform, VMware, Puppet, Ansible, GitLab — 
suggests top-paying "analyst" roles often blend in platform engineering
ML frameworks & big data ($113K–127K): PyTorch, TensorFlow, Keras, Kafka, PySpark, MongoDB — 
consistently valued but not standout differentiators. 
*/