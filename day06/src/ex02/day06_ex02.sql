SELECT
    person.name,
    m.pizza_name,
    m.price,
    m.price * (100 - pd.discount) / 100 AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu m ON person_order.menu_id = m.id
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
    JOIN person_discounts pd on person.id = pd.person_id AND
                                m.pizzeria_id = pd.pizzeria_id
ORDER BY 1, 2;