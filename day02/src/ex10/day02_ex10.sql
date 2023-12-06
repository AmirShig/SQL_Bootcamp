SELECT per1.name AS person_name1,
       per2.name AS person_name2,
       per1.address AS common_address
FROM person per1
    JOIN person per2 ON
        per1.address = per2.address AND
        per1.id > per2.id
WHERE per1.name != per2.name
ORDER BY 1, 2, 3;
