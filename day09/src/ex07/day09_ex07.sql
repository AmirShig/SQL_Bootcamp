CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC
AS $$
    DECLARE
        min_val NUMERIC;
    BEGIN
        SELECT min(value)::NUMERIC INTO min_val
        -- UNNEST() для разбора массива на отдельные значения в виде таблицы
        FROM UNNEST(arr) AS value;

        RETURN min_val;
    END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);


