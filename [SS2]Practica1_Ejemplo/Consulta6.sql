USE Practica;

SELECT
    TOP 5 Dates.years,
    SUM(total_deaths) AS Cantidad_de_muertos
FROM Dates
    INNER JOIN History ON History.idDates = Dates.idDates
GROUP BY Dates.years
ORDER BY Cantidad_de_muertos desc