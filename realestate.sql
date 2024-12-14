-- Online SQL Editor to Run SQL Online.
-- Use the editor to create new tables, insert data and all other SQL operations.
  --Roll Numbers: 22i-1583,22i-1773,22i-1765
-- Create the database
CREATE DATABASE RealEstateDB;

-- Use the database
USE RealEstateDB;

-- Table for owner
CREATE TABLE owner (
    owner_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);
-- I.nserting data into owner table
INSERT INTO owner (owner_id, name, contact_number, email)
VALUES
    (1, 'John Doe', '1234567890', 'john@example.com'),
    (2, 'Jane Smith', '0987654321', 'jane@example.com'),
    (3, 'Michael Jordan', '5550001111', 'mjordan@example.com'),
    (4, 'Elena Fisher', '5553336666', 'efisher@example.com'),
    (5, 'Nathan Drake', '5554447777', 'ndrake@example.com'),
    (6, 'Lara Croft', '5555558888', 'lcroft@example.com'),
    (7, 'Tony Stark', '5556669999', 'tstark@example.com');


-- Table for location
CREATE TABLE location (
    location_id INT PRIMARY KEY,
    l_zipcode VARCHAR(15) NOT NULL,
    l_city VARCHAR(15) NOT NULL,
    l_address VARCHAR(20) NOT NULL,
    l_state VARCHAR(10) NOT NULL
);

INSERT INTO location (location_id, l_zipcode, l_city, l_address, l_state)
VALUES
    (1, '10001', 'New York', '123 Main St', 'NY'),
    (2, '90001', 'Los Angeles', '456 Elm St', 'CA'),
    (3, '60601', 'Chicago', '789 Oak St', 'IL'),
    (4, '94103', 'San Francisco', '101 Pine St', 'CA'),
    (5, '33101', 'Miami', '202 Palm St', 'FL'),
    (6, '77001', 'Houston', '303 Cedar St', 'TX'),
    (7, '85001', 'Phoenix', '404 Maple St', 'AZ');


-- Table for property
CREATE TABLE property (
    property_id INT PRIMARY KEY,
    location_id INT,
    owner_id INT,
    type VARCHAR(15) NOT NULL,
    size DECIMAL(10, 2) NOT NULL,
    p_status VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES location(location_id),
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);

-- Inserting data into property table
INSERT INTO property (property_id, location_id, owner_id, type, size, p_status, price)
VALUES
    (1, 1, 1, 'Apartment', 850.50, 'Available', 150000),
    (2, 2, 2, 'House', 1200.75, 'Sold', 300000),
    (3, 3, 3, 'Condo', 900.00, 'Available', 200000),
    (4, 4, 4, 'Villa', 2500.00, 'Sold', 500000),
    (5, 5, 5, 'Studio', 600.00, 'Available', 120000),
    (6, 6, 6, 'Duplex', 1800.00, 'Available', 400000),
    (7, 7, 7, 'Mansion', 4500.00, 'Sold', 1000000);



-- Table for property_image
CREATE TABLE property_image (
    image_id INT PRIMARY KEY,
    property_id INT,
    image_url VARCHAR(200) NOT NULL,
    caption VARCHAR(50) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

-- Inserting data into property_image table
INSERT INTO property_image (image_id, property_id, image_url, caption)
VALUES
    (1, 1, 'http://example.com/img1.jpg', 'Front View'),
    (2, 2, 'http://example.com/img2.jpg', 'Backyard'),
     (3, 3, 'http://example.com/img3.jpg', 'Living Room'),
    (4, 4, 'http://example.com/img4.jpg', 'Swimming Pool'),
    (5, 5, 'http://example.com/img5.jpg', 'Kitchen'),
    (6, 6, 'http://example.com/img6.jpg', 'Bedroom'),
    (7, 7, 'http://example.com/img7.jpg', 'Garage');

-- Table for inspection
CREATE TABLE inspection (
    inspection_id INT PRIMARY KEY,
    inspection_date DATE NOT NULL,
    inspector_name VARCHAR(50) NOT NULL,
    comments VARCHAR(50) NOT NULL,
    property_id INT,
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

-- Inserting data into inspection table
INSERT INTO inspection (inspection_id, inspection_date, inspector_name, comments, property_id)
VALUES
    (1, '2024-01-15', 'Mike Johnson', 'Good condition', 1),
    (2, '2024-02-20', 'Sarah Lee', 'Needs repair', 2),
     (3, '2024-03-15', 'Chris Redfield', 'Spacious and clean', 3),
    (4, '2024-04-10', 'Jill Valentine', 'Needs repainting', 4),
    (5, '2024-05-05', 'Leon Kennedy', 'Excellent condition', 5),
    (6, '2024-06-20', 'Ada Wong', 'Minor issues', 6),
    (7, '2024-07-30', 'Claire Redfield', 'Perfect for families', 7);
    

-- Table for customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    preferred_property_type VARCHAR(25),
    email VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15) NOT NULL
);

