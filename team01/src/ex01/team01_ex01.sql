insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH existing_currencies AS (
    SELECT id, name
    FROM currency
    GROUP BY id, name
), date_rates AS (
    SELECT
        b.currency_id,
        b.updated AS balance_updated,
        MAX(c.updated) AS t1_date,
        MIN(c2.updated) AS t2_date
    FROM
        balance b
        LEFT JOIN currency c ON c.id = b.currency_id AND c.updated < b.updated
        LEFT JOIN currency c2 ON c2.id = b.currency_id AND c2.updated > b.updated
    GROUP BY
        b.user_id, b.currency_id, b.updated
), cur_updates AS (
    SELECT DISTINCT b.user_id,
           b.currency_id,
           b.updated AS balance_updated,
           (SELECT rate_to_usd FROM currency
           WHERE id = dr.currency_id AND
                 updated = dr.t1_date
           ) AS t1,
           t1_date,
           (SELECT rate_to_usd FROM currency
           WHERE id = dr.currency_id AND
                 updated = dr.t2_date
           ) AS t2,
           t2_date
    FROM balance b
        JOIN date_rates dr ON b.currency_id = dr.currency_id AND
                              b.updated = dr.balance_updated
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    ec.name AS currency_name,
    balance.money * COALESCE(cu.t1, cu.t2) AS currency_in_usd
FROM "user" u
    FULL JOIN balance ON u.id = balance.user_id
    JOIN existing_currencies ec ON balance.currency_id = ec.id
    LEFT JOIN cur_updates cu ON balance.user_id = cu.user_id AND
                           balance.currency_id = cu.currency_id AND
                           balance.updated = cu.balance_updated
ORDER BY name DESC,
         lastname,
         currency_name;