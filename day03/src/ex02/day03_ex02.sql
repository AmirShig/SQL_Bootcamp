SELECT menu.pizza_name,
       price,
       p.name
FROM menu JOIN
    pizzeria p on menu.pizzeria_id = p.id
WHERE menu.id NOT IN
      (SELECT menu_id FROM person_order)
ORDER BY pizza_name, price;