WITH orders AS (
    SELECT name, gender, m.pizza_name
    FROM person
    JOIN person_order p ON person.id = p.person_id
    JOIN menu m ON m.id = p.menu_id
    WHERE gender = 'female'
)
SELECT name
FROM orders
WHERE pizza_name = 'pepperoni pizza'
INTERSECT
SELECT name
FROM orders
WHERE pizza_name = 'cheese pizza'
ORDER BY name;
