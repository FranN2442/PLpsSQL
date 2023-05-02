CREATE DATABASE restaurante;

\c restaurante;

CREATE TABLE employees (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
position VARCHAR(50) NOT NULL,
salary DECIMAL(8,2) NOT NULL
);


CREATE TABLE commands (
id SERIAL PRIMARY KEY,
date DATE NOT NULL,
table INT NOT NULL,
employee_id INT NOT NULL,
total DECIMAL(8,2) NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees(id)
);


CREATE TABLE providers (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
contact VARCHAR(50) NOT NULL,
number VARCHAR(20) NOT NULL
);


CREATE TABLE inventory (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
description VARCHAR(100) NOT NULL,
provider_id INT NOT NULL,
quantity INT NOT NULL,
price DECIMAL(8,2) NOT NULL,
FOREIGN KEY (provider_id) REFERENCES providers(id)
);