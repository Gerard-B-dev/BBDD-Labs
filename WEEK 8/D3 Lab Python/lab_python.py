# Lab Proyecto Python

# Paso 1: Definir la Clase Terrario

# 1. Crea una clase llamada Terrario que tenga los siguientes atributos:
class Terrario:
    def __init__(self, nombre, ancho, largo):
        self.nombre = nombre
        self.ancho = ancho
        self.largo = largo
        self.habitantes = []
# 2. Define un método llamado agregar_habitante que reciba un objeto Serpiente y lo agregue a la lista de habitantes.
    def agregar_habitante(self, serpiente):
        self.habitantes.append(serpiente)
# 3. Define un método llamado area que calcule el área del terrario.
    def area(self):
        return self.ancho * self.largo

    def mostrar_serpientes(self):
        for serpiente in self.habitantes:
            print(f"Serpiente: {serpiente.nombre}, Especie: {serpiente.especie}")

# Paso 2: Definir la Clase Serpiente
# 1. Crea una clase llamada Serpiente que tenga los siguientes atributos:

class Serpiente:
    def __init__(self, nombre, longitud, especie):
        self.nombre = nombre
        self.longitud = longitud
        self.especie = especie

# 2. Define un método llamado deslizarse que imprima un mensaje indicando que la serpiente se está deslizando:
    def deslizarse(self):
        print(f"{self.nombre} se esta deslizando.")

# 3. Paso 3: Crear Instancias y Probar:

# 1. Crea una instancia de la clase Terrario
terrario = Terrario("Terrario Grande", 10, 20)
# 2. Crea al menos dos instancias de la clase Serpiente:
serpiente1 = Serpiente("Anaconda", 5, "Eunectes murinus")
serpiente2 = Serpiente("Boa Constrictor", 4, "Boa constrictor")
# 3. Agrega las serpientes al terrario usando el método agregar_habitante:
terrario.agregar_habitante(serpiente1)
terrario.agregar_habitante(serpiente2)
# 4. Calcula el área del terrario y muestra el resultado:
area_terrario = terrario.area()
print(f"Area del terrario: {area_terrario} metros cuadrados")
# 5. Haz que cada serpiente se deslice usando el método deslizarse.
serpiente1.deslizarse()
serpiente2.deslizarse()
# 6. Muestra todas las serpientes del terrario (Tendrás que crear una clase nueva que no te he pedido previamente)
print("\nSerpientes en el terrario:")
terrario.mostrar_serpientes()