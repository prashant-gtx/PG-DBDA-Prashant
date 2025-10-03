CREATE DATABASE IF NOT EXISTS shopdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shopdb;

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(80) NOT NULL,
email VARCHAR(120) NOT NULL UNIQUE,
city VARCHAR(60) NOT NULL,
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
stock_qty INT NOT NULL CHECK (stock_qty >= 0),
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
INDEX idx_products_category (category)
) ENGINE=InnoDB;

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
status ENUM('NEW','PAID','SHIPPED','CANCELLED') NOT NULL DEFAULT 'NEW',
total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON UPDATE CASCADE ON DELETE RESTRICT,
INDEX idx_orders_customer (customer_id),
INDEX idx_orders_date (order_date)
) ENGINE=InnoDB;

CREATE TABLE order_items (
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
PRIMARY KEY (order_id, product_id),
CONSTRAINT fk_oi_order
FOREIGN KEY (order_id) REFERENCES orders(order_id)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_oi_product
FOREIGN KEY (product_id) REFERENCES products(product_id)
ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO customers (full_name, email, city) VALUES
('Aditi Rao','aditi@example.com','Mumbai'),
('Rohan Das','rohan@example.com','Pune'),
('Meera Singh','meera@example.com','Delhi'),
('Imran Ali','imran@example.com','Mumbai');

INSERT INTO products (name, category, price, stock_qty) VALUES
('Wireless Mouse','Electronics',799.00, 50),
('Mechanical Keyboard','Electronics',3499.00, 30),
('Office Chair','Furniture',5999.00, 15),
('Notebook A5','Stationery',99.00, 200),
('Ball Pen Blue','Stationery',15.00, 500);

INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2025-09-10 10:05:00', 'PAID', 0),
(1, '2025-09-15 12:30:00', 'SHIPPED', 0),
(2, '2025-09-20 09:45:00', 'NEW', 0),
(3, '2025-09-25 16:10:00', 'PAID', 0);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 799.00), -- 2 Wireless Mouse
(1, 4, 5, 99.00), -- 5 Notebook A5
(2, 2, 1, 3499.00), -- 1 Mechanical Keyboard
(2, 5, 10, 15.00), -- 10 Ball Pen Blue
(3, 3, 1, 5999.00), -- 1 Office Chair
(4, 1, 1, 799.00), -- 1 Wireless Mouse
(4, 2, 1, 3499.00); -- 1 Mechanical Keyboard

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

INSERT INTO employees (emp_name, dept_id, salary) VALUES
('Aditi Sharma', 1, 60000.00),
('Rohan Mehta', 1, 75000.00),
('Sneha Kapoor', 1, 75000.00),
('Imran Khan', 2, 50000.00),
('Meera Nair', 2, 80000.00),
('Karan Patel', 2, 45000.00),
('Nisha Rao', 3, 90000.00),
('Vikas Yadav', 3, 70000.00),
('Arjun Das', 3, 90000.00);