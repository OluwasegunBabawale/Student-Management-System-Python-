-- SQL script to create necessary tables
Create TABLE if NOT EXISTS customers (
    customer_id Serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE
);


Create TABLE if NOT EXISTS products (
    product_id Serial PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE IF NOT EXISTS orders (
    order_id Serial PRIMARY KEY,
    customer_id INT not null ,
    Foreign KEY (customer_id) REFERENCES customers(customer_id),
    product_id INT not null ,
    Foreign KEY (product_id) REFERENCES products(product_id),
    quantity INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE
)