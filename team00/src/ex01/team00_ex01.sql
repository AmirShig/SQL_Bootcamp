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
     WHERE array_length(road, 1) = 5) AS cheaper,
     (SELECT max(cost) AS price FROM tour_path
     WHERE array_length(road, 1) = 5) AS most_expensive
WHERE array_length(road, 1) = 5 AND
      (cost = cheaper.price OR
       cost = most_expensive.price)
ORDER BY total_cost, tour;