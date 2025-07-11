SELECT * FROM Department
WHERE dept_code IN ('ME', 'CE');

SELECT * FROM Exam
WHERE dept_id IN (SELECT dept_id FROM Department);

SELECT * FROM Exam e
WHERE EXISTS (
    SELECT 1 FROM Department d
    WHERE d.dept_id = e.dept_id
);

--22
ELECT * FROM Product
WHERE description ~* 'Milk|Dark';  

SELECT * FROM Product
WHERE POSITION('Milk' IN description) > 0
   OR POSITION('Dark' IN description) > 0;

SELECT * FROM Product
WHERE POSITION('milk' IN LOWER(description)) > 0
   OR POSITION('dark' IN LOWER(description)) > 0;


   DELETE FROM Registration
WHERE student_id NOT IN (
    SELECT student_id FROM Students
);


--23 
SELECT 
  SUM(CASE WHEN position = 'Assistant Professor' THEN 1 ELSE 0 END) AS assistant_count,
  SUM(CASE WHEN position = 'Professor' THEN 1 ELSE 0 END) AS professor_count
FROM Faculty;

--24

DELETE FROM Student
USING Department
WHERE Student.dept_id = Department.dept_id
  AND Department.dept_name = 'Computer Science';

DELETE FROM s
USING Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Computer Science';


--25
DELETE FROM Registration r
USING Students s
WHERE r.student_id = s.student_id
  AND s.student_id IS NULL;  

DELETE FROM Registration r
WHERE NOT EXISTS (
    SELECT 1 FROM Students s WHERE s.student_id = r.student_id
);

DELETE FROM Registration
WHERE student_id NOT IN (
    SELECT student_id FROM Students
);
DO $$
DECLARE
    tbl TEXT;
BEGIN
    FOR tbl IN 
        SELECT tablename FROM pg_tables
        WHERE schemaname = 'public'
    LOOP
        EXECUTE 'DROP TABLE IF EXISTS public."' || tbl || '" CASCADE';
    END LOOP;
END$$;

--27

SELECT * FROM Product
WHERE description ~* 'Milk|Dark';  

SELECT * FROM Product
WHERE POSITION('Milk' IN description) > 0
   OR POSITION('Dark' IN description) > 0;

SELECT * FROM Product
WHERE POSITION('milk' IN LOWER(description)) > 0
   OR POSITION('dark' IN LOWER(description)) > 0;


--28 
SELECT dept_name AS name FROM Department
UNION
SELECT faculty_name AS name FROM Faculty;

SELECT dept_name AS name FROM Department
UNION ALL
SELECT faculty_name AS name FROM Faculty;
