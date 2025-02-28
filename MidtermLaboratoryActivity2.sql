-- Create students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    major VARCHAR(50)
);

-- Create courses table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

-- Set default value for credits column
ALTER TABLE courses
ALTER COLUMN credits SET DEFAULT 3;

-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

-- Insert data into students table
INSERT INTO students(first_name, last_name, date_of_birth, major)
VALUES ('Neil Jay', 'Lacandazo', '2004-10-20', 'Computer Engineering'),
       ('Joliza Khey', 'Gonzales', '2005-08-15', 'Architecture'),
       ('Jasmin', 'Pille', '2005-10-15', 'Information Systems'),
       ('Ma. Jenifer', 'Labag', '2004-11-04', 'Information Systems'),
       ('Abegail', 'Zabala', '2002-05-02', 'Computer Science');

-- Insert data into courses table
INSERT INTO courses(course_name, credits)
VALUES ('Information Management', 3),  
       ('System Analysis and Design', 3),  
       ('Computer Programming 2', 3),
       ('Data Structures and Algorithms', 3),
       ('Fundamentals of Database Systems', 3);

-- Insert data into enrollments table
INSERT INTO enrollments(student_id, course_id, enrollment_date)
VALUES (1, 1, '2025-08-22'),
       (1, 2, '2025-08-22'),
       (2, 3, '2025-08-22'),
       (2, 4, '2025-08-22'),
       (3, 5, '2025-08-22'),
       (3, 1, '2025-08-22'),
       (4, 2, '2025-08-22'),
       (4, 3, '2025-08-22'),
       (5, 4, '2025-08-22'),
       (5, 5, '2025-08-22');

-- Retrieve data from tables
SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollments;

-- Retrieve data from tables with specific conditions
SELECT * FROM students
WHERE major = 'Computer Science';

-- Update and delete data
UPDATE students
SET major = 'Information Systems'
WHERE student_id = 1;

UPDATE enrollments
SET course_id = 6
WHERE enrollment_id = 3;

UPDATE enrollments
SET course_id = 6
WHERE enrollment_id = 8;

DELETE FROM courses
WHERE course_id = 7;

-- Insert additional data into courses table
INSERT INTO courses(course_name, credits)
VALUES ('Computer Programming 2', 3);

INSERT INTO courses(course_name, credits)
VALUES ('Computer Programming 1', 3);