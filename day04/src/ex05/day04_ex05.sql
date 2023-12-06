CREATE VIEW v_price_with_discount AS
(SELECT
    person.name AS person_name,
    menu.pizza_name,
    price,
    CAST(ROUND(price - (price * 0.1)) AS INT) AS discount_price
FROM menu
    JOIN person_order po ON menu.id = po.menu_id
    JOIN person ON po.person_id = person.id
ORDER BY person_name, pizza_name);