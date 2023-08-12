USE Practica;
GO
/* Consulta 1 */
SELECT COUNT(*) AS 'Tabla Country' FROM Country
SELECT COUNT(*) AS 'Tabla Dates' FROM Dates
SELECT COUNT(*) AS 'Tabla Location_Name' FROM Location_Name
SELECT COUNT(*) AS 'Tabla Tsunami' FROM Tsunami
SELECT COUNT(*) AS 'Tabla Temporal' FROM TEMPORAL
SELECT COUNT(*) AS 'Tabla History' FROM History
GO
/* Consulta 2 */
SELECT years AS Anio, COUNT(*) AS Cantidad_de_Tsunamis
FROM Dates
INNER JOIN History ON Dates.idDates = History.idDates
GROUP BY years
GO

/* Consulta 3 */


/* Consulta 4 */
SELECT Country.name, AVG(History.total_damage) AS Promedio_Total_Damage
FROM History
JOIN Country ON History.idCountry = Country.idCountry
GROUP BY Country.name

/* Consulta 5*/
SELECT TOP 5 Country.name, SUM(History.total_deaths) AS Cantidad_de_muertos
FROM Country
INNER JOIN History ON History.idCountry = Country.idCountry
GROUP BY Country.name
ORDER BY  Cantidad_de_muertos desc

/* Consulta 6*/
SELECT TOP 5 Dates.years, SUM(total_deaths) AS Cantidad_de_muertos
FROM Dates
INNER JOIN History ON History.idDates = Dates.idDates
GROUP BY Dates.years
ORDER BY  Cantidad_de_muertos desc

/* Consulta 7*/
GO


