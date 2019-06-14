
-- 176. Second Highest Salary
-- -----------------------------------------------------
-- Method 1 (MySQL w/o analytics function)
-- -----------------------------------------------------
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);


-- -----------------------------------------------------
-- Method 2 (Postgres with analytics function)
-- -----------------------------------------------------
SELECT salary AS SecondHighestSalary
FROM 
    (SELECT salary, ROW_NUMBER() OVER(ORDER BY Salary DESC) AS rank
     FROM fb.Employee) AS t
WHERE rank=2;