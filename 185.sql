-- 185. Department Top Three Salaries
-- -----------------------------------------------------
-- Method 1 (w/ analytics function Oracle/Postgres)
-- -----------------------------------------------------
SELECT department, name AS employee, salary
FROM 
    (SELECT employee.*, 
            DENSE_RANK() OVER (PARTITION BY employee.departmentid
                               ORDER BY employee.salary DESC) AS rank,
            department
     FROM employee
     LEFT JOIN (SELECT id as departmentid, name as department FROM department) dep
     ON employee.departmentid = dep.departmentid)

WHERE rank IN (1,2,3) AND department IS NOT NULL
ORDER BY 1;


-- -----------------------------------------------------
-- Method 2 (w/ analytics simplified Oracle solution)
-- -----------------------------------------------------
SELECT d.name department, e.name employee, e.salary
FROM
	(SELECT name, salary, departmentid, dense_rank() OVER (PARTITION BY departmentid
														   ORDER BY salary DESC) rank
	 FROM employee) e,
	department d
WHERE e.departmentid = d.id
AND e.rank IN (1,2,3) -- or t.rank <=3