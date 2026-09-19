-- SQL Practice: Conditional Logic using CASE with Logical & Pattern Operators
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Conditional Expressions, Range Evaluation, and String Pattern Matching

/*
=====================================================
Topic: SQL CASE with AND, OR, and LIKE Operators
Note: Advanced conditional classification for inventory stock management
      and dynamic string-based category labeling.
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


-- 4. CASE with Quantity Range - Stock Status
-- Classifies products based on available inventory levels
SELECT product_name, 
       quantity,
       CASE
           WHEN quantity >= 10 THEN 'In Stock'
           WHEN quantity >= 5 AND quantity <= 9 THEN 'Limited Stock'
           ELSE 'Out of Stock'
       END AS availability
FROM products;


-- 5. CASE with LIKE Operator - Category Classification
-- Matches category patterns using wildcards (%LIKE%)
SELECT product_name, 
       category,
       CASE
           WHEN category LIKE '%Electronics%' THEN 'Electronics Item'
           WHEN category LIKE '%Furniture%' THEN 'Furniture Item'
           ELSE 'Accessories'
       END AS category_status
FROM products;
