SELECT pz.name, pz.rating
FROM pizzeria pz
LEFT JOIN person_visits pv on pz.id = pv.pizzeria_id
WHERE pv.id IS NULL;