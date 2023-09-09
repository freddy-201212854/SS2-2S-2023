# -*- coding: utf-8 -*-

# Las librerias necesarias
#import pyodbc
# imports Conexion SQL Server
import pyodbc
from pyparsing import col
import sqlServerConfig
# fin imports conexion SQL Server
import mysql.connector
import os
from mysql.connector import Error
import pandas as pd
from imprimir import *
from creacion import *
from consultas import *
import logging
import math
from numpy import nan
import subprocess

# Configura log
logger = logging.getLogger(
    'PROYECTO 1, FASE 1 SEMINARIO DE SISTEMAS 1 - GRUPO D')
logger.setLevel(logging.DEBUG)
ch = logging.FileHandler('logs.log')
ch.setLevel(logging.DEBUG)
formatter = logging.Formatter(
    '%(asctime)s - %(name)s - %(levelname)s - %(message)s')
ch.setFormatter(formatter)
logger.addHandler(ch)
# Fin Configura log

# Conexion SQL SERVER
try:
    #CONNECTION_STRING = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER=DESKTOP-8Q6L6F9\SQLEXPRESS;DATABASE=dw;UID=usr_ss2:PWD=123456;Trusted_Connection=yes"
    CONNECTION_STRING = (
        "DRIVER=ODBC Driver 17 for SQL Server;"
        "SERVER=DESKTOP-DFPFKQN\\SQLEXPRESS;"
        "DATABASE=Practica;"
        "UID=DESKTOP-MOKQI5C\\Freddy;"
        "Trusted_Connection=yes;"
    )
    logger.info("Iniciando nuestra aplicacion")
    logger.info(" CONNECTION_STRING: ".center(80, "-"))
    #before, after = CONNECTION_STRING.split("PWD=")
    #logger.info(before + f"PWD=<{len(after)} characters>")
    logger.info("Iniciando la realizacion de la conexion")
    connSQLS = pyodbc.connect(CONNECTION_STRING, autocommit=True)
    logger.info("Conexion realizada exitosamente")
except mysql.connector.Error as error:
    print("ERROR CREAR CONEXION {}".format(error))
# Fin Conexion SQL SERVER


def main():
    menu()


def menu():
    while True:
        print_main_menu()
        opcion = input('Elija la operación que desea realizar: ')
        if opcion == '1':
            print("Borrado de Informacion")
            os.system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Eliminacion.sql")
            print("\n Borrado \n")
        elif opcion == '2':
            print("Crear Base de Dato")
            os.system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Creacion.sql")
            print("\n Creado \n")
        elif opcion == '3':
            print("Extraer Informacion")
            os.system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Extraer.sql")
            print("\n La información fue extraída \n")
        elif opcion == '4':
            print("Cargar Informacion")
            os.system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Cargar.sql")
            print("\n Información Cargada \n")
        elif opcion == '5':
            print("Consulta 1")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta1.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta1.txt')

            print("Consulta 2")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta2.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta2.txt')

            print("Consulta 4")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta4.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta4.txt')

            print("Consulta 5")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta5.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta5.txt')

            print("Consulta 6")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta6.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta6.txt')

            print("Consulta 7")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta7.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta7.txt')

            print("Consulta 8")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta8.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta8.txt')

            print("Consulta 9")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta9.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta9.txt')

            print("Consulta 10")
            sqlcmd_command = "sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consulta10.sql"
            result = subprocess.run(
                sqlcmd_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
            print(result.stdout.decode())
            crearArchivo(result.stdout.decode(), 'Consulta10.txt')

        else:
            logger.info('Fin de aplicación')
            exit()


def crearArchivo(texto, nombre_archivo):
    # Abrir un archivo en modo escritura
    with open(nombre_archivo, "w") as archivo:
        # Escribir el texto en el archivo
        archivo.write(texto)


if __name__ == "__main__":
    main()
    logger.info('Aplicacion finalizada')
