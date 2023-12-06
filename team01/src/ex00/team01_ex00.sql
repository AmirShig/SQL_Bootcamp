SELECT COALESCE(u.name, 'not defined'),
       COALESCE(u.lastname, 'not defined'),
       our_balance.type,
       our_balance.volume,
       COALESCE(curr.name_currency, 'not defined') AS name_currency,
       COALESCE(
           (SELECT currency.rate_to_usd
           FROM currency
           WHERE currency.updated = curr.lust_update AND
                 currency.id = curr.id),
           '1') AS Last_rate_to_usd,
       COALESCE(
           (SELECT currency.rate_to_usd
           FROM currency
           WHERE currency.updated = curr.lust_update AND
                 currency.id = curr.id),
           '1') * our_balance.volume AS total_volume_in_usd
FROM "user" u
FULL JOIN (
    SELECT SUM(balance.money) AS volume,
                  balance.user_id,
                  balance.type,
                  balance.currency_id
    FROM balance
    GROUP BY balance.user_id, balance.type, balance.currency_id
    ) AS our_balance ON u.id = our_balance.user_id
FULL JOIN (
    SELECT currency.name AS name_currency,
           currency.id,
           MAX(currency.updated) AS lust_update
    FROM currency
    GROUP BY currency.id, currency.name
    ) AS curr ON curr.id = our_balance.currency_id
ORDER BY 1 DESC, 2, 3 ASC;