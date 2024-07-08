CREATE DATABASE xyz_company;
USE xyz_company;

CREATE TABLE employees(
ID INT PRIMARY KEY,
name VARCHAR(50),
salary FLOAT4
);

INSERT INTO employees
(ID,name,salary)
VALUES
(1024,'Hanif',60000),
(1026,'Parvez',43000),
(1123,'Sami',37600),
(1127,'Porag',41000),
(1129,'Fahid',46000),
(1130,'Sozon',47000);

SELECT *
FROM employees;

BEGIN;

-- Update the salary of an employee
UPDATE employees
SET salary = salary + 3000
WHERE ID = 1123;

-- Commit the transaction
COMMIT;

SELECT *
FROM employees;
