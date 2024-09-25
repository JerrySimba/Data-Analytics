-- modify the emp_id in the sql_intro.employees table and then adding a new column for the city
-- Create a Backup of the Original emp_id to keep a copy of the original emp_id in case need to reference it later.
ALTER TABLE sql_intro.employees ADD original_emp_id VARCHAR(7);
UPDATE sql_intro.employees SET original_emp_id = emp_id;

-- use a combination of the CONCAT, LPAD, FLOOR, and RAND functions to generate random strings.
-- However, since MySQL doesn't natively support generating random letters easily, we'll use a combination of ASCII values to simulate this


UPDATE sql_intro.employees 
SET emp_id = CONCAT(
    LPAD(FLOOR(1 + RAND() * 9), 1, '0'),  -- Random single-digit number
    LPAD(FLOOR(1 + RAND() * 9), 1, '0'),  -- Another random single-digit number
    CHAR(FLOOR(65 + RAND() * 26)),        -- Random uppercase letter
    CHAR(FLOOR(65 + RAND() * 26)),        -- Another random uppercase letter
    LPAD(FLOOR(1 + RAND() * 9), 1, '0'),  -- Another random single-digit number
    LPAD(FLOOR(1 + RAND() * 9), 1, '0')   -- Another random single-digit number
);

-- add new column "city" and populate.

ALTER TABLE sql_intro.employees ADD city VARCHAR(50);
UPDATE sql_intro.employees SET city = 
  CASE 
    WHEN dept = 'HR' THEN 'Nairobi' 
    WHEN dept = 'IT' THEN 'Mombasa' 
    WHEN dept = 'Finance' THEN 'Kisumu' 
    ELSE 'Unknown' 
  END;
SELECT emp_id, emp_name, gender, dept, salary, city, original_emp_id 
FROM sql_intro.employees;

