use tienda;
create table productos (
	id INT PRIMARY KEY,
	nombre VARCHAR(100),
	categoria VARCHAR(100),
	precio INT,
	stock INT
);


insert into productos(id, nombre, categoria, precio, stock)
values
(1, 'Sommier y Colchón Espuma 2 plazas 140x190 Rembrandt', 'Hogar', 639999, 23),
(2, 'Bicicleta Mountain Bike Rodado 26 Peretti Azul', 'Deporte', 241000, 15),
(3, 'Apple iPhone 11 128 GB - Blanco', 'Electronica', 1200000, 77),
(4, 'Notebook Acer 15,6” AMD Ryzen 5 8GB 256GB SSD Aspire 3', 'Electronica', 950000, 32),
(5, 'Planchita de Pelo GA.MA Elegance Bella Tourmaline ION 230°C', 'Belleza y Cuidado Personal', 39500, 16),
(6, 'Patacleta Love 078 Rosa', 'Juguetes', 31000, 4),
(7, 'Proyector Gadnic Full HD 1080p', 'Electronica', 510349, 12);

#TODO
select * from productos;

#Solo categoria
SELECT * FROM productos WHERE categoria = 'Electronica';

#Ej 15
#Por orden
SELECT * FROM productos ORDER BY precio asc;

#Solo muestra lo que hay en categorias
SELECT DISTINCT categoria FROM productos;

#Where y And
SELECT * FROM productos WHERE precio > 50000 AND categoria = 'Electronica';

#Ej 18
#Between
select * from productos where precio between 10000 and 100000;

#Ej 19
#Like
select * from productos where nombre like 'Notebook%';

#Ej 20
#IN
SELECT * FROM productos WHERE categoria IN ('Electronica', 'Hogar');

create table clientes(
	id int primary key,
    nombre varchar(50),
    apellido varchar(50),
    email varchar(100),
    fecha_registro date
);

insert into clientes(id, nombre, apellido, email, fecha_registro)
values
(1, 'Ana', 'García', 'ana.garcia@example.com', '2022-01-10'),
(2, 'Luis', 'Fernández', 'luis.fernandez@example.com', '2022-02-15'),
(3, 'Sofía', 'Ramírez', 'sofia.ramirez@example.com', '2022-03-20'),
(4, 'Diego', 'Sánchez', 'diego.sanchez@example.com', '2022-04-25'),
(5, 'Elena', 'Pérez', 'elena.perez@example.com', '2022-05-30');

select * from clientes;

#Solo categoria
SELECT * FROM clientes WHERE fecha_registro > '2022-01-01';

#Ej 25
#Por orden
SELECT * FROM clientes ORDER BY fecha_registro desc;

#26
#Solo muestra lo que hay en categorias
SELECT DISTINCT email FROM clientes;

#Where y And
SELECT * FROM clientes WHERE fecha_registro > '2022-01-01' AND apellido = 'García';

#Ej 28
#Between
select * from clientes where fecha_registro between '2022-01-01' and '2022-12-31';

#Ej 29
#Like
select * from clientes where nombre like 'A%';

#Ej 30
#IN
SELECT * FROM clientes WHERE apellido IN ('García', 'Fernandez');

create table ventas(
	id int primary key,
    fecha date,
    cliente_id int,
    producto_id int,
    cantidad int,
    total float(10,2)
);

insert into ventas(id, fecha, cliente_id, producto_id, cantidad, total)
values
(1, '2023-01-10', 1, 1, 2, 2000.00),
(2, '2023-01-15', 2, 2, 1, 500.00),
(3, '2023-01-20', 3, 3, 3, 60.00),
(4, '2023-01-25', 4, 4, 2, 30.00),
(5, '2023-01-30', 5, 5, 5, 25.00);

select * from ventas;

#36
#Solo categoria
SELECT * FROM ventas WHERE fecha > '2023-01-01';

#Ej 25
#Por orden
SELECT * FROM ventas ORDER BY fecha asc;

#26
#Solo muestra lo que hay en categorias
SELECT DISTINCT cliente_id FROM ventas;

#Where y And
SELECT * FROM ventas WHERE fecha > '2023-01-01' AND total > 100;

#Ej 38
#Between
select * from ventas where fecha between '2023-01-01' and '2023-12-31';

#Ej 39
#Like
select * from ventas where fecha like '2023-01%';

#Ej 40
#IN
SELECT * FROM ventas WHERE cliente_id IN (1, 2);
