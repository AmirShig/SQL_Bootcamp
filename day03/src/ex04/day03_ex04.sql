-- Находим названия пиццерий, где заказывали
-- только женщины с помощью EXCEPT
(SELECT pizzeria.name AS pizzeia_name
FROM person
    JOIN person_order po on person.id = po.person_id
    JOIN menu m on po.menu_id = m.id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE gender = 'female'
    EXCEPT
SELECT pizzeria.name AS pizzeia_name
FROM person
    JOIN person_order po on person.id = po.person_id
    JOIN menu m on po.menu_id = m.id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE gender = 'male')
    UNION
-- По аналогии с первой частью запроса находим
-- пиццерии, где заказывали только мужчины.
-- Выполняем UNION для объединения этих таблиц без дубликатов
(SELECT pizzeria.name AS pizzeia_name
FROM person
    JOIN person_order po on person.id = po.person_id
    JOIN menu m on po.menu_id = m.id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE gender = 'male'
    EXCEPT
SELECT pizzeria.name AS pizzeia_name
FROM person
    JOIN person_order po on person.id = po.person_id
    JOIN menu m on po.menu_id = m.id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE gender = 'female')
ORDER BY 1;