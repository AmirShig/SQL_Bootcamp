INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT 19, id, 'greek pizza', 800
FROM pizzeria
WHERE name = 'Dominos';