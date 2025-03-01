CREATE DATABASE Social;
use Social;
CREATE TABLE Users(
User_id int PRIMARY KEY,
User_name VARCHAR(20) NOT NULL UNIQUE,
Email NVARCHAR(30)NOT NULL UNIQUE,
DOB DATE,
JoinDate DATE,
Gender VARCHAR(10)
);
CREATE TABLE Posts(
Post_id INT PRIMARY KEY,
Content TEXT NOT NULL,
PostDate DATETIME DEFAULT CURRENT_TIMESTAMP,
User_id INT,
);
CREATE TABLE Comment (
CommentID INT PRIMARY KEY
,CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
Content TEXT NOT NULL,
UserID INT,
PostID INT,
);

CREATE TABLE Reaction (
Reaction_id INT PRIMARY KEY ,
ReactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
 Type VARCHAR(10) NOT NULL CHECK (Type IN ('Like', 'Love', 'Haha', 'Sad', 'Angry')),
 User_id INT,
 Post_id int
);

CREATE TABLE Interaction (
    InteractionID INT PRIMARY KEY ,
    User_id INT,
    Post_id int

	);
	INSERT INTO Users (User_id, User_name, Email, DOB, JoinDate, Gender)
VALUES 
(1, 'Ahmed', 'ahmed@gmail.com', '2004-2-26', '2024-03-01', 'Male'),
(2, 'Mariam', 'Marian@gmail.com', '1998-08-22', '2024-03-01', 'Female');

INSERT INTO Posts (Post_id, Content, PostDate, User_id)
VALUES 
(1, 'Hello, this is my first post!', '2024-03-01 10:00:00', 1),
(2, 'Good morning everyone!', '2024-03-01 11:00:00', 2);
INSERT INTO Comment (CommentID, CommentDate, Content, UserID, PostID)
VALUES 
(1, '2024-03-01 12:00:00', 'Nice post!', 2, 1),
(2, '2024-03-01 12:30:00', 'Thank you!', 1, 2);

INSERT INTO Reaction (Reaction_id, ReactionDate, Type, User_id, Post_id)
VALUES 
(1, '2024-03-01 13:00:00', 'Like', 1, 2),
(2, '2024-03-01 13:15:00', 'Love', 2, 1);
INSERT INTO Interaction (InteractionID, User_id, Post_id)
VALUES 
(1, 1, 2),
(2, 2, 1);
