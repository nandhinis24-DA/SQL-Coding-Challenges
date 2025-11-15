-- Joins & Union --
 CREATE DATABASE student_management;
USE student_management;

CREATE TABLE students(
student_id INT PRIMARY KEY,
student_name VARCHAR(50) UNIQUE NOT NULL,
date_of_birth DATE,
gender ENUM("M","F"),
email VARCHAR(100),
phone_no VARCHAR(20)
);

INSERT INTO students VALUES
(501,"Jeni","2016-11-01","F","jeni23@gmail.com","+919994212546"),
(502,"Pooja","2015-03-15","F","pooja@rediffmail.com","+919600712345"),
(503,"Rahul","2017-08-21","M","rahul@gmail.com","+919843712555"),
(504,"Pratheep","2018-09-30","M","pratheep@yahoo.co.in","+919843098430"),
(505,"Mukesh","2017-09-28","M","mukesh@gmail.com","+919842223505");

CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(10),
course_code VARCHAR(10)
);
INSERT INTO courses VALUES
(1,"MATHS","C001"),
(2,"PHYSICS","C002"),
(3,"CHEMISTRY","C003"),
(4,"BIOLOGY","C004"),
(5,"COMMERCE","C005");

CREATE TABLE enrollments(
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments VALUES
(1001,101,1,"2025-05-31"),
(1002,102,2,"2025-07-14"),
(1003,101,1,"2025-06-10"),
(1004,102,2,"2025-03-29");

--  INNER JOIN --
-- Show students with their enrolled course names --
-- Write a query joining Students and Courses --
SELECT s.student_name, c.course_name 
FROM students AS s
INNER JOIN enrollments AS e ON
s.student_id=e.student_id
INNER JOIN courses AS c ON
e.course_id=c.course_id;

-- LEFT & RIGHT JOIN --
-- List all students and their courses, including those without matches --
-- Use LEFT JOIN and RIGHT JOIN between Students and Enrollments --
SELECT s.student_name, c.course_name
FROM students AS s 
LEFT JOIN enrollments AS e ON
s.student_id=e.student_id 
LEFT JOIN courses AS c ON 
e.course_id=c.course_id;

SELECT s.student_name, c.course_name
FROM students AS s 
RIGHT JOIN enrollments AS e ON
s.student_id=e.student_id
RIGHT JOIN courses AS c ON
e.course_id=c.course_id;

CREATE TABLE current_employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100)
);
INSERT INTO current_employees VALUES
(1,"Arjun"),
(2,"Rina"),
(3,"Rocky"),
(4,"Teju"),
(5,"Guna");

CREATE TABLE past_employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100)
);
INSERT INTO past_employees VALUES
(1,"Gowtham"),
(2,"Ishu"),
(3,"Mohan"),
(4,"Nila"),
(5,"Rina");

-- UNION vs UNION ALL --
-- Combine lists of current and past employees --
-- Write queries demonstrating UNION and UNION ALL --
SELECT emp_name FROM current_employees
UNION
SELECT emp_name FROM past_employees;

SELECT emp_name FROM current_employees
UNION ALL
SELECT emp_name FROM past_employees;