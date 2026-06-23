SELECT * FROM studentmanagement.students;
CREATE Database StudentManagement;
CREATE TABLE Students(
		StudentID int primary key auto_increment,
        Name varchar(50),
        Gender char(1),
        Age int,
        Grade Varchar(2),
        MathScore int,
        ScienceScore int,
        EnglishScore int
);

Insert into students 
(Name,Gender,Age,Grade,Mathscore,Sciencescore,EnglishScore)
values
('Amit', 'M', 18, 'A', 95, 88, 91),
('Priya', 'F', 17, 'B', 82, 90, 85),
('Rahul', 'M', 19, 'A', 78, 75, 80),
('Sneha', 'F', 18, 'A', 92, 95, 89),
('Vikas', 'M', 17, 'C', 65, 70, 68),
('Neha', 'F', 19, 'B', 88, 84, 90),
('Arjun', 'M', 18, 'B', 76, 81, 79),
('Kavya', 'F', 17, 'A', 98, 96, 94),
('Rohan', 'M', 18, 'C', 60, 58, 65),
('Anjali', 'F', 19, 'B', 85, 87, 92);

-- 1. Queries to perform
--  a. Show student Details
select * from students;

-- b. Average Score In Each Department
Select 
	avg(mathscore) as 'Math_Average',
        avg(Sciencescore) as 'Science_Average',
        avg(Englishscore) as 'English_Avg'
        from students;
  
     
--  c. Highest total score (Top Perfromer)
SELECT *,
	(MathScore+ScienceScore+EnglishScore) AS 'TOTAL SCORE'
	FROM students 
    ORDER BY 'TOTAL SCORE' DESC LIMIT 1;
    
-- d. COUNT STUDENT PER GRADE
SELECT GRADE,COUNT(*) AS 'TOTAL STUDENTS'
FROM students
GROUP BY GRADE;

-- e. AVERAGE SCORE BY GENDER
SELECT GENDER,
		AVG(MathScore) AS 'AVGMATH',
        AVG(ScienceScore) AS 'AVGSCIENCE',
        AVG(EnglishScore) AS 'AVGENGLISH'
        FROM STUDENTS
        GROUP BY GENDER;

-- f. STUDENTS WITH MARKS IN MATH > 80
SELECT * FROM students
	 WHERE MATHSCORE > 80;
     
	
-- g. Update student's grade

UPDATE Students
SET Grade = 'A'
WHERE Name = 'Rahul'; 

UPDATE STUDENTS 
SET GRADE = 'B'
WHERE STUDENTID = 1;

