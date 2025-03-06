-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Customers table
INSERT INTO Customers
VALUES (1, 'Alice', 'USA'),
       (2, 'Bob', 'UK'),
       (3, 'Charlie', 'USA'),
       (4, 'Diana', 'Canada'),
       (5, 'Edward', 'USA');

-- Insert data into Orders table
INSERT INTO Orders 
VALUES (101, 1, '2024-01-15', 200),
       (102, 2, '2024-02-20', 500),
       (103, 3, '2024-03-10', 150),
       (104, 4, '2024-03-15', 300),
       (105, 5, '2024-04-02', 1200);

-- Select data from Customers and Orders tables
SELECT C.CustomerName, O.OrderID, O.OrderDate, O.TotalAmount
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into Departments table
INSERT INTO Departments
VALUES (10, 'HR'),
       (20, 'IT'),
       (30, 'Sales');

-- Insert data into Employees table
INSERT INTO Employees
VALUES (1, 'John', 10),
       (2, 'Alice', 20),
       (3, 'Bob', 30),
       (4, 'Diana', NULL),
       (5, 'Edward', 20);

-- Select data from Employees and Departments tables
SELECT E.EmployeeName, D.DepartmentName
FROM Employees AS E
LEFT JOIN Departments AS D
ON E.DepartmentID = D.DepartmentID;

-- Create Products_2023 table
CREATE TABLE Products_2023 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Create Products_2024 table
CREATE TABLE Products_2024 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Insert data into Products_2023 table
INSERT INTO Products_2023
VALUES (1, 'Widget', 10),
       (2, 'Gadget', 20),
       (3, 'Gizmo', 30),
       (4, 'Doohickey', 25),
       (5, 'Widget', 12);

-- Insert data into Products_2024 table
INSERT INTO Products_2024 
VALUES (1, 'Widget', 15),
       (2, 'Gizmo', 35),
       (6, 'Gizmo', 32),
       (7, 'Gadget', 22),
       (8, 'Thingamajig', 40);

-- List all distinct products from both Products_2023 and Products_2024 tables
SELECT DISTINCT ProductName
FROM Products_2023
UNION
SELECT DISTINCT ProductName
FROM Products_2024;

-- Create Colors table
CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(50)
);

-- Create Sizes table
CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(50)
);

-- Insert data into Colors table
INSERT INTO Colors 
VALUES (1, 'Red'),
       (2, 'Blue'),
       (3, 'Green'),
       (4, 'Yellow'),
       (5, 'Black');

-- Insert data into Sizes table
INSERT INTO Sizes
VALUES (1, 'Small'),
       (2, 'Medium'),
       (3, 'Large'),
       (4, 'Extra-Large'),
       (5, 'Jumbo');

-- Combine data from Colors and Sizes tables
SELECT *
FROM Colors
CROSS JOIN Sizes;