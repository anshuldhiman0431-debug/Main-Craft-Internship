SELECT * FROM studentmanagement.courses;
-- Create students table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);

-- Insert Data
INSERT INTO students VALUES
(1,'Ankit',20,'Male','Delhi'),
(2,'Priya',21,'Female','Mumbai'),
(3,'Rahul',19,'Male','Pune'),
(4,'Sneha',22,'Female','Jaipur'),
(5,'Amit',20,'Male','Chandigarh');

select * from students;

-- Create Table Courses
CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- insert courses data
INSERT INTO courses (id, name)
VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Power BI'),
(104, 'Excel'),
(105, 'Tableau'),
(106, 'Machine Learning'),
(107, 'Data Structures'),
(108, 'DBMS'),
(109, 'Cloud Computing'),
(110, 'Big Data');

-- Verify table
select * from courses;

-- create Enrollment Table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(course_id) REFERENCES courses(id)
);

-- Insert Enrollment
INSERT INTO enrollments VALUES
(1,101,85),
(1,102,90),
(2,101,75),
(2,103,82),
(3,102,35),
(3,104,45),
(4,101,95),
(4,103,88),
(5,104,39),
(5,102,60);

select * from enrollments;

-- Q1 List all students enrolled in each course
SELECT
    s.id,
    s.name AS student_name,
    c.name AS course_name,
    e.grade
FROM enrollments e
JOIN students s
ON e.student_id = s.id
JOIN courses c
ON e.course_id = c.id
ORDER BY c.name, s.name;


-- Q2 Find average grade per course
SELECT
    c.name,
    ROUND(AVG(e.grade),2) AS average_grade
FROM enrollments e
JOIN courses c
ON e.course_id=c.id
GROUP BY c.name;

-- Q3 Find Top 3 students overall
SELECT
    s.id,
    s.name,
    ROUND(AVG(e.grade),2) AS average_grade
FROM students s
JOIN enrollments e
ON s.id=e.student_id
GROUP BY s.id,s.name
ORDER BY average_grade DESC
LIMIT 3;

-- Q4 count students who failed (grade <40)
SELECT COUNT(*) AS failed_students
FROM enrollments
WHERE grade<40;









