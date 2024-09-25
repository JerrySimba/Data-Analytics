-- Rank Employees Based on Salary Within Each Department

SELECT 
    emp_id,
    emp_name,
    dept,
    salary,
    RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS salary_rank
FROM 
    sql_intro.employees;
