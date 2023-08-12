USE Practica;

/* Consulta 2 */

SELECT
    years AS Anio,
    COUNT(*) AS Cantidad_de_Tsunamis
FROM Dates
    INNER JOIN History ON Dates.idDates = History.idDates
GROUP BY years