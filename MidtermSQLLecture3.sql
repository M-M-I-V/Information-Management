-- Create multiple_tables_21 database
CREATE DATABASE multiple_tables_21;

-- Use multiple_tables_21 database
USE multiple_tables_21;

-- Create employees_inner table
CREATE TABLE employees_inner (
    id INT PRIMARY KEY, 
    employee_name VARCHAR(50),
    dept_id INT
);

-- Create departments_inner table
CREATE TABLE departments_inner (
    id INT PRIMARY KEY, 
    dept_name VARCHAR(50)
);

-- Insert records in employees_inner table
INSERT INTO employees_inner
VALUES (1, ‘Alice’, 101),
       (2, ‘Bob’, 102),
       (3, ‘Charlie’, 103);

-- Insert records in departments_inner table
INSERT INTO departments_inner
VALUES (101, ‘HR’),
       (102, ‘Finance’),
       (103, ‘IT’);

-- Inner joined employees_inner and departments_inner table
SELECT employees_inner.employee_name, departments_inner.dept_name
FROM employees_inner
INNER JOIN departments_inner
ON employees_inner.dept_id = depertments_inner.id;

-- Create products table
CREATE TABLE products (
    id INT PRIMARY KEY, 
    product_name VARCHAR(50),
    supplier_id INT
);

-- Create suppliers table
CREATE TABLE suppliers (
    id INT PRIMARY KEY, 
    supplier_name VARCHAR(50)
);

-- Insert records in products table
INSERT INTO products
VALUES (1, ‘Product A’, 201),
       (2, ‘Product B’, 202),
       (3, ‘Product C’, 203);

-- Insert records in suppliers table
INSERT INTO suppliers
VALUES (201, ‘Supplier 1’),
       (202, ‘Supplier 2’);

-- Left joined products and suppliers table
SELECT products.product_name, suppliers.supplier_name
FROM products 
LEFT JOIN suppliers 
ON products.supplier_id = suppliers.id;

-- Right joined products and suppliers table
SELECT products.product_name, suppliers.supplier_name
FROM products 
RIGHT JOIN suppliers 
ON products.supplier_id = suppliers.id;

-- Create students table
CREATE TABLE students (
    id INT PRIMARY KEY, 
    name VARCHAR(50)
);

-- Create sports table
CREATE TABLE sports (
    id INT PRIMARY KEY, 
    sport_name VARCHAR(50)
);

-- Insert records in students table
INSERT INTO students 
VALUES (1, 'John'),
       (2, 'Jane');

-- Insert records in sports table
INSERT INTO sports
VALUES (2, 'Basketball'),
       (3, 'Soccer');

-- Full joined students and sports table
SELECT students.name, sports.sport_name
FROM students
LEFT JOIN sports
UNION ALL
SELECT students.name, sports.sport_name
FROM students
RIGHT JOIN sports;

-- Create students_2023 table
CREATE TABLE students_2023 (
    id INT PRIMARY KEY, 
    name VARCHAR(50)
);

-- Create students_2024 table
CREATE TABLE students_2023 (
    id INT PRIMARY KEY, 
    name VARCHAR(50)
);

-- Insert records in students_2023 table
INSERT INTO students_2023
VALUES (1, 'Alice'), 
       (2, 'Bob'),
       (3, 'Charlie'),
       (4, 'Alice');

-- Insert records in students_2024 table
INSERT INTO students_2024
VALUES (2, 'Bob'),
       (3, 'Charlie'),
       (5, 'Eve'),
       (6, 'Frank');

SELECT name 
FROM students_2023
UNION 
SELECT name 
FROM students_2024;

SELECT name 
FROM students_2023
UNION ALL
SELECT name 
FROM students_2024;

SELECT name 
FROM students_2023
INTERSECT
SELECT name 
FROM students_2024;

SELECT name 
FROM students_2023
EXCEPT
SELECT name 
FROM students_2024;