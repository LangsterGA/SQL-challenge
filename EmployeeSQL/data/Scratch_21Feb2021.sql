-- Create Titles table
CREATE TABLE Titles (
	title_ID VARCHAR Primary Key,
	title VARCHAR
	);
--select * from titles

-- Create Employees table
CREATE TABLE Employees (
    emp_no INT Not Null Primary Key,
	emp_title_id VARCHAR,
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_ID),
    birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL
);
--select * from Employees

-- Create salaries table
CREATE TABLE salaries(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INT NOT NULL
);
--select * from salaries

-- Create Departments table
CREATE TABLE Departments(
	dept_no VARCHAR Not Null Primary Key, 
	dept_name VARCHAR
);
--select * from Departments

-- Create Dept_manager table
CREATE TABLE Dept_manager(
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
select * from Dept_manager

-- Create Dept_emp table
CREATE TABLE Dept_emp(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
--select * from Dept_emp

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
		Employees.emp_no, 
		last_name, 
		first_name, 
		sex, 
		salary
FROM 
		Employees
INNER JOIN salaries
ON salaries.emp_no = Employees.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
		first_name, 
		last_name, 
		hire_date	
FROM 
		Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
		dept_manager.dept_no,
		Departments.dept_name,
		dept_manager.emp_no,
		last_name,
		first_name
FROM	
		dept_manager
		
INNER JOIN Employees
ON dept_manager.emp_no = Employees.emp_no

INNER JOIN Departments
ON dept_manager.dept_no = Departments.dept_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
		Employees.emp_no,
		Employees.last_name,
		Employees.first_name,
		Departments.dept_name
FROM Employees
	
INNER JOIN Dept_emp
On Employees.emp_no = Dept_emp.emp_no

INNER JOIN Departments
On dept_manager.dept_no = Departments.dept_no
	
		
		
