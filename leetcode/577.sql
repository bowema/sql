-- CREATE TABLE lc.employee_577 (
--     empId   INT,
--     name    VARCHAR,
--     supervisor INT,
--     salary  INT
-- );

-- CREATE TABLE lc.bonus (
--     empId   INT,
--     bonus   INT
-- );

-- INSERT INTO lc.employee_577 VALUES (1, 'John', 3, 1000);
-- INSERT INTO lc.employee_577 VALUES (2, 'Dan', 3, 2000);
-- INSERT INTO lc.employee_577 VALUES (3, 'Brad', null, 4000);
-- INSERT INTO lc.employee_577 VALUES (4, 'Thomas', 3, 4000);

-- INSERT INTO lc.bonus VALUES (2, 500);
-- INSERT INTO lc.bonus VALUES (4, 2000);

-- SELECT * FROM lc.employee_577;
-- SELECT * FROM lc.bonus;

SELECT name, bonus
FROM lc.employee_577
LEFT JOIN lc.bonus USING (empId)
WHERE bonus < 1000 OR bonus IS NULL;  -- note the result wants null so here need to include OR IS NULL in the condition