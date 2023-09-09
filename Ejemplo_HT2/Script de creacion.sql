CREATE DATABASE HT2_201212854;

USE HT2_201212854;

CREATE TABLE Temporal (
  carne VARCHAR(15),
  nombre VARCHAR(50),
  llevalab VARCHAR(2),
  posiblenota VARCHAR(3)
)

CREATE TABLE Alumno(
	 carne INT PRIMARY KEY,
	 nombre VARCHAR(50),
	 llevalab VARCHAR(2),
	 nota VARCHAR(3)
)

SELECT * FROM Temporal;
SELECT * FROM Alumno;

DELETE FROM Temporal;
DELETE FROM Alumno;

DROP TABLE Temporal;
DROP TABLE Alumno;
