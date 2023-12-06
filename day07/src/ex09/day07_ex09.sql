SELECT address,
       ROUND(MAX(age::NUMERIC) - (MIN(age::NUMERIC) / MAX(age::NUMERIC)), 2) AS formula,
       ROUND(AVG(age), 2) AS average,
       CASE
           WHEN ROUND(MAX(age::NUMERIC) - (MIN(age::NUMERIC) / MAX(age::NUMERIC)), 2) > ROUND(AVG(age), 2) THEN True
           ELSE False
           END AS comparison
FROM person
GROUP BY address
ORDER BY address;