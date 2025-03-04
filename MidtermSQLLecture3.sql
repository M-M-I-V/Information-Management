
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