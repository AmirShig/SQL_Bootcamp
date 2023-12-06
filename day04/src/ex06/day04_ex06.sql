CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name
FROM pizzeria
    JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
    JOIN menu m ON pizzeria.id = m.pizzeria_id
    JOIN person ON pv.person_id = person.id
WHERE pv.visit_date = '2022-01-08' AND
      m.price < 800 AND
      person.name = 'Dmitriy';

