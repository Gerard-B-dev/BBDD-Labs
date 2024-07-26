DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;

USE empresa;


-- Creamos la tabla departamentos
CREATE TABLE departamentos (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);


-- Creamos la tabla empleados
CREATE TABLE empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT,
    CONSTRAINT fk_departamento_empleado FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

-- Creamos la tabla proyectos
CREATE TABLE proyectos (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Creamos la tabla intermedia empleado_proyecto para la relación ManyToMany
CREATE TABLE empleado_proyecto (
    empleado_id INT,
    proyecto_id INT,
    PRIMARY KEY (empleado_id, proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- Creamos tabla intermedia empleado_departamento para la relación ManyToOne
CREATE TABLE departamento_empleado (
    empleado_id INT,
    departamento_id INT,
    PRIMARY KEY (empleado_id, departamento_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

-- Creamos la tabla detalles_empleado para la relación OneToOne
CREATE TABLE detalles_empleado (
    empleado_id INT PRIMARY KEY,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    CONSTRAINT fk_empleado_detalles FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Insertamos valores en la tabla departamentos
INSERT INTO departamentos (nombre)
VALUES ('Recursos Humanos'),
       ('Ventas'),
       ('Marketing'),
       ('Finanzas');
      
-- Insertamos valores en la tabla empleados
INSERT INTO empleados (nombre, salario, departamento_id)
VALUES ('Sergi López', 3000, 1),
       ('Loles León', 2500, 2),
       ('Sandra Berneda', 4500, 3);

-- Insertamos valores en la tabla proyectos
INSERT INTO proyectos (nombre)
VALUES ('Proyecto 1'),
       ('Proyecto 2'),
       ('Proyecto 3');
       
-- Insertamos valores en la tabla intermedia empleado_proyecto
INSERT INTO empleado_proyecto (empleado_id, proyecto_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 2);
       
-- Insertamos valores en la tabla detalles_empleado
INSERT INTO detalles_empleado (empleado_id, direccion, telefono)
VALUES (1, 'Calle Principal 123', '+34 123 456 789'),
       (2, 'Avenida Secundaria 456', '+34 987 654 321'),
       (3, 'Calle Cerdeña 2', '+34 223 456 589');
       
-- -- Paso 3: Crear la función calcular_bonificacion
DELIMITER //

CREATE FUNCTION calcular_bonificacion(empleado_id INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE salario DECIMAL(10, 2);
    DECLARE bonificacion DECIMAL(10, 2);
    
    -- Obtener el salario del empleado
    SELECT e.salario INTO salario
    FROM empleados e
    WHERE e.empleado_id = empleado_id;
    
    -- Calcular la bonificación
    SET bonificacion = salario * 0.10;
    
    RETURN bonificacion;
END //

DELIMITER ;

-- Comprobar la funcionalidad de la función calcular_bonificacion

SELECT
    nombre,
    salario,
    calcular_bonificacion(empleado_id) AS bonificacion
FROM
    empleados;
   
  -- Paso 5: Nombrar una Constrain y Usarla
  -- Realizado
   
  -- Paso 6: Declarar Variables y Usarlas
  -- Realizado
