CREATE DATABASE company_management;
USE company_management;

-- TABLE 1: DEPARTMENTS

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Support');

-- TABLE 2: EMPLOYEES

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    age INT,
    salary INT,
    dept_id INT,
    joining_date DATE
);

INSERT INTO employees VALUES
(101, 'Rahul', 25, 35000, 1, '2023-01-15'),
(102, 'Priya', 28, 45000, 2, '2022-05-20'),
(103, 'Arjun', 30, 55000, 1, '2021-03-10'),
(104, 'Sneha', 24, 30000, 3, '2024-07-01'),
(105, 'Kiran', 32, 60000, 4, '2020-11-25'),
(106, 'Ayesha', 27, 40000, 2, '2023-09-12'),
(107, 'Vikram', 29, 50000, 5, '2022-06-18'),
(108, 'Neha', 26, 38000, 3, '2024-02-05'),
(109, 'Amit', 31, 65000, 1, '2020-08-14'),
(110, 'Pooja', 23, 28000, 6, '2025-01-10');

-- TABLE 3: PROJECTS

CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(50),
    emp_id INT,
    budget INT,
    start_date DATE
);

INSERT INTO projects VALUES
(201, 'AI Project', 101, 50000, '2025-01-10'),
(202, 'HR Portal', 102, 30000, '2025-02-15'),
(203, 'Data Analytics', 103, 80000, '2025-03-20'),
(204, 'Finance System', 104, 45000, '2025-04-05'),
(205, 'Marketing App', 105, 60000, '2025-05-12'),
(206, 'ML Project', 101, 90000, '2025-06-18'),
(207, 'Cloud Migration', 107, 75000, '2025-07-22'),
(208, 'Support Portal', 108, 25000, '2025-08-10'),
(209, 'Sales Dashboard', 103, 55000, '2025-09-15'),
(210, 'Automation System', 109, 100000, '2025-10-20');

-- SEC - A
-- 1
select 
employees.emp_name,
employees.age,
employees.salary from
employees ;

-- 2
select
employees.emp_name ,
employees.salary
from employees
where salary > 40000

-- 3 
select 
employees.emp_name,
employees.age
from employees
where age between 25 and 30 ;

-- 4 
 select 
 employees.emp_id,
 employees.emp_name 
 from employees 
where emp_name like 'a%' ;

-- Q2

-- 1
SELECT 
 employees.emp_id,
 employees.emp_name,
 employees.salary
 from employees
 order by employees.salary desc ;
 
 -- 2
 SELECT 
 employees.emp_id,
 employees.emp_name,
 employees.joining_date
 from employees
 order by employees.joining_date asc ; 
 
 -- 3
 select 
 distinct employees.dept_id
 from employees ;
 
 -- Q3
 -- 1
 select 
 count(emp_name) as total_employees
 from employees ;
 
 -- 2
 select 
 sum(salary)as total_salary
 from employees ;
 
 -- 3
 select
 max(salary) as max_salary , min(salary) as min_salary
 from employees ;
 
 -- 4
  select 
 avg(salary)as avg_salary
 from employees ;
 
 -- Q4
 -- 1
 select 
 departments.dept_name,
 count(*) as total_employees
 from departments
 group by departments.dept_name;
 
 -- 3
select employees.salary , employees.dept_id,avg(salary) as avg_salary 
from employees
group by employees.salary,employees.dept_id
having avg(salary) > 40000;

-- Q5
-- 1
select *
from projects
where budget > 50000;

-- 2
select SUM(budget) as total_project_budget
from projects;

-- 3
select avg(budget) as average_project_budget
from projects;

-- 4
select
    employees.emp_name,
    COUNT(projects.project_id) as total_projects
from employees
left join projects 
on  employees.emp_id = projects.emp_id
group by employees.emp_id, employees.emp_name;

-- SEC B 
-- Q 6 
-- 1
SELECT
    employees.emp_name,
    departments.dept_name
FROM employees 
INNER JOIN departments 
ON employees.dept_id = departments.dept_id;
 
-- 2 
SELECT
    employees.emp_name,
    projects.project_name
FROM employees 
LEFT JOIN projects 
ON employees.emp_id = projects.emp_id;