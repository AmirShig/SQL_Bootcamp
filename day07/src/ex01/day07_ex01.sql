WITH visits AS (
    SELECT person_id,
           COUNT(pizzeria_id) AS count
    FROM person_visits
    GROUP BY person_id
)
SELECT person.name AS name,
       visits.count AS count_of_visits
FROM person
    JOIN visits ON person.id = visits.person_id
ORDER BY count_of_visits DESC, person_id ASC
LIMIT 4;