-- 1. Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.

SELECT MAX(order_id), employee_id 
FROM orders
GROUP BY employee_id;

SELECT employee_id, order_date
FROM orders
ORDER BY order_date DESC
GROUP BY employee_id;




SELECT*FROM orders;






-- 3. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.

USE northwind;

SELECT product_id, product_name, category_id
FROM northwind.products
WHERE category_id = (SELECT category_id
FROM northwind.categories
WHERE category_name = "Beverages");


-- OTRA OPCION
SELECT product_id, product_name, products.category_id
FROM northwind.products
INNER JOIN northwind.categories ON products.category_id = categories.category_id
WHERE category_name = "Beverages";


-- 4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.

SELECT c.country 
FROM customers c
WHERE c.country NOT IN (SELECT s.country 
FROM suppliers s)
GROUP BY c.country;



-- 5.Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.

SELECT o.order_id, c.customer_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IN (SELECT order_id 
	FROM order_details od 
	WHERE product_id = 6 AND quantity > 20);


	
SELECT order_id 
FROM order_details od 
WHERE product_id = 6 AND quantity > 20;


SELECT*FROM products p
WHERE product_name = "Grandma's Boysenberry Spread" ;







