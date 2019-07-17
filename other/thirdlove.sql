-- create table
-- CREATE TABLE fb.customer (
--     customer_id     VARCHAR,
--     email           VARCHAR
-- );

-- INSERT INTO fb.customer VALUES ('a', 'a@gmail.com');
-- INSERT INTO fb.customer VALUES ('b', 'b@gmail.com');
-- INSERT INTO fb.customer VALUES ('c', 'c@gmail.com');

-- CREATE TABLE fb.order (
--     order_id      VARCHAR,
--     customer_id   VARCHAR
-- );

-- INSERT INTO fb.order VALUES ('1', 'a');
-- INSERT INTO fb.order VALUES ('2', 'b');
-- INSERT INTO fb.order VALUES ('3', 'a');

-- Method 1 - using join
SELECT SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS count_cust
FROM fb.customer c
LEFT JOIN fb.order o
ON c.customer_id = o.customer_id;

-- Method 2 -- using subquesry
SELECT COUNT(customer_id)
FROM fb.customer
WHERE customer_id NOT IN
    (SELECT customer_id
     FROM fb.order);

-- Method 3 -- directly subtract
SELECT COUNT(DISTINCT c.customer_id) - COUNT(DISTINCT o.customer_id) AS num_cust
FROM fb.customer c, fb.order o;