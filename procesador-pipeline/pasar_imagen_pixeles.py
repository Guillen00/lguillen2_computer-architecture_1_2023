from PIL import Image

# Cargamos la imagen en memoria
img = Image.open("leon.png")

# Obtenemos las dimensiones de la imagen
width, height = img.size

# Abrimos el archivo de texto para escribir los valores de los píxeles
with open("imagen_leon.txt", "w") as f:
    # Iteramos sobre todos los píxeles de la imagen
    for y in range(height):
        for x in range(width):
            # Obtenemos el valor de gris del píxel actual y lo convertimos a hexadecimal
            gris = int(img.getpixel((x, y)))
            valor_hex = hex(gris)[2:].zfill(2)
            
            # Escribimos el valor hexadecimal en el archivo de texto
            f.write(valor_hex)
            f.write("\n")
            
        # Agregamos un salto de línea al final de cada fila
        #f.write("\n")
