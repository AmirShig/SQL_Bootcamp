WITH orders AS (
    SELECT pizzeria.name,
           COUNT(m.pizzeria_id) AS count,
           'order' AS action_type
    FROM menu m
        JOIN person_order po ON m.id = po.menu_id
        JOIN pizzeria ON m.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    LIMIT 3
), visits AS (
    SELECT p.name,
           COUNT(pizzeria_id) AS count,
           'visit' AS action_type
    FROM person_visits
        JOIN pizzeria p ON person_visits.pizzeria_id = p.id
    GROUP BY p.name
    LIMIT 3
)
SELECT * FROM orders
    UNION ALL
SELECT * FROM visits
ORDER BY action_type, count DESC;