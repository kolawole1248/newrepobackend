-- Create the account table
CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    account_firstname VARCHAR(50) NOT NULL,
    account_lastname VARCHAR(50) NOT NULL,
    account_email VARCHAR(100) NOT NULL,
    account_password VARCHAR(50) NOT NULL,
    account_type VARCHAR(20) NOT NULL DEFAULT 'Client'
);

-- Create the classification table
CREATE TABLE classification (
    classification_id SERIAL PRIMARY KEY,
    classification_name VARCHAR(50) NOT NULL
);

-- Insert sample data into the classification table
INSERT INTO classification (classification_name)
VALUES 
('Sport'),
('SUV'),
('Truck'),
('Sedan');

-- Create the inventory table
CREATE TABLE inventory (
    inv_id SERIAL PRIMARY KEY,
    inv_make VARCHAR(50) NOT NULL,
    inv_model VARCHAR(50) NOT NULL,
    inv_description TEXT NOT NULL,
    inv_image VARCHAR(255) NOT NULL,
    inv_thumbnail VARCHAR(255) NOT NULL,
    inv_price DECIMAL(10, 2) NOT NULL,
    inv_year INT NOT NULL,
    inv_miles INT NOT NULL,
    inv_color VARCHAR(50) NOT NULL,
    classification_id INT NOT NULL,
    FOREIGN KEY (classification_id) REFERENCES classification(classification_id)
);

-- Insert sample data into the inventory table
INSERT INTO inventory (inv_make, inv_model, inv_description, inv_image, inv_thumbnail, inv_price, inv_year, inv_miles, inv_color, classification_id)
VALUES 
('GM', 'Hummer', 'Small interiors...', '/images/hummer.jpg', '/images/hummer-tn.jpg', 45000.00, 2020, 15000, 'Black', 1),
('Ford', 'Mustang', 'Sporty and fast', '/images/mustang.jpg', '/images/mustang-tn.jpg', 55000.00, 2021, 10000, 'Red', 2);

-- Task 1, Query 1: Insert Tony Stark
INSERT INTO account (account_firstname, account_lastname, account_email, account_password)
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n');

-- Task 1, Query 2: Update Tony Stark's account_type to "Admin"
UPDATE account
SET account_type = 'Admin'
WHERE account_email = 'tony@starkent.com';

-- Task 1, Query 3: Delete Tony Stark
DELETE FROM account
WHERE account_email = 'tony@starkent.com';

-- Task 1, Query 4: Modify the "GM Hummer" description
UPDATE inventory
SET inv_description = REPLACE(inv_description, 'small interiors', 'a huge interior')
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- Task 1, Query 5: Inner join for "Sport" category
SELECT inv_make, inv_model, classification_name
FROM inventory
INNER JOIN classification
ON inventory.classification_id = classification.classification_id
WHERE classification_name = 'Sport';

-- Task 1, Query 6: Update inv_image and inv_thumbnail paths
UPDATE inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');


-- Check the account table
SELECT * FROM account;

-- Check the classification table
SELECT * FROM classification;

-- Check the inventory table
SELECT * FROM inventory;