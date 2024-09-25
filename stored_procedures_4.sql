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
