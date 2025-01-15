-- Exercise 1
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    topic TEXT NOT NULL,
    hours INTEGER
);

CREATE TABLE grades (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    grade INTEGER NOT NULL,
    PRIMARY KEY (course_id, student_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Exercise 2
INSERT INTO courses (topic, hours) VALUES ('Math', 10);
INSERT INTO courses (topic, hours) VALUES ('Computer Science', 12);
INSERT INTO courses (topic, hours) VALUES ('Physics', 10);

INSERT INTO students (name, email) VALUES ('Alice', 'alice@gmail.com');
INSERT INTO students (name, email) VALUES ('Bob', 'bob@gmail.com');
INSERT INTO students (name, email) VALUES ('Charlie', 'charlie@gmail.com');

INSERT INTO grades (student_id, course_id, grade) VALUES (1, 1, 90);
INSERT INTO grades (student_id, course_id, grade) VALUES (1, 2, 87);
INSERT INTO grades (student_id, course_id, grade) VALUES (1, 3, 90);
INSERT INTO grades (student_id, course_id, grade) VALUES (2, 1, 94);
INSERT INTO grades (student_id, course_id, grade) VALUES (2, 2, 85);
INSERT INTO grades (student_id, course_id, grade) VALUES (2, 3, 98);
INSERT INTO grades (student_id, course_id, grade) VALUES (3, 1, 78);
INSERT INTO grades (student_id, course_id, grade) VALUES (3, 2, 86);
INSERT INTO grades (student_id, course_id, grade) VALUES (3, 3, 91);

-- Exercise 3
SELECT courses.topic AS course, printf('%.2f', AVG(grades.grade)) AS AVG
FROM grades
JOIN courses ON grades.course_id = courses.course_id
GROUP BY grades.course_id;
