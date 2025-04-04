create database My_Music;
use My_Music;
create table Users(
User_ID int primary key,
Name varchar(50) not null,
Email varchar(100),
Password varchar(150)not null,
Date_of_Birth date);
create table Artists(
Artist_ID int primary key,
Name varchar(100) not null,
Genre varchar(30));
create table Albums(
Album_ID int primary key,
Artist_ID int,
Name varchar(50),
Release_date Date,
foreign key(Artist_ID) references Artists(Artist_ID)on delete cascade);
create table Tracks(
Track_ID int primary key,
Album_ID int,
Name varchar(50),
Duration time,
Foreign key (Album_ID )references Albums(Album_ID)on delete cascade);
create table Playlists(
Playlist_ID int primary key,
User_ID int,
Name varchar(50),
foreign key(User_ID) references Users(User_ID)on delete cascade);
create table Playlist_tracks(
Playlist_ID int ,
Track_ID int,
Order_ID int,
primary key(Playlist_ID,Track_ID),
foreign key(Playlist_ID)references Playlists(Playlist_ID)on delete cascade,
foreign key(Track_ID) references Tracks(Track_ID)on delete cascade);

create table Likes(
User_ID int,
Track_ID int ,
Like_Date_Time datetime,
primary key(User_ID,Track_ID),
foreign key(User_ID) references Users(User_ID)on delete cascade,
foreign key(Track_ID) references Tracks(Track_ID)on delete cascade);

create table Followers(
User_ID int,
Artist_ID int,
Primary key(User_ID, Artist_ID),
foreign key(User_ID) references Users(User_ID)on delete cascade,
foreign key(Artist_ID) references Artists(Artist_ID)on delete cascade);

INSERT INTO Users (User_ID, Name, Email, Password, Date_of_Birth) 
VALUES
(1, 'Arun', 'arun@example.com', 'password123', '1995-05-21'),
(2, 'Priya', 'priya@example.com', 'securepass', '1998-09-12'),
(3, 'Vijay', 'vijay@example.com', 'vijaypass', '1993-11-03'),
(4, 'Keerthi', 'keerthi@example.com', 'keerthi123', '1997-07-19'),
(5, 'Raj', 'raj@example.com', 'rajpass', '1990-02-28');

INSERT INTO Artists (Artist_ID, Name, Genre) VALUES
(1, 'A. R. Rahman', 'Film Score'),
(2, 'Ilaiyaraaja', 'Folk, Classical'),
(3, 'Yuvan Shankar Raja', 'Electronic, Folk'),
(4, 'Harris Jayaraj', 'Melody, Electronic'),
(5, 'Anirudh Ravichander', 'Pop, Electronic'),
(6, 'G. V. Prakash Kumar', 'Film Score'),
(7, 'Santhosh Narayanan', 'Film Score'),
(8, 'D. Imman', 'Film Score'),
(9, 'Hiphop Tamizha', 'Rap, Hip-Hop'),
(10, 'Vijay Antony', 'Film Score');

INSERT INTO Albums (Album_ID, Artist_ID, Name, Release_Date) VALUES
(1, 1, 'Roja', '1992-08-15'),
(2, 1, 'Enthiran', '2010-09-30'),
(3, 2, 'Nayakan', '1987-11-21'),
(4, 2, 'Thalapathi', '1991-11-05'),
(5, 3, 'Mankatha', '2011-08-15'),
(6, 3, 'Paiyaa', '2010-04-02'),
(7, 4, 'Kaakha Kaakha', '2003-08-01'),
(8, 4, 'Vaaranam Aayiram', '2008-11-14'),
(9, 5, '3', '2012-03-30'),
(10, 5, 'Master', '2021-01-13'),
(11, 1, 'Bigil', '2019-10-25'),
(12, 9, 'Meesaya Murukku', '2017-07-21'),
(13, 10, 'Vettaikaaran', '2009-12-18'),
(14, 3, 'Pudhu Pettai', '2006-05-26'),
(15, 5, 'Leo', '2023-10-19'),
(16, 4, 'Ghajini', '2005-09-29'),
(17, 5, 'Vikram', '2022-06-03'),
(18, 6, 'Aadukalam', '2011-01-14'),
(19, 6, 'Darling', '2015-01-15');

