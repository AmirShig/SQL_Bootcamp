SELECT pizzeria.name AS pizzeria_name
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_visits pv ON menu.pizzeria_id = pv.pizzeria_id
    JOIN person ON pv.person_id = person.id
WHERE
      person.name = 'Dmitriy' AND
      visit_date = '2022-01-08' AND
      price < 800;




