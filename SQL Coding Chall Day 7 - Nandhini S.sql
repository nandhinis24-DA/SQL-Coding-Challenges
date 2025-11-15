use employees;
select * from employees;

DELIMITER $$ 
CREATE procedure emp_details(in emp_no int)
begin
	select emp_no , birth_date, first_name, last_name, gender, hire_date from employees;
END $$
DELIMITER ;

call emp_details(10002); 

Create View emp_dep AS
select e.emp_no,e.first_name,e.last_name,de.dept_no,d.dept_name
from employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
group by e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name;

Select * from emp_dep;

Create View emp_info AS
select e.emp_no,e.first_name,e.last_name,d.dept_name,s.salary
from employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN salaries AS s
ON e.emp_no = s.emp_no
group by e.emp_no, e.first_name, e.last_name,d.dept_name,s.salary;

Select * from emp_info;