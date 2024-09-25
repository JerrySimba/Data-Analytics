-- stored procedures
delimiter &&
create procedure top_scorer()
begin
select name, country, goals
from sql_intro.players where goals > 10;
End &&
delimiter ;
call top_scorer();
