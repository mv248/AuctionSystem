DROP DATABASE AuctionSystem;
CREATE DATABASE IF NOT EXISTS AuctionSystem;
USE AuctionSystem;

DROP TABLE IF EXISTS `User`;
CREATE TABLE User (
    userId VARCHAR(50),
    password VARCHAR(50),
    userType VARCHAR(50),
    cardNum VARCHAR(16),
    PRIMARY KEY (userId)
);

DROP TABLE IF EXISTS `Category`;
CREATE TABLE Category (
    name VARCHAR(50),
    PRIMARY KEY (name)
);

DROP TABLE IF EXISTS `Item`;
CREATE TABLE Item (
    name VARCHAR(50),
    year INT,
    brand VARCHAR(50),
    itemId INT,
    categoryName VARCHAR(50),
    sellerUserId VARCHAR(50),
    PRIMARY KEY (itemId),
    FOREIGN KEY (sellerUserId)
        REFERENCES User (userId)
);

DROP TABLE IF EXISTS `Auction`;
CREATE TABLE Auction (
    auctionId INT,
    reserve INT,
    startTime DATETIME,
    endTime DATETIME,
    sellerId VARCHAR(50),
    itemId INT,
    PRIMARY KEY (auctionId),
    FOREIGN KEY (sellerId)
        REFERENCES User (userId),
    FOREIGN KEY (itemId)
        REFERENCES Item (itemId)
);

DROP TABLE IF EXISTS `BelongsTo`;
CREATE TABLE BelongsTo (
    childName VARCHAR(50),
    parentName VARCHAR(50),
    FOREIGN KEY (parentName)
        REFERENCES Category (name),
    FOREIGN KEY (childName)
        REFERENCES Category (name),
    PRIMARY KEY (parentName , childName)
);

DROP TABLE IF EXISTS `Posts`;
CREATE TABLE Posts (
    postId INT,
    comment VARCHAR(200),
    parentPostId INT,
    itemId INT,
    authorId VARCHAR(50),
    PRIMARY KEY (postId),
    FOREIGN KEY (itemId)
        REFERENCES Item (itemId),
    FOREIGN KEY (parentPostId)
        REFERENCES Posts (postId),
    FOREIGN KEY (authorId)
        REFERENCES User (userId)
);

DROP TABLE IF EXISTS `Bids`;
CREATE TABLE Bids (
    ownerId VARCHAR(50),
    upperLimit INT,
    bidId INT,
    amount INT,
    itemId INT,
    PRIMARY KEY (bidId),
    FOREIGN KEY (ownerId)
        REFERENCES User (userId),
    FOREIGN KEY (itemId)
        REFERENCES Item (itemId)
);

DROP TABLE IF EXISTS `Alerts`;
CREATE TABLE Alerts (
    alertId INT,
    userId VARCHAR(50),
    message VARCHAR(100),
    PRIMARY KEY (alertId),
    FOREIGN KEY (userId)
        REFERENCES User (userId)
);

/*
LOCK TABLES `User` WRITE;
INSERT INTO `User` VALUES ('arjun', 'password', 'normal', '1');
UNLOCK TABLES;

LOCK TABLES `Category` WRITE;
INSERT INTO `Category` VALUES ('funItems');
UNLOCK TABLES;

LOCK TABLES `Item` WRITE;
INSERT INTO `Item` VALUES ('toys', '1', 'funItems', 'arjun');
UNLOCK TABLES;

LOCK TABLES `Auction` WRITE;
INSERT INTO `Auction` VALUES ('1', '15.99', '2019-04-14 17:00:00', '2019-04-19 17:00:00', 'arjun', '1');
UNLOCK TABLES;

use AuctionSystem;
select * from Item where name like "%mac%" and categoryName="Laptop"

USE AuctionSystem;
SELECT * FROM Item 
WHERE name LIKE '%mac%' 
AND categoryName='Phone' 
AND itemID IN 
	(SELECT itemId FROM Auction
    WHERE currentBidId IN 
		(SELECT bidId FROM Bids
        WHERE (amount < 500))
        )
        
USE AuctionSystem;     
Select * FROM Auction where sellerId='ravi' group by endTime;
SELECT * FROM Item WHERE sellerUserId = 'ravi';
SELECT * FROM Item AS I INNER JOIN Bids AS B ON I.itemID=B.itemId
WHERE B.ownerId= 'arjun'; 
*/


