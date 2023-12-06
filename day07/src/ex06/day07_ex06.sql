SELECT pizzeria.name,
       COUNT(m.pizzeria_id) AS count_of_orders,
       ROUND(AVG(m.price), 2) AS average_price,
       MAX(m.price) AS max_price,
       MIN(m.price) AS min_price
FROM menu m
    JOIN person_order po ON m.id = po.menu_id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY name;
