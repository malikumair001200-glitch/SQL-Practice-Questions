-- SQL Practice: Date & Time Manipulation Functions
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Date Retrieval, Part Extraction, Interval Calculation, and Date Formatting

/*
=====================================================
Topic: SQL Date Functions
Note: Handling timestamps, extracting specific date components,
      calculating time differences, and formatting date outputs.
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


-- 4. Current Timestamp & Date
-- NOW(): Returns current system date and timestamp
SELECT NOW() AS current_datetime;

-- CURRENT_DATE: Returns current system date only
SELECT CURRENT_DATE AS today_date;


-- 5. EXTRACT Function
-- Extract year, month, and day parts from added_date
SELECT product_name,
       EXTRACT(YEAR FROM added_date) AS year_added,
       EXTRACT(MONTH FROM added_date) AS month_added,
       EXTRACT(DAY FROM added_date) AS day_added
FROM products;


-- 6. AGE Function
-- Calculate the exact time interval between current date and added_date
SELECT product_name,
       AGE(CURRENT_DATE, added_date) AS age_since_added
FROM products;


-- 7. TO_CHAR Function
-- Format date into a custom string pattern (DD-MON-YYYY)
SELECT product_name,
       TO_CHAR(added_date, 'DD-MON-YYYY') AS formatted_date
FROM products;
