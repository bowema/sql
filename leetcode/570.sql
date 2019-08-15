-- CREATE TABLE lc.employee (
--     id  INT
--     , name VARCHAR
--     , department VARCHAR
--     , managerId INT
-- );

-- INSERT INTO lc.employee VALUES (101, 'John', 'A', null );
-- INSERT INTO lc.employee VALUES (102, 'Dan', 'A', 101);
-- INSERT INTO lc.employee VALUES (103, 'James', 'A', 101);
-- INSERT INTO lc.employee VALUES (104, 'Amy', 'A', 101);
-- INSERT INTO lc.employee VALUES (105, 'Anne', 'A', 101);
-- INSERT INTO lc.employee VALUES (106, 'Ron', 'B', 101);


SELECT a.name
FROM lc.employee a
LEFT JOIN lc.employee b ON a.id = b.managerId
GROUP BY a.name
HAVING COUNT(b.id) >= 1;