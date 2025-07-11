CREATE TABLE students_backup AS TABLE students;

alter table students_backup
drop column faculty_id,
drop column score;