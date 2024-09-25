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
