USE Practica;

SELECT
    Country.name,
    AVG(History.total_damage) AS PromedioTotalDamage
FROM History
    JOIN Country ON History.idCountry = Country.idCountry
GROUP BY Country.name