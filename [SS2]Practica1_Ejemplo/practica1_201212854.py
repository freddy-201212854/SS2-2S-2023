from os import system


def pedirNumeroEntero():

    correcto = False
    num = 0
    while(not correcto):
        try:
            num = int(input("Introduce un numero entero: "))
            correcto = True
        except ValueError:
            print('Error, introduce un numero entero')

    return num


salir = False
opcion = 0


while not salir:

    print("1. Borrar Informacion")
    print("2. Crear Base de Datos")
    print("3. Extraer Informacicon")
    print("4. Cargar Informacicon")
    print("5. Realizar Consultas")
    print("6. Salir")

    print("Elige una opcion")

    opcion = pedirNumeroEntero()

    if opcion == 1:
        print("Borrado de Informacion")
        system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Eliminacion.sql")
        print("\n Borrado \n")
    elif opcion == 2:
        print("Crear Base de Dato")
        system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Creacion.sql")
        print("\n Creado \n")
    elif opcion == 3:
        print("Extraer Informacion")
        system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Extraer.sql")
        print("\n La información fue extraída \n")
    elif opcion == 4:
        print("Cargar Informacion")
        system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Cargar.sql")
        print("\n Información Cargada \n")
    elif opcion == 5:
        print("Consultas")
        system("sqlcmd -S DESKTOP-MOKQI5C\MSSQLSERVER01 -i C:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consultas.sql")
        system("sqlcmd -iC:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consultas.sql -oC:\\seminario2\\Laboratorio\\Practicas\\Practica\\Consultas.txt")
        print("\n Consultas generadas \n")
    elif opcion == 6:
        salir = True
    else:
        print("Introduce un numero entre 1 y 6")

print("Fin")
