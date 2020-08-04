-- List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE VIEW employee_info AS
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary 
FROM employees
JOIN salaries ON
employees.emp_no = salaries.emp_no

-- List employees who were hired in 1986.

CREATE VIEW "employees hired in 1986" AS
SELECT first_name, last_name
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

CREATE VIEW "Manager Info" AS
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date, employees.first_name, employees.last_name
FROM departments
JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
JOIN employees ON
dept_manager.emp_no = employees.emp_no;

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

CREATE VIEW "Employee Department Info" AS
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
JOIN dept_emp ON
dept_emp.dept_no = departments.dept_no
JOIN employees ON
dept_emp.emp_no = employees.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW "Hurculean Employees" AS
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

CREATE VIEW "Sales Department" AS 
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
JOIN employees ON
dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW "Sales & Development Departments" AS 
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
JOIN employees ON
dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' OR
dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

CREATE VIEW "Family Names" AS
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;