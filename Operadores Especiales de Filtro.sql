SELECT  'Hola!'  AS tipo_nombre
FROM customers;

-- 1 Ciudades que empiezan con "A" o "B".
-- Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia y el nombre de contacto.

SELECT company_name, city, contact_name
    FROM customers
    WHERE city LIKE 'A%' OR 'B%';
    
-- 2 Número de pedidos que han hecho en las ciudades que empiezan con L.
-- En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".
SELECT city, company_name, contact_name, COUNT(order_id)
    FROM customers
    WHERE city LIKE 'L%'
    GROUP BY city
    UNION 
    SELECT ship_name, ship_city, ship_name
    FROM orders;
    
SELECT city, company_name, contact_name, count(order_id)
    FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    WHERE customers.city LIKE 'L%'
    GROUP BY customers.city ;
    
-- 3 Todos los clientes cuyo "country" no incluya "USA".
-- Nuestro objetivo es extraer los clientes que no sean de USA. Extraer el nombre de contacto, su pais y el nombre de la compañia.
SELECT company_name,country ,contact_name
    FROM customers
    WHERE country NOT IN ('USA');
    
-- 4 Todos los clientes que no tengan una "A" en segunda posición en su nombre.
-- Devolved unicamente el nombre de contacto.
SELECT contact_name
    FROM customers
    WHERE contact_name NOT LIKE '_a%';
    
-- 5 Extraer toda la información sobre las compañias que tengamos en la BBDD
-- Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.
-- Nota: Deberás crear esta columna temporal en cada instrucción SELECT

   