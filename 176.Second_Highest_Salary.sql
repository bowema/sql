
-- 176. Second Highest Salary
-- -----------------------------------------------------
-- Method 1 (MySQL w/o analytics function)
-- -----------------------------------------------------
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);


-- -----------------------------------------------------
-- Method 2 (with analytics function - works for both Postgres and Oracle)
-- -----------------------------------------------------
SELECT MAX(Salary) AS SecondHighestSalary
FROM (
    SELECT DISTINCT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rank
    FROM Employee
    ) t
WHERE rank = 2;

