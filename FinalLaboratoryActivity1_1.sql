-- Connection 1
CREATE DATABASE inventory_db;

USE inventory_db;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    stock_quantity INT NOT NULL CHECK(stock_quantity >= 0)
) ENGINE=InnoDB;

INSERT INTO products(product_name, stock_quantity) VALUES
('Laptop Model X', 50),
('Wireless Keyboard', 120);

SELECT * FROM products;

-- Connection 2
USE inventory_db;

-- Connection 1
START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity + 10
WHERE product_id = 1;

SELECT * 
FROM products
WHERE product_id = 1;

ROLLBACK;

SELECT * 
FROM products
WHERE product_id = 1;

-- Connection 1
START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 5
WHERE product_id = 2;

SELECT * 
FROM products
WHERE product_id = 2;

COMMIT;

SELECT * 
FROM products
WHERE product_id = 2;

-- Connection 1
SELECT * 
FROM products
WHERE product_id = 1;

START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 60
WHERE product_id = 1;

ROLLBACK;

SELECT * 
FROM products
WHERE product_id = 1;

-- Connection 1
START TRANSACTION;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 2;

SELECT *
FROM products
WHERE product_id = 2;

-- Connection 2
SELECT *
FROM products
WHERE product_id = 2;

-- Connection 1
COMMIT;

-- Connection 2
SELECT *
FROM products
WHERE product_id = 2;