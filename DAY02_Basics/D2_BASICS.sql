-- SELECT * FROM Customers;
-- SELECT * FROM Orders;
-- SELECT * FROM Departments;
-- SELECT * FROM Employees;
-- SELECT * FROM Categories;
-- SELECT * FROM Products;
-- SELECT * FROM Suppliers;

-- Joins & Relationships

--1)List all products along with their category names.
-- select p.product_id,p.product_name,c.category_name
-- from products p
-- inner join categories c 
-- on p.category_id = c.category_id

--2)Find customers who have never placed an order
-- select * from customers c
-- left join orders o
-- on c.customer_id = o.customer_id
-- where o.customer_id is Null 

-- 3)Retrieve orders with customer name and email
-- select o.order_id,c.name,c.email
-- from orders o
-- inner join customers c
-- on o.customer_id = c.customer_id

-- 4)List employees along with their manager’s name
-- select e1.emp_id,e1.emp_name,e2.emp_name as manager_name
-- from employees e1
-- join employees e2
-- on e1.manager_id = e2.emp_id

--5)Find suppliers who do not supply any products
-- select * 
-- from suppliers s
-- left join products p
-- on s.supplier_id = p.supplier_id
-- where p.supplier_id is null

--Aggregations
-- 6)Count the number of orders placed by each customer
-- select count(order_id) as no_of_orders,c.customer_id,c.name
-- from orders o
-- join customers c
-- on o.customer_id = c.customer_id
-- group by c.name,c.customer_id


--7)Find the average order amount per customer
--This shows since we have customer_id in orders table
--we have to add where clause is not null to eliminate them.

-- select o.customer_id,avg(order_amount) as order_amount
-- from orders o
-- group by o.customer_id

--This shows without null
-- select avg(order_amount) as order_amount,c.customer_id
-- from orders o
-- join customers c
-- on o.customer_id = c.customer_id
-- group by c.customer_id


--8)Get the maximum, minimum, and average salary per department
-- select max(salary) as max_salary,min(salary) as min_salary,avg(salary) as avg_salary 
-- from employees e
-- join departments d
-- on e.dept_id = d.dept_id
-- group by d.dept_id

--9)Identify departments with more than 1 employees
-- select d.dept_id,d.dept_name
-- from  departments d
-- left join employees e
-- on d.dept_id = e.dept_id
-- group by d.dept_id,d.dept_name
-- having Count(e.emp_id) > 1

--10)Find customers who spent more than 500 in total
-- select sum(order_amount) as spent_amt,c.customer_id,c.name
-- from customers c
-- left join orders o
-- on c.customer_id=o.customer_id
-- group by c.customer_id
-- having sum(order_amount) > 500


--Subqueries
--11)Find employees who earn more than the average salary
-- select *
-- from employees 
-- where salary >(select avg(salary) from employees)


--12)List customers who placed orders worth more than the highest order of customer_id=2.
-- select * 
-- from customers c
-- join orders o
-- on c.customer_id = o.customer_id 
-- where o.order_amount >
-- (select max(order_amount)from orders where customer_id =2)

--13)Retrieve all products more expensive than the average product price 
-- select *
-- from products
-- where price >
-- (select avg(price) from products)

--14)Find employees who earn the second highest salary
-- select *
-- from employees
-- where salary =
-- (select max(salary) from employees where salary < 
-- (select max(salary) from employees))

--3rd highest salary
-- select *
-- from employees
-- where salary =
-- (select max(salary) from employees where salary < 
-- (select max(salary) from employees where salary <(select max(salary) from employees)))

--15)List customers whose order count is above the overall average order count.
-- select customer_id,count(*) as order_count
-- from orders
-- group by customer_id
-- having count (*) >
-- (select  avg(order_count) 
-- from (select count(*) as order_count from orders 
-- group by customer_id))


-- Window Functions

--16)Rank employees by salary within each department
-- select * ,
-- DENSE_RANK() over(partition by dept_id order by salary desc) as salary_rank
-- from employees

--17)Show running total of order amounts per customer
--(previous +present goes over customer_id to group first
--keep same second adds previous + present same goes for other groups too.)

-- select order_id,customer_id,order_date,order_amount,
-- sum(order_amount)over(partition by customer_id order by order_date)
-- from orders

--18)Find the top 3 most expensive products

-- select price 
-- from products
-- order by price desc
-- limit 3

-- Use dense_rank() function
-- select price ,
-- DENSE_RANK() over(order by price desc)
-- from products
-- limit 3

--19)Get each employee’s salary vs. department average.
-- select dept_id,salary,
-- avg(salary)over(partition by dept_id) as department_average
-- from employees 

--20)Identify the customer who placed the earliest order
-- with ranked_orders as (
-- select customer_id,order_date,
-- RANK() over(order by order_date ) as order_rank
-- from orders
-- )
-- select  customer_id,order_date
-- from ranked_orders
-- where order_rank = 1

-- Data Definition & Constraints

--21)Create a table Invoices with invoice_id as PRIMARY KEY and customer_id as FOREIGN KEY.
-- create table Invoices(
-- invoice_id int primary key,
-- customer_id int references customers(customer_id)
-- )

--22)Alter Employees table to add a new column status VARCHAR(20).
-- alter table employees
-- add status varchar(20)

--23)Drop the phone column from Customers (instead of middle_name).
-- alter table customers
-- drop column phone;

--24)Add a UNIQUE constraint on email in Customers.
-- alter table customers
-- add unique (email)

--when we try to add same email we get error
-- update customers
-- set email = 'alice@example.com'
-- where customer_id = 4

--25)Create an index on Orders(order_date).
-- create index idx_order_date
-- on orders(order_date)

-- SELECT * FROM orders
-- WHERE order_date = '2025-01-10';


-- Data Manipulation

-- 26)Insert a new order for customer ID 1 with today’s date.
-- INSERT INTO Orders (order_id, customer_id, order_date, ship_date, quantity, order_amount)
-- VALUES (106, 1, CURRENT_DATE, NULL, 2, 200.00);

-- 27)Update salary of employees in IT department (dept_id=30) by 10%.
-- update employees
-- set salary = salary * 1.10
-- where dept_id = 30

-- 28)Delete customers who haven’t placed any order.
-- select * 
-- from customers c
-- left join orders o
-- on c.customer_id = o.customer_id
-- where o.customer_id is null

-- delete from customers
-- where customer_id in(4,5) 

-- select * from customers

-- 29)Update missing phone numbers with 'Not Provided'.
--added phone again
-- alter table customers
-- add column phone varchar(20)
--updated agin
-- update customers
-- set phone = 1234567890
-- where customer_id in(1,3)
--update where it is missing
-- update customers
-- set phone = 'Not provided'
-- where phone is null

-- 30)Insert multiple rows into Products in a single query.
-- select * from products

-- INSERT INTO Products (product_id, product_name, price, supplier_id)
-- VALUES
-- (206, 'Mac-Book', 1300, 2),
-- (207, 'iPad', 900, 2),
-- (208, 'AirPods', 200, 3);

--updating multiple products
-- update products
-- set supplier_id = case product_id 
-- when 206 then 302
-- when 208 then 304
-- end
-- where product_id in (206,208)


-----CTE

--31)Use a CTE to find the total sales per customer.
-- with customer_sales as (
-- select customer_id, sum(order_amount) as total_sales
-- from orders 
-- group by customer_id
-- )
-- select *
-- from customer_sales


--32)With a CTE, find employees whose salary is above their department’s average.
-- with dept_avg as(
-- select dept_id,avg(salary) as dept_avg
-- from employees
-- group by dept_id
-- )
-- select e.emp_id,e.salary,d.dept_avg
-- from employees e
-- join dept_avg d
-- on e.dept_id = d.dept_id
-- where e.salary > d.dept_avg


--33)Write a recursive CTE to generate numbers from 1 to 10.
-- with recursive numbers as(
-- --base Case
-- select 1 as num
-- union all
-- --Recursive case
-- select num + 1
-- from numbers
-- where num < 10
-- )
-- select * from numbers


--34)Use a CTE to get the most recent order per customer.
-- with recent_orders as(
-- select customer_id,max(order_date) as order_date
-- from orders
-- group by customer_id
-- )
-- select *
-- from orders o
-- join recent_orders r
-- on o.customer_id =r.customer_id
-- and o.order_date = r.order_date
-- order by r.order_date desc


--35)Find the 2nd highest salary in each department using a CTE and window function.
-- with second_highest_salary as(
-- select *,
-- row_number() over(partition by dept_id order by salary desc ) as rank_number
-- from employees
-- )
-- select *
-- from second_highest_salary
-- where rank_number=2

--subqueries(Advanced)

--36)Find customers whose total spending is greater than the average customer spending.
-- select customer_id,sum(order_amount) as total_spent
-- from orders
-- group by customer_id
-- having sum(order_amount) > 
-- (select avg(avg_amt) from (
-- (select sum(order_amount) as avg_amt from orders group by customer_id)
-- ) as customer_totals
-- )

--37)Retrieve products supplied by suppliers who supply more than 1 products.
-- select * 
-- from products
-- where supplier_id IN
-- (select supplier_id
-- from products
-- group by supplier_id
-- having count(*) > 1)


--38)List employees who earn more than their department’s average but less than the overall company average.
-- select * from employees e
-- WHERE
-- salary >
-- (SELECT AVG(salary) as dept_avg FROM employees WHERE dept_id = e.dept_id)
-- and salary < 
-- (SELECT AVG(salary) as overall_avg FROM employees) 

--39)Find customers who placed an order equal to the maximum order amount.
-- select *
-- from customers c
-- join orders o
-- on c.customer_id=o.customer_id
-- where o.order_amount =
-- (select max(order_amount)
-- from orders)


--40)Get all orders that are larger than the average order amount for their customer.
-- select * from orders o
-- where order_amount > (select avg(order_amount)
-- from orders
-- where customer_id = o.customer_id)


--String Functions

--41)Find customers whose email ends with .com.
-- select * from customers
-- where email like '%.com'

