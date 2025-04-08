-- Setup

CREATE DATABASE order_processing_db;

USE order_processing_db;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    stock_quantity INT NOT NULL CHECK(stock_quantity >= 0),
    price DECIMAL(10, 2)
) ENGINE=InnoDB;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_balance DECIMAL(10, 2) NOT NULL CHECK(customer_balance >= 0)
) ENGINE=InnoDB;

INSERT INTO products(product_name, stock_quantity, price) VALUES
('Tablet', 10, 6999.99),
('Smartphone', 8, 3799.98),
('Laptop', 20, 39599.99),
('Headset', 15, 999.99),
('Gaming Chair', 10, 18999.99);

INSERT INTO customers(customer_name, customer_balance) VALUES
('Alice', 100000.00),
('Bob', 9500.00),
('Charlie', 98000.00);

SELECT *
FROM products;

SELECT *
FROM customers;

-- Part 1: The All-or-Nothing Order

SELECT *
FROM products
WHERE product_id IN(1, 2);

SELECT *
FROM customers
WHERE customer_id = 2;

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id IN (1, 2);

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 2;

UPDATE customers
SET customer_balance = customer_balance - 10799.97
WHERE customer_id = 2;

SELECT *
FROM products
WHERE product_id IN(1, 2);

SELECT *
FROM customers
WHERE customer_id = 2;

ROLLBACK;

SELECT *
FROM products
WHERE product_id IN(1, 2);

SELECT *
FROM customers
WHERE customer_id = 2;

-- Part 2

SELECT *
FROM products
WHERE product_id IN(4, 5);

SELECT *
FROM customers
WHERE customer_id = 1;

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 4;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 5;

UPDATE customers
SET customer_balance = customer_balance - 38999.97
WHERE customer_id = 1;

SELECT *
FROM products
WHERE product_id IN(4, 5);

SELECT *
FROM customers
WHERE customer_id = 1;

COMMIT;

SELECT *
FROM products
WHERE product_id IN(4, 5);

SELECT *
FROM customers
WHERE customer_id = 1;

-- Part 3

SELECT *
FROM products
WHERE product_id = 3;

START TRANSACTION;

UPDATE products
SET stock_quantity = -3
WHERE product_id = 3;

ROLLBACK;

SELECT *
FROM products
WHERE product_id = 3;

SELECT *
FROM customers
WHERE customer_id = 3;

START TRANSACTION;

UPDATE customers
SET customer_balance = customer_balance - 100000
WHERE customer_id = 3;

ROLLBACK;

SELECT *
FROM customers
WHERE customer_id = 3;

-- Part 4

SELECT *
FROM products
WHERE product_id = 2;

SELECT *
FROM customers
WHERE customer_id = 1;

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 5
WHERE product_id = 2;

UPDATE customers
SET customer_balance = customer_balance - 3799.98
WHERE product_id = 2;

-- Connection 1
SELECT *
FROM products
WHERE product_id = 2;

SELECT *
FROM customers
WHERE customer_id = 1;

-- Connection 2
SELECT *
FROM products
WHERE product_id = 2;

SELECT *
FROM customers
WHERE customer_id = 1;

COMMIT;

SELECT *
FROM products
WHERE product_id = 2;

SELECT *
FROM customers
WHERE customer_id = 1;