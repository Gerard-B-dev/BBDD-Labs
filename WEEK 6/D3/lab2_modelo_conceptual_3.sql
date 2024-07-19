CREATE DATABASE IF NOT EXISTS lab2_modelo_conceptual_3;
USE lab2_modelo_conceptual_3;

DROP DATABASE IF EXISTS lab2_modelo_conceptual_3;

CREATE DATABASE lab2_modelo_conceptual_3;
USE lab2_modelo_conceptual_3;

-- Diseñamos una BBDD de un Parking

/*  
 1. Identificamos Entidades y Atributos:
 
 Cliente: ClienteID (PK), Nombre, Apellido, Telefono, Email
 Coche: Matricula (PK), Marca, Modelo, Color, ClienteID (FK)
 Plaza: PlazaID (PK), Número, Tipo
 Precio: PrecioID (PK) Tarifa, Pago
 Oficina: OficinaID (PK), Ubicación, Telefono
 Empleado: EmpleadoID (PK), Nombre, Apellido, Cargo, OficinaID (FK)
 Plaza_Precio: PlazaID (FK), PrecioID (FK)
 Empleado_Oficina: EmpleadoID (FK), OficinaID (FK)
 
 2. Relaciones entre tablas:
 
 Cliente - Coche --> Un cliente puede estacionar su coche en el parking.
 Coche - Plaza -->  Un coche puede estacionar en una plaza.
 Empeado - Oficina --> Un empleado trabaja en una oficina
 Plaza - Precio --> Una plaza tiene asignado un precio
 
 3. Cardinalidad entre las tablas: 
  
 Cliente - Coche --> uno a muchos (1:N) --> Un cliente puede tener vrios coches
 Coche - Plaza --> uno a uno (1:1)
 Oficina - Empleado --> uno a muchos (1:N) --> En una oficina pueden trabajar varios empleados
 
*/

-- Creamos la tabla Cliente
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(15),
    Email VARCHAR(50)
);

-- Creamos la tabla Coche
CREATE TABLE Coche (
    Matricula VARCHAR(10) PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Color VARCHAR(20),
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- Creamos la tabla Plaza
CREATE TABLE Plaza (
    PlazaID INT PRIMARY KEY,
    Numero INT,
    Tipo VARCHAR(20)
);

-- Creamos la tabla Precio
CREATE TABLE Precio (
    PrecioID INT PRIMARY KEY,
    Tarifa VARCHAR(50),
    Pago DECIMAL(10, 2)
);

-- Creamos la tabla Oficina
CREATE TABLE Oficina (
    OficinaID INT PRIMARY KEY,
    Ubicacion VARCHAR(100),
    Telefono VARCHAR(15)
);

-- Creamos la tabla  Empleado
CREATE TABLE Empleado (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    OficinaID INT,
    FOREIGN KEY (OficinaID) REFERENCES Oficina(OficinaID)
);

-- Creamos la tabla intermedia Plaza_Precio
CREATE TABLE Plaza_Precio (
    PlazaID INT,
    PrecioID INT,
    PRIMARY KEY (PlazaID, PrecioID),
    FOREIGN KEY (PlazaID) REFERENCES Plaza(PlazaID),
    FOREIGN KEY (PrecioID) REFERENCES Precio(PrecioID)
);

CREATE TABLE Empleado_Oficina (
    EmpleadoID INT,
    OficinaID INT,
    PRIMARY KEY (EmpleadoID, OficinaID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID),
    FOREIGN KEY (OficinaID) REFERENCES Oficina(OficinaID)
);

