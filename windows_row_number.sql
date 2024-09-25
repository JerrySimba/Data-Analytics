-- generate unique row numbers within each department

SELECT 
    emp_id,
    emp_name,
    dept,
    salary,
    ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS row_num
FROM 
    sql_intro.employees;
