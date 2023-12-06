WITH orders AS (
    SELECT pizzeria.name,
           COUNT(m.pizzeria_id) AS count
    FROM menu m
        JOIN person_order po ON m.id = po.menu_id
        JOIN pizzeria ON m.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
), visits AS (
    SELECT pizzeria.name,
           COUNT(pizzeria_id) AS count
    FROM person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
)
SELECT visits.name,
       COALESCE(orders.count, 0) + COALESCE(visits.count, 0) AS total_count
FROM orders
    FULL JOIN visits ON orders.name = visits.name
ORDER BY total_count DESC, name;
