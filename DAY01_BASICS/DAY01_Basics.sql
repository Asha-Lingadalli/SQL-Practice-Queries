--select * from Customers
--1)Find all customers who don’t have a phone number.
SELECT * from Customers
where phone is NULL or phone = '';

--2)Count customers with missing email IDs.Customers
select count(*)
from Customers
where email is  NULL

--3)Find duplicate customer emails
select email,count(*) as duplicate_emails
from Customers
where email is not NULL
GROUP by email
having count(*) > 1


--4)Identify customers who provided neither phone nor email
SELECT * from Customers
where phone is NULL or phone='' OR email is NULL or email='';

--5)List customers whose email does not contain '@'.
SELECT * FROM Customers
where email not like '%@'


--select * from Orders
--6)Count how many orders have missing ship dates.
SELECT * from Orders
WHERE ship_date is NULL or ship_date='';

--7)Find orders with negative quantity.
SELECT * from Orders
where quantity < 0

--SELECT * from Customers

--8)List orders linked to customers that don’t exist in the Customers table.
select * from Orders as o
left join Customers as c 
on o.customer_id = c.customer_id
WHERE c.customer_id is NULL

--9)Find customers who placed orders but are missing from Customers.
SELECT * 
from Orders as o
left join Customers as c
on o.customer_id = c.customer_id
where c.customer_id is NULL


--10)Count how many orders were placed without valid customer_id.
SELECT *
from Orders as o
left join Customers as c
on o.customer_id = c.customer_id
WHERE c.customer_id is NULL  or o.customer_id is  NULL

--SELECT * from Employees
--SELECT * from Departments

--11)List employees with no assigned department
SELECT * FROM Employees as e
left join Departments as d 
on e.department_id = d.department_id
where d.department_id is NULL

--12)Find employees younger than 18 or older than 60.
SELECT * from Employees
WHERE age < 18 or age > 60

--13)Identify employees earning a salary of 0
SELECT * from Departments
WHERE salary = 0
SELECT * from Employees

--14)Find employees with salaries greater than 1,000,000.
SELECT * from Employees
WHERE salary > 1000000

--15)Count employees working in departments that don’t exist in the Departments table.
SELECT count(*) as employee_count from Employees as e
left join Departments as d
on e.department_id = d.department_id
WHERE d.department_id is null 