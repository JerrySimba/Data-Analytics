-- Calculating Total Salary Per Department

SELECT 
    emp_id,
    emp_name,
    dept,
    salary,
    SUM(salary) OVER (PARTITION BY dept) AS total_dept_salary
FROM 
    sql_intro.employees;
