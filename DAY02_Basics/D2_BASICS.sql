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












