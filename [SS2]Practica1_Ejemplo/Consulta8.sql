USE Practica
SELECT
    TOP 5 Country.name as Pais,
    SUM(total_house_destroy) AS Cantidad_destruidas
FROM Country
    INNER JOIN History ON History.idCountry = Country.idCountry
GROUP BY Country.name
ORDER BY Cantidad_destruidas desc