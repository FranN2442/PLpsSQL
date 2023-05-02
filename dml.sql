
INSERT INTO employees (name, position, salary) VALUES
('Juan', 'Chef', 3000.00),
('Maria', 'Mesero', 1500.00),
('Pedro', 'Cocinero', 2000.00),
('Laura', 'Cajero', 1800.00);


INSERT INTO commands (date, table, employee_id, total) VALUES
('2023-05-01', 4, 1, 100.00),
('2023-05-01', 7, 2, 50.00),
('2023-05-02', 2, 3, 75.00),
('2023-05-02', 3, 4, 60.00);

INSERT INTO providers (name, contact, number) VALUES
('Distribuidora de alimentos S.A.', 'Jorge Perez', '555-1234'),
('Licores y bebidas finas S.A.', 'Marcela Rodriguez', '555-5678');


INSERT INTO inventory (name, description, provider_id, quantity, price) VALUES
('Carne de res', 'Carne de res de primera calidad', 1, 10, 15.00),
('Pescado fresco', 'Pescado fresco del dia', 1, 5, 20.00),
('Botella de vino', 'Vino tinto reserva', 2, 20, 30.00),
('Botella de cerveza', 'Cerveza artesanal', 2, 50, 5.00);