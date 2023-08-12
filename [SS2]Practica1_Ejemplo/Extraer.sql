USE [Practica]
GO
BULK INSERT TEMPORAL FROM 'C:\Laboratorio\Practicas\historial_tsumamis.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
)
GO
SELECT * FROM TEMPORAL