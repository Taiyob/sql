-- Active: 1729931588244@@127.0.0.1@5432@university_db


-- Create a "students" table with the following fields:
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(50)
);

-- Create a "courses" table with the following fields:
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

-- Create an "enrollment" table with the following fields:
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
);

-- add a column email in students table
ALTER TABLE students
ADD COLUMN email VARCHAR(100);



-- Insert the following sample data into the "students" table:
INSERT INTO students(student_name, age, frontend_mark, backend_mark, status, email) VALUES 
('Sameer', 21, 48, 60, NULL, 'sameer@example.com'),
('Zoya', 23, 52, 58, NULL, 'zoya@example.com'),
('Nabil', 22, 37, 46, NULL, 'nabil@example.com'),
('Rafi', 24, 41, 40, NULL, 'rafi@example.com'),
('Sophia', 21, 50, 52, NULL, 'sophia@example.com'),
('Hasan', 21, 43, 39, NULL, 'hasan@gmail.com');

-- Insert the following sample data into the "courses" table:
INSERT INTO courses(course_name, credits) VALUES 
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

-- Insert the following sample data into the "enrollment" table:
INSERT INTO enrollment(student_id, course_id) VALUES
(1,1),
(1,2),
(2,1),
(3,2);

-- Insert a new student record with the following details:
INSERT INTO students(student_name AS Name, age AS Age, frontend_mark AS Frontend-Mark, backend_mark AS Backend-Mark, status AS Status, email AS Email) VALUES
('Md Oli Ullah', 31, 50, 55, NULL, 'oli1412001@gmail.com');