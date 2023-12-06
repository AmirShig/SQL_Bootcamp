SELECT menu.pizza_name,
       menu.price,
       pizzeria.name AS pizzeria_name,
       visit_date
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
    JOIN person p on pv.person_id = p.id
WHERE menu.price BETWEEN 800 AND 1000 AND p.name = 'Kate'
ORDER BY 1,2,3;
