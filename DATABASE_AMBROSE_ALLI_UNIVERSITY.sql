CREATE DATABASE AMBROSE_ALLI_UNIVERSITY
CREATE TABLE FACULTY(
    faculty_id  SERIAL PRIMARY KEY,
    faculty_name VARCHAR(200) NOT NULL
);


CREATE TABLE DEPARTMENT(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(200) NOT NULL UNIQUE,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id)
);
CREATE TABLE MLS_MMB_DEPARTMENT(
    serial_number SERIAL PRIMARY KEY,
    student_mat_number VARCHAR(25) UNIQUE,
    course_code VARCHAR(10),
    date_of_attendance DATE NOT NULL DEFAULT CURRENT_DATE CHECK (date_of_attendance <= CURRENT_DATE),
    attendance_status BOOLEAN, 
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
);
