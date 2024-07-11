-- 1 Pedidos por empresa en UK:
-- Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
-- Deberéis obtener una tabla similar a esta:

SELECT c.customer_id, c.company_name, COUNT(order_id)
    FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id    
    WHERE c.country = 'UK'
    GROUP BY c.company_name;    

-- 2 Productos pedidos por empresa en UK por año:
-- Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales. La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.
-- El resultado será una tabla similar a esta:

SELECT customers.company_name, YEAR(orders.order_date), SUM(order_details.quantity)
    FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    INNER JOIN order_details
    ON orders.order_id = order_details.order_id
    WHERE country = 'UK'
    GROUP BY customers.company_name, YEAR (orders.order_date);

SELECT c.company_name, YEAR (o.order_date), SUM(od.quantity)
    FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    INNER JOIN order_details AS od
    ON o.order_id = od.order_id
    WHERE country = 'UK'
    GROUP BY c.company_name, YEAR (o.order_date);

SELECT c.company_name AS nombreEmpresa, YEAR (o.order_date) AS año, SUM(od.quantity) AS NumObjetos
    FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    INNER JOIN order_details AS od
    ON o.order_id = od.order_id
    WHERE c.country = 'UK'
    GROUP BY c.company_name, YEAR (o.order_date);

-- 3 Mejorad la query anterior:
-- Lo siguiente que nos han pedido es la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% nos sale como 0.15.

SELECT customers.company_name, YEAR(orders.order_date), SUM(order_details.quantity), SUM((order_details.unit_price - (order_details.unit_price * order_details.discount))*order_details.quantity)
    FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id
    INNER JOIN order_details
    ON orders.order_id = order_details.order_id
    WHERE country = 'UK'
    GROUP BY customers.company_name, YEAR (orders.order_date);
    

SELECT c.company_name AS nombreEmpresa, YEAR (o.order_date) AS año, SUM(od.quantity) AS NumObjetos, SUM(unit_price - (unit_price*discount))*quantity AS CantDinero
    FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    INNER JOIN order_details AS od
    ON o.order_id = od.order_id
    WHERE c.country = 'UK'
    GROUP BY c.company_name, YEAR (o.order_date);

-- 4 BONUS: Pedidos que han realizado cada compañía y su fecha:
-- Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central nos han pedido una consulta que indique el -- nombre de cada compañia cliente junto con cada pedido que han realizado y su fecha.

SELECT customers.company_name, orders.order_id, orders.order_date
    FROM customers
    INNER JOIN orders
    ON customers.customer_id = orders.customer_id;
 
-- BONUS: Tipos de producto vendidos:
-- Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).

SELECT p.category_id, c.category_name, p.product_name, SUM((od.unit_price - (od.unit_price * od.discount)) * od.quantity)
    FROM orders AS o
    INNER JOIN order_details AS od
    ON o.order_id = od.order_id
    INNER JOIN products AS p
    ON od.product_id = p.product_id
    INNER JOIN categories AS c
    ON p.category_id = c.category_id
    ORDER BY p.product_id;

SELECT *
    FROM order_details AS p;

-- Qué empresas tenemos en la BBDD Northwind:
-- Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, los ID de sus pedidos y las fechas

SELECT o.order_id, c.company_name, o.order_date
    FROM customers AS c
    INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;
    
    
    