INSERT INTO Tracks (Track_ID, Album_ID, Name, Duration) VALUES
(1, 1, 'Chinna Chinna Aasai', '00:01:05'),
(2, 1, 'Pudhu Vellai Mazhai', '00:05:16'),
(3, 2, 'Kadhal Anukkal', '00:05:46'),
(4, 2, 'Arima Arima', '00:05:19'),
(5, 11, 'Verithanam', '00:04:05'),
(6, 11, 'Singappenney','00:06:04'),
(7, 17, 'Pathala Pathala','00:03:18'),
(8, 17, 'Once Upon a Time','00:02:23'),
(9, 3, 'Nee Oru Kaadhal Sangeetham','00:04:32'),
(10, 3, 'Thenpandi Cheemayile','00:04:33'),
(11, 4, 'Sundari Kannal Oru Seidhi','00:07:12'),
(12, 4, 'Rakkamma Kaiya Thattu', '00:07:11'),
(13, 14, 'Oru Naalil', '00:05:23'),
(14, 14, 'Enga Area','00:05:19'),
(15, 16, 'Suttum Vizhi Chudare','00:05:18'),
(16, 16, 'Oru Maalai','00:05:53'),
(17, 9, 'Why This Kolaveri Di','00:04:02'),
(18, 9, 'Po Nee Po','00:03:06'),
(19, 10, 'Vaathi Coming','00:03:48'),
(20, 10, 'Kutty Story','00:05:01'),
(21, 15, 'Anbenum','00:03:34'),
(22, 15, 'Badass','00:03:49'),
(23, 9, 'Idhazhin oru oram','00:03:16'),
(24, 9, 'Kannazhaga','00:03:13'),
(25,5, 'Vilayadu Mankatha','00:04:52'),
(26,5, 'Va da Bin lada','00:04:29'),
(27,6, 'Thuli Thuli','00:05:22'),
(28,6, 'Adada Mazhaida','00:05:00'),
(29,7,'Uyirin Uyire','00:05:32'),
(30,7,'Ondra renda','00:04:43'),
(31,8, 'Ava Enna','00:04:21'),
(32,8,'Mundhinam','00:05:10'),
(33,12,'Vaadi Pulla Vaadi','00:04:05'),
(34,12,'Enna nadanthalun','00:04:05'),
(35,13,'Karikalan Kaala','00:04:32'),
(36,13,'Puli Urumuthu','00:03:58'),
(37,18,'Ayyayo nenju','00:05:24'),
(38,18,'Otha Sollaala','00:04:18'),
(39,19,'Anbe Anbe','00:04:22'),
(40,19,'Un vizhigalil','00:05:05');

INSERT INTO Playlists (Playlist_ID, User_ID, Name) VALUES
(1, 1, 'Kollywood Classics'),
(2, 2, 'Romantic Melodies'),
(3, 3, 'ARR Hits'),
(4,5,"Anirudh vibezz");

INSERT INTO Playlist_tracks (Playlist_ID, Track_ID, Order_ID) VALUES
(1, 1, 1),
(1, 3, 2),
(1,9,3),
(1,10,4),
(1,11,5),
(1,12,6),
(2, 7, 1),
(2, 2, 2),
(2,9,3),
(2,11,4),
(2,12,5),
(2,15,6),
(2,16,7),
(2,21,8),
(2,23,9),
(2,24,10),
(2,30,11),
(2,32,12),
(2,39,13),
(2,40,14),
(2,37,15),
(3,1,1),
(3,2,2),
(3,3,3),
(3, 4, 4),
(3, 5, 5),
(3,6,6),
(4,7, 1),
(4, 8, 2),
(4,17,3),
(4,18,4),
(4,19,5),
(4,20,6),
(4,21,7),
(4,22,8),
(4,23,9),
(4,24,10);
INSERT INTO Likes (User_ID, Track_ID, Like_Date_Time) VALUES
(1, 1, '2024-04-01 10:00:00'),
(2, 7, '2024-04-02 14:20:00'),
(3, 4, '2024-04-03 18:35:00'),
(4, 6, '2024-04-04 08:45:00'),
(5, 10, '2024-04-05 12:15:00');

