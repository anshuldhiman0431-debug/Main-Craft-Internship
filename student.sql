SELECT * FROM studentmanagement.students;

-- 1. Top Student Per Course
SELECT course_name,
       student_name,
       grade
FROM
(
    SELECT c.name AS course_name,
           s.name AS student_name,
           e.grade,
           RANK() OVER(PARTITION BY c.id ORDER BY e.grade DESC) AS rnk
    FROM enrollments e
    JOIN students s
        ON e.student_id = s.id
    JOIN courses c
        ON e.course_id = c.id
) t
WHERE rnk = 1;

-- 2. Pass Rate Per Course (Grade ≥ 40)
SELECT
    c.name AS course_name,
    COUNT(*) AS total_students,
    SUM(CASE
            WHEN e.grade >= 40 THEN 1
            ELSE 0
        END) AS passed_students,
    ROUND(
        SUM(CASE
                WHEN e.grade >=40 THEN 1
                ELSE 0
            END)*100.0/COUNT(*),
        2
    ) AS pass_rate
FROM enrollments e
JOIN courses c
ON e.course_id=c.id
GROUP BY c.id,c.name;

-- 3. Overall Topper Across All Courses
SELECT
    s.id,
    s.name,
    SUM(e.grade) AS total_marks
FROM students s
JOIN enrollments e
ON s.id=e.student_id
GROUP BY s.id,s.name
ORDER BY total_marks DESC
LIMIT 1;

-- 4. Students Enrolled in Multiple Courses
SELECT
    s.id,
    s.name,
    COUNT(e.course_id) AS total_courses
FROM students s
JOIN enrollments e
ON s.id=e.student_id
GROUP BY s.id,s.name
HAVING COUNT(e.course_id)>1;

-- 5. Use JOIN + GROUP BY + HAVING Together

SELECT
    c.name AS course_name,
    COUNT(e.student_id) AS total_students,
    AVG(e.grade) AS average_grade
FROM courses c
JOIN enrollments e
ON c.id=e.course_id
GROUP BY c.id,c.name
HAVING AVG(e.grade)>60;






