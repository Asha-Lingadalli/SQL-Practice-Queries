# SQL Practice Questions

This repository contains SQL practice exercises covering various real-world scenarios using sample tables like Customers, Orders, Employees, Departments, Products, Categories, and Suppliers.

---

## Questions Covered

### Joins & Relationships
1. List all products along with their category names.
2. Find customers who have never placed an order.
3. Retrieve orders with customer name and email.
4. List employees along with their manager’s name.
5. Find suppliers who do not supply any products.

### Aggregations
6. Count the number of orders placed by each customer.
7. Find the average order amount per customer.
8. Get maximum, minimum, and average salary per department.
9. Identify departments with more than 1 employee.
10. Find customers who spent more than 500 in total.

### Subqueries
11. Find employees who earn more than the average salary.
12. List customers who placed orders worth more than the highest order of customer_id=2.
13. Retrieve all products more expensive than the average product price.
14. Find employees who earn the second highest salary.
15. List customers whose order count is above the overall average order count.

# SQL Practice Questions (Part 2)

This set continues from Question 16 onward, covering Window Functions, Data Definition & Constraints, Data Manipulation.

---

## Window Functions

16) Rank employees by salary within each department.  
17) Show running total of order amounts per customer.  
18) Find the top 3 most expensive products.  
19) Get each employee’s salary vs. department average.  
20) Identify the customer who placed the earliest order.  

---

## Data Definition & Constraints

21) Create a table Invoices with invoice_id as PRIMARY KEY and customer_id as FOREIGN KEY.  
22) Alter Employees table to add a new column status VARCHAR(20).  
23) Drop the phone column from Customers.  
24) Add a UNIQUE constraint on email in Customers.  
25) Create an index on Orders(order_date).  

---

## Data Manipulation

26) Insert a new order for customer ID 1 with today’s date.  
27) Update salary of employees in IT department (dept_id=30) by 10%.  
28) Delete customers who haven’t placed any order.  
29) Update missing phone numbers with 'Not Provided'.  
30) Insert multiple rows into Products in a single query.  

---


## Topics Covered

This set of queries helps practice the following SQL concepts:

- **Joins**
  - Inner Join
  - Left Join
  - Self Join

- **Aggregations**
  - COUNT, SUM, AVG, MAX, MIN
  - GROUP BY and HAVING clauses
  - Conditional aggregations

- **Subqueries**
  - Scalar subqueries
  - Nested subqueries
  - Using subqueries with WHERE and HAVING clauses

- **Filtering**
  - WHERE clause conditions
  - NULL value handling

- **Ranking and Comparison**
  - Finding highest, second-highest, or specific-ranked values
  - Comparing individual records to aggregated values

- **Data Analysis Queries**
  - Customer purchase analysis
  - Department-wise salary analysis
  - Product price comparison
  - Supplier-product relationships

- **Window Functions  
  Topics Covered:** Ranking, running totals, dense rank, averages, partitioning, ordering.  

## Data Definition & Constraints  
**Topics Covered:** Primary Key, Foreign Key, ALTER, DROP, UNIQUE, INDEX. 

## Data Manipulation  
**Topics Covered:** INSERT, UPDATE, DELETE, NULL handling, CASE-based updates.

---

This repository is ideal for **SQL practice, learning advanced queries, and interview preparation**.
