CREATE DATABASE IF NOT EXISTS alx_book_store /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE alx_book_store;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: alx_book_store
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table Authors
--

DROP TABLE IF EXISTS Authors;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE Authors (
  author_id int NOT NULL,
  author_name varchar(215) DEFAULT NULL,
  PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table Authors
--

LOCK TABLES Authors WRITE;
/*!40000 ALTER TABLE Authors DISABLE KEYS */;
/*!40000 ALTER TABLE Authors ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table Books
--

DROP TABLE IF EXISTS Books;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE Books (
  book_id int NOT NULL,
  title varchar(130) DEFAULT NULL,
  author_id int NOT NULL,
  price double DEFAULT NULL,
  publication_date date DEFAULT NULL,
  PRIMARY KEY (book_id),
  KEY author_id (author_id),
  CONSTRAINT Books_ibfk_1 FOREIGN KEY (author_id) REFERENCES Authors (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table Books
--

LOCK TABLES Books WRITE;
/*!40000 ALTER TABLE Books DISABLE KEYS */;
/*!40000 ALTER TABLE Books ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table Customers
--

DROP TABLE IF EXISTS Customers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE Customers (
  customer_id int auto_increment NOT NULL,
  customer_name varchar(215) DEFAULT NULL,
  email varchar(215) DEFAULT NULL,
  address text,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table Customers
--

LOCK TABLES Customers WRITE;
/*!40000 ALTER TABLE Customers DISABLE KEYS */;
/*!40000 ALTER TABLE Customers ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table Order_Details
--

DROP TABLE IF EXISTS Order_Details;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE Order_Details (
  order_detailid int NOT NULL,
  order_id int DEFAULT NULL,
  book_id int DEFAULT NULL,
  quantity double DEFAULT NULL,
  PRIMARY KEY (order_detailid),
  KEY order_id (order_id),
  KEY book_id (book_id),
  CONSTRAINT Order_Details_ibfk_1 FOREIGN KEY (order_id) REFERENCES Orders (order_id),
  CONSTRAINT Order_Details_ibfk_2 FOREIGN KEY (book_id) REFERENCES Books (book_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table Order_Details
--

LOCK TABLES Order_Details WRITE;
/*!40000 ALTER TABLE Order_Details DISABLE KEYS */;
/*!40000 ALTER TABLE Order_Details ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table Orders
--

DROP TABLE IF EXISTS Orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE Orders (
  order_id int NOT NULL,
  customer_id int DEFAULT NULL,
  order_date date DEFAULT NULL,
  PRIMARY KEY (order_id),
  KEY customer_id (customer_id),
  CONSTRAINT Orders_ibfk_1 FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table Orders
--

LOCK TABLES Orders WRITE;
/*!40000 ALTER TABLE Orders DISABLE KEYS */;
/*!40000 ALTER TABLE Orders ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 17:49:14
