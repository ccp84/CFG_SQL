-- Add data into members table

USE games_library;

INSERT INTO member 
(email, first_name, last_name)
values
('am@members.co', 'Ann', 'Marie'),
('ian@members.co', 'Ian', 'Fuller'),
('gem@members.co', 'Gem', 'May'),
('ccp@members.co', 'Cheryl', 'Phillips');

-- add data into genre table

INSERT INTO genre
(title)
values
('Family'),
('Euro'),
('Social Deduction'),
('Party'),
('Card'),
('Strategy');

-- add data into game table

INSERT INTO game
(title, genre)
values
('Cosmoctopus', 6),
('Achroma', 5),
('Taco Cat Goat Cheese Pizza', 4),
('TacTiki', 6),
('Tatsu', 6),
('Sushi Go', 4),
('Death By Coconuts', 1),
('Bloka', 1),
('Bears vs Babies', 5),
('Exploding Kittens', 5),
('Cora Quest', 1),
('Cheese Thief', 3),
('Sounds Fishy', 3),
('Key To The Kingdom', 2);

-- add data into loan table

INSERT INTO loan
(member,
game,
start_date,
end_date)
VALUES
(1, 1, '2023-12-01', '2023-12-07'),
(2, 5, '2023-12-01', '2023-12-07'),
(3, 7, '2023-12-01', '2023-12-07'),
(4, 6, '2023-12-01', '2023-12-07'),
(1, 2, '2023-12-07', '2023-12-14'),
(3, 1, '2023-12-07', '2023-12-14'),
(2, 8, '2023-12-07', '2023-12-14'),
(4, 3, '2023-12-07', null);

-- add data into reviews table

INSERT INTO rating
(
score,
game,
member
)
VALUES
(5, 1, 1),
(3, 5, 2),
(4, 7, 3),
(4, 6, 4),
(3, 2, 1),
(5, 1, 3),
(4, 8, 2),
(2, 3, 4);
