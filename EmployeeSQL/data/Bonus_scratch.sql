--select * from employees
select salary FROM salaries
WHERE salary BETWEEN 40000 AND 50000

SELECT
	title,
	salary
	
from 
Employees
INNER JOIN salaries
ON salaries.emp_no = Employees.emp_no
INNER JOIN titles
ON titles.title_id = Employees.emp_title_id
	