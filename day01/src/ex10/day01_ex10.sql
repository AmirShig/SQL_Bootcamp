SELECT person.name AS person_name,
       menu.pizza_name AS pizza_name,
       pizzeria.name AS pizzeria_name
FROM person
JOIN person_order po ON person.id = po.person_id
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY
    person_name,
    pizza_name,
    pizzeria_name;
