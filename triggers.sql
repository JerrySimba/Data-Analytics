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
