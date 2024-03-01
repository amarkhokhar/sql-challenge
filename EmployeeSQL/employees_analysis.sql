--Listing the employee number, last name, first name, sex, and salary of each employee
SELECT
	employees.emp_no,
	first_name,
	last_name,
	sex,
	salary
FROM salary 
LEFT JOIN employees
ON employees.emp_no = salary.emp_no;

--Listing the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date > '1985-12-31' AND hire_date< '1987-01-01';

--Listing the manager of each department along with their department number, 
--department name, employee number, last name, and first name
SELECT
	dept_name,
	departments.dept_no,
	employees.emp_no,
	last_name,
	first_name
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON 
employees.emp_no = dept_manager.emp_no;

--Listing the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name
SELECT
	departments.dept_no,
	dept_name,
	employees.emp_no,
	last_name,
	first_name
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON 
employees.emp_no = dept_emp.emp_no;

--Listing first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B
SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Listing each employee in the Sales department, including their employee number, 
--last name, and first name
SELECT
	employees.emp_no,
	last_name,
	first_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON 
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--Listing each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
SELECT
	employees.emp_no,
	last_name,
	first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON 
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

--Listing the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)
SELECT
	last_name,
	COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;