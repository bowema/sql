-- 183. Customers Who Never Order

SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN 
    (SELECT DISTINCT CustomerId FROM Orders);