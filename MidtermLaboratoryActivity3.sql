CREATE DATABASE information_management;

USE information_management;

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

SELECT UPPER(FirstName) 
FROM Employees;

SELECT ROUND(Salary, 2)
FROM Employees;

SELECT CONCAT(FirstName, ' ', LastName)
FROM Employees;

SELECT ABS(Salary)
FROM Employees;

SELECT CEILING(Salary)
FROM Employees;

SELECT FLOOR(Salary)
FROM Employees;

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    Name VARCHAR(50)
    ON DELETE CASCADE
);

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CustomerId INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

INSERT INTO Customers
VALUES (1, 'John Doe'),
       (2, 'Jane Doe'),
       (3, 'Juan Dela Cruz');

INSERT INTO Orders
VALUES (1, 1, '2021-10-01'),
       (2, 2, '2021-10-02'),
       (3, 3, '2021-10-03');

DELETE FROM Customers
WHERE CustomerId = 3;