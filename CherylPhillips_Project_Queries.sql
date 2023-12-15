use games_library;

-- view all customer accounts
select * from customer_account;

-- select all inactive members from the database

SELECT member.member_id, member.email, member.first_name, member.last_name 
FROM member
WHERE member.member_id NOT IN (
	SELECT loan.member
    FROM loan
    WHERE loan.end_date > '2023-11-30'
);

-- Complex query to find the most popular games using group by and having

SELECT games_library.game.title AS 'Game', count(games_library.loan.game) as 'Total loans' from loan
LEFT JOIN game on loan.game = game.game_id
GROUP BY loan.game
HAVING count(loan.game) > 0;

-- Stored function

DELIMITER //

CREATE FUNCTION is_overdue (return_date date)
RETURNS varchar(25)
deterministic
BEGIN
	declare overdue_status varchar(25);
    declare today date;
    set today = date(now());
    
    if return_date < today then
		set overdue_status = 'Overdue';
	elseif return_date > today then
		set overdue_status = 'Not overdue';
	elseif return_date = today then
		set overdue_status = 'Today';
	end if;
    
RETURN overdue_status;
END//
DELIMITER ;

-- use a view in a query to analyse data

-- average ratings for all games
SELECT avg(game_rating) as average_rating, game_title FROM all_ratings
GROUP BY game_title
ORDER BY average_rating DESC;

-- see ratings left for a particular game
SELECT game_rating, game_title, first_name, last_name FROM all_ratings
WHERE game_title = 'Cosmoctopus'
ORDER BY game_rating DESC;