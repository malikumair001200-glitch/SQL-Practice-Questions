-- SQL Practice: Window Functions (ROW_NUMBER, RANK, DENSE_RANK, Running Totals)
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Window Functions, Partitioning, Ranking, and Cumulative Aggregations

/*
=====================================================
Topic: SQL Window Functions
Note: Performing calculations across sets of table rows related to the current row,
      including row numbering, dense/sparse ranking, and running total calculations.
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


-- 4. ROW_NUMBER() Window Function
-- Assigns a unique sequential row number to each product within its category
SELECT product_name,
       category,
       price,
       ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) AS row_num
FROM products;


-- 5. DENSE_RANK() Window Function
-- Ranks products within category without gaps in ranking sequence for tied values
SELECT product_name,
       category,
       price,
       DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS dense_rank_num
FROM products;


-- 6. RANK() Window Function
-- Ranks products within category with gaps in ranking sequence for tied values
SELECT product_name,
       category,
       price,
       RANK() OVER(PARTITION BY category ORDER BY price DESC) AS rank_num
FROM products;


-- 7. SUM() OVER - Running Total (Descending Price Order)
-- Calculates cumulative price sum starting from highest to lowest price
SELECT product_name,
       category,
       price,
       SUM(price) OVER(ORDER BY price DESC) AS running_total_desc
FROM products;


-- 8. SUM() OVER - Running Total (Ascending Price Order)
-- Calculates cumulative price sum starting from lowest to highest price
SELECT product_name,
       category,
       price,
       SUM(price) OVER(ORDER BY price ASC) AS running_total_asc
FROM products;
