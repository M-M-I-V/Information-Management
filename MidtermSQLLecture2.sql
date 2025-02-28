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