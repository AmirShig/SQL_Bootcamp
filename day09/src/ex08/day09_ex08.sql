CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci INTEGER)
AS $$BEGIN
    RETURN QUERY
    WITH RECURSIVE fib(number1, number2) AS (
        SELECT 0 AS number1,
               1 AS number2

            UNION ALL

        SELECT number2,
               number1 + number2
        FROM fib
        WHERE number2 < pstop
    )
    SELECT number1
    FROM fib;
    END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
