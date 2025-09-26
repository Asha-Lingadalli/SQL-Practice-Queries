-- -- Customers
-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY,
--     customer_name VARCHAR(50),
--     city VARCHAR(50),
--     join_date DATE
-- );

-- INSERT INTO Customers VALUES
-- (1, 'Alice', 'Seoul', '2022-01-15'),
-- (2, 'Bob', 'Bangalore', '2021-05-22'),
-- (3, 'Charlie', 'Tokyo', '2023-03-10'),
-- (4, 'David', 'Seoul', '2022-07-19'),
-- (5, 'Eva', 'New York', '2021-11-11');

-- -- Products
-- CREATE TABLE Products (
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(50),
--     category VARCHAR(50),
--     price DECIMAL(10,2)
-- );

-- INSERT INTO Products VALUES
-- (101, 'Galaxy S22', 'Mobile', 800.00),
-- (102, 'Galaxy Watch', 'Wearable', 250.00),
-- (103, 'Galaxy Buds', 'Audio', 120.00),
-- (104, 'QLED TV', 'TV', 1500.00),
-- (105, 'Laptop', 'Electronics', 1200.00);

-- -- Orders
-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY,
--     customer_id INT,
--     product_id INT,
--     quantity INT,
--     order_date DATE,
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)
-- );

-- INSERT INTO Orders VALUES
-- (1001, 1, 101, 1, '2023-01-05'),
-- (1002, 2, 104, 2, '2023-02-12'),
-- (1003, 3, 103, 3, '2023-03-15'),
-- (1004, 1, 105, 1, '2023-04-20'),
-- (1005, 4, 101, 2, '2023-05-25'),
-- (1006, 5, 102, 1, '2023-06-10'),
-- (1007, 2, 105, 1, '2023-07-18'),
-- (1008, 3, 101, 1, '2023-08-22'),
-- (1009, 4, 104, 1, '2023-09-01'),
-- (1010, 1, 103, 2, '2023-10-12');

-- Example: update some orders to have NULL customer_id
-- UPDATE orders
-- SET customer_id = NULL
-- WHERE order_id IN (1, 2, 3);  -- pick a few order_ids


-- select * from customers
-- select * from Products
-- select * from Orders

