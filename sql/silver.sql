-- ejecutar el schema por separado antes de las tablas
CREATE SCHEMA silver;

-- ejecutar las tablas por separado
CREATE TABLE silver.categoria (
    id INT,
    nombre VARCHAR(255)
);

CREATE TABLE silver.producto (
    id INT,
    nombre VARCHAR(255),
    id_categoria INT,
    fecha_lanzamiento DATE,
    precio INT
);

CREATE TABLE silver.ventas (
    id VARCHAR(255),
    fecha DATE,
    id_tienda INT,
    id_producto INT,
    cantidad INT,
);

CREATE TABLE silver.tienda (
    id INT,
    nombre VARCHAR(255),
    ciudad VARCHAR(255),
    pais VARCHAR(255),
    inaguracion INT
);

CREATE TABLE silver.garantia (
    id INT,
    fecha DATE,
    id_venta VARCHAR(255),
    estado VARCHAR(255)
);
