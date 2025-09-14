# SQL Practice Questions

This repository contains SQL queries for practicing **data validation, joins, filtering, and basic SQL functions** using sample tables: `Customers`, `Orders`, `Employees`, `Departments`, and `Products`.

## Tables

- **Customers**: `customer_id`, `name`, `phone`, `email`  
- **Orders**: `order_id`, `customer_id`, `order_date`, `ship_date`, `quantity`  
- **Employees**: `emp_id`, `name`, `age`, `salary`, `department_id`  
- **Departments**: `department_id`, `department_name`  
- **Products**: `product_id`, `product_name`, `category_id`, `price`  

---

## SQL Queries with Topics Covered

| # | Query | SQL Topic(s) |
|---|-------|--------------|
| 1 | Find all customers who don’t have a phone number | `SELECT`, `WHERE`, `IS NULL`, `=''` |
| 2 | Count customers with missing email IDs | `SELECT`, `COUNT()`, `WHERE`, `IS NULL` |
| 3 | Find duplicate customer emails | `SELECT`, `COUNT()`, `GROUP BY`, `HAVING`, `WHERE` |
| 4 | Identify customers who provided neither phone nor email | `SELECT`, `WHERE`, `OR`, `IS NULL`, `=''` |
| 5 | List customers whose email does not contain '@' | `SELECT`, `WHERE`, `NOT LIKE` |
| 6 | Count orders with missing ship dates | `SELECT`, `WHERE`, `IS NULL`, `=''` |
| 7 | Find orders with negative quantity | `SELECT`, `WHERE`, `<` (less than) |
| 8 | List orders linked to customers that don’t exist | `SELECT`, `LEFT JOIN`, `WHERE`, `IS NULL` |
| 9 | Find customers who placed orders but are missing | `SELECT`, `LEFT JOIN`, `WHERE`, `IS NULL` |
| 10 | Count orders without valid customer_id | `SELECT`, `LEFT JOIN`, `WHERE`, `IS NULL`, `OR` |
| 11 | List employees with no assigned department | `SELECT`, `LEFT JOIN`, `WHERE`, `IS NULL` |
| 12 | Find employees younger than 18 or older than 60 | `SELECT`, `WHERE`, `<`, `>`, `OR` |
| 13 | Identify employees earning a salary of 0 | `SELECT`, `WHERE`, `=` |
| 14 | Find employees with salaries greater than 1,000,000 | `SELECT`, `WHERE`, `>` |
| 15 | Count employees working in departments that don’t exist | `SELECT`, `COUNT()`, `LEFT JOIN`, `WHERE`, `IS NULL` |

---

## Key SQL Topics Practiced

- **SELECT**: Basic retrieval of data  
- **WHERE**: Filtering rows with conditions  
- **IS NULL / = ''**: Handling missing or empty values  
- **COUNT()**: Aggregation to count rows  
- **GROUP BY & HAVING**: Aggregate with grouping  
- **LEFT JOIN**: Handling missing references across tables  
- **Comparison operators**: `<`, `>`, `=`  
- **OR / AND**: Combining multiple conditions  
- **LIKE / NOT LIKE**: Pattern matching in strings  

---

This structure helps quickly identify the **topic each query is practicing**, making it great for interview preparation.
