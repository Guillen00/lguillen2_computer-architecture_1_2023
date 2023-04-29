import math as mth
print('Algoritmo Corvic')

# Raiz cuadrada mas eficiente
def sqrt(valor) :
  base=256.0
  y=yy=0.0
  for i in range(16) :
    yy=y+base
    if yy*yy <= valor :
      y=yy
    base/=2.0
  return y

def calc_initial_values(theta):
    theta = mth.radians(theta)
    K = 1.64676025812107
    x = 1 / sqrt(1 + K ** 2)
    y = 0
    z = theta
    return x, y, z

def reduce_angle(theta):
    # Reducir ángulo a rango -90 a 90 grados
    if theta > 90:
        return reduce_angle(theta - 180) * -1
    elif theta < -90:
        return reduce_angle(theta + 180) * -1
    else:
        return theta

def cordic(theta, n):
    
    # Reducir el ángulo de entrada al rango -90 a 90 grados
    theta = reduce_angle(theta)
    
    # Valores iniciales para el vector
    initial_values = calc_initial_values(theta)
    x = initial_values[0]
    y = initial_values[1]
    z = initial_values[2]
    
    #Algoritmo cordic
    for i in range(n):
        d = 1 if z >= 0 else -1
        x_new = x - d * y * 2**(-i)
        y_new = y + d * x * 2**(-i)
        z_new = z - d * mth.atan(2**(-i))
        x, y, z = x_new, y_new, z_new
    
    #cos = x / sqrt(x**2 + y**2)
    sin = y / sqrt(x**2 + y**2)
    return sin 

angulo = 230
    
sin = cordic(angulo, 20)
    #cordic(45, 20)

print("El valor sin para el angulo "+str(angulo)+" es: "+str(sin))