--42)Display employee first name in uppercase and last name in lowercase.
-- select upper(SPLIT_PART(emp_name, ' ', 1)) AS first_name,
--     lower(SPLIT_PART(emp_name, ' ', 2)) AS last_name
-- from employees

--43)Extract the domain (after @) from each customer email
-- select substring(email from position ('@' in email) + 1) as mail
-- from customers

--or substring can also used
-- SELECT SPLIT_PART(email, '@', 2) AS domain
-- FROM customers;

--44)Count how many customers have the substring com in their email.
-- select count(*)
-- from customers
-- where email like '%com%'

--45)Replace all spaces in employee names with underscores
-- select replace(emp_name,' ', '_') as emp_name
-- from employees


-- Date & Time Functions

--46)Find all orders placed in the last 30 days.
-- select *
-- from orders
-- where order_date >= current_date - interval '30 days'

--47)Count orders grouped by month and year.
-- select count(order_id) as total_orders,DATE_PART('month',order_date) as order_month,
-- DATE_PART('year',order_date) as order_year
-- from orders
-- group by order_month,order_year

--48)Find employees whose hire_date is on a weekend.
-- SELECT emp_id, hire_date
-- FROM employees
-- WHERE EXTRACT(DOW FROM hire_date) IN (0, 6);

--49)Calculate the age of each employee in years.
-- select age
-- from employees

--50)List customers who have birthdays in the current month.
-- select *
-- from customers
-- where extract(month from dob)= EXTRACT(MONTH FROM CURRENT_DATE);


-- Advanced Aggregations

--51)Find the product with the highest revenue (price × quantity sold).
-- select p.product_id,p.product_name,sum(p.price * o.quantity) as total_revenue
-- from products p
-- join orders o
-- on p.product_id = o.product_id
-- group by p.product_id,p.product_name
-- order by total_revenue desc
-- limit 1

--52)Get the average order amount per month for the last 12 months.
-- select date_part('month',order_date) as order_month,
-- date_part('year',order_date) as order_year ,avg(order_amount) as avg_order_month
-- from orders
-- where order_date >= current_date - interval '12 months'
-- group by order_year,order_month
-- order by  order_year,order_month

--53)Find departments where the average salary is greater than 50,000.
-- select avg(salary) as avg_salary,d.dept_id,dept_name 
-- from employees e
-- join departments d
-- on e.dept_id = d.dept_id
-- group by d.dept_id,d.dept_name 
-- having avg(salary) > 50000

--54)Calculate the percentage contribution of each employee’s salary within their department.
-- select emp_id,dept_id,salary,
-- round((salary / sum(salary) over (partition by dept_id) * 100),2)|| '%' as salary_percentage
-- from employees

--55)Identify suppliers who contribute more than 30% of total supplied products.
-- with supplier_per as(
-- select supplier_id,sum(price) as supplier_total,
-- round((sum(price) / sum(sum(price)) over () * 100),2) as contribution_percentage
-- from products 
-- group by supplier_id
-- )
-- select *
-- from supplier_per
-- where contribution_percentage > 30


-- Performance & Indexing

--56)Explain the difference between clustered and non-clustered indexes.
-- Clustered Index:
-- Determines the physical order of data in the table.
-- Table rows are stored in the order of the clustered index key.
-- Each table can have only one clustered index (because rows can only be sorted one way).
-- Typically used on primary keys.
-- Pros: Fast retrieval for range queries and sorting.
-- Cons: Inserting or updating can be slower because physical order must be maintained.
-- Example:
-- If you have a CustomerID clustered index, the table rows are physically arranged in ascending CustomerID order.

-- Non-Clustered Index:
-- Does not affect the physical order of the table.
-- Creates a separate structure (like a pointer) to the actual table rows.
-- A table can have multiple non-clustered indexes.
-- Good for searching/filtering on columns that aren’t primary keys.
-- Pros: Faster search on non-key columns without rearranging the table.
-- Cons: Extra storage, slightly slower writes (insert/update/delete) due to maintaining the index.
-- Example:
-- A non-clustered index on LastName allows you to quickly find customers by last name without changing the table’s physical order.


--57)Show the execution plan of a query fetching customers with orders.
-- Show execution plan
-- EXPLAIN ANALYZE
-- SELECT c.customer_id, c.name, o.order_id, o.order_date
-- FROM customers c
-- JOIN orders o 
-- ON c.customer_id = o.customer_id;


--58)Create a composite index on Orders(customer_id, order_date).
-- create index idx_orders_customer_date
-- on orders (customer_id,order_date)
--example:
-- SELECT *
-- FROM orders
-- WHERE customer_id = 1
--   AND order_date >= '2025-01-01';


--59)Identify queries that could benefit from indexing in the Orders table.
-- select * from orders
-- where customer_id=2

--60)Compare performance of EXISTS vs. IN for checking customers with orders.
--IN
-- select * 
-- from customers c
-- where c.customer_id in (
-- select o.customer_id
-- from orders o
-- )

--Exists
-- SELECT *
-- FROM customers c
-- WHERE EXISTS (
--     SELECT 1
--     FROM orders o
--     WHERE o.customer_id = c.customer_id
-- );








