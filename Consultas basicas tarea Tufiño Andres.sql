create database Banco;
use Banco;
create table Cliente (
    id_cliente int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100) not null
);
create table Cuentas (
    id_cuenta int auto_increment primary key,
    id_cliente int,
    saldo decimal(10, 2) not null,
    foreign key (id_cliente) references Cliente(id_cliente)
);
create table Transacciones (
    id_transaccion int auto_increment primary key,
    id_cuenta int,
    monto decimal(10, 2) not null,
    fecha date not null,
    foreign key(id_cuenta) references Cuentas(id_cuenta)
);

insert into Cliente (nombre, email) values
('Juan Perez', 'juan.perez@example.com'),
('Maria Lopez', 'maria.lopez@example.com'),
('Carlos Gomez', 'carlos.gomez@example.com'),
('Ana Torres', 'ana.torres@example.com'),
('Luis Morales', 'luis.morales@example.com'),
('Marta Sanchez', 'marta.sanchez@example.com'),
('Pedro Ramirez', 'pedro.ramirez@example.com'),
('Lucia Fernandez', 'lucia.fernandez@example.com'),
('Miguel Diaz', 'miguel.diaz@example.com'),
('Laura Gutierrez', 'laura.gutierrez@example.com');

insert into Cuentas (id_cliente, saldo) values
(1, 5000.00),
(1, 1500.00),
(2, 3000.00),
(3, 7000.00),
(4, 1000.00),
(5, 2500.00),
(6, 4000.00),
(7, 3500.00),
(8, 2000.00),
(9, 4500.00),
(10, 6000.00);

insert into Transacciones (id_cuenta, monto, fecha) values
(1, 200.00, '2024-01-15'),
(1, -100.00, '2024-02-10'),
(2, 150.00, '2024-03-05'),
(3, -200.00, '2024-04-20'),
(4, 300.00, '2024-05-25'),
(5, -150.00, '2024-06-30'),
(6, 400.00, '2024-07-15'),
(7, -250.00, '2024-08-10'),
(8, 350.00, '2024-09-05'),
(9, -300.00, '2024-10-20'),
(10, 450.00, '2024-11-25');

-- 1
-- a
SELECT id_cuenta, saldo FROM Cuentas;
-- b
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo > 4000;
-- c
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo < 2000;
-- d
SELECT nombre, CHAR_LENGTH(nombre) AS longitud_nombre FROM Cliente;
-- e
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo BETWEEN 1000 AND 3000;
-- f
SELECT Cliente.id_cliente, Cliente.nombre, Cuentas.id_cuenta
FROM Cliente
LEFT JOIN Cuentas ON Cliente.id_cliente = Cuentas.id_cliente;
-- g
SELECT CONCAT(nombre, ' - ', email) AS cliente_email FROM Cliente;

--  h

SELECT email, RIGHT(email, 3) AS ultimos_tres_caracteres FROM Cliente;

-- i
SELECT LOWER(nombre) AS nombre_minusculas FROM Cliente;
-- j 
SELECT UPPER(nombre) AS nombre_mayusculas FROM Cliente;
-- k 
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 10;

-- l

SELECT id_cuenta, saldo, saldo * 1.05 AS saldo_con_interes FROM Cuentas;
 
-- m 

UPDATE Cliente
SET email = REPLACE(email, '@example.com', '@newdomain.com');
select*from Cliente;

-- 2
-- a 
SELECT nombre FROM Cliente;
-- b
SELECT nombre, CONCAT('Correo: ', email) AS formato_email FROM Cliente;
-- c 
SELECT LOWER(email) AS email_minusculas FROM Cliente;

-- d 
SELECT UPPER(nombre) AS nombre_mayusculas FROM Cliente;

-- 3
-- a
SELECT id_cuenta FROM Cuentas;

-- b
SELECT id_cuenta, SUM(monto) AS total_transacciones FROM Transacciones GROUP BY id_cuenta;

-- c 
SELECT SUM(saldo) AS saldo_total FROM Cuentas;

-- d
SELECT SUM(monto) AS monto_total FROM Transacciones;

-- e

SELECT AVG(monto) AS monto_promedio FROM Transacciones;

-- 4
-- a
SELECT id_transaccion, fecha FROM Transacciones;
-- b
SELECT id_transaccion, YEAR(fecha) AS anio FROM Transacciones;

-- c 
SELECT id_transaccion, MONTH(fecha) AS mes FROM Transacciones;

-- d
SELECT id_transaccion, DAYOFWEEK(fecha) AS dia_semana FROM Transacciones;

-- e
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2024;

-- f
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023;

-- g 
SELECT * FROM Transacciones WHERE MONTH(fecha) = 6;

-- h
SELECT * FROM Transacciones WHERE DAY(fecha) = 15;

-- 5 
-- a
-- id cuenta

-- b 
SELECT id_cuenta, COUNT(*) AS numero_transacciones FROM Transacciones GROUP BY id_cuenta;

-- c 
SELECT AVG(saldo) AS saldo_promedio FROM Cuentas;

-- 6
-- a
SELECT * FROM Transacciones WHERE monto < 0;

-- b 
SELECT * FROM Transacciones WHERE monto > 0;

-- 7
-- a
SELECT * FROM Cuentas ORDER BY saldo DESC;

SELECT * FROM Cliente ORDER BY nombre;

SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023;

SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 5;

-- 8

-- a 
SELECT COUNT(*) AS total_clientes FROM Cliente;

-- b 
SELECT COUNT(*) AS total_cuentas FROM Cuentas;

-- c 
SELECT COUNT(*) AS total_transacciones FROM Transacciones;

-- d 
SELECT id_cuenta, ROUND(saldo, 2) AS saldo_redondeado FROM Cuentas;

-- 9 

-- a
SELECT * FROM Cuentas ORDER BY saldo DESC LIMIT 1;

-- b 
SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 1;

-- c 
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 1;

-- d 
SELECT * FROM Transacciones ORDER BY monto ASC LIMIT 1;



