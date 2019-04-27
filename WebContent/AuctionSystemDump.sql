-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com    Database: AuctionSystem
-- ------------------------------------------------------
-- Server version	5.6.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alerts`
--

DROP TABLE IF EXISTS `Alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alerts` (
  `alertId` int(11) NOT NULL DEFAULT '0',
  `userId` varchar(50) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`alertId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Alerts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alerts`
--

LOCK TABLES `Alerts` WRITE;
/*!40000 ALTER TABLE `Alerts` DISABLE KEYS */;
INSERT INTO `Alerts` VALUES (1,'ravi','Your bid for an item (<a href=\'itemPage.jsp?itemId=1\'> item #1 - click to view item </a>) has been overtaken by user arjun for $550.0!'),(2,'arjun','Your bid for an item (<a href=\'itemPage.jsp?itemId=1\'> item #1 - click to view item </a>) has been overtaken by user ravi for $600! (via AutoBid)'),(3,'ravi','Your bid for an item (<a href=\'itemPage.jsp?itemId=1\'> item #1 - click to view item </a>) has been overtaken by user arjun for $650! (via AutoBid)'),(4,'ravi','Your bidding upper limit for an item (<a href=\'itemPage.jsp?itemId=1\'> item #1 - click to view item </a>) has been overtaken by user arjun with $650! (via AutoBid)'),(5,'ravi','Your auction (<a href=\'itemPage.jsp?itemId=1\'> item #1 - click to view item </a>) has sold to user arjun for $650.0!'),(6,'arjun','You won an auction (<a href=\'itemPage.jsp?itemId=1\'> item #1 - click to view item </a>) for $650.0!');
/*!40000 ALTER TABLE `Alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auction`
--

DROP TABLE IF EXISTS `Auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Auction` (
  `auctionId` int(11) NOT NULL DEFAULT '0',
  `reserve` float DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `sellerId` varchar(50) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `startPrice` float DEFAULT NULL,
  `currentBidId` int(11) DEFAULT NULL,
  `bidIncrement` float DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`auctionId`),
  KEY `sellerId` (`sellerId`),
  KEY `itemId` (`itemId`),
  KEY `currentBidId` (`currentBidId`),
  CONSTRAINT `Auction_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `User` (`userId`),
  CONSTRAINT `Auction_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `Item` (`itemId`),
  CONSTRAINT `Auction_ibfk_3` FOREIGN KEY (`currentBidId`) REFERENCES `Bids` (`bidId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auction`
--

LOCK TABLES `Auction` WRITE;
/*!40000 ALTER TABLE `Auction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bids`
--

DROP TABLE IF EXISTS `Bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bids` (
  `ownerId` varchar(50) DEFAULT NULL,
  `upperLimit` int(11) DEFAULT NULL,
  `bidId` int(11) NOT NULL DEFAULT '0',
  `amount` float(24,2) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bidId`),
  KEY `ownerId` (`ownerId`),
  KEY `itemId` (`itemId`),
  CONSTRAINT `Bids_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `User` (`userId`),
  CONSTRAINT `Bids_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `Item` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bids`
--

LOCK TABLES `Bids` WRITE;
/*!40000 ALTER TABLE `Bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES ('Computer'),('Laptop'),('Phone');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `name` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `condition` varchar(50) DEFAULT NULL,
  `itemId` int(11) NOT NULL DEFAULT '0',
  `categoryName` varchar(50) DEFAULT NULL,
  `sellerUserId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `sellerUserId` (`sellerUserId`),
  KEY `categoryName` (`categoryName`),
  CONSTRAINT `Item_ibfk_1` FOREIGN KEY (`sellerUserId`) REFERENCES `User` (`userId`),
  CONSTRAINT `Item_ibfk_2` FOREIGN KEY (`categoryName`) REFERENCES `Category` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`patarj23`@`%`*/ /*!50003 trigger SendSubscription
after insert on Item
for each row
begin
    set @subId = (select min(subId) from Subscriptions);
    while @subId is not null do
		set @keyword = (select subName from Subscriptions where subId = @subId);
        set @userId = (select userId from Subscriptions where subId = @subId);
        if strcmp(@keyword, new.`name`) = 0 then
			set @latestAlertId = (select max(alertId) from Alerts);
			set @link = concat("<a href='itemPage.jsp?itemId=", new.itemId, "'> item #", new.itemId, " - click to view item </a>");
			set @message = concat("A ", new.`name`, " (", @link, ") is available from ", @userId, "!");
			insert into Alerts (alertId, userId, message) values (@latestAlertId + 2, @userId, @message);
        end if;
		set @subId = (select min(subId) from Subscriptions where subId > @subId);
	end while;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts` (
  `postId` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(200) DEFAULT NULL,
  `parentPostId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `authorId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`postId`),
  KEY `itemId` (`itemId`),
  KEY `parentPostId` (`parentPostId`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `Item` (`itemId`),
  CONSTRAINT `Posts_ibfk_2` FOREIGN KEY (`parentPostId`) REFERENCES `Posts` (`postId`),
  CONSTRAINT `Posts_ibfk_3` FOREIGN KEY (`authorId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscriptions`
--

DROP TABLE IF EXISTS `Subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subscriptions` (
  `subId` int(11) NOT NULL DEFAULT '0',
  `userId` varchar(50) DEFAULT NULL,
  `subName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscriptions`
--

LOCK TABLES `Subscriptions` WRITE;
/*!40000 ALTER TABLE `Subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userId` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `userType` varchar(50) DEFAULT NULL,
  `cardNum` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('admin','admin','admin',NULL),('arjun','pwd','normal',NULL),('mehak','pwd','customerRep',NULL),('ravi','pwd','normal',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AuctionSystem'
--
/*!50003 DROP PROCEDURE IF EXISTS `AutoBid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`patarj23`@`%` PROCEDURE `AutoBid`(nItemId int)
begin
	set @bId = (select min(bidId) from (SELECT MAX(bidId) as bidId from Bids WHERE itemId = nItemId GROUP BY ownerId ORDER BY bidId ASC) as B);
    set @bidCount = (select count(distinct ownerId) from Bids where itemId = nItemId);
	if @bidCount >= 2 then
		set @bidInc = (select bidIncrement from Auction where itemId = nItemId);
		auto: while @bId is not null do
			set @nBidId = (select currentBidId from Auction where itemId = nItemId);
            set @nOwnerId = (select ownerId from Bids where bidId = @nBidId);
			set @nAmount = (select amount from Bids where bidId = @nBidId);
            set @upperLimit = (select upperLimit from Bids where bidId = @bId);
            set @ownerId = (select ownerId from Bids where bidId = @bId);
			if @nAmount + @bidInc <= @upperLimit and @nOwnerId != @ownerId then
				set @latestBidId = (select max(bidId) from Bids);
				insert into Bids (bidId, ownerId, upperLimit, amount, itemId) values (@latestBidId + 1, @ownerId, @upperLimit, @nAmount + @bidInc, nItemId);
				update Auction set currentBidId = (@latestBidId + 1) where itemId = nItemId;
				set @latestAlertId = (select max(alertId) from Alerts);
                set @link = concat("<a href='itemPage.jsp?itemId=", nItemId, "'> item #", nItemId, " - click to view item </a>");
                set @message = concat("Your bid for an item (", @link, ") has been overtaken by user ", @ownerId, " for $", @nAmount + @bidInc, "! (via AutoBid)");
                insert into Alerts (alertId, userId, message) values (@latestAlertId + 1, @nOwnerId, @message);
                set @bId = (select min(bidId) from (SELECT MAX(bidId) as bidId from Bids WHERE itemId = nItemId GROUP BY ownerId ORDER BY bidId ASC) as B);
			elseif @nAmount + @bidInc > @upperLimit and @nOwnerId != @ownerId then
				set @latestAlertId = (select max(alertId) from Alerts);
                set @link = concat("<a href='itemPage.jsp?itemId=", nItemId, "'> item #", nItemId, " - click to view item </a>");
                set @message = concat("Your bidding upper limit for an item (", @link, ") has been overtaken by user ", @nOwnerId, " with $", @nAmount, "! (via AutoBid)");
                insert into Alerts (alertId, userId, message) values (@latestAlertId + 1, @ownerId, @message);
				set @bId = (select min(bidId) from (SELECT MAX(bidId) as bidId from Bids WHERE itemId = 8 GROUP BY ownerId ORDER BY bidId ASC) as B where bidId > @bId);
			end if;
        end while auto;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 22:22:42
