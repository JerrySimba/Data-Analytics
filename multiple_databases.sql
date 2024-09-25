-- creating subqueries with multiple databases 

use classic_intro
SELECT * FROM employees;
-- selecting any employee earning more salary than least paid sql_intro employees

SELECT emp_name, dept, salary 
FROM classic_intro.employees 
WHERE salary > (SELECT MIN(salary) FROM sql_intro.employees);
