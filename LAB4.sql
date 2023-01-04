USE FptAptechBikeStore
GO
--Lay ra du lieu cua bang customers co customers_id 
SELECT *
FROM sales.customers
WHERE customer_id >= 00 AND customer_id <=100
--lay ra du lieu cua bang customer co customer_id trong khoang (100, 200)
SELECT * FROM sales.customers
WHERE customer_id BETWEEN 100 AND 200
--LAY ra nhuwng customer co lastname ket thuc boi ky tu e
SELECT * FROM sales.customers
WHERE last_name LIKE '%e'
--lay ra nhung customer co lastname bat dau bang ky tu R hoac A, ket thuc boi ky tu e
SELECT * FROM sales.customers
WHERE last_name LIKE '[r]%e'
--su dung  lenh INNER JOIN
SELECT  product_name, brand_id
FROM sales.order_items as oi INNER JOIN production.products p
ON oi.product_id = p.product_id


--GROUP BY
SELECT  customer_id,store_name,s.staff_id, st.store_id
FROM sales.orders as o
INNER JOIN sales.stores st
ON st.store_id  = o.store_id
INNER JOIN sales.staffs s
ON o.staff_id = s.staff_id

SELECT first_name, item_id,c.customer_id
FROM sales.customers as c
INNER JOIN sales.orders as o
ON c.customer_id = o.customer_id
INNER JOIN sales.order_items as u
ON u.order_id = o.order_id




GROUP BY customer_id , YEAR(order_date)
ORDER BY customer_id

SELECT product_name, brand_name
FROM production.products as pr
INNER JOIN production.brands br
ON pr.brand_id = br.brand_id

SELECT c.first_name as NameCUS, ST.first_name AS NameST, product_name AS NamePr, oi.list_price
FROM sales.customers as c
INNER JOIN sales.orders o
ON C.customer_id = o.customer_id
INNER JOIN sales.staffs st
ON O.staff_id = st.staff_id
INNER JOIN sales.order_items OI
ON OI.order_id = o.order_id
INNER JOIN production.products P
ON P.product_id = OI.product_id






