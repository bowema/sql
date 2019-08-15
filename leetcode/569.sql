-- CREATE TABLE lc.employee_569 (
--     id  INT
--     , company VARCHAR
--     , salary INT
-- );

-- INSERT INTO lc.employee_569 VALUES (1, 'A', 2341);
-- INSERT INTO lc.employee_569 VALUES (2, 'A', 234);
-- INSERT INTO lc.employee_569 VALUES (3, 'A', 15);
-- INSERT INTO lc.employee_569 VALUES (4, 'A', 15314);
-- INSERT INTO lc.employee_569 VALUES (5, 'A', 451);
-- INSERT INTO lc.employee_569 VALUES (6, 'A', 513);
-- INSERT INTO lc.employee_569 VALUES (7, 'B', 15);
-- INSERT INTO lc.employee_569 VALUES (8, 'B', 13);
-- INSERT INTO lc.employee_569 VALUES (9, 'B', 1154);
-- INSERT INTO lc.employee_569 VALUES (10, 'B', 1345);
-- INSERT INTO lc.employee_569 VALUES (11, 'B', 1221);
-- INSERT INTO lc.employee_569 VALUES (12, 'B', 234);
-- INSERT INTO lc.employee_569 VALUES (13, 'C',2345);
-- INSERT INTO lc.employee_569 VALUES (14, 'C', 2645);
-- INSERT INTO lc.employee_569 VALUES (15, 'C', 2645);
-- INSERT INTO lc.employee_569 VALUES (16, 'C', 2652);
-- INSERT INTO lc.employee_569 VALUES (17, 'C', 65);

SELECT employee.id, employee.company, employee.salary
FROM 
    lc.employee_569 employee,
    lc.employee_569 AS alias
WHERE
    employee.company = alias.company
GROUP BY 1, 2, 3
HAVING SUM(CASE WHEN employee.salary = alias.salary THEN 1 ELSE 0 END)
       >= ABS(SUM(SIGN(employee.salary - alias.salary)))
ORDER BY employee.id;

-- some issue
--https://leetcode.com/articles/median-employee-salary/?page=3