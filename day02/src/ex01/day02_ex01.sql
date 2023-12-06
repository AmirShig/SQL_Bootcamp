SELECT dates::date AS missing_date
FROM
    generate_series('2022-01-01'::date, '2022-01-10'::date, interval '1 day') AS dates
    LEFT JOIN (
        SELECT *
        FROM person_visits pv
        WHERE person_id BETWEEN 1 AND 2
    ) AS po ON po.visit_date = dates
WHERE po.id IS NULL
ORDER BY missing_date
;
