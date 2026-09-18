-- SQL Practice: Logical Operators (AND, OR, NOT) & Schema Setup
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Table Creation, Data Insertion, and Conditional Filtering

/*
=====================================================
Topic: SQL Logical Filtering (AND, OR, NOT)
Note: Filtering database records based on multiple
      conditional statements and logical evaluations.
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

-- 4. Using AND Operator
-- Both conditions must be True (Age > 29 AND Salary > 50,000)
SELECT * FROM employee
WHERE age > 29 AND salary > 50000.00;

-- 5. Using OR Operator
-- At least one condition must be True (Age > 20 OR Salary > 20,000)
SELECT * FROM employee
WHERE age > 20 OR salary > 20000.00;

-- 6. Using NOT Operator
-- Excludes records where department is 'HR'
SELECT * FROM employee
WHERE NOT dept_name = 'HR';
