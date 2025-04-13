--  Create the database
CREATE DATABASE BookstoreDB;
USE BookstoreDB;

--  Tables

-- Country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL
);

-- Address
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Address Status
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_description VARCHAR(50) NOT NULL
);

-- Customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Customer Address (Many-to-Many with status)
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Author
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL
);

-- Book Language
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL
);

-- Publisher
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Book
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20),
    price DECIMAL(10,2),
    publisher_id INT,
    language_id INT,
    stock_quantity INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Book Author (Many-to-Many)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Shipping Method
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100),
    cost DECIMAL(10,2)
);

-- Order Status
CREATE TABLE order_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_description VARCHAR(50)
);

-- Customer Order
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    shipping_method_id INT,
    total_amount DECIMAL(10,2),
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Order Line (Books in each order)
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Order History
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    status_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

--  User and Access Roles

-- Step 1: Create Users
CREATE USER 'cian_admin'@'localhost' IDENTIFIED BY 'AdminCianPass123!';
CREATE USER 'Naima_developer'@'localhost' IDENTIFIED BY 'DevNaimaPass123!';
CREATE USER 'Titus_user'@'localhost' IDENTIFIED BY 'UserPass123!';

-- Step 2: Grant Admin Cina Privileges (ALL)
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'cian_admin'@'localhost' WITH GRANT OPTION;

-- Step 3: Grant Developer Naima Privileges (Read/Write/Modify schema, no user management)
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX ON bookstore_db.* TO 'Naima_developer'@'localhost';

-- Step 4: Grant Regular User Titus Privileges (Read-Only Access)
GRANT SELECT ON bookstore_db.book TO 'Titus_user'@'localhost';
GRANT SELECT ON bookstore_db.author TO 'Titus_user'@'localhost';
GRANT SELECT ON bookstore_db.cust_order TO 'Titus_user'@'localhost';

-- Adding data to the tables
INSERT INTO country (country_name) VALUES 
('Kenya'),
('Uganda'),
('Tanzania'),
('Rwanda'),
('Burundi'),
('South Africa'),
('Ethiopia'),
('Somalia'),
('Nigeria'),
('Ghana');
INSERT INTO order_history (order_id, status_id, status_date) VALUES
(1, 1, '2025-04-01 08:00:00'),  -- Order 1: Status "Pending" on April 1st, 8 AM
(1, 2, '2025-04-02 10:00:00'),  -- Order 1: Status "Processing" on April 2nd, 10 AM
(2, 2, '2025-04-02 09:30:00'),  -- Order 2: Status "Processing" on April 2nd, 9:30 AM
(3, 3, '2025-04-03 12:00:00'),  -- Order 3: Status "Shipped" on April 3rd, 12 PM
(4, 4, '2025-04-04 15:00:00'),  -- Order 4: Status "Delivered" on April 4th, 3 PM
(5, 5, '2025-04-05 16:00:00');  -- Order 5: Status "Cancelled" on April 5th, 4 PM

INSERT INTO order_line (order_id, book_id, quantity, unit_price) VALUES
(1, 1, 2, 500.00),  -- Order 1: 2 copies of "The River Between" at 500 each
(2, 2, 1, 600.00),  -- Order 2: 1 copy of "Things Fall Apart" at 600
(3, 3, 3, 450.00),  -- Order 3: 3 copies of "The White Man of the Nile" at 450 each
(4, 4, 1, 700.00),  -- Order 4: 1 copy of "Coming to Birth" at 700
(5, 5, 2, 650.00);  -- Order 5: 2 copies of "The Promised Land" at 650 each

INSERT INTO cust_order (customer_id, order_date, shipping_method_id, total_amount, status_id) VALUES
(1, '2025-04-01', 1, 1200.00, 1),  -- John Doe's order with Standard Shipping, Pending status
(2, '2025-04-02', 2, 1500.00, 2),  -- Mary Wanjiku's order with Express Shipping, Processing status
(3, '2025-04-03', 3, 2000.00, 3),  -- Ali Abdi's order with Overnight Shipping, Shipped status
(4, '2025-04-04', 4, 3000.00, 4),  -- Grace Mutiso's order with International Shipping, Delivered status
(5, '2025-04-05', 5, 1800.00, 5);  -- Peter Otieno's order with Courier Delivery, Cancelled status

INSERT INTO order_status (status_description) VALUES
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled'),
('Returned');

INSERT INTO shipping_method (method_name, cost) VALUES
('Standard Shipping', 300.00),
('Express Shipping', 600.00),
('Overnight Shipping', 1000.00),
('International Shipping', 1500.00),
('Courier Delivery', 500.00);

INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),  -- "The River Between" by Ngũgĩ wa Thiong'o
(2, 2),  -- "Things Fall Apart" by Chinua Achebe
(3, 3),  -- "The White Man of the Nile" by Marjorie Oludhe Macgoye
(4, 4),  -- "Coming to Birth" by Meja Mwangi
(5, 5);  -- "The Promised Land" by Grace Ogot

INSERT INTO book (title, isbn, price, publisher_id, language_id, stock_quantity) VALUES
('The River Between', '9789966258003', 500.00, 1, 1, 10),
('Things Fall Apart', '9780141023380', 600.00, 2, 1, 15),
('The White Man of the Nile', '9789966462253', 450.00, 3, 1, 20),
('Coming to Birth', '9789966258928', 700.00, 4, 1, 5),
('The Promised Land', '9789966258935', 650.00, 5, 1, 30);

INSERT INTO publisher (publisher_name, contact_email, phone_number) VALUES
('East African Publishers', 'contact@eastafricanpublishers.com', '+254111223344'),
('Longman Kenya', 'info@longmankenya.com', '+254112233445'),
('Oxford University Press', 'support@oup.com', '+254113344556'),
('Macmillan Kenya', 'info@macmillan.com', '+254114455667'),
('Kenya Literature Bureau', 'kib@kbl.co.ke', '+254115566778');

INSERT INTO book_language (language_name) VALUES
('English'),
('Swahili'),
('Kiswahili'),
('French'),
('German'),
('Arabic'),
('Spanish'),
('Yoruba'),
('Luo'),
('Hausa');

INSERT INTO author (author_name) VALUES
('Ngũgĩ wa Thiong\'o'),
('Chinua Achebe'),
('Marjorie Oludhe Macgoye'),
('Meja Mwangi'),
('Grace Ogot');

    INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),  -- John Doe lives at address 1 with 'Active' status
(2, 2, 2),  -- Mary Wanjiku at address 2, 'Inactive'
(3, 3, 1),  -- Ali Abdi at address 3, 'Active'
(4, 4, 3),  -- Grace Mutiso at address 4, 'Pending Verification'
(5, 5, 4);  -- Peter Otieno at address 5, 'Verified'

    INSERT INTO customer (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '+254712345678'),
('Mary', 'Wanjiku', 'mary.wanjiku@example.com', '+254701234567'),
('Ali', 'Abdi', 'ali.abdi@example.com', '+254733445566'),
('Grace', 'Mutiso', 'grace.mutiso@example.com', '+254722334455'),
('Peter', 'Otieno', 'peter.otieno@example.com', '+254711223344');

    INSERT INTO address_status (status_description) VALUES
('Active'),
('Inactive'),
('Pending Verification'),
('Verified'),
('Deprecated');

    
    INSERT INTO address (street, city, postal_code, country_id) VALUES
('Moi Avenue', 'Nairobi', '00100', 1),
('Jinja Road', 'Kampala', '00200', 2),
('Uhuru Street', 'Dar es Salaam', '00300', 3),
('KN 3 Ave', 'Kigali', '00400', 4),
('Boulevard de l’Indépendance', 'Bujumbura', '00500', 5),
('Nimule Road', 'Juba', '00600', 6),
('Bole Road', 'Addis Ababa', '00700', 7),
('Makara Street', 'Mogadishu', '00800', 8),
('Awolowo Road', 'Lagos', '00900', 9),
('Oxford Street', 'Accra', '01000', 10);