select name, graduation_date, AVG(gpa) as average
from students 
group by name, graduation_date
having AVG(gpa) > 4.0

select id, name, gpa from students
where gpa > 3.5