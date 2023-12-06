INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    g + (SELECT max(id) FROM person_order) AS id,
    id AS person_id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
    '2022-02-25' AS order_date
FROM
    person
INNER JOIN
    generate_series(1, (SELECT count(*) FROM person)) AS g ON g = person.id;

WITH gen_id AS (
    SELECT generate_series(1, (SELECT count(*) FROM person))
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    generate_series(
        (SELECT COALESCE(MAX(id), 0) + 1 FROM person_order),
        (SELECT COALESCE(MAX(id), 0) + (SELECT count(*) FROM person) FROM person_order)
    ) AS id,
    (SELECT id FROM person) AS person_id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
    '2022-02-25' AS order_date
-- FROM
    ;

SELECT id
FROM generate_series(
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_order),
    (SELECT COALESCE(MAX(id), 0) + (SELECT count(*) FROM person) FROM person_order)
) AS id
WHERE id IN (SELECT id FROM person_order);