

USE sql_intro;

-- Create the sales table with duplicate emp_id values
CREATE TABLE sales (
    emp_id VARCHAR(7), 
    emp_name VARCHAR(50), 
    sales_amount FLOAT
);

-- Insert sample data with duplicate emp_id values
INSERT INTO sales (emp_id, emp_name, sales_amount) VALUES
('A1B2C3', 'Alice', 5000),
('A1B2C3', 'Alice', 7500),
('D4E5F6', 'Bob', 8000),
('D4E5F6', 'Bob', 6000),
('G7H8I9', 'John', 9000),
('G7H8I9', 'John', 7000),
('J1K2L3', 'Marry', 7000),
('M4N5O6', 'Eva', 8500),
('M4N5O6', 'Eva', 5000),
('P7Q8R9', 'Mike', 9500);

-- Select all records to verify the data
SELECT * FROM sales;
-- Ranking Sales within Each Employee (Partitioning by emp_id)
SELECT 
    emp_id,
    emp_name,
    sales_amount,
    RANK() OVER (PARTITION BY emp_id ORDER BY sales_amount DESC) AS sales_rank
FROM 
    sales;

-- Calculating Total Sales per Employee (Using SUM with PARTITION BY)
SELECT 
    emp_id,
    emp_name,
    sales_amount,
    SUM(sales_amount) OVER (PARTITION BY emp_id) AS total_sales
FROM 
    sales;

 -- Assigning Row Numbers to Sales Records within Each Employee Group
SELECT 
    emp_id,
    emp_name,
    sales_amount,
    ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY sales_amount DESC) AS row_num
FROM 
    sales;

-- Calculating Average Sales per Employee
SELECT 
    emp_id,
    emp_name,
    sales_amount,
    AVG(sales_amount) OVER (PARTITION BY emp_id) AS avg_sales
FROM 
    sales;


















