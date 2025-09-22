# SQL Practice Questions

This repository contains **60 SQL practice questions** covering real-world scenarios using sample tables like **Customers, Orders, Employees, Departments, Products, Categories, and Suppliers**.

The questions are grouped by topic for easy navigation and structured practice.

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
8. Get the maximum, minimum, and average salary per department.  
9. Identify departments with more than 1 employee.  
10. Find customers who spent more than 500 in total.  

### Subqueries
11. Find employees who earn more than the average salary.  
12. List customers who placed orders worth more than the highest order of customer_id=2.  
13. Retrieve all products more expensive than the average product price.  
14. Find employees who earn the second highest salary.  
15. List customers whose order count is above the overall average order count.  

### Window Functions
16. Rank employees by salary within each department.  
17. Show running total of order amounts per customer.  
18. Find the top 3 most expensive products.  
19. Get each employee’s salary vs. department average.  
20. Identify the customer who placed the earliest order.  

### Data Definition & Constraints (DDL)
21. Create a table Invoices with invoice_id as PRIMARY KEY and customer_id as FOREIGN KEY.  
22. Alter Employees table to add a new column status VARCHAR(20).  
23. Drop the phone column from Customers.  
24. Add a UNIQUE constraint on email in Customers.  
25. Create an index on Orders(order_date).  

### Data Manipulation (DML)
26. Insert a new order for customer ID 1 with today’s date.  
27. Update salary of employees in IT department (dept_id=30) by 10%.  
28. Delete customers who haven’t placed any order.  
29. Update missing phone numbers with 'Not Provided'.  
30. Insert multiple rows into Products in a single query.  

### Common Table Expressions (CTEs)
31. Use a CTE to find the total sales per customer.  
32. With a CTE, find employees whose salary is above their department’s average.  
33. Write a recursive CTE to generate numbers from 1 to 10.  
34. Use a CTE to get the most recent order per customer.  
35. Find the 2nd highest salary in each department using a CTE and window function.  

### Advanced Subqueries
36. Find customers whose total spending is greater than the average customer spending.  
37. Retrieve products supplied by suppliers who supply more than 1 product.  
38. List employees who earn more than their department’s average but less than the overall company average.  
39. Find customers who placed an order equal to the maximum order amount.  
40. Get all orders that are larger than the average order amount for their customer.  

### String Functions
41. Find customers whose email ends with `.com`.  
42. Display employee first name in uppercase and last name in lowercase.  
43. Extract the domain (after @) from each customer email.  
44. Count how many customers have the substring "com" in their email.  
45. Replace all spaces in employee names with underscores.  

### Date & Time Functions
46. Find all orders placed in the last 30 days.  
47. Count orders grouped by month and year.  
48. Find employees whose hire_date is on a weekend.  
49. Calculate the age of each employee in years.  
50. List customers who have birthdays in the current month.  

### Advanced Aggregations
51. Find the product with the highest revenue (price × quantity sold).  
52. Get the average order amount per month for the last 12 months.  
53. Find departments where the average salary is greater than 50,000.  
54. Calculate the percentage contribution of each employee’s salary within their department.  
55. Identify suppliers who contribute more than 30% of total supplied products.  

### Performance & Indexing
56. Explain the difference between clustered and non-clustered indexes.  
57. Show the execution plan of a query fetching customers with orders.  
58. Create a composite index on Orders(customer_id, order_date).  
59. Identify queries that could benefit from indexing in the Orders table.  
60. Compare performance of EXISTS vs. IN for checking customers with orders.  

---

## Topics Covered

### 🔗 Joins & Relationships
* INNER JOIN, LEFT JOIN, SELF JOIN  
* Identifying unmatched records (e.g., customers without orders, suppliers without products)  
* Hierarchical relationships (employees with managers)  

### 📊 Aggregations
* COUNT, SUM, AVG, MAX, MIN  
* GROUP BY and HAVING clauses  
* Department-wise and customer-wise analytics  

### 🌀 Subqueries
* Scalar subqueries  
* Nested subqueries  
* Comparing row values against aggregated values  

### 📈 Window Functions
* Ranking (RANK, DENSE_RANK, ROW_NUMBER)  
* Running totals  
* Partitioning and ordering  
* Salary vs department average comparisons  

### 🛠 Data Definition & Constraints (DDL)
* CREATE TABLE with PRIMARY KEY and FOREIGN KEY  
* ALTER TABLE (ADD / DROP columns)  
* UNIQUE constraints  
* Index creation  

### ✏️ Data Manipulation (DML)
* INSERT (single and multiple rows)  
* UPDATE (bulk updates, arithmetic updates)  
* DELETE (with joins/conditions)  
* NULL handling with updates  

### 📝 Common Table Expressions (CTEs)
* Simple aggregations with CTEs  
* Recursive CTEs (e.g., number generation)  
* Combining CTEs with window functions  

### ⚡ Advanced Subqueries
* Customer spending vs average  
* Multi-level comparisons  
* Department vs company-wide salary checks  

### 🔤 String Functions
* UPPER, LOWER  
* REPLACE, SUBSTRING, SPLIT_PART  
* Pattern matching with LIKE  

### ⏳ Date & Time Functions
* CURRENT_DATE and INTERVAL calculations  
* DATE_PART and EXTRACT  
* Weekend/weekday checks  
* Age calculation and birthday filters  

### 💰 Advanced Aggregations
* Revenue calculation (price × quantity)  
* Contribution analysis (%)  
* Department-level analytics with HAVING  

### 🚀 Performance & Indexing
* Clustered vs Non-clustered indexes  
* Execution plan analysis (EXPLAIN)  
* Composite indexes for optimization  
* EXISTS vs IN performance comparisons  

---

## 🎯 Purpose

This repository is designed for:  
* **SQL Interview Preparation**  
* **Hands-on practice with real-world queries**  
* **Understanding advanced SQL concepts**  
* **Improving query performance with indexing**  

----
