-- SQL Project: Employee and Department Management System

-- Create Database
DROP DATABASE IF EXISTS company_demo;
CREATE DATABASE company_demo;
USE company_demo;

-- Create Tables
CREATE TABLE Department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    salary DECIMAL(10,2),
    join_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert Sample Data
INSERT INTO Department (dept_name) VALUES
('HR'), ('IT'), ('Finance');

INSERT INTO Employee (emp_name, dept_id, salary, join_date) VALUES
('Amit Kumar', 2, 60000, '2021-01-10'),
('Priya Sharma', 1, 50000, '2022-03-15'),
('Rohit Verma', 2, 75000, '2020-10-05'),
('Sneha Gupta', 3, 68000, '2023-02-20'),
('Anjali Rai', 1, 55000, '2021-07-12');

-- Useful SQL Queries (Easy + Practical)

-- Show all employees with their department name
SELECT e.emp_name, d.dept_name, e.salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id;

-- Find employees who joined after 2021
SELECT emp_name, join_date
FROM Employee
WHERE join_date > '2021-12-31';

-- Find average salary in each department
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Find the highest paid employee
SELECT emp_name, salary
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- Show employees earning above the average salary
SELECT emp_name, salary
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- Order employees by highest salary
SELECT emp_name, salary
FROM Employee
ORDER BY salary DESC;

-- Count number of employees in each department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Use the view
SELECT * FROM employee_summary;

-- Check updated salaries
SELECT * FROM Employee;