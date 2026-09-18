-- SQL Practice: Aggregate Functions (SUM, COUNT, AVG, MAX, MIN)
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Data Aggregation, Conditional Summary Statistics, and Metrics Calculation

/*
=====================================================
Topic: SQL Aggregate Functions
Note: Summary statistics including totals, averages,
      record counts, and range analysis on product data.
=====================================================
*/

-- 1. Setup & Create Products Table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);

-- 2. Insert Sample Product Records
INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate) VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

-- 3. Retrieve All Records
SELECT * FROM products;


-- 4. SUM Operator
-- Total quantity of all available products
SELECT SUM(quantity) AS total_quantity
FROM products;

-- Total quantity for specific high-value Electronics
SELECT SUM(quantity) AS total_electronics
FROM products
WHERE category = 'Electronics' AND price > 20000;


-- 5. COUNT Operator
-- Total number of products
SELECT COUNT(*) AS total_products
FROM products;

-- Count products with conditional pattern matching
SELECT COUNT(*) AS total_phone_products
FROM products
WHERE product_name LIKE '%phone%';


-- 6. AVG Operator
-- Overall average price across all products
SELECT AVG(price) AS overall_avg_price
FROM products;

-- Average price with category and date conditions
SELECT AVG(price) AS conditional_avg_price
FROM products
WHERE category = 'Accessories' OR added_date > '2024-02-01';


-- 7. MAX & MIN Operators
-- Retrieve highest and lowest product prices
SELECT MAX(price) AS max_price,
       MIN(price) AS min_price
FROM products;
