select * from Departments
where dept_name is null


select * from departments
where trim(dept_name) = 'Security'

SELECT *
FROM students
WHERE TRIM(graduation_date::TEXT) = '' OR graduation_date IS NULL;

-- 18
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    dept_code VARCHAR(10)
);

INSERT INTO Department (dept_id, dept_name, dept_code) VALUES
(1, 'Computer Science', 'CS'),
(2, 'Mathematics', 'MATH'),
(3, 'Physics', 'PHYS');


CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    is_active BOOLEAN,
    dept_id INT REFERENCES Department(dept_id)
);

INSERT INTO Course (course_id, course_name, credits, is_active, dept_id) VALUES
(101, 'Introduction to Programming', 3, TRUE, 1),
(102, 'Data Structures', 4, TRUE, 1),
(103, 'Discrete Mathematics', 3, TRUE, 2),
(104, 'Quantum Mechanics', 4, FALSE, 3),
(105, 'Independent Study', 2, TRUE, NULL);


select c.course_id, c.course_name, c.credits, c.is_active, d.dept_id, d.dept_name
from Course c inner join department d on c.dept_id = d.dept_id

SELECT 
  c.course_id, 
  c.course_name, 
  c.credits, 
  c.is_active, 
  d.dept_id, 
  d.dept_name, 
  d.dept_code
FROM Course c
INNER JOIN Department d ON c.dept_id = d.dept_id;


SELECT 
  c.course_id, 
  c.course_name, 
  c.credits, 
  c.is_active, 
  d.dept_id, 
  d.dept_name, 
  d.dept_code
FROM Course c, Department d
WHERE c.dept_id = d.dept_id;

SELECT 
  c.course_name, 
  d.dept_name
FROM Course c
LEFT JOIN Department d ON c.dept_id = d.dept_id;

--19
SELECT 
    c.id AS course_id,
    c.name AS course_name,
    AVG(
        CASE 
            WHEN e.grade = 'A+' THEN 4.3
            WHEN e.grade = 'A' THEN 4.0
            WHEN e.grade = 'A-' THEN 3.7
            WHEN e.grade = 'B+' THEN 3.3
            WHEN e.grade = 'B' THEN 3.0
            WHEN e.grade = 'B-' THEN 2.7
            WHEN e.grade = 'C+' THEN 2.3
            WHEN e.grade = 'C' THEN 2.0
            WHEN e.grade = 'C-' THEN 1.7
            WHEN e.grade = 'D+' THEN 1.3
            WHEN e.grade = 'D' THEN 1.0
            WHEN e.grade = 'F' THEN 0.0
            ELSE NULL
        END
    ) / NULLIF(COUNT(e.grade), 0) AS average_grade
FROM 
    Course c
LEFT JOIN 
    Exam e ON c.id = e.course_id
GROUP BY 
    c.id, c.name
ORDER BY 
    c.id; 



SELECT 
    c.id AS course_id,
    c.name AS course_name,
    CASE 
        WHEN EXISTS (SELECT 1 FROM Exam e WHERE e.course_id = c.id) THEN
            AVG(
                CASE 
                    WHEN e.grade = 'A+' THEN 4.3
                    WHEN e.grade = 'A' THEN 4.0
                    WHEN e.grade = 'A-' THEN 3.7
                    WHEN e.grade = 'B+' THEN 3.3
                    WHEN e.grade = 'B' THEN 3.0
                    WHEN e.grade = 'B-' THEN 2.7
                    WHEN e.grade = 'C+' THEN 2.3
                    WHEN e.grade = 'C' THEN 2.0
                    WHEN e.grade = 'C-' THEN 1.7
                    WHEN e.grade = 'D+' THEN 1.3
                    WHEN e.grade = 'D' THEN 1.0
                    WHEN e.grade = 'F' THEN 0.0
                    ELSE NULL
                END
            )
        ELSE NULL
    END AS average_grade
FROM 
    Course c
LEFT JOIN 
    Exam e ON c.id = e.course_id
GROUP BY 
    c.id, c.name
ORDER BY 
    c.id; 


SELECT 
    c.id AS course_id,
    c.name AS course_name,
    COALESCE(
        AVG(
            CASE 
                WHEN e.grade = 'A+' THEN 4.3
                WHEN e.grade = 'A' THEN 4.0
                WHEN e.grade = 'A-' THEN 3.7
                WHEN e.grade = 'B+' THEN 3.3
                WHEN e.grade = 'B' THEN 3.0
                WHEN e.grade = 'B-' THEN 2.7
                WHEN e.grade = 'C+' THEN 2.3
                WHEN e.grade = 'C' THEN 2.0
                WHEN e.grade = 'C-' THEN 1.7
                WHEN e.grade = 'D+' THEN 1.3
                WHEN e.grade = 'D' THEN 1.0
                WHEN e.grade = 'F' THEN 0.0
                ELSE NULL
            END
        ),
        0
    ) AS average_grade
FROM 
    Course c
LEFT JOIN 
    Exam e ON c.id = e.course_id
GROUP BY 
    c.id, c.name
ORDER BY 
    c.id;
