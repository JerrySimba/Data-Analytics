-- Create the sql_intro database
CREATE DATABASE IF NOT EXISTS sql_intro;
USE sql_intro;

-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    dept VARCHAR(50),
    salary FLOAT
);

-- Insert sample data into employees table
INSERT INTO employees (emp_name, gender, dept, salary) VALUES
('Alice', 'F', 'HR', 75000),
('Bob', 'M', 'IT', 80000),
('John', 'M', 'Finance', 90000),
('Marry', 'F', 'IT', 70000),
('Eva', 'F', 'HR', 85000);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    productcode VARCHAR(20) PRIMARY KEY,
    productname VARCHAR(100),
    msrp FLOAT
);

-- Insert sample data into products table
INSERT INTO products (productcode, productname, msrp) VALUES
('P001', 'Product A', 50.0),
('P002', 'Product B', 100.0),
('P003', 'Product C', 75.0);

-- Create orderdetails table
CREATE TABLE IF NOT EXISTS orderdetails (
    ordernumber INT,
    productcode VARCHAR(20),
    priceeach FLOAT,
    PRIMARY KEY (ordernumber, productcode)
);

-- Insert sample data into orderdetails table
INSERT INTO orderdetails (ordernumber, productcode, priceeach) VALUES
(1, 'P001', 45.0),
(1, 'P002', 95.0),
(2, 'P003', 70.0);

-- Create players table
CREATE TABLE IF NOT EXISTS players (
    name VARCHAR(50),
    country VARCHAR(50),
    goals INT
);

-- Insert sample data into players table
INSERT INTO players (name, country, goals) VALUES
('Player1', 'CountryA', 7),
('Player2', 'CountryB', 5),
('Player3', 'CountryC', 8);

-- Create student table
CREATE TABLE IF NOT EXISTS student (
    st_roll INT,
    age INT,
    name VARCHAR(30),
    mark FLOAT
);

-- Insert sample data into student table
INSERT INTO student (st_roll, age, name, mark) VALUES
(501, 10, 'Ruth', 75.0),
(502, 12, 'Mike', -20.5),
(503, 13, 'Dave', 90.0),
(504, 10, 'Jacobs', -12.5);

-- Create demo table
CREATE TABLE IF NOT EXISTS demo (
    st_id INT,
    st_name VARCHAR(20)
);

-- Insert sample data into demo table
INSERT INTO demo (st_id, st_name) VALUES
(101, 'Shane'),
(102, 'Bradley'),
(103, 'Herath'),
(103, 'Herath'),
(104, 'Nathan');

-- Create demo1 table
CREATE TABLE IF NOT EXISTS demo1 (
    var_a INT
);

-- Insert sample data into demo1 table
INSERT INTO demo1 (var_a) VALUES
(101), (102), (103), (103), (104);
