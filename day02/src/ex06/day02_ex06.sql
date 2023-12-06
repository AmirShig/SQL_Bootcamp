SELECT menu.pizza_name,
       pz.name
FROM person_order po
    JOIN menu on po.menu_id = menu.id
    JOIN person on po.person_id = person.id
    JOIN pizzeria pz on menu.pizzeria_id = pz.id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY 1, 2;