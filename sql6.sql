select * from students

alter table students
add column gpa numeric(3,2)

alter table students add column graduation_date DATE;

CREATE OR REPLACE PROCEDURE updateStudentGpa(stud_id INT, new_gpa NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE students
    SET gpa = new_gpa
    WHERE id = stud_id;
END;
$$;

call UpdateStudentGPA(1, 4.0);
call UpdateStudentGPA(10, 3.88);

update students 
set graduation_date = '2025-07-04'
where id in (1, 4, 11, 5);

create or replace view studentGradGpa as select * from students 
where graduation_date is not null

SELECT * FROM studentGradGpa;
