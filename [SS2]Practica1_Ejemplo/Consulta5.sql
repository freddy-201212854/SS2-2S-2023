USE Practica;

SELECT
    TOP 5 Country.name,
    SUM(History.total_deaths) AS Cantidad_de_muertos
FROM Country
    INNER JOIN History ON History.idCountry = Country.idCountry
GROUP BY Country.name
ORDER BY Cantidad_de_muertos desc