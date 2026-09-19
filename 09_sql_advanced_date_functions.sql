-- SQL Practice: Advanced Date & Time Functions
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Date Extraction, Date Truncation, Interval Arithmetic, and Type Conversions

/*
=====================================================
Topic: SQL Advanced Date Operations
Note: Extracting day parts, truncating dates to start of periods,
      performing interval additions, and converting string data to DATE types.
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


-- 4. DATE_PART Function
-- Extract specific part of date (Day Of Week - DOW)
SELECT product_name, 
       added_date,
       DATE_PART('DOW', added_date) AS day_of_week
FROM products;


-- 5. DATE_TRUNC Function
-- Truncate added_date to the beginning of the specified period (month)
SELECT product_name, 
       added_date,
       DATE_TRUNC('month', added_date) AS month_start
FROM products;


-- 6. INTERVAL Arithmetic
-- Add 6 months to added_date
SELECT product_name, 
       added_date,
       added_date + INTERVAL '6 MONTHS' AS added_date_plus_6m
FROM products;


-- 7. CURRENT_TIME Function
-- Retrieve current system time with time zone
SELECT CURRENT_TIME AS current_system_time;


-- 8. TO_DATE Function
-- Convert a formatted date string to PostgreSQL DATE type
SELECT TO_DATE('28-11-2024', 'DD-MM-YYYY') AS converted_date;
