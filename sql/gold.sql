-- ejecutar el schema por separado antes de las tablas
CREATE SCHEMA gold;

-- ejecutar las tablas por separado
CREATE TABLE gold.dim_categoria (
    id INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE gold.dim_producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    id_categoria INT,
    fecha_lanzamiento DATE,
    precio INT,
    FOREIGN KEY (id_categoria) REFERENCES gold.dim_categoria(id)
);

CREATE TABLE gold.dim_tienda (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    ciudad VARCHAR(255),
    pais VARCHAR(255),
    ano_inauguracion INT
);

CREATE TABLE gold.hechos_ventas (
    id VARCHAR(255) PRIMARY KEY,
    fecha DATE,
    id_tienda INT,
    id_producto INT,
    cantidad INT,
    total INT,
    FOREIGN KEY (id_tienda) REFERENCES gold.dim_tienda(id),
    FOREIGN KEY (id_producto) REFERENCES gold.dim_producto(id)
);

CREATE TABLE gold.hechos_garantia (
    id INT,
    fecha DATE,
    id_venta VARCHAR(255),
    estado VARCHAR(255),
    FOREIGN KEY (id_venta) REFERENCES gold.hechos_ventas(id)
);
