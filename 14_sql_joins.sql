-- SQL Practice: Table Joins (INNER, LEFT, and RIGHT JOIN)
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Relational Joins, Data Combination, and Null Value Handling

/*
=====================================================
Topic: SQL Joins
Note: Combining records from two tables (Employees3 and Departments) 
      based on a related key column (department_id).
=====================================================
*/

-- 1. Setup & Create Employees Table
DROP TABLE IF EXISTS Employees3;
CREATE TABLE Employees3 (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

-- 2. Insert Sample Records into Employees
INSERT INTO Employees3 (first_name, last_name, department_id)
VALUES
('Rahul', 'Sharma', 101),
('Priya', 'Mehta', 102),
('Ankit', 'Verma', 103),
('Simran', 'Kaur', NULL),
('Aman', 'Singh', 101);

-- 3. Retrieve All Employee Records
SELECT * FROM Employees3;


-- 4. Setup & Create Departments Table
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- 5. Insert Sample Records into Departments
INSERT INTO Departments (department_id, department_name)
VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'IT'),
(104, 'HR');

-- 6. Retrieve All Department Records
SELECT * FROM Departments;


-- 7. INNER JOIN
-- Returns records that have matching values in both tables
SELECT e.employee_id,
       e.first_name,
       e.last_name, 
       d.department_id,
       d.department_name
FROM Employees3 e
INNER JOIN Departments d
    ON e.department_id = d.department_id;


-- 8. LEFT JOIN (LEFT OUTER JOIN)
-- Returns all records from the left table (Employees3), and matched records from right
SELECT e.employee_id,
       e.first_name,
       e.last_name, 
       d.department_id,
       d.department_name
FROM Employees3 e
LEFT JOIN Departments d
    ON e.department_id = d.department_id;


-- 9. RIGHT JOIN (RIGHT OUTER JOIN)
-- Returns all records from the right table (Departments), and matched records from left
SELECT e.employee_id,
       e.first_name,
       e.last_name, 
       d.department_id,
       d.department_name
FROM Employees3 e
RIGHT JOIN Departments d
    ON e.department_id = d.department_id;