-- Inserting data into customer table
INSERT INTO customer (customer_id, name, preferred_property_type, email, contact_number)
VALUES
    (1, 'Alice Brown', 'Apartment', 'alice@example.com', '5551112233'),
    (2, 'Bob Green', 'House', 'bob@example.com', '5552223344'),
    (3, 'Charlie White', 'Condo', 'charlie@example.com', '5551115555'),
    (4, 'Daisy Blue', 'Villa', 'daisy@example.com', '5552226666'),
    (5, 'Ethan Black', 'Studio', 'ethan@example.com', '5553337777'),
    (6, 'Fiona Green', 'Duplex', 'fiona@example.com', '5554448888'),
    (7, 'George Yellow', 'Mansion', 'george@example.com', '5555559999');

-- Table for rental (after customer table)
CREATE TABLE rental (
    rental_id INT PRIMARY KEY,
    property_id INT,
    customer_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

-- Inserting data into rental table
INSERT INTO rental (rental_id, property_id, customer_id, start_date, end_date)
VALUES
    (1, 1, 1, '2024-03-01', '2025-02-28'),
    (2, 2, 2, '2024-04-01', '2025-03-31'),
    (3, 3, 3, '2024-05-01', '2025-04-30'),
    (4, 4, 4, '2024-06-01', '2025-05-31'),
    (5, 5, 5, '2024-07-01', '2025-06-30'),
    (6, 6, 6, '2024-08-01', '2025-07-31'),
    (7, 7, 7, '2024-09-01', '2025-08-31');

-- Table for agent
CREATE TABLE agent (
    agent_id INT PRIMARY KEY,
    name VARCHAR(20),
    contact_number VARCHAR(15),
    email VARCHAR(55),
    agency_name VARCHAR(50)
);

-- Inserting data into agent table
INSERT INTO agent (agent_id, name, contact_number, email, agency_name)
VALUES
    (1, 'Sam Adams', '5553334455', 'sam@example.com', 'City Real Estate'),
    (2, 'Nancy Wilson', '5554445566', 'nancy@example.com', 'Prime Realty'),
     (3, 'Bruce Wayne', '5556660000', 'bwayne@example.com', 'Gotham Realty'),
    (4, 'Clark Kent', '5557771111', 'ckent@example.com', 'Metropolis Properties'),
    (5, 'Diana Prince', '5558882222', 'dprince@example.com', 'Amazon Estates'),
    (6, 'Barry Allen', '5559993333', 'ballen@example.com', 'Speed Realty'),
    (7, 'Arthur Curry', '5550004444', 'acurry@example.com', 'Atlantis Homes');

-- Table for payment
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_type VARCHAR(30)
);

-- Inserting data into payment table
INSERT INTO payment (payment_id, amount, payment_date, payment_type)
VALUES
    (1, 150000.00, '2024-05-01', 'Credit Card'),
    (2, 300000.00, '2024-06-01', 'Bank Transfer'),
    (3, 200000.00, '2024-07-01', 'Cash'),
    (4, 500000.00, '2024-08-01', 'Check'),
    (5, 120000.00, '2024-09-01', 'Wire Transfer'),
    (6, 400000.00, '2024-10-01', 'Credit Card'),
    (7, 1000000.00, '2024-11-01', 'Bank Transfer');

