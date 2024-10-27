-- Active: 1729942382435@@127.0.0.1@5432@postgres


-- Create a "students" table with the following fields:
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    email VARCHAR(100),
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
INSERT INTO students(student_name, age,email, frontend_mark, backend_mark, status) VALUES 
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23,'zoya@example.com', 52, 58, NULL),
('Nabil', 22,'nabil@example.com', 37, 46, NULL),
('Rafi', 24,'rafi@example.com', 41, 40, NULL),
('Sophia', 21,'sophia@example.com', 50, 52, NULL),
('Hasan', 21,'hasan@gmail.com', 43, 39, NULL);

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
INSERT INTO students(student_name, age, email, frontend_mark, backend_mark, status) 
VALUES ('Md Oli Ullah', 31, 'oli1412001@gmail.com', 50, 55, NULL);

--Retrieve the names of all students who are enrolled in the course titled 'Next.js'
SELECT student_name FROM students
JOIN enrollment ON students.student_id = enrollment.student_id
JOIN courses ON enrollment.course_id = courses.course_id
WHERE courses.course_name = 'Next.js' 

-- Update the status of the student with the highest total (`frontend_mark + backend_mark`) to 'Awarded'
SELECT MAX(frontend_mark + backend_mark) FROM students;
UPDATE students
SET status = 'Awarded'
WHERE(frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark) FROM students
);

-- Delete all courses that have no students enrolled.
SELECT DISTINCT course_id FROM enrollment;
DELETE FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollment);

--Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name 
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;

-- Retrieve the course names and the number of students enrolled in each course.


-- Calculate and display the average age of all students.
SELECT AVG(age) AS average_age
FROM students;

-- Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name FROM students WHERE email LIKE '%example.com';

 


