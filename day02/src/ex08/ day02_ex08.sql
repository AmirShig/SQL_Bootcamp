SELECT person.name
FROM person
    JOIN person_order po ON person.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
WHERE gender = 'male' AND
      address IN ('Moscow', 'Samara') AND
      pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;