-- Table for sale
CREATE TABLE sale (
    sale_id INT PRIMARY KEY,
    property_id INT,
    agent_id INT,
    payment_id INT,
    customer_id INT,
    sale_date DATE NOT NULL,
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (agent_id) REFERENCES agent(agent_id),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Inserting data into sale table
INSERT INTO sale (sale_id, property_id, agent_id, payment_id, customer_id, sale_date)
VALUES
    (1, 1, 1, 1, 1, '2024-05-01'),
    (2, 2, 2, 2, 2, '2024-06-01'),
    (3, 3, 3, 3, 3, '2024-07-01'),
    (4, 4, 4, 4, 4, '2024-08-01'),
    (5, 5, 5, 5, 5, '2024-09-01'),
    (6, 6, 6, 6, 6, '2024-10-01'),
    (7, 7, 7, 7, 7, '2024-11-01');

-- Table for review
CREATE TABLE review (
    review_id INT PRIMARY KEY,
    rental_id INT,
    rating INT NOT NULL,
    comments TEXT NOT NULL,
    review_date DATE,
    FOREIGN KEY (rental_id) REFERENCES rental(rental_id)
);

-- Inserting data into review table
INSERT INTO review (review_id, rental_id, rating, comments, review_date)
VALUES
    (1, 1, 4, 'Very comfortable', '2024-08-01'),
    (2, 2, 5, 'Excellent location', '2024-09-01'),
    (3, 3, 5, 'Great ambiance', '2024-10-01'),
    (4, 4, 4, 'Well maintained', '2024-11-01'),
    (5, 5, 3, 'Good value for money', '2024-12-01'),
    (6, 6, 4, 'Spacious', '2025-01-01'),
    (7, 7, 5, 'Highly recommend', '2025-02-01');

-- Table for maintenance_request
CREATE TABLE maintenance_request (
    request_id INT PRIMARY KEY,
    property_id INT,
    customer_id INT,
    description TEXT NOT NULL,
    request_date DATE,
    status VARCHAR(30) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Inserting data into maintenance_request table
INSERT INTO maintenance_request (request_id, property_id, customer_id, description, request_date, status)
VALUES
    (1, 1, 1, 'Leaking faucet', '2024-08-10', 'Pending'),
    (2, 2, 2, 'Broken window', '2024-09-15', 'Completed'),
    (3, 3, 3, 'Clogged sink', '2024-10-15', 'Completed'),
    (4, 4, 4, 'Electrical issue', '2024-11-20', 'Pending'),
    (5, 5, 5, 'Roof leak', '2024-12-05', 'In Progress'),
    (6, 6, 6, 'AC repair', '2025-01-10', 'Pending'),
    (7, 7, 7, 'Garage door broken', '2025-02-15', 'Completed');
-- Query to Find All Available Properties

SELECT * FROM property WHERE p_status = 'Available';

-- Query to Find Properties Owned by a Specific Owner
SELECT * 
FROM property 
WHERE owner_id = (SELECT owner_id FROM owner WHERE name = 'John Doe');

-- Query to Fetch Rental History for a Customer
SELECT r.*, c.name AS customer_name, p.type AS property_type 
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN property p ON r.property_id = p.property_id
WHERE r.customer_id = 1;

-- Query to Get Maintenance Requests for a Property
SELECT * 
FROM maintenance_request 
WHERE property_id = 1;

-- Query to Calculate Total Sales Facilitated by an Agent
SELECT a.name AS agent_name, SUM(p.amount) AS total_sales
FROM sale s
JOIN agent a ON s.agent_id = a.agent_id
JOIN payment p ON s.payment_id = p.payment_id
GROUP BY a.name;

-- Query to View Customer Reviews
SELECT r.rating, r.comments, p.type AS property_type
FROM review r
JOIN rental rn ON r.rental_id = rn.rental_id
JOIN property p ON rn.property_id = p.property_id;

--Find Top Customers by Sales or Rentals
SELECT TOP 5 c.name AS customer_name, SUM(p.amount) AS total_spent
FROM sale s
JOIN customer c ON s.customer_id = c.customer_id
JOIN payment p ON s.payment_id = p.payment_id
GROUP BY c.name
ORDER BY total_spent DESC;


--Get Average Property Price by Type
SELECT type AS property_type, AVG(price) AS average_price
FROM property
GROUP BY type
ORDER BY average_price DESC;

--Find Properties by Agent

SELECT p.property_id, p.type, p.price, s.sale_date
FROM sale s
JOIN property p ON s.property_id = p.property_id
JOIN agent a ON s.agent_id = a.agent_id
WHERE a.name = 'Sam Adams';


--Find Properties with Pending Maintenance Requests
SELECT p.property_id, p.type, m.description, m.status
FROM maintenance_request m
JOIN property p ON m.property_id = p.property_id
WHERE m.status = 'Pending';

-- Find Revenue by Month
SELECT MONTH(s.sale_date) AS month, SUM(p.amount) AS total_revenue
FROM sale s
JOIN payment p ON s.payment_id = p.payment_id
GROUP BY MONTH(s.sale_date)
ORDER BY month;
--Query for Rental Revenue

SELECT MONTH(r.start_date) AS month, COUNT(r.rental_id) AS total_rentals
FROM rental r
GROUP BY MONTH(r.start_date)
ORDER BY month;

--Find High-Rated Properties by Type
SELECT p.type AS property_type, AVG(r.rating) AS average_rating
FROM review r
JOIN rental rn ON r.rental_id = rn.rental_id
JOIN property p ON rn.property_id = p.property_id
GROUP BY p.type
HAVING AVG(r.rating) > 4;


-- Find Recently Added Properties
SELECT * 
FROM property 
WHERE DATEADD(DAY, -30, GETDATE()) <= GETDATE();