INSERT INTO Followers (User_ID, Artist_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


DELIMITER //
CREATE PROCEDURE AddUser(
    IN p_Name VARCHAR(50), 
    IN p_Email VARCHAR(100), 
    IN p_Password VARCHAR(150), 
    IN p_DateOfBirth DATE
)
BEGIN
    INSERT INTO Users (Name, Email, Password, Date_of_Birth) 
    VALUES (p_Name, p_Email, p_Password, p_DateOfBirth);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetSongsByArtist(IN p_ArtistID INT)
BEGIN
    SELECT t.Track_ID, t.Name AS Track_Name, a.Name AS Album_Name, t.Duration
    FROM Tracks t
    JOIN Albums a ON t.Album_ID = a.Album_ID
    WHERE a.Artist_ID = p_ArtistID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAlbumsByArtist(IN p_ArtistID INT)
BEGIN
    SELECT Album_ID, Name, Release_Date 
    FROM Albums 
    WHERE Artist_ID = p_ArtistID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetPlaylistSongs(IN p_UserID INT, IN p_PlaylistID INT)
BEGIN
    SELECT t.Track_ID, t.Name AS Track_Name, t.Duration
    FROM Tracks t
    JOIN Playlist_tracks pt ON t.Track_ID = pt.Track_ID
    JOIN Playlists p ON pt.Playlist_ID = p.Playlist_ID
    WHERE p.User_ID = p_UserID AND p.Playlist_ID = p_PlaylistID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddSongToPlaylist(IN p_PlaylistID INT, IN p_TrackID INT, IN p_OrderID INT)
BEGIN
    INSERT INTO Playlist_tracks (Playlist_ID, Track_ID, Order_ID)
    VALUES (p_PlaylistID, p_TrackID, p_OrderID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RemoveSongFromPlaylist(IN p_PlaylistID INT, IN p_TrackID INT)
BEGIN
    DELETE FROM Playlist_tracks WHERE Playlist_ID = p_PlaylistID AND Track_ID = p_TrackID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetTopLikedSongs()
BEGIN
    SELECT t.Track_ID, t.Name AS Track_Name, COUNT(l.User_ID) AS Like_Count
    FROM Likes l
    JOIN Tracks t ON l.Track_ID = t.Track_ID
    GROUP BY t.Track_ID
    ORDER BY Like_Count DESC
    LIMIT 5;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE FollowArtist(IN p_UserID INT, IN p_ArtistID INT)
BEGIN
    INSERT INTO Followers (User_ID, Artist_ID) VALUES (p_UserID, p_ArtistID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UnfollowArtist(IN p_UserID INT, IN p_ArtistID INT)
BEGIN
    DELETE FROM Followers WHERE User_ID = p_UserID AND Artist_ID = p_ArtistID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetPlaylistSongCount(IN p_PlaylistID INT)
BEGIN
    SELECT COUNT(*) AS SongCount
    FROM Playlist_tracks
    WHERE Playlist_ID = p_PlaylistID;
END //
DELIMITER ;


CREATE VIEW View_LikedTracks AS
SELECT l.User_ID, u.Name AS User_Name, t.Track_ID, t.Name AS Track_Name, l.Like_Date_Time
FROM Likes l
JOIN Users u ON l.User_ID = u.User_ID
JOIN Tracks t ON l.Track_ID = t.Track_ID;

CREATE VIEW View_UserPlaylists AS
SELECT p.Playlist_ID, p.Name AS Playlist_Name, u.User_ID, u.Name AS User_Name
FROM Playlists p
JOIN Users u ON p.User_ID = u.User_ID;

