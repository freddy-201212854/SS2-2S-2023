USE Practica
SELECT
    Country.name,
    AVG(height_water) AS Altura_Maxima_agua
FROM Country
    INNER JOIN History ON History.idCountry = Country.idCountry
    INNER JOIN Tsunami ON History.idTsunami = Tsunami.idTsunami
GROUP BY Country.name
ORDER BY Altura_Maxima_agua desc