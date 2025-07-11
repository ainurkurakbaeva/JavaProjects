CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    faculty VARCHAR(100)
);

INSERT INTO students (name) VALUES
('Roman'), ('Rinat'), ('Aliya'), ('Richard'),
('rashid'), ('Roberto'), ('Rodion'), ('Ruslan'),
('Damir'), ('rakhimjan'), ('Abdulrahman');


INSERT INTO courses (name, faculty) VALUES
('Intro to Programming', 'Computer Science'),
('Data Structures', 'Computer Science'),
('Topology and Geometry', 'Mathematics'),
('History of Art', 'Arts'),
('Foundations of Logic', 'Philosophy'),
('Robotics 101', 'Computer Science');
