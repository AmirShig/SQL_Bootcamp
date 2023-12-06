CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name, price
FROM menu
WHERE pizza_name = 'cheese pizza' AND
      pizzeria_id IN (1, 2);

-- DROP INDEX idx_menu_unique;
