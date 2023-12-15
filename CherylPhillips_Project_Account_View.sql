CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `games_library`.`customer_account` AS
    SELECT 
        `games_library`.`member`.`member_id` AS `member_id`,
        `games_library`.`member`.`first_name` AS `first_name`,
        `games_library`.`member`.`last_name` AS `last_name`,
        `games_library`.`game`.`title` AS `game_title`,
        `games_library`.`loan`.`start_date` AS `start_date`,
        `games_library`.`loan`.`end_date` AS `end_date`,
        IS_OVERDUE(`games_library`.`loan`.`end_date`) AS `is_overdue`
    FROM
        ((`games_library`.`member`
        LEFT JOIN `games_library`.`loan` ON ((`games_library`.`loan`.`member` = `games_library`.`member`.`member_id`)))
        LEFT JOIN `games_library`.`game` ON ((`games_library`.`loan`.`game` = `games_library`.`game`.`game_id`)))