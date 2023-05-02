CREATE DATABASE restaurante;

\c restaurante;

CREATE TABLE empleados (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
puesto VARCHAR(50) NOT NULL,
salario DECIMAL(8,2) NOT NULL
);


CREATE TABLE comandas (
id SERIAL PRIMARY KEY,
fecha DATE NOT NULL,
mesa INT NOT NULL,
empleado_id INT NOT NULL,
total DECIMAL(8,2) NOT NULL,
FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);


CREATE TABLE proveedores (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
contacto VARCHAR(50) NOT NULL,
telefono VARCHAR(20) NOT NULL
);


CREATE TABLE inventario (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
proveedor_id INT NOT NULL,
cantidad INT NOT NULL,
precio DECIMAL(8,2) NOT NULL,
FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);