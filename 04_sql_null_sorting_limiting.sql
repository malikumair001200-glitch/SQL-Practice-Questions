-- SQL Practice: NULL Checks, Sorting (ORDER BY), Limiting & DISTINCT
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Data Filtering, Sorting, Result Set Partitioning, and Unique Value Retrieval

/*
=====================================================
Topic: SQL Null Handling & Result Set Control
Note: Filtering missing values using IS NULL, sorting records,
      limiting top outputs, and retrieving unique categories.
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

-- 4. FIND EMPLOYEES WHERE THE DEPARTMENT IS NULL
SELECT first_name, last_name, dept_name
FROM employee
WHERE dept_name IS NULL;

-- 5. LIST EMPLOYEES BY SALARY IN DESCENDING ORDER
SELECT first_name, last_name, salary
FROM employee
ORDER BY salary DESC;

-- 6. RETRIEVE THE TOP HIGHEST PAID EMPLOYEES
SELECT first_name, last_name, salary
FROM employee
ORDER BY salary DESC
LIMIT 5;

-- 7. RETRIEVE LIST OF UNIQUE DEPARTMENTS
SELECT DISTINCT dept_name 
FROM employee;
