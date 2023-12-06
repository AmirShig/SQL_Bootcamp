CREATE TABLE nodes (
    point1 VARCHAR,
    point2 VARCHAR,
    cost INT
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10), ('a', 'd', 20), ('a', 'c', 15),
       ('b', 'a', 10), ('b', 'd', 25), ('b', 'c', 35),
       ('d', 'a', 20), ('d', 'b', 25), ('d', 'c', 30),
       ('c', 'a', 15), ('c', 'b', 35), ('c', 'd', 30);

WITH RECURSIVE tour_path (point1, point2, cost, road, count) AS (
    SELECT point1, point2, cost,
           ARRAY[point1, point2]::VARCHAR[] AS road,
           1 AS count
    FROM nodes
    WHERE point1 = 'a'

        UNION ALL

    SELECT n.point1,
           n.point2,
           tt.cost + n.cost,
           CASE
               WHEN tt.count < 3 THEN tt.road || n.point2::VARCHAR
               ELSE tt.road || 'a'::VARCHAR
           END,
           tt.count + 1
    FROM tour_path tt
        JOIN nodes n ON n.point1 = tt.point2
    WHERE (NOT n.point2 = ANY(tt.road)) OR (tt.count = 3 AND n.point2 = 'a')
)
SELECT cost AS total_cost,
       road AS tour
FROM tour_path,
     (SELECT min(cost) AS price FROM tour_path
     WHERE array_length(road, 1) = 5) AS cheaper
WHERE cost = cheaper.price AND array_length(road, 1) = 5
ORDER BY total_cost, tour;