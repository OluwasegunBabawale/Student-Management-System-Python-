-- SQL script to insert sample data

INSERT INTO customers (name, email, join_date) VALUES
('Badmus Moridot', 'badmusmoridot.@gmail.com', '2018-11-15'),
('Emperor Shezy', 'emperorshezy@yahoo.com', '2000-08-22'),
('Abdulmalik Saliu', 'abdulmaliksaliu@outlook.com', '1997-09-10'),
('Adeyemo Banjo', 'banjoadeyemo123@gmail.com', '1990-12-17'),
('Babawale Oluwasegun', 'babawaleoluwasegun90@gmail.com', '2000-05-12');



INSERT INTO products (product_name, category, price) VALUES
('Fanta 500ml', 'Drinks', 500.00),
('7UP', 'Drinks', 450.55),
('Donut', 'Snacks', 200.00),
('Potato Chips', 'Snacks', 100.00),
('Amstel Malt', 'Drinks', 650.50);


INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 24, '2025-06-01'),
(2, 3, 12, '2025-05-02'),
(1, 5, 17, '2025-03-03'),
(3, 2, 10, '2025-02-04'),
(4, 4, 25, '2025-01-05');
