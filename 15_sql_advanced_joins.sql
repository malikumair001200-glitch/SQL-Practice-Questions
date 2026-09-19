-- SQL Practice: Advanced Joins (FULL OUTER JOIN, CROSS JOIN, and SELF JOIN)
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Outer Joins, Cartesian Products, and Self-Referential Joins

/*
=====================================================
Topic: Advanced SQL Table Joins
Note: Combining records using Full Outer Joins, generating Cartesian products
      with Cross Joins, and comparing rows within the same table using Self Joins.
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


-- 7. FULL OUTER JOIN
-- Returns all records when there is a match in left or right table records
SELECT e.employee_id,
       e.first_name,
       e.last_name, 
       d.department_id,
       d.department_name
FROM Employees3 e
FULL OUTER JOIN Departments d
    ON e.department_id = d.department_id;


-- 8. CROSS JOIN
-- Produces a Cartesian product (combines every row from Employees3 with every row from Departments)
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name
FROM Employees3 e
CROSS JOIN Departments d;


-- 9. SELF JOIN
-- Joins table Employees3 to itself to pair colleagues within the same department
SELECT e1.employee_id AS employee_1_id,
       e1.first_name AS employee_1_name,
       e2.employee_id AS employee_2_id,
       e2.first_name AS employee_2_name,
       d.department_name
FROM Employees3 e1
INNER JOIN Employees3 e2
    ON e1.department_id = e2.department_id 
   AND e1.employee_id <> e2.employee_id
LEFT JOIN Departments d
    ON e1.department_id = d.department_id;
