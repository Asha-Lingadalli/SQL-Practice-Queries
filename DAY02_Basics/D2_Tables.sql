-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY,
--     name VARCHAR(50),
--     email VARCHAR(100),
--     phone VARCHAR(20)
-- );

-- INSERT INTO Customers (customer_id, name, email, phone) VALUES
-- (1, 'Alice Johnson', 'alice@example.com', '9876543210'),
-- (2, 'Bob Smith', 'bob@example.com', NULL),
-- (3, 'Charlie Brown', 'charlieexample.com', '1234567890'), -- invalid email (no @)
-- (4, 'David Miller', NULL, '9876500000'),
-- (5, 'Eva Green', 'eva@example.com', '');


-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY,
--     customer_id INT,
--     order_date DATE,
--     ship_date DATE,
--     quantity INT,
--     order_amount DECIMAL(10,2),
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
-- );

-- INSERT INTO Orders (order_id, customer_id, order_date, ship_date, quantity, order_amount) VALUES
-- (101, 1, '2025-01-10', '2025-01-15', 5, 500.00),
-- (102, 1, '2025-02-05', NULL, 3, 300.00), -- missing ship date
-- (103, 2, '2025-02-20', '2025-02-25', -2, -200.00), -- negative quantity
-- (104, 3, '2025-03-01', '2025-03-05', 1, 100.00),
-- (105, NULL, '2025-03-10', '2025-03-15', 2, 150.00); -- missing customer_id


-- CREATE TABLE Departments (
--     dept_id INT PRIMARY KEY,
--     dept_name VARCHAR(50)
-- );

-- INSERT INTO Departments (dept_id, dept_name) VALUES
-- (10, 'HR'),
-- (20, 'Finance'),
-- (30, 'IT'),
-- (40, 'Marketing');


-- CREATE TABLE Employees (
--     emp_id INT PRIMARY KEY,
--     emp_name VARCHAR(50),
--     age INT,
--     salary DECIMAL(10,2),
--     dept_id INT,
--     manager_id INT NULL,
--     FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
--     FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
-- );

-- INSERT INTO Employees (emp_id, emp_name, age, salary, dept_id, manager_id) VALUES
-- (1, 'John Doe', 25, 50000, 10, NULL),
-- (2, 'Jane Smith', 45, 1200000, 20, 1),
-- (3, 'Mark Taylor', 17, 20000, 30, 1), -- age < 18
-- (4, 'Lucy Adams', 61, 30000, NULL, 2), -- age > 60, no department
-- (5, 'Tom Harris', 35, 0, 20, 2), -- salary = 0
-- (6, 'Sophia White', 29, 75000, 30, 2);

-- CREATE TABLE Categories (
--     category_id INT PRIMARY KEY,
--     category_name VARCHAR(50)
-- );

-- INSERT INTO Categories (category_id, category_name) VALUES
-- (1, 'Electronics'),
-- (2, 'Clothing'),
-- (3, 'Furniture');


-- CREATE TABLE Products (
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(50),
--     price DECIMAL(10,2),
--     category_id INT,
--     supplier_id INT,
--     FOREIGN KEY (category_id) REFERENCES Categories(category_id)
-- );

-- INSERT INTO Products (product_id, product_name, price, category_id, supplier_id) VALUES
-- (201, 'Laptop', 1200.00, 1, 301),
-- (202, 'Smartphone', 800.00, 1, 301),
-- (203, 'T-Shirt', 20.00, 2, 302),
-- (204, 'Sofa', 700.00, 3, NULL), -- no supplier
-- (205, 'Desk', 150.00, 3, 303);


-- CREATE TABLE Suppliers (
--     supplier_id INT PRIMARY KEY,
--     supplier_name VARCHAR(50)
-- );

-- INSERT INTO Suppliers (supplier_id, supplier_name) VALUES
-- (301, 'TechCorp'),
-- (302, 'FashionHouse'),
-- (303, 'FurniCo'),
-- (304, 'NoProductsSupplier'); -- doesn’t supply anything

-- Customers table
SELECT * FROM Customers;

-- Orders table
SELECT * FROM Orders;

-- Departments table
SELECT * FROM Departments;

-- Employees table
SELECT * FROM Employees;

-- Categories table
SELECT * FROM Categories;

-- Products table
SELECT * FROM Products;

-- Suppliers table
SELECT * FROM Suppliers;




