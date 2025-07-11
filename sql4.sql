select * from students
where name like 'R%';

SELECT * FROM students
WHERE LENGTH(name) = 9;

-- 2
select * from students
where name ~ '^R'

select * from students
where name ~* '^r'

select * from courses 
where faculty = 'Computer Science' and name like '%to&';

select * from students
where position('R' in name) = 1;

select distinct faculty from courses 
where faculty !~* '[aeiou]';