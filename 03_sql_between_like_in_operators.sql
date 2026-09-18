-- SQL Practice: Advanced Filtering (BETWEEN, LIKE, IN Operators)
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Pattern Matching, Range Filtering, and Value Lists

/*
=====================================================
Topic: SQL Advanced Filtering Techniques
Note: Demonstrating BETWEEN for range queries, 
      LIKE for pattern matching, and IN for set matching.
=====================================================
*/

-- 1. Create Employee Table
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_name VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0),
    joining_date DATE NOT NULL,
    age INT CHECK (age > 18)
);

-- 2. Insert Employee Records
INSERT INTO employee (first_name, last_name, dept_name, salary, joining_date, age) VALUES
('Amit', 'Sharma', 'IT', 65000.00, '2022-05-01', 29),
('Neha', 'Patel', 'HR', 55000.00, '2021-08-15', 32),
('Ravi', 'Kumar', 'IT', 65000.00, '2020-11-22', 28),
('Suresh', 'Reddy', 'Operation', 50000.00, '2023-01-10', 26);

-- 3. Retrieve All Records
SELECT * FROM employee;

-- 4. USING BETWEEN OPERATOR
-- Retrieve employees whose salary is between 35,000 and 50,000
SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 35000 AND 50000;

-- 5. USING LIKE OPERATOR
-- Find employees whose last name ends with 'a'
SELECT last_name
FROM employee
WHERE last_name LIKE '%a';

-- 6. USING IN OPERATOR
-- Retrieve employees who belong to 'HR' or 'IT' department
SELECT first_name, last_name, dept_name
FROM employee
WHERE dept_name IN ('HR', 'IT');
