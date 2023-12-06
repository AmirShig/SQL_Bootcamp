WITH Ordered AS (
    SELECT person.gender AS visitor_gender,
           pz.name AS pizzeria_name
    FROM person
        JOIN person_visits pv on person.id = pv.person_id
        JOIN pizzeria pz on pv.pizzeria_id = pz.id
)
-- Получаем уникальные пиццерии, которые посещали ТОЛЬКО женщины
-- С помощью EXCEPT ALL исключаются пиццерии, посещенные мужчинами
(SELECT Ordered.pizzeria_name
FROM Ordered
WHERE visitor_gender = 'female'
    EXCEPT ALL
SELECT Ordered.pizzeria_name
FROM Ordered
WHERE visitor_gender = 'male')
    UNION ALL
-- Получаем уникальные пиццериии, которые посещали ТОЛЬКО мужчины
-- По аналогии с первой частью UNION
(SELECT Ordered.pizzeria_name
FROM Ordered
WHERE visitor_gender = 'male'
    EXCEPT ALL
SELECT Ordered.pizzeria_name
FROM Ordered
WHERE visitor_gender = 'female')
ORDER BY 1;