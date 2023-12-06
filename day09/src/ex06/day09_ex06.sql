CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (pizzeria_name VARCHAR)
AS $$
    BEGIN
    RETURN QUERY -- Возвращаем результат запроса в теле функции (plpgsql)
        SELECT pizzeria.name AS pizzeria_name
        FROM pizzeria
            JOIN menu m ON pizzeria.id = m.pizzeria_id
            JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
            JOIN person p ON pv.person_id = p.id
        WHERE p.name = pperson AND
              m.price < pprice AND
              pv.visit_date = pdate;
    END;
$$ LANGUAGE plpgsql;


SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

