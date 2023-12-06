-- Находим пиццерии, которые посетил Андрей в первой части запроса
-- Во второй части находим пиццерии, где Андрей заказал
-- С помощью EXCEPT отметаем пиццерии, полученные во второй части запроса
SELECT pizzeria.name
FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey'
EXCEPT
SELECT pizzeria.name
FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person_order.person_id = person.id
WHERE person.name = 'Andrey'
ORDER BY 1
