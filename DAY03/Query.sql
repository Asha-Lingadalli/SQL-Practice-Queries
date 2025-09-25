
--Easy

--1)List all customers and their cities.
-- select customer_name,city
-- from customers

--2)Get all products with price greater than 500.
-- select *
-- from products
-- where price > 500

--3)Find all orders placed in 2023.
-- select *
-- from orders
-- where DATE_PART('year',order_date) = 2023

--4)Show product names ordered by customer Alice.
-- select product_name
-- from products p
-- join orders o
-- on p.product_id=o.product_id
-- join customers c
-- on o.customer_id = c.customer_id
-- where c.customer_name='Alice'

--5)Count how many products belong to each category.
-- select category,count(product_id) as product_count
-- from products
-- group by category

--Medium (Joins + Aggregates)

--6)Get the total revenue from each product.
-- select p.product_id,p.product_name,sum(p.price * o.quantity) as tota_revenue 
-- from products p
-- join orders o
-- on p.product_id=o.product_id
-- group by p.product_id,p.product_name

-- -- Total revenue per product without quantity column
-- SELECT p.product_id,
--        p.product_name,
--        COUNT(o.order_id) * p.price AS total_revenue
-- FROM products p
-- LEFT JOIN orders o ON p.product_id = o.product_id
-- GROUP BY p.product_id, p.product_name, p.price;

--7)Find customers who never placed an order.
-- select * 
-- from customers c
-- left join orders o
-- on c.customer_id=o.customer_id
-- where o.customer_id is  null

--8)List the top 3 most expensive products.
-- with ranked_products as(
-- select *,
-- row_number() over(order by price desc) as rn
-- from products) 
-- select * from ranked_products
-- where rn <=3

--9)Find the total orders per customer.
-- select customer_id,count(order_id) as total_orders
-- from orders
-- group by customer_id

--10)Get the average order value per city.
-- select c.city,
-- round(avg(p.price * o.quantity),2) as order_total 
-- from orders  o
-- join products  p
-- on o.product_id = p.product_id
-- join customers c
-- on o.customer_id=c.customer_id
-- group by c.city

--11)Show customers who bought more than 1 distinct product.
-- select c.customer_name
-- from customers c
-- join orders o
-- on c.customer_id=o.customer_id
-- join products p
-- on o.product_id=p.product_id
-- group by c.customer_name
-- having  count(distinct p.product_name) > 1


--Hard (Product-company level)

--14)Find the second highest priced product without using LIMIT or TOP.
-- with second_highest_product as(
-- select *,
-- row_number() over(order by price desc)as row_number
-- from products
-- )
-- select *
-- from second_highest_product
-- where row_number = 2

--15)Show the running total revenue month by month for 2023.
-- with sum_rev_total as(
-- select sum(p.price * o.quantity) as sum_rev,DATE_PART('month',order_date) as month,
-- DATE_PART('year',order_date) as year
-- from orders o
-- join products p
-- on o.product_id=p.product_id
-- group by DATE_PART('month',order_date),DATE_PART('year',order_date)
-- )
-- select month,year,sum(sum_rev) over (order by month) as running_total
-- from sum_rev_total
-- where year=2023

--16)Get customers who placed consecutive month orders in 2023.
-- with customer_placed as (
-- select c.customer_id,customer_name,DATE_PART('month',order_date) as month,
-- DATE_PART('year',order_date) as year
-- from customers c
-- join orders o
-- on c.customer_id=o.customer_id
-- )
-- ,numbered as(
-- select *,
-- row_number() over(partition by customer_id order by month) as con_month
-- from customer_placed 
-- where year = 2023
-- )

-- select *,month - con_month as diff
-- from numbered

--17)For each customer, find the first product they ordered.
-- with first_orders as (
-- select c.customer_id,p.product_name,
-- row_number() over(partition by c.customer_id order by o.order_date ) as row_num
-- from customers c
-- join orders o
-- on c.customer_id=o.customer_id
-- join products p
-- on o.product_id=p.product_id
-- )
-- select customer_id,product_name
-- from first_orders
-- where row_num=1

--18)List the top 2 customers (by revenue) from each city.
-- with two_customers as(
-- select sum(p.price * o.quantity) as sum_rev,c.city,c.customer_id,c.customer_name
-- from customers c
-- join orders o
-- on c.customer_id=o.customer_id
-- join products p
-- on o.product_id=p.product_id
-- group by c.city,c.customer_id
-- ),
-- numbered as (
-- select *,
-- row_number() over (partition by city order by sum_rev desc) as rn
-- from two_customers
-- )
-- select *
-- from numbered
-- where rn <= 2

--19)Identify customers who ordered all products in the 'Mobile' category.
-- with customer_mobile_count as (
-- select COUNT(DISTINCT p.product_id) as product_orderd,c.customer_id,c.customer_name 
-- from customers c
-- join orders o
-- on c.customer_id=o.customer_id
-- join products p
-- on o.product_id=p.product_id
-- where p.category='Mobile'
-- group by c.customer_id,c.customer_name
-- )
-- , total_mobile as (
-- select count(*) as total_products
-- from products
-- where category='Mobile'
-- )
-- select customer_id,customer_name
-- from customer_mobile_count,total_mobile
-- where product_orderd = total_products

--20)Find the product that contributed the highest revenue percentage of total revenue.
-- with product_revenue as (
-- select sum(p.price * o.quantity) as rev,p.product_name
-- from orders o
-- join products p
-- on o.product_id=p.product_id
-- group by p.product_id
-- ),
-- ranked_products as(
-- select *,
-- round(rev / sum(rev) over() * 100,2) as revenue_per,
-- ROW_NUMBER() OVER(ORDER BY rev DESC) AS rn
-- from product_revenue
-- order by revenue_per desc
-- )
-- select product_name,revenue_per,rev
-- from ranked_products
-- where rn = 1


