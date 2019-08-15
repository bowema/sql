-- CREATE TABLE lc.customer (
--     id  INT,
--     name VARCHAR,
--     referee_id INT
-- );

-- INSERT INTO lc.customer VALUES (1, 'Will', null);
-- INSERT INTO lc.customer VALUES (2, 'Jane', null);
-- INSERT INTO lc.customer VALUES (3, 'Alex', 2);
-- INSERT INTO lc.customer VALUES (4, 'Bill', Null);
-- INSERT INTO lc.customer VALUES (5, 'Zack', 1);
-- INSERT INTO lc.customer VALUES (6, 'Mark', 2);

-- SELECT * FROM lc.customer;


-- NOTE: !!! INCORRECT!!!
-- SELECT name 
-- FROM customer
-- WHERE referee_id != 2;

SELECT *
FROM lc.customer 
WHERE referee_id != 2 OR referee_id IS NULL;

--Algorithm
-- MySQL uses three-valued logic -- TRUE, FALSE and UNKNOWN. Anything compared to NULL evaluates to the third value: UNKNOWN. That “anything” includes NULL itself! That’s why MySQL provides the IS NULL and IS NOT NULL operators to specifically check for NULL.
-- Thus, one more condition 'referee_id IS NULL' should be added to the WHERE clause as below.