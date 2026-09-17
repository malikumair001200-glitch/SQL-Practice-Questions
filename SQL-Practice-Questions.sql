CREATE TABLE employee(
  employee_id SERIAL PRIMARY KEY,
  first_name  VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  department VARCHAR(50),
  salary DECIMAL(10,2) CHECK (salary>0),
  joining_date DATE NOT NULL,
  age INT CHECK(age>18)
);
SELECT * FROM employee;

INSERT INTO employee(first_name, department, last_name, salary, joining_date, age) VALUES
('Amit', 'Sharma', 'IT', 65000.00, '2022-05-01',29),
('Neha', 'Patel', 'HR', 55000.00, '2021-08-15',32),
('Ravi', 'Kumar','IT',65000.00,'2020-11-22',28),
('Suresh','Reddy','Operation',50000.00, '2023-01-10',26);

--RETRIVE ALL EMPLOYEES FIRST NAME AND THEIR DEPARTMENTS
SELECT first_name,department FROM employee;

--update the salary of all employee in IT department
UPDATE employee
SET salary= salary +(salary*0.1)
WHERE department='IT';

--DELETE ALL EMPLOYEE WHO ARE ALDER THAN 34
DELETE FROM employee
WHERE age>20

--add a new column  email to the employee table
ALTER TABLE employee
ADD COLUMN email VARCHAR(100);
--RENAME THE DEPARTMENT COLUMN TO DEPT_NAME
ALTER TABLE employee
RENAME COLUMN department to dept_name;
--RETRIVE THE NAME  OF EMPLOYEE WHO JOIN AFTER JANUARY 1 2021
SELECT first_name, dept_name, joining_date FROM employee
WHERE joining_date>'2021-01-01';
--CHANG THE DATA TYPE OF THE SALARY COLUMN TO INT 
ALTER TABLE employee
ALTER COLUMN salary TYPE
INTEGER USING salary::INTEGER;
--LIST ALL EMPLOYEE WITH THEIR AGE ND SALARY IN DESCENDING ORDER
SELECT first_name, age, salary FROM employee
ORDER BY salary DESC;
--UPDATE AGE OF EMPLOYEE +1 TO EVERY EMPLOYEE.
UPDATE employee
SET age=age+1;













