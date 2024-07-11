-- Extraed información de los productos "Beverages"
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



