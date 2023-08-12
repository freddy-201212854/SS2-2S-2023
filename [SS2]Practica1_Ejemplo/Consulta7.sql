USE Practica
SELECT
    TOP 5 Dates.years,
    COUNT(Tsunami.runups) as Tsunamis
FROM History
    INNER JOIN Dates ON History.idDates = Dates.idDates
    INNER JOIN Tsunami ON History.idTsunami = Tsunami.idTsunami
GROUP BY Dates.years
ORDER BY Tsunamis desc