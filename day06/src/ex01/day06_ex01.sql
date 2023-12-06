WITH amount_of_orders AS (
    SELECT po.person_id,
           m.pizzeria_id,
           COUNT(po.person_id) AS orders_count
    FROM person_order po
        JOIN menu m ON po.menu_id = m.id
    GROUP BY po.person_id, m.pizzeria_id
)
INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT
       ROW_NUMBER() OVER () AS id,
       ao.person_id,
       ao.pizzeria_id,
       CASE
           WHEN ao.orders_count = 1 THEN 10.5
           WHEN ao.orders_count = 2 THEN 22
           ELSE 30
       END AS discount
FROM amount_of_orders ao;
