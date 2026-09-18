-- SQL Practice: Set Operations (UNION, UNION ALL, INTERSECT, EXCEPT)
-- Author: Waqas Manzoor
-- Topic: PostgreSQL Set Operations across Multiple Data Tables

/*
=====================================================
Topic: SQL Set Operations
Note: Combining and comparing result sets across multiple
      tables representing different academic years.
=====================================================
*/

-- 1. Setup & Create 2023 Students Table
DROP TABLE IF EXISTS students_2023;
CREATE TABLE students_2023 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2023 (student_id, student_name, course) VALUES
(1, 'Aarav Sharma', 'Computer Science'),
(2, 'Ishita Verma', 'Mechanical Engineering'),
(3, 'Kabir Patel', 'Electronics'),
(4, 'Ananya Desai', 'Civil Engineering'),
(5, 'Rahul Gupta', 'Computer Science');

SELECT * FROM students_2023;


-- 2. Setup & Create 2024 Students Table
DROP TABLE IF EXISTS students_2024;
CREATE TABLE students_2024 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2024 (student_id, student_name, course) VALUES
(3, 'Kabir Patel', 'Electronics'),      -- Overlaps with 2023
(4, 'Ananya Desai', 'Civil Engineering'), -- Overlaps with 2023
(6, 'Meera Rao', 'Computer Science'),
(7, 'Vikram Singh', 'Mathematics'),
(8, 'Sanya Kapoor', 'Physics');

SELECT * FROM students_2024;


-- 3. UNION Operator
-- Combines unique records from both tables (Removes duplicate rows)
SELECT student_name, course
FROM students_2023
UNION
SELECT student_name, course
FROM students_2024;


-- 4. UNION ALL Operator
-- Combines all records from both tables (Preserves duplicate rows)
SELECT student_name, course 
FROM students_2023
UNION ALL
SELECT student_name, course
FROM students_2024;


-- 5. INTERSECT Operator
-- Returns only the common records present in both tables
SELECT student_name, course 
FROM students_2023
INTERSECT
SELECT student_name, course
FROM students_2024;


-- 6. EXCEPT Operator
-- Returns records present in the first table (students_2023) but NOT in the second (students_2024)
SELECT student_name, course 
FROM students_2023
EXCEPT
SELECT student_name, course
FROM students_2024;
