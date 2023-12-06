SELECT person.address,
       pizzeria.name,
       COUNT(m.pizzeria_id) AS count_of_orders
FROM menu m
    JOIN person_order po ON m.id = po.menu_id
    JOIN person ON po.person_id = person.id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY address, name;