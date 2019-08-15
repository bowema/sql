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

-- alternative 1
SELECT a.name
FROM lc.employee a
LEFT JOIN lc.employee b ON a.id = b.managerId
GROUP BY a.name
HAVING COUNT(b.id) >= 1;


-- alternative 2
SELECT NAME  -- join name from employee table to the manager id to get the name of manager with >= direct reports
FROM lc.employee AS t1
    JOIN
    (SELECT managerId from lc.employee
    GROUP BY 1
    HAVING COUNT(managerId)>=5) AS t2  -- t2 has managerid with >= 5 direct reports
    ON t1.Id = t2.managerId;
-- https://leetcode.com/articles/managers-with-at-least-5-direct-reports/