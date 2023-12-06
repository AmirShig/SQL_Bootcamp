-- Находим пиццерию, которая удовлетворяет условиям задания 06
-- При этом, имеет отличное название от пиццериии, полученной в 06 задании
-- Для того, чтобы получить одну пиццерию, используем LIMIT 1
WITH ex_06_conditions AS (
    SELECT pizzeria.id
    FROM pizzeria
        JOIN menu m ON pizzeria.id = m.pizzeria_id
    WHERE name != 'Papa Johns' AND m.price < 800
)
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(id) FROM person_visits) + 1,
       (SELECT id FROM person WHERE name = 'Dmitriy'),
       (SELECT id FROM ex_06_conditions LIMIT 1),
       '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;