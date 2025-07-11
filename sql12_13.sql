--12-13-14
select count(*) as totalstudents
from students

alter table students
add column location varchar

update students
set location = 'Shym' where id in (2, 4, 8)

select location, Count(*) as studentsAlmaty
from students
group by location
having location = 'Almaty';

select * from students

select name, Count(*) as count 
from students
group by name 
having count(*) > 1;

select faculty_id, name, location, count(*)
from students
group by faculty_id, name, location
having count(*) > 1	


select name, gpa, location, count(*)
from students
Group by name, gpa, location
Having count(*) > 1

-- 14 query
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    emp_id INT,
    amount NUMERIC(10, 2),
    pay_date DATE,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO Employees (emp_id, first_name, last_name, dept_id) VALUES
(101, 'Ainur', 'Kurakbaeva', 1),
(102, 'Aliya', 'Omarova', 2),
(103, 'Rinat', 'Nazarov', 3);

INSERT INTO Salaries (salary_id, emp_id, amount, pay_date) VALUES
(1, 101, 500000.00, '2025-06-01'),
(2, 102, 400000.00, '2025-06-01'),
(3, 103, 600000.00, '2025-06-01');

select e.emp_id, e.first_name, e.last_name, d.dept_id, s.amount, s.pay_date
from Employees e join Salaries s on s.emp_id = e.emp_id
join Departments d on d.dept_id = e.dept_id;

SELECT 
    emp_dept.first_name,
    emp_dept.last_name,
    emp_dept.dept_name,
    s.amount,
    s.pay_date
FROM (
    SELECT 
        e.emp_id,
        e.first_name,
        e.last_name,
        d.dept_name
    FROM Employees e
    INNER JOIN Departments d ON e.dept_id = d.dept_id
) AS emp_dept
INNER JOIN Salaries s ON emp_dept.emp_id = s.emp_id;

 --15 query
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE';

-- 16 query

select * from students
where score  in (76, 90)