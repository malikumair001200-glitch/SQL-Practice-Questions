-- SQL Practice: String Manipulation Functions
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Text Processing, String Formatting, and Extraction Techniques

/*
=====================================================
Topic: SQL String Functions
Note: Cleaning, transforming, concatenating, and extracting
      text attributes within relational database columns.
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


-- 4. UPPER & LOWER Functions
-- Convert category strings to UPPERCASE
SELECT UPPER(category) AS category_uppercase
FROM products;

-- Convert category strings to LOWERCASE
SELECT LOWER(category) AS category_lowercase
FROM products;


-- 5. CONCAT Function
-- Combine Product Name and Category with a hyphen separator
SELECT CONCAT(product_name, ' - ', category) AS product_details
FROM products;


-- 6. SUBSTRING Function
-- Extract the first 5 characters from product_name
SELECT SUBSTRING(product_name, 1, 5) AS short_name
FROM products;


-- 7. LENGTH Function
-- Calculate character length of product names
SELECT product_name, LENGTH(product_name) AS char_count
FROM products;


-- 8. TRIM Function
-- Remove leading and trailing spaces from text
SELECT TRIM('     mentor    ') AS trimmed_text;


-- 9. REPLACE Function
-- Replace occurrences of 'phone' with 'device' in product names
SELECT REPLACE(LOWER(product_name), 'phone', 'device') AS updated_product_name
FROM products;


-- 10. LEFT Function
-- Extract the first 3 characters from category
SELECT LEFT(category, 3) AS category_prefix
FROM products;
