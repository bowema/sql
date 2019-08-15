-- CREATE TABLE lc.student(
--     student_id  Integer,
--     student_name    VARCHAR,
--     gender  Character,
--     dept_id Integer
-- );

-- CREATE TABLE lc.department (
--     dept_id Integer,
--     dept_name   VARCHAR
-- );

-- INSERT INTO lc.student VALUES (1, 'Jack', 'M', 1);
-- INSERT INTO lc.student VALUES (2, 'Jane', 'F', 1);
-- INSERT INTO lc.student VALUES (3, 'Mark', 'M', 2);

-- INSERT INTO lc.department VALUES (1, 'Engineering');
-- INSERT INTO lc.department VALUES (2, 'Science');
-- INSERT INTO lc.department VALUES (3, 'Law');

-- SELECT * FROM lc.student;
-- SELECT * FROM lc.department;

SELECT dept_name, COUNT(student_id) AS student_number 
FROM lc.department
LEFT JOIN lc.student USING (dept_id)
GROUP BY 1
ORDER BY 2 DESC, 1;		-- note can order by number indicating col directly 
