create table departments (
id Serial primary key ,
name varchar(100),
info JSONB
);

insert into departments (name, info) values 
('Computer Science', '{
    "head": "Dr. Smith",
    "location": "Building A",
    "courses": ["CS101", "CS102", "CS201"]
}'), 
('Mathematics', '{
    "head": "Dr. Taylor",
    "location": "Building B",
    "courses": ["MATH101", "MATH202"]
}');

select name,
info ->> 'location' as location_of_dep,
info ->> 'courses' as courses_of_dep
from departments;

update departments 
set info = jsonb_set(info, '{head}', '"Dr. Myrzaliyev"')
where name = 'Computer Science'

UPDATE departments
SET info = jsonb_set(info, '{dean}', '"Prof. Kelly"')
where name = 'Mathematics';

update departments
set info = info - 'courses'
where name = 'Mathematics'

update departments
set info = jsonb_set(info, '{courses}',
(info -> 'courses') || '"CS322"'::jsonb
)
where name = 'Computer Science';

select * from departments