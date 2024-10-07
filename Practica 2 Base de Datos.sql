
use tp2_basededatos;

DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS productos;
CREATE TABLE proveedores(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50)
);

INSERT INTO proveedores (nombre)
VALUES
('PROVEEDOR 1'),
('PROVEEDOR 2'),
('PROVEEDOR 3'),
('PROVEEDOR 4'),
('PROVEEDOR 5');

CREATE TABLE productos (
id INTEGER AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DECIMAL(10, 2) NOT NULL,
categoria VARCHAR(50) NOT NULL,
fecha_lanzamiento DATE NOT NULL,
proveedor_id INT,
FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

INSERT INTO productos (nombre, precio, categoria, fecha_lanzamiento, proveedor_id)
VALUES
('Laptop', 1200.00, 'Electrónica', '2021-01-01', NULL),
('Smartphone', 800.00, 'Electrónica', '2020-05-15', NULL),
('Cafetera', 50.00, 'Hogar', '2019-08-20', NULL),
('Libro', 20.00, 'Libros', '2022-03-10', NULL),
('Tablet', 300.00, 'Electrónica', '2021-06-01', 1),
('Aspiradora', 150.00, 'Hogar', '2020-11-20', 2),
('Monitor', 250.00, 'Electrónica', '2018-07-15', 3),
('Juego de Mesa', 30.00, 'Juegos', '2022-09-05', 4);

select * from productos;

#Escribe una consulta SQL que seleccione todos los productos cuyo precio
#sea mayor a 200.00 y pertenezcan a la categoría 'Electrónica', o cuyo
#precio sea menor a 50.00 y pertenezcan a la categoría 'Hogar'
SELECT * FROM productos 
WHERE 
	(precio > 200.00 and categoria = 'Electrónica') OR (precio < 50.00 AND categoria = 'Hogar');

#Escribe una consulta SQL que calcule el precio promedio de los
#productos agrupados por categoría y que solo muestre las categorías
#cuyo precio promedio sea mayor a 100.00.
SELECT 
	categoria,
    AVG(precio) AS precio_promedio
FROM 
	productos
GROUP BY 
	categoria
HAVING AVG
	(precio) > 100.00;
    
#Escribe una consulta SQL que seleccione todos los productos y los
#ordene en orden descendente por precio y en orden ascendente por nombre.
SELECT * 
FROM 
	productos 
ORDER BY 
	precio DESC, nombre ASC;

#Escribe una consulta SQL que actualice el precio de todos los productos
#de la categoría 'Electrónica' que fueron lanzados después del 1 de enero
#de 2020, incrementando su precio en un 10%.
SET SQL_SAFE_UPDATES = 0;

UPDATE 
	productos
SET 
	precio = precio * 1.10
WHERE 
	categoria = 'Electrónica' AND fecha_lanzamiento < '2020-01-01';

SET SQL_SAFE_UPDATES = 1;
select * from productos;

#Escribe una consulta SQL que elimine todos los productos de la categoría
#'Libros' que fueron lanzados antes del 1 de enero de 2020.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM productos WHERE categoria = 'Libros' AND fecha_lanzamiento < '2020-01-01';
SET SQL_SAFE_UPDATES = 1;

#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea mayor que el promedio de precios de todos los productos.
SELECT 
	nombre, precio
FROM 
	productos
WHERE 
	precio > (SELECT AVG(precio) FROM productos);
    
#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos y les asigne un ranking basado en el precio en orden descendente.
SELECT 
	nombre, precio,
	RANK() OVER (ORDER BY precio DESC) AS ranking 
FROM 
	productos;

#Escribe una consulta SQL que cree una vista llamada
#`productos_electronica` que seleccione el nombre y el precio de los productos de la categoría 'Electrónica'.
CREATE VIEW 
	productos_electronica AS
SELECT 
	nombre, precio 
FROM 
	productos
WHERE 
	categoria = 'Electrónica';
    
SELECT * FROM productos_electronica;

#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea mayor que el promedio de precios de los productos de la misma categoría.
SELECT 
	nombre, precio
FROM 
	productos p1
WHERE 
	precio > (SELECT AVG(precio) FROM productos p2 WHERE p1.categoria = p2.categoria);

#Usar Índices
CREATE INDEX idx_categoria ON productos (categoria);

#13. Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea mayor que el promedio de precios de todos los productos.
SELECT 
	nombre, precio
FROM 
	productos
WHERE 
	precio > (SELECT AVG(precio) FROM productos);

#14. Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea mayor que el promedio de precios de los productos de la misma categoría.
SELECT 
	nombre, precio
FROM 
	productos p1
WHERE 
	precio > (SELECT AVG(precio) FROM productos p2 WHERE p1.categoria = p2.categoria);

#15. Seleccionar Productos con Precio Mayor al Mínimo de su Categoría
#Escribe una consulta SQL que seleccione el nombre y el precio de los productos 
#cuyo precio sea mayor que el precio mínimo de los productos de la misma categoría.
SELECT 
	nombre, precio 
FROM 
	productos p1
WHERE  
	precio > (SELECT MIN(precio)FROM productos p2 WHERE p1.categoria = p2.categoria);

#16. Seleccionar Productos con Precio Mayor al Máximo de su Categoría
#Escribe una consulta SQL que seleccione el nombre y el precio de los productos 
#cuyo precio sea mayor que el precio máximo de los productos de la misma categoría.
SELECT 
	nombre, precio 
FROM 
	productos p1
WHERE  
	precio > (SELECT MAX(precio)FROM productos p2 WHERE p1.categoria = p2.categoria);

#17. Seleccionar Productos con Precio Igual al Máximo de su Categoría
#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea igual al precio máximo de los productos de la misma categoría.
SELECT 
	nombre, precio 
FROM 
	productos p1
WHERE  
	precio = (SELECT MAX(precio)FROM productos p2 WHERE p1.categoria = p2.categoria);

#18. Seleccionar Productos con Precio Igual al Mínimo de su Categoría
#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea igual al precio mínimo de los productos de la misma categoría.
SELECT 
	nombre, precio 
FROM 
	productos p1
WHERE  
	precio = (SELECT MIN(precio)FROM productos p2 WHERE p1.categoria = p2.categoria);

#19. Seleccionar Productos con Precio Mayor al Promedio de Todos los Productos
#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea mayor que el promedio de precios de todos los productos en la tabla.
SELECT 
	nombre, precio
FROM 
	productos
WHERE 
	precio > (SELECT AVG(precio)FROM productos);
    
#20. Seleccionar Productos con Precio Mayor al Promedio de Productos de Otra Categoría
#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea mayor que el promedio de precios de los
#productos de una categoría específica (por ejemplo, 'Electrónica').
SELECT 
	nombre, precio
FROM 
	productos p1
WHERE 
	precio > (SELECT AVG(precio)FROM productos p2 WHERE p2.categoria = 'Hogar') AND p1.categoria != 'Hogar';

#21. Seleccionar Productos con Precio Mayor al Promedio de Productos de la Misma Categoría y Fecha de Lanzamiento Reciente
#Escribe una consulta SQL que seleccione el nombre y el precio de los
#productos cuyo precio sea mayor que el promedio de precios de los
#productos de la misma categoría y que hayan sido lanzados después de una fecha específica (por ejemplo, '2020-01-01').ç
select * from productos where categoria = 'Electronica';

SELECT 
	nombre, precio
FROM 
	productos p1
WHERE 
	precio > (SELECT AVG(precio)FROM productos p2 WHERE p1.categoria = p2.categoria) AND p1.categoria = 'Electronica' 
    AND p1.fecha_lanzamiento > '2020-12-31';

#22. Seleccionar Productos con Precio Mayor al Promedio de Productos de la Misma Categoría y Proveedor Asignado
#Escribe una consulta SQL que seleccione el nombre y el precio de los productos cuyo 
#precio sea mayor que el promedio de precios de los productos de la misma categoría y 
#que tengan un proveedor asignado (proveedor_id no es NULL).
SELECT 
	nombre, precio
FROM 
	productos p1
WHERE 
	precio > (SELECT AVG(precio)FROM productos p2 WHERE p1.categoria = p2.categoria) AND p1.proveedor_id is not null;
