-- ejecutar el schema por separado antes de las tablas
CREATE SCHEMA bronce;

-- ejecutar las tablas por separado
CREATE TABLE bronce.categoria (
    id VARCHAR(255),
    nombre VARCHAR(255),
    nota_extra VARCHAR(255)
);

CREATE TABLE bronce.producto (
    id VARCHAR(255),
    nombre VARCHAR(255),
    id_categoria VARCHAR(255),
    fecha_lanzamiento VARCHAR(255),
    precio VARCHAR(255),
    notas VARCHAR(255)
);

CREATE TABLE bronce.ventas (
    id VARCHAR(255),
    fecha VARCHAR(255),
    id_tienda VARCHAR(255),
    id_producto VARCHAR(255),
    cantidad VARCHAR(255),
);

CREATE TABLE bronce.tienda (
    id VARCHAR(255),
    nombre VARCHAR(150),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    inaguracion VARCHAR(100)
);

CREATE TABLE bronce.garantia (
    id VARCHAR(255),
    fecha VARCHAR(255),
    id_venta VARCHAR(255),
    estado VARCHAR(255)
);
