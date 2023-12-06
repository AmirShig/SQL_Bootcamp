SELECT menu.pizza_name,
       pizzeria.name AS pizzeria_name,
       menu.price
FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY pizza_name, pizzeria_name;