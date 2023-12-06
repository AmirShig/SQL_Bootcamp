SELECT fem_view.name
FROM v_persons_female fem_view
UNION
SELECT male_view.name
FROM v_persons_male male_view
ORDER BY name;