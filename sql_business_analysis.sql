/*
=====================================================
DAY 35: SQL BUSINESS ANALYSIS PROJECT
Author: Rathinapriya
Tool: SQLite (SQL Online)
Description:
Analyze a simple business dataset using SQL
=====================================================
*/
/*
   STEP 1: CREATE TABLES
   ================================================== */

-- Customers table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    City TEXT
);

-- Products table
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Price INTEGER
);

-- Orders table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER
);

/* ==================================================
   STEP 2: INSERT DATA
   ================================================== */

-- Insert customers
INSERT INTO Customers VALUES
(1, 'Ravi', 'Chennai'),
(2, 'Anu', 'Bangalore'),
(3, 'Kiran', 'Hyderabad'),
(4, 'Meena', 'Chennai');

-- Insert products
INSERT INTO Products VALUES
(1, 'Mobile', 15000),
(2, 'Laptop', 50000),
(3, 'Headphones', 2000);

-- Insert orders
INSERT INTO Orders VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 1, 3, 3),
(4, 3, 1, 1),
(5, 4, 2, 1);

/* ==================================================
   STEP 3: BUSINESS ANALYSIS QUERIES
   ================================================== */

-----------------------------------------------------
-- QUERY 1: VIEW ALL ORDERS
-- Purpose: Understand raw order data
-----------------------------------------------------
SELECT * FROM Orders;

-----------------------------------------------------
-- QUERY 2: CUSTOMER-WISE ORDERS (INNER JOIN)
-- Purpose: Show customer name with order ID
-----------------------------------------------------
SELECT 
    Customers.CustomerName,
    Orders.OrderID
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-----------------------------------------------------
-- QUERY 3: PRODUCT-WISE QUANTITY ORDERED
-- Purpose: See which product was ordered and how much
-----------------------------------------------------
SELECT 
    Products.ProductName,
    Orders.Quantity
FROM Orders
INNER JOIN Products
ON Orders.ProductID = Products.ProductID;

-----------------------------------------------------
-- QUERY 4: TOTAL QUANTITY SOLD PER PRODUCT
-- Purpose: Find best-selling products
-----------------------------------------------------
SELECT 
    Products.ProductName,
    SUM(Orders.Quantity) AS TotalQuantitySold
FROM Orders
INNER JOIN Products
ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductName;

-----------------------------------------------------
-- QUERY 5: REVENUE PER ORDER
-- Formula: Price × Quantity
-----------------------------------------------------
SELECT 
    Orders.OrderID,
    Products.ProductName,
    Products.Price * Orders.Quantity AS Revenue
FROM Orders
INNER JOIN Products
ON Orders.ProductID = Products.ProductID;

-----------------------------------------------------
-- QUERY 6: CITY-WISE TOTAL REVENUE
-- Purpose: Identify top-performing cities
-----------------------------------------------------
SELECT 
    Customers.City,
    SUM(Products.Price * Orders.Quantity) AS TotalRevenue
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Products
ON Orders.ProductID = Products.ProductID
GROUP BY Customers.City;
