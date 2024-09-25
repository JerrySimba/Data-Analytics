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
