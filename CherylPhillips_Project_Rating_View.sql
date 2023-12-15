CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `games_library`.`all_ratings` AS
    SELECT 
        `games_library`.`rating`.`score` AS `game_rating`,
        `games_library`.`member`.`first_name` AS `first_name`,
        `games_library`.`member`.`last_name` AS `last_name`,
        `games_library`.`game`.`title` AS `game_title`
    FROM
        ((`games_library`.`rating`
        LEFT JOIN `games_library`.`member` ON ((`games_library`.`rating`.`member` = `games_library`.`member`.`member_id`)))
        LEFT JOIN `games_library`.`game` ON ((`games_library`.`rating`.`game` = `games_library`.`game`.`game_id`)))