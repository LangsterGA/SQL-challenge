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