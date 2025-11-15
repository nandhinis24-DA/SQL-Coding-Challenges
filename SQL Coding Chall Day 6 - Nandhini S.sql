create database functions;
use functions;

CREATE TABLE Employees (
    Emp_no INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    join_date DATE
);

INSERT INTO Employees (Emp_no, FirstName, LastName, join_date) VALUES
(1001, 'Rahul', 'Raj', '2018-03-15'),
(1002, 'Pratheep', 'Raj', '2020-07-20'),
(1003, 'Mohan', 'Kumar', '2015-01-10');

DELIMITER $$ 
CREATE FUNCTION get_emp_uppercase(emp_no INT)
returns varchar (50)
deterministic
Begin
	declare emp_uppercase varchar (50);
    select UPPER(FirstName)
    into emp_uppercase
    from employees 
    where employees.emp_no = emp_no;
	return emp_uppercase;
end $$
DELIMITER ;
select get_emp_uppercase(1002); 

DELIMITER $$ 
CREATE FUNCTION get_emp_lowercase(emp_no INT)
returns varchar (50)
deterministic
Begin
	declare emp_lowercase varchar (50);
    select lower(FirstName)
    into emp_lowercase
    from employees 
    where employees.emp_no = emp_no;
	return emp_lowercase;
end $$
DELIMITER ;
DROP function if exists get_emp_lowercase;
select get_emp_lowercase(1001); 

DELIMITER $$ 
CREATE FUNCTION get_emp_substring(emp_no INT)
returns varchar (50)
deterministic
Begin
	declare emp_substring varchar (50);
    select SUBSTRING(FirstName, 1, 4) AS First4Letters
    into emp_substring
    from employees 
    where employees.emp_no = emp_no;
	return emp_substring;
end $$
DELIMITER ;
select get_emp_substring(1002); 

DELIMITER $$ 
CREATE FUNCTION get_emp_fullname(emp_no INT)
returns varchar (50)
deterministic
Begin
	declare emp_fullname varchar (50);
    Select concat(FirstName, " " ,LastName)
    into emp_fullname
    from employees 
    where employees.emp_no = emp_no;
	return emp_fullname;
end $$
DELIMITER ;
select get_emp_fullname(1002); 
DROP function if exists get_emp_fullname;

DELIMITER $$ 
CREATE FUNCTION get_emp_formate(emp_no INT)
returns varchar (100)
deterministic
Begin
	declare emp_formate varchar (100);
       SELECT CONCAT(
        'UPPER: ', UPPER(FirstName), ', ',
        'lower: ', LOWER(FirstName), ', ',
        'First4: ', SUBSTRING(FirstName, 1, 4), ', ',
        'Full: ', CONCAT(FirstName, ' ', LastName)
    )
    INTO emp_formate from employees
    where employees.emp_no = emp_no;
	return emp_formate;
end $$
DELIMITER ;
DROP function if exists get_emp_formate;
select get_emp_formate(1002); 


DELIMITER $$ 
CREATE FUNCTION get_emp_tenure(emp_no INT)
returns int
deterministic
Begin
	declare emp_tenure INT;
    SELECT TIMESTAMPDIFF(YEAR, join_date, CURDATE())
    into emp_tenure
    from employees 
    where employees.emp_no = emp_no;
	return emp_tenure;
end $$
DELIMITER ;

select get_emp_tenure(1003); 