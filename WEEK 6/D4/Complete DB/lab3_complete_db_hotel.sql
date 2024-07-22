CREATE DATABASE IF NOT exists hotel_db;
use hotel_db;

DROP DATABASE IF exists hotel_db;

CREATE database hotel_db;
use hotel_db;

-- Creamos la tabla Hotel
CREATE TABLE Hotel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Creamos tabla Habitación
CREATE TABLE Habitacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    id_hotel INT,
    FOREIGN KEY (id_hotel) REFERENCES Hotel(id)
);

-- Creamos la tabla Cliente
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Creamos tabla Reserva
CREATE TABLE Reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_habitacion INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id)
);

-- Creamos tabla Servicio
CREATE TABLE Servicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL
);

-- Creamosla tabla intermedia Reserva_Servicio
CREATE TABLE Reserva_Servicio (
    id_reserva INT,
    id_servicio INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id),
    PRIMARY KEY (id_reserva, id_servicio)
);

-- Insertamos datos en Hotel
INSERT INTO Hotel (nombre, direccion, telefono, email) VALUES
('Hotel Mandarin', 'Calle Mandarin 123, Madrid', '911234567', 'contacto@mandarin.com'),
('Hotel Espe', 'Avenida Diagon 400, Barcelona', '934567890', 'info@espe.com');

-- Insertar datos en Habitación
INSERT INTO Habitacion (numero, tipo, capacidad, precio, id_hotel) VALUES
('101', 'Individual', 1, 50.00, 1),
('102', 'Doble', 2, 75.00, 1),
('201', 'Suite', 4, 150.00, 2),
('202', 'Doble', 2, 80.00, 2);

-- Insertamos datos en Cliente
INSERT INTO Cliente (nombre, apellidos, telefono, email) VALUES
('Sergi', 'Pere', '699123456', 'sergi.pere@gmail.com'),

-- Insertamos datos en Servicio
INSERT INTO Servicio (nombre, descripcion, precio) VALUES
('Desayuno', 'Desayuno buffet', 10.00),
('piscina', 'Acceso a piscina hotel', 30.00);

-- Insertar datos en Reserva_Servicio
INSERT INTO Reserva_Servicio (id_reserva, id_servicio, cantidad) VALUES
(1, 1, 5),
(2, 2, 3);
('Silvia', 'García', '698987654', 'silvia.garcia@gmail.com');

-- Insertamos datos en Reserva
INSERT INTO Reserva (id_cliente, id_habitacion, fecha_inicio, fecha_fin) VALUES
(1, 1, '2024-08-01', '2024-08-05'),
(2, 3, '2024-08-10', '2024-08-15');


-- Parte 3: Alteración de tabla para añadir columna
-- 5. Modificación de Estructura de Tablas
ALTER TABLE Reserva
ADD COLUMN fecha_checkin DATE,
ADD COLUMN fecha_checkout DATE;

-- Parte 4: Consultas con Joins
-- 6. Consultas Utilizando Joins
-- 1. Obtener la lista de habitaciones reservadas junto con los nombres de los clientes que las ocupan.
SELECT H.numero AS Numero_Habitacion, C.nombre AS Nombre_Cliente, C.apellidos AS Apellidos_Cliente
FROM Habitacion H
JOIN Reserva R ON H.id = R.id_habitacion
JOIN Cliente C ON R.id_cliente = C.id;

-- 2. Obtener la lista de servicios reservados por un cliente específico junto con los detalles de cada servicio.
SELECT S.nombre AS Nombre_Servicio, S.descripcion AS Descripcion_Servicio, RS.cantidad AS Cantidad
FROM Servicio S
JOIN Reserva_Servicio RS ON S.id = RS.id_servicio
JOIN Reserva R ON RS.id_reserva = R.id
JOIN Cliente C ON R.id_cliente = C.id
WHERE C.id = 1;

-- Parte 5: Retos Adicionales
-- 7. Utilizar subconsultas para obtener la cantidad total de reservas realizadas en un hotel específico en un mes determinado.
SELECT COUNT(*) AS Total_Reservas
FROM Reserva R
WHERE R.fecha_inicio >= '2024-08-01' AND R.fecha_fin <= '2024-08-31'
AND R.id_habitacion IN (
    SELECT H.id FROM Habitacion H WHERE H.id_hotel = 1
);

-- 8. Indexación y Optimización
--  Implementar índices en las tablas relevantes para mejorar el rendimiento de consultas frecuentes, como la búsqueda de habitaciones disponibles.
CREATE INDEX idx_habitacion_id_hotel ON Habitacion(id_hotel);

-- 9. Transacciones y Control de Concurrencia
-- Simular escenarios de reservas simultáneas utilizando transacciones para garantizar la consistencia de los datos y evitar conflictos:
START TRANSACTION;

INSERT INTO Reserva (id_cliente, id_habitacion, fecha_inicio, fecha_fin) VALUES (1, 1, '2024-09-01', '2024-09-05');
INSERT INTO Reserva_Servicio (id_reserva, id_servicio, cantidad) VALUES (LAST_INSERT_ID(), 1, 2);

COMMIT;

-- 10. Uso de Triggers
-- Crear triggers para automatizar acciones en la base de datos, como la actualización del estado de una habitación al realizarse una reserva o cancelación:
DELIMITER $$
CREATE TRIGGER after_reserva_insert AFTER INSERT ON Reserva
FOR EACH ROW
BEGIN
   UPDATE Habitacion SET estado = 'Reservada' WHERE id = NEW.id_habitacion;
end;
DELIMITER ;


-- Ejemplo de consulta para verificar el estado de las habitaciones después de una reserva
SELECT * FROM Habitacion;
