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
		E.emp_no,
		E.last_name Employees_last_name,
		E.first_name Employees_first_name,
		D.dept_name
		
FROM Employees E
	
INNER JOIN Dept_emp de
On E.emp_no = de.emp_no

INNER JOIN Departments D
On de.dept_no = D.dept_no
	
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."		
SELECT
		first_name, 
		last_name, 
		sex
FROM 
		Employees
where first_name = 'Hercules' and last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
		E.emp_no,
		E.last_name Employees_last_name,
		E.first_name Employees_first_name,
		D.dept_name
		
FROM Employees E
	
INNER JOIN Dept_emp de
On E.emp_no = de.emp_no

INNER JOIN Departments D
On de.dept_no = D.dept_no

WHERE D.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
		E.emp_no,
		E.last_name Employees_last_name,
		E.first_name Employees_first_name,
		D.dept_name
		
FROM Employees E
	
INNER JOIN Dept_emp de
On E.emp_no = de.emp_no

INNER JOIN Departments D
On de.dept_no = D.dept_no

WHERE D.dept_name = 'Sales' OR D.dept_name ='Development'

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
		last_name,
		COUNT(last_name) cnt
FROM 
		Employees
GROUP BY
		last_name
ORDER BY
	    cnt DESC;


