-- advanced sql subqueries
use sql_intro;
-- selecting employees with salary higher than Marry 
SELECT * FROM employees;
SELECT emp_id, emp_name, dept, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE emp_name = 'Marry');

-- Create the classic_intro database
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

-- Create the players table in a separate sports_intro database
CREATE DATABASE sports_intro;
USE sports_intro;

-- Create the players table
CREATE TABLE players (
    name VARCHAR(50),
    country VARCHAR(50),
    goals INT
);

-- Insert sample data into players table
INSERT INTO players (name, country, goals) VALUES
('Messi', 'Argentina', 50),
('Ronaldo', 'Portugal', 55),
('Mbappe', 'France', 60);

-- Create the student table
CREATE TABLE student (
    st_roll INT PRIMARY KEY,
    age INT,
    name VARCHAR(30),
    mark FLOAT
);

-- Insert sample data into student table
INSERT INTO student VALUES
(101, 15, 'Liam', 80.0),
(102, 14, 'Olivia', 85.0),
(103, 16, 'Noah', 90.0),
(104, 14, 'Emma', 95.0);

-- Create the demo table
CREATE TABLE demo (
    st_id INT,
    st_name VARCHAR(50)
);

-- Insert sample data into demo table
INSERT INTO demo VALUES
(1, 'Daniel'),
(2, 'Lucas'),
(3, 'Elijah'),
(4, 'Isabella');

-- Create the demo1 table for rank function
CREATE TABLE demo1 (var_a INT);

-- Insert sample data into demo1 table
INSERT INTO demo1 VALUES
(5), (3), (8), (2), (7);

-- creating subqueries with multiple databases 

use classic_intro
SELECT * FROM employees;
-- selecting any employee earning more salary than least paid sql_intro employees

SELECT emp_name, dept, salary 
FROM classic_intro.employees 
WHERE salary > (SELECT MIN(salary) FROM sql_intro.employees);


-- stored procedures
select * from sql_intro.players
INSERT INTO sql_intro.players (name, country, goals) 
VALUES
('Lionel Messi', 'Argentina', 10),
('Cristiano Ronaldo', 'Portugal', 12),
('Neymar Jr', 'Brazil', 9),
('Kylian Mbappe', 'France', 11),
('Mohamed Salah', 'Egypt', 8),
('Robert Lewandowski', 'Poland', 10),
('Kevin De Bruyne', 'Belgium', 7),
('Sadio Mane', 'Senegal', 9),
('Harry Kane', 'England', 8),
('Erling Haaland', 'Norway', 11);

-- updating table by replacing player names

-- temporarily disabling safe mode
SET SQL_SAFE_UPDATES = 0;

UPDATE sql_intro.players 
SET name = CASE 
    WHEN name = 'Player1' THEN 'Olunga'
    WHEN name = 'Player2' THEN 'Davies'
    WHEN name = 'Player3' THEN 'Forster'
END
WHERE name IN ('Player1', 'Player2', 'Player3');

select * from sql_intro.players;

-- stored procedures
delimiter &&
create procedure top_scorer()
begin
select name, country, goals
from sql_intro.players where goals > 10;
End &&
delimiter ;
call top_scorer();

-- stored procedure with IN parameter
-- This stored procedure retrieves player details based on the..
-- minimum number of goals passed as a parameter
DELIMITER //
create procedure get_players_by_goals(IN min_goals INT)
begin
  select name, country, goals
  from sql_intro.players
  where goals >= min_goals;
  end //
  call get_players_by_goals(7);
  -- a stored procedure that updates a player's goals based on their name.
  -- This stored procedure uses an IN parameter to accept the player name and the new goals value
  DELIMITER //
CREATE PROCEDURE update_player_goals(IN player_name VARCHAR(50), IN new_goals INT)
BEGIN
    UPDATE sql_intro.players
    SET goals = new_goals
    WHERE name = player_name;
END //
DELIMITER ;
call update_player_goals("Olunga", 13);
select * from sql_intro.players;

  
  -- a stored procedure using an OUT parameter. This procedure counts the number of players
  -- with more than a specified number of goals and returns that value through the OUT parameter:
  DELIMITER //
CREATE PROCEDURE count_high_goal_players(IN min_goals INT, OUT total_players INT)
BEGIN
    SELECT COUNT(*) INTO total_players
    FROM sql_intro.players
    WHERE goals > min_goals;
END //
DELIMITER ;
CALL count_high_goal_players(5, @total);
SELECT @total AS Total_Players;

-- create a trigger for the sql_intro.players table 
  -- that automatically logs any changes to the number of goals scored by players.
  -- Use Case: Logging Updates to Player Goals
-- Whenever the number of goals for a player is updated, the trigger will insert a log entry 
-- into a goal_changes table with the player’s name, old goals, new goals, and the date of change.
 
 -- Step 1: Create the log table
 use sql_intro;
CREATE TABLE sql_intro.goal_changes (
    change_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(50),
    old_goals INT,
    new_goals INT,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create the trigger to log changes in the 'players' table
DELIMITER //
CREATE TRIGGER log_goal_changes
AFTER UPDATE ON sql_intro.players
FOR EACH ROW
BEGIN
    IF NEW.goals != OLD.goals THEN
        INSERT INTO sql_intro.goal_changes (player_name, old_goals, new_goalsproducts)
        VALUES (NEW.name, OLD.goals, NEW.goals);
    END IF;
END //
DELIMITER ;
-- checking functionality of trigger
-- Update a player's goals
UPDATE sql_intro.players SET goals = 10 WHERE name = 'Olunga';

-- Check the goal_changes table for the log entry
SELECT * FROM sql_intro.goal_changes;

select* from sql_intro.products
-- Create a view to join data from both `sql_intro.products` and `classic_intro.products`
CREATE VIEW combined_products AS
SELECT 
    s.productcode AS sql_productcode,
    s.productname AS sql_productname,
    c.productcode AS classic_productcode,
    c.productname AS classic_productname
FROM 
    sql_intro.products AS s
INNER JOIN 
    classic_intro.products AS c
ON 
    s.productcode = c.productcode;

SELECT * FROM combined_products;
  
 
 -- modify the emp_id in the sql_intro.employees table and then adding a new column for the city
-- Create a Backup of the Original emp_id to keep a copy of the original emp_id in case need to reference it later.
ALTER TABLE sql_intro.employees ADD original_emp_id INT;
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























