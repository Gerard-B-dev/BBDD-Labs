CREATE DATABASE IF NOT EXISTS lab2_modelo_conceptual_2;
USE lab2_modelo_conceptual_2;

DROP DATABASE IF EXISTS lab2_modelo_conceptual_2;

CREATE DATABASE lab2_modelo_conceptual_2;
use lab2_modelo_conceptual_2;

-- Hemos diseñado una BBDD de un supermercado

/* 

1. Identificamos Entidades y Atributos:

Producto: ID_Producto (PK), Nombre, Descripcion, Precio, Stock
Categoria: ID_Categoría (PK), Nombre, Descripcion
Cliente: ID_Cliente (PK), Nombre, Apellido, Dirección, Teléfono, Email
Pedido: ID_Pedido (PK), Fecha, ID_Cliente (FK), Total
Detalle_Pedido: ID_Detalle (PK), ID_Pedido (FK), ID_Producto (FK), Cantidad
Producto_Categoría: ID_Producto (FK), ID_Categoría (FK)

2. Relaciones entre tablas:

Producto - Categoria:  Los productos se relacionan con categorías
Pedido - Cliente: Relación entre los pedidos y el cliente
Pedido - Detalle_Pedido: Relación entre el pedido y los detalles de pedido
Detalle_Pedido y Producto: Relación entre los Productos en los detalles-pedido

3. Cardinalidad entre las tablas:

Producto - Categoria --> Muchos a Muchos (N:M) --> Muchos productos pueden tener diferentes categorías
Cliente - Pedido -->  Muchos a uno (1:N) --> Un cliente puede tener varios pedidos
Pedido - Detalle_Pedido --> Uno a muchos (1:N) --> Un pedido puede tener varios detalles en el pedido)
Producto - Detalle_Pedido  -->  Uno a muchos (1:N) --> Muchos detalles de pedido pueden referirse a un producto
*/
-- Creamos la tabla Producto
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Stock INT
);

-- Creamos la tabla Categoría
CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT
);

-- Creamos la tabla Cliente

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Creamos la tabla Pedido
CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Fecha DATE,
    ID_Cliente INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Creamos la tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    ID_Detalle INT PRIMARY KEY,
    ID_Pedido INT,
    ID_Producto INT,
    Cantidad INT,
    Precio DECIMAL(10, 2),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Creamos la tabla intermedia Producto_Categoría
CREATE TABLE Producto_Categoria (
    ID_Producto INT,
    ID_Categoria INT,
    PRIMARY KEY (ID_Producto, ID_Categoria),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto),
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

