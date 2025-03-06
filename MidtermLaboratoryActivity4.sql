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
INSERT INTO
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