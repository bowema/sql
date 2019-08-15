-- CREATE table lc.candidate (
--     id INT,
--     name VARCHAR
-- );

-- CREATE TABLE lc.vote (
--     id INT,
--     candidateId INT
-- );

-- INSERT INTO lc.candidate VALUES (1, 'A');
-- INSERT INTO lc.candidate VALUES (2, 'B');
-- INSERT INTO lc.candidate VALUES (3, 'C');
-- INSERT INTO lc.candidate VALUES (4, 'D');
-- INSERT INTO lc.candidate VALUES (5, 'E');

-- INSERT INTO lc.vote VALUES (1, 2);
-- INSERT INTO lc.vote VALUES (2, 4);
-- INSERT INTO lc.vote VALUES (3, 3);
-- INSERT INTO lc.vote VALUES (4, 2);
-- INSERT INTO lc.vote VALUES (5, 5);

-- SELECT * FROM lc.candidate;
-- SELECT * FROM lc.vote;


-- alternative 1
SELECT name
FROM lc.candidate c
LEFT JOIN lc.vote v
ON c.id = v.candidateId
GROUP BY 1
ORDER BY COUNT(v.id) DESC
LIMIT 1;


-- alternative 2
SELECT name
FROM 
    lc.candidate as candidate
    JOIN
    (SELECT candidateId
    FROM
        lc.vote
    GROUP BY 1
    ORDER BY COUNT(*) DESC
    LIMIT 1) AS winner
    ON candidate.id = winner.candidateid;