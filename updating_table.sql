-- updating table by replacing player names

UPDATE sql_intro.players 
SET name = CASE 
    WHEN name = 'Player1' THEN 'Olunga'
    WHEN name = 'Player2' THEN 'Davies'
    WHEN name = 'Player3' THEN 'Forster'
END
WHERE name IN ('Player1', 'Player2', 'Player3');

select * from sql_intro.players;
