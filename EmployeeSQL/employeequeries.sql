--test queries to ensure data is visible
SELECT "emp_no", "first_name", "last_name", "sex"
FROM "Employees";

SELECT "salary" FROM "Salaries";

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON (e.emp_no = s.emp_no);

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT "first_name", "last_name", "hire_date"
FROM "Employees"
WHERE "hire_date" >= '1/1/86' AND "hire_date" <= '12/31/86';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM "Dept_manager" dm
JOIN "Employees" e 
ON (e.emp_no = dm.emp_no)
JOIN "Departments" d
ON (dm.dept_no = d.dept_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM "Employees" e
JOIN "Dept_emp" de 
ON (e.emp_no = de.emp_no)
JOIN "Departments" d
ON (d.dept_no = de.dept_no);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT "first_name", "last_name", "sex"
FROM "Employees"
WHERE "first_name" = 'Hercules' AND "last_name" LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM "Employees" e
JOIN "Dept_emp" de 
ON (e.emp_no = de.emp_no)
JOIN "Departments" d
ON (d.dept_no = de.dept_no)
WHERE de.dept_no = 'd007';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM "Employees" e
JOIN "Dept_emp" de 
ON (e.emp_no = de.emp_no)
JOIN "Departments" d
ON (d.dept_no = de.dept_no)
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';

--List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT "last_name", COUNT(e.last_name) AS "Frequency of last names"
FROM "Employees" e
GROUP BY e.last_name
ORDER BY e.last_name DESC;