# Data and SQL Kickstarter Project December 2023

## Concept
This project aims to set up a working database for a board game lending library, allowing staff to manage stock, members, and loans as well as allowing members to search for games of interest to borrow. 

## Scope
* It will allow staff to add new members to the database
* It will allow staff to add new stock to the database
* It will allow staff to create a new loan when a member borrows a game
* It will allow members to search by name, genre and rating
* It will allow members to add a stars rating to games
* It will allow staff to see the most popular games
* It will allow staff to see the most popular genres
* It will allow staff to see inactive member accounts
* It will allow staff to see members who have overdue loans

## Data Model
![ERD](https://github.com/ccp84/CFG_SQL/assets/106958690/8302c560-282c-4962-9e7c-dac3567f62c9)

## Database Schema

### Member
| Field Name | Field Type | Details |
| ---------- | ---------- | ------- |
| id         | BIGINT     | Primary Key, Auto_Increment |
| email      | VARCHAR    | 50, not null |
| first_name | VARCHAR    | 50 |
| last_name  | VARCHAR    | 50 |

### Loan
| Field Name | Field Type | Details |
| ---------- | ---------- | ------- |
| id         | BIGINT     | Primary Key, Auto_Increment |
| member     | BIGINT     | Foreign Key, Member-id, Cascade |
| game       | BIGINT     | Foreign Key, Game-id, Cascade |
| start_date | DATE       |  |
| end_date   | DATE       |  |

### Game
| Field Name | Field Type | Details |
| ---------- | ---------- | ------- |
| id         | BIGINT     | Primary Key, Auto_Increment |
| title      | VARCHAR    | 100, not null |
| genre      | BIGINT     | Foreign Key, Genre-id, SET NULL |

### Genre
| Field Name | Field Type | Details |
| ---------- | ---------- | ------- |
| id         | BIGINT     | Primary Key, Auto_Increment |
| title      | VARCHAR    | 50, not null |

### Rating
| Field Name | Field Type | Details |
| ---------- | ---------- | ------- |
| id         | BIGINT     | Primary Key, Auto_Increment |
| score      | INT        |  |
| game       | BIGINT     | Foreign Key, Game-id, Cascade |
| member     | BIGINT     | Foreign Key, Member-id, Cascade |

## Database Creation and Population
Included within this repo are a number of SQL files that can be used to recreate this database and the initial data contained within it. 

The dump file which is a full backup including views and stored procedures. The Project_Create file which when executed will build the skeleton structure. The Project_Populate file which will add an initial set of data to the tables for you to work with. 

## Requirements of the Project

### Core Requirements
* Create relational  DB of your choice with minimum 5 tables - Achieved in the structure planned above
* Set Primary and Foreign Key constraints to create relations between the tables - Achieved in the structure planned above
* Using any type of the joins create a view that combines multiple tables in a logical way - A a basic view for looking at member accounts was created including the account details and the loans linked to that member. This gives a quick overview of the account status. The code to produce this view is stored in the Project_Account_View file.
* In your database, create a stored function that can be applied to a query in your DB - A stored function called 'is_overdue' was created to add a simple flag to member accounts showing is the status of their loan is ok, due back today, or overdue. It compares the current date with the return date of the loan and returns a varchar value. This function has been used to enhance the customer account overview. The code used to create this function is stored in the Project_Queries file.
* Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis - This query selects all inactive members (who have not begun a new item loan since a specified date) `SQL
SELECT member.member_id, member.email, member.first_name, member.last_name 
FROM member
WHERE member.member_id NOT IN (
	SELECT loan.member
    FROM loan
    WHERE loan.end_date > '2023-11-30'
);`
* Create DB diagram where all table relations are shown - Detailed above

### Advanced Requirements 
* Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis. - This view called all_ratings was created using the code stored in Project_Rating_View. It Combines the rating, game and member table in preparation for looking at ratings left on the games by members. The ratings could be considered per game, for example by a member deciding if they want to borrow that game next - `SQL SELECT game_rating, game_title, first_name, last_name FROM all_ratings
WHERE game_title = 'Cosmoctopus'
ORDER BY game_rating DESC;` or could be used to view all ratings left as an average - `SQL SELECT avg(game_rating) as average_rating, game_title FROM all_ratings
GROUP BY game_title
ORDER BY average_rating DESC;`
* Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis - This query finds the most popular games based on the number of times they have been loaned out by members `SQL SELECT games_library.game.title AS 'Game', count(games_library.loan.game) as 'Total loans' from loan
LEFT JOIN game on loan.game = game.game_id
GROUP BY loan.game
HAVING count(loan.game) > 0;`



