with open("resultados.txt", "r") as f:
    with open('seno.txt', 'w') as f2:
        for linea in f:
            binario = linea.strip() #eliminamos el salto de línea
            hexadecimal = hex(int(binario, 10))[2:].zfill(8) #convertimos a hexadecimal y agregamos ceros a la izquierda si es necesario
            print(hexadecimal) #imprimimos el resultado
            f2.write(hexadecimal + '\n')  # Escribir el valor hexadecimal en el nuevo archivo de texto