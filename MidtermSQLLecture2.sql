-- Create sql_functions database
CREATE DATABASE sql_functions;

-- Use sql_functions database
USE sql_functions;


-- Create sales table
CREATE TABLE sales (
    sales_id INT PRIMARY KEY,
    sales_amount DECIMAL(10, 2),
    sales_date DATE,
    customer_id INT
);

-- Insert data in sales table
INSERT INTO sales
VALUES (1, 500, '2024-11-01', 1),
       (2, 300, '2024-11-02', 2),
       (3, 150, '2024-11-03', 3),
       (4, 200, '2024-11-04', 4),
       (5, 400, '2024-11-05', 5);

-- AGGREGATE FUNCTIONS --

-- Retrieve the number of accounts in sales table
SELECT COUNT(sales_id) AS total_account
FROM sales;

-- Retrieve the number of unique accounts in sales table
SELECT COUNT(DISTINCT(customer_id)) AS unique_customer
FROM sales;

-- Retrieve the total sales in sales table
SELECT SUM(sales_amount) AS total_sales
FROM sales;

-- Retrieve the average sales in sales table
SELECT AVG(sales_amount) AS average_sales
FROM sales;

-- Retrieve the lowest sale in sales table
SELECT MIN(sales_amount) AS average_sales
FROM sales;

-- Retrieve the highest sale in sales table
SELECT MAX(sales_amount) AS average_sales
FROM sales;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(20)
);

-- Insert data in employees table
INSERT INTO employees
VALUES (1, 'John', 'Doe', 'IT'),
       (2, 'James', 'Smith', 'HR'),
       (3, 'Emily', 'Smith', 'IT'),
       (4, 'Michael', 'Williams', 'Marketing');

SELECT department, GROUP_CONCAT(CONCAT(first_name, ' ', last_name) ORDER BY last_name) AS employee_name
FROM employees
GROUP BY department;

SELECT department, GROUP_CONCAT(CONCAT(first_name, ' ', last_name) ORDER BY last_name DESC) AS employee_name
FROM employees
GROUP BY department;

SELECT department, GROUP_CONCAT(CONCAT(first_name, ' ', last_name) ORDER BY last_name ASC) AS employee_name
FROM employees
GROUP BY department;

SELECT department, CONCAT(first_name, ' ', last_name) AS employee_name
FROM employees;

-- Retrieve the total sales of sales greater than 400
SELECT customer_id, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY customer_id
HAVING SUM(sales_amount > 400);

-- SCALAR FUNCTIONS

SELECT employee_id, UPPER(first_name) AS upper_case_first_name
FROM employees;

SELECT employee_id, LOWER(last_name) AS lower_case_last_name
FROM employees;

SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT employee_id, UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees;

SELECT employee_id, CONCAT(UPPER(first_name), ' ', LOWER(last_name)) AS full_name
FROM employees;

ALTER TABLE employees
ADD salary DECIMAL(10, 2);

UPDATE employees
SET salary = 200000.75
WHERE employee_id = 1;

UPDATE employees
SET salary = 50000.00
WHERE employee_id = 2;

UPDATE employees
SET salary = 300000.80
WHERE employee_id = 3;

UPDATE employees
SET salary = 75000.25
WHERE employee_id = 4;

SELECT employee_id, ROUND(salary, 2) AS rounded_salary
FROM employees;

SELECT employee_id, CEILING(salary) AS ceiling_salary
FROM employees;

SELECT employee_id, FLOOR(salary) AS floor_salary
FROM employees;

SELECT CURTIME();

SELECT CURDATE();

SELECT YEAR('2025-02-28');

SELECT YEAR(CURDATE());

SELECT DAYOFWEEK('2025-02-28');

SELECT DAYOFWEEK(CURDATE());

SELECT DATE_ADD('2025-02-28', INTERVAL 3 DAY);

SELECT DATE_ADD(CURDATE(), INTERVAL 3 DAY);

SELECT DATE_SUB('2025-02-28', INTERVAL 3 DAY);

SELECT DATE_SUB(CURDATE(), INTERVAL 3 DAY);

SELECT DATEDIFF('2025-02-28', '2025-02-20');

SELECT CHAR(78, 69, 73, 76, 0, 74, 65, 89);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_details VARCHAR(100),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
    ON DELETE CASCADE ON UPDATE CASCADE
); 

INSERT INTO customers
VALUES (1, 'John Doe'),
       (2, 'Emily Smith'),
       (3, 'Michael Williams');

INSERT INTO orders
VALUES (1, 1, 'Order 1 from John Doe'),
       (2, 2, 'Order 1 from Emily Smith'),
       (3, 3, 'Order 1 from Michael Williams');

DROP TABLE orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_details VARCHAR(100),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
    ON DELETE SET NULL ON UPDATE SET NULL
); 

INSERT INTO customers
VALUES (1, 'John Doe'),
       (2, 'Emily Smith'),
       (3, 'Michael Williams');

INSERT INTO orders
VALUES (1, 1, 'Order 1 from John Doe'),
       (2, 2, 'Order 1 from Emily Smith'),
       (3, 3, 'Order 1 from Michael Williams');