 CREATE DATABASE AMBROSE_ALLI_UNIVERSITY
CREATE TABLE FACULTY(
    faculty_id  SERIAL PRIMARY KEY,
    faculty_name VARCHAR(200) NOT NULL
);
--SCHOOL SESSION TABLE 
CREATE TABLE SCHOOL_SESSION(
    session_id SERIAL PRIMARY KEY,
    session_name INTEGER NOT NULL UNIQUE,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id)
);
--DEPARTMENT TABLE,NB:The 'ON DELETE CASCADE' clause ensures that when a faculty is deleted, all associated departments will also be automatically deleted, maintaining referential integrity in the database.
CREATE TABLE DEPARTMENT
(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(200) NOT NULL UNIQUE,
    session_id INT,
    FOREIGN KEY (session_id) REFERENCES SCHOOL_SESSION(session_id) ON DELETE CASCADE
);

--ATTENDANCE TABLE
CREATE TABLE ATTENDANCE
(
    attendance_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    department_id INT NOT NULL,
    date_of_attendance DATE NOT NULL DEFAULT CURRENT_DATE CHECK (date_of_attendance <= CURRENT_DATE),
    attendance_status BOOLEAN NOT NULL, 
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
);
