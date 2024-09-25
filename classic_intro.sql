CREATE DATABASE classic_intro;
USE classic_intro;

-- Create the employees table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    dept VARCHAR(50),
    salary FLOAT
);

-- Insert sample data into employees table
INSERT INTO employees (emp_name, gender, dept, salary) VALUES
('Diana', 'F', 'Marketing', 60000),
('Peter', 'M', 'Sales', 55000),
('Sophia', 'F', 'Finance', 75000),
('Kevin', 'M', 'HR', 68000),
('Emma', 'F', 'IT', 72000);

-- Create the products table
CREATE TABLE products (
    productcode VARCHAR(20) PRIMARY KEY,
    productname VARCHAR(100),
    msrp FLOAT
);

-- Insert sample data into products table
INSERT INTO products (productcode, productname, msrp) VALUES
('P01', 'Desk Chair', 150.00),
('P02', 'Office Desk', 250.00),
('P03', 'Monitor Stand', 50.00),
('P04', 'Laptop', 1200.00);

-- Create the orderdetails table
CREATE TABLE orderdetails (
    ordernumber INT,
    productcode VARCHAR(20),
    priceeach FLOAT,
    PRIMARY KEY (ordernumber, productcode),
    FOREIGN KEY (productcode) REFERENCES products(productcode)
);

-- Insert sample data into orderdetails table
INSERT INTO orderdetails (ordernumber, productcode, priceeach) VALUES
(1001, 'P01', 130.00),
(1002, 'P03', 45.00),
(1003, 'P04', 1150.00),
(1004, 'P02', 240.00);
