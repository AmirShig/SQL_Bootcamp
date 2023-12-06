WITH PersonVisits AS (
    SELECT *
    FROM person_visits pv
    WHERE person_id BETWEEN 1 AND 2
), Dates AS (
    SELECT dates::date
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates
)
SELECT dates::date AS missing_date
FROM PersonVisits AS po RIGHT JOIN Dates ON po.visit_date = Dates
WHERE po.id IS NULL
ORDER BY missing_date
;