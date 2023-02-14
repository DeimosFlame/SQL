CREATE TABLE Hotels 
(
	HotelId int IDENTITY NOT NULL PRIMARY KEY,
	HotelName varchar(20) NOT NULL,
	StarsCount int  NOT NULL,
	CreationYear int NOT NULL,
	Adress varchar(30) NOT NULL,
	City varchar(20) NOT NULL,
	Country varchar(20) NOT NULL
)
SELECT TOP (1000) [HotelId]
      ,[HotelName]
      ,[StarsCount]
      ,[CreationYear]
      ,[Adress]
      ,[City]
      ,[Country]
  FROM [Hotel 4.0].[dbo].[Hotels]

INSERT INTO Hotels (HotelName,StarsCount,CreationYear,Adress,City,Country) VALUES
('Mars',5,2002,'Profsouznaya 34','Kazan','Russia'), 
('Deimos',5,2002,'Butlerova 30','Kazan','Russia'), 
('Phobos',5,2002,'Mazita Gafuri 4','Kazan','Russia')

CREATE TABLE Rooms
(
	RoomId int IDENTITY NOT NULL PRIMARY KEY,
	RoomNamber int NOT NULL,
	HotelID int NOT NULL FOREIGN KEY REFERENCES Hotels(HotelId)
)
SELECT TOP (1000) [RoomId]
      ,[RoomNamber]
      ,[HotelID]
  FROM [Hotel 4.0].[dbo].[Rooms]

  INSERT INTO Rooms (RoomNamber, HotelID) VALUES 
  (100,1),
  (101,1),
  (102,1),
  (103,1),
  (200,2),
  (201,2),
  (202,2),
  (203,2),
  (300,3),
  (301,3),
  (302,3),
  (303,3)

  CREATE TABLE Clients
(
	ClientID int IDENTITY NOT NULL PRIMARY  KEY,
	ClientName varchar (30) NOT NULL,
	Email varchar (20) NOT NULL,
	Age int
)
SELECT TOP (1000) [ClientID]
      ,[ClientName]
      ,[Email]
      ,[Age]
  FROM [Hotel 4.0].[dbo].[Clients]

  INSERT INTO Clients (ClientName, Email, Age) VALUES
  ('Keso','Keso@gmail.com', 23 ),
  ('Kejo', 'Kejo@gmail.com', 23),
  ('Nick','Nick@gmail.com', 42),
  ('Anna','Anna@gmail.com', 20),
  ('Nick','NickFury@gmail.com',40),
  ('Pimp','EvilPimp@gmail.com',36),
  ('David','Jrvvtsvdze@gmail.com',27),
  ('Saadet','Saadetka@gmail.com',21),
  ('Gera','T3tri@gmail.com',28),
  ('Mashka','YoYo@gmail.com',27)

  CREATE TABLE Orders
  (
	OrderId int IDENTITY NOT NULL PRIMARY KEY,
	ClientId int NOT NULL FOREIGN KEY REFERENCES Clients (ClientID),
	Room int NOT NULL  FOREIGN KEY REFERENCES Rooms (RoomId),
	Price int NOT NULL,
	DaysCount int NOT NULL
  )
  SELECT TOP (1000) [OrderId]
      ,[ClientId]
      ,[Room]
      ,[Price]
      ,[DaysCount]
  FROM [Hotel 4.0].[dbo].[Orders]

  INSERT INTO Orders (ClientId, Room, Price, DaysCount) VALUES
	(1,1,100,1),
	(2,2,100,5),
	(3,3,400,4),
	(4,4,200,2),
	(5,5,700,7),
	(6,6,600,6),
	(7,7,400,4),
	(8,11,2000,1),
	(9,12,1500,1),
	(10,3,1000,10)


SELECT * FROM Clients
SELECT * FROM Hotels
SELECT * FROM Rooms
SELECT * FROM Orders




SELECT * FROM Orders JOIN Clients on Orders.ClientId = Clients.ClientID
SELECT * FROM Orders JOIN Rooms on Orders.Room = Rooms.RoomId
SELECT * FROM Hotels JOIN Rooms on Hotels.HotelId = Rooms.HotelID
	SELECT * FROM Hotels LEFT JOIN Rooms on Hotels.HotelId = Rooms.HotelID
	SELECT * FROM Rooms RIGHT JOIN Hotels on Rooms.HotelID = Hotels.HotelId


INSERT INTO Hotels (HotelName,StarsCount,CreationYear,Adress,City,Country) VALUES
('Moon',5,2002,'Nowhere','Kazan','Russia')


	SELECT Clients.ClientID, Clients.ClientName, Clients.Email, Clients.Age FROM Clients
  SELECT Clients.ClientName, Clients.Email FROM Clients
  SELECT * FROM Clients
  SELECT Clients.ClientID, Clients.ClientName, Clients.Email, Clients.Age FROM Clients WHERE Age = 23
  SELECT * FROM Clients WHERE Email = 'Kejo@gmail.com'
  SELECT *  FROM Clients WHERE ClientName = 'Keso'
  SELECT *  FROM Clients WHERE ClientName LIKE 'K%'
  SELECT *  FROM Clients WHERE ClientName LIKE '%o'
  SELECT *  FROM Clients WHERE ClientName LIKE '%K%'
  SELECT *  FROM Clients WHERE Email LIKE '%@%'
  SELECT *  FROM Clients WHERE ClientName LIKE '_e_%'
  SELECT *  FROM Clients WHERE ClientName LIKE 'Ke__'
  SELECT *  FROM Clients WHERE ClientName LIKE 'Ke%o'
  SELECT *  FROM Clients WHERE ClientName LIKE 'Ke_o'
  SELECT  COUNT(Age) as AgeCount FROM Clients WHERE Age=23
  SELECT SUM(Age) as SumAge FROM Clients
  SELECT AVG(Age) as AvgAge FROM Clients
  SELECT MAX(Age) as MaxAge  FROM Clients
  SELECT MIN(Age) as MaxAge  FROM Clients
  
  
SELECT Price, Count(Price) FROM Orders GROUP BY Price
SELECT DaysCount, Count(DaysCount) FROM Orders GROUP BY DaysCount
SELECT Age, Count(Age) FROM Clients GROUP BY Age
SELECT Room, AVG(Price) FROM Orders GROUP BY Room
SELECT Room, MAX(Price) FROM Orders GROUP BY Room
SELECT Room, MIN(Price) FROM Orders GROUP BY Room

SELECT Age, Count(Age) FROM Clients GROUP BY Age HAVING Age <30
SELECT Age, Count(Age) FROM Clients GROUP BY Age HAVING Age <21

SELECT * FROM Orders ORDER BY Price
	SELECT * FROM Orders ORDER BY Price DESC
SELECT * FROM Clients ORDER BY ClientName
	SELECT * FROM Clients ORDER BY ClientName DESC
