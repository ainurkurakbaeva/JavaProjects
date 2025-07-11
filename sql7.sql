create or replace procedure CalculateAvgGPA()

select * from students

alter table students
add column faculty_id int

create or replace procedure CalculateAvgGPA(fac_id int,out avg_gpa numeric)
language plpgsql
as $$
begin 
select avg(gpa) into avg_gpa from students
where faculty_id = fac_id;
end;
$$;

call CalculateAvgGPA(1, null);

alter table students
add column letter_grade char(1);
alter table students
add column score int;

update students
set score = 85 where id in (3);

create or replace procedure AssignLetterGrade(score int, out grade char)
language plpgsql
as $$
begin
if score >= 90 then grade := 'A';
elsif score >= 80 then grade := 'B';
elsif score >= 70 then grade := 'C';
elsif score >= 60 then grade := 'D';
else grade:= 'F';
end if;
end;
$$;

create or replace procedure IncrementAndReturn(inout score int)
language plpgsql
as $$
begin
score := score + 1;
end;
$$;