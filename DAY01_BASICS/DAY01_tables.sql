-- Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50)
);

-- Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    ship_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    department_id INT
);

-- Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    price DECIMAL(10,2)
);


-- Insert sample data in the tables
-- Customers
INSERT INTO Customers VALUES
(1, 'Alice', '1234567890', 'alice@mail.com'),
(2, 'Bob', NULL, 'bob@mail.com'),
(3, 'Charlie', '', 'charlie@mail.com'),
(4, 'David', '9876543210', NULL);

-- Orders
INSERT INTO Orders VALUES
(101, 1, '2025-09-01', '2025-09-03', 2),
(102, 2, '2025-09-02', NULL, 1),
(103, 5, '2025-09-05', '2025-09-07', -3); -- invalid customer + negative qty

-- Employees
INSERT INTO Employees VALUES
(201, 'Emma', 25, 50000, 10),
(202, 'John', 17, 30000, NULL),  -- age below 18
(203, 'Sophia', 61, 1200000, 11), -- age > 60 + high salary
(204, 'Mike', 35, 0, 15); -- salary = 0

-- Departments
INSERT INTO Departments VALUES
(10, 'HR'),
(11, 'Finance');

-- Products
INSERT INTO Products VALUES
(301, 'Laptop', 1, 800),
(302, 'Phone', NULL, 500),
(303, 'Tablet', 2, 0); -- price = 0
