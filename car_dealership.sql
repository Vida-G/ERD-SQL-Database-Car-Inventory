--############################### Project - Week 4 ###############################--
-- Salesperson Table
CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	phone VARCHAR(150),
	email VARCHAR(150)
);

-- Mechanic Table
CREATE TABLE mechanic(
	mech_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	phone VARCHAR(150),
	email VARCHAR(150)
);
 
-- Parts Inventory Table
CREATE TABLE part_inventory(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(100),
	part_quantity INTEGER
);

-- Service/Repair Table
CREATE TABLE service(
	service_id SERIAL PRIMARY KEY,
	service_type VARCHAR(100),
	service_date DATE DEFAULT CURRENT_DATE,
	part_id INTEGER,
	mech_id INTEGER
);
 
-- Customer Table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	email VARCHAR(100),
	address VARCHAR(200),
	billing_info VARCHAR(40),
	service_id INTEGER
);

-- Car Inventory
CREATE TABLE car_inventory(
	car_id SERIAL PRIMARY KEY,
	car_model VARCHAR(15),
	car_made VARCHAR(15),
	car_year INTEGER,
	salesperson_id INTEGER,
	customer_id INTEGER
);

-- Invoice Table
CREATE TABLE invoice(
	sale_invoice_id SERIAL PRIMARY KEY,
	car_price NUMERIC(10,2),
	car_invoice_date DATE DEFAULT CURRENT_DATE,
	part_price NUMERIC(16,2),
	invoice_type VARCHAR(150),
	car_id INTEGER,
	salesperson_id INTEGER,
	customer_id INTEGER,
	service_id INTEGER,
	part_id INTEGER
);

-- Stored Function to insert info into the Salesperson Table
CREATE OR REPLACE FUNCTION add_salesperson(
	_salesperson_id INTEGER,
	_first_name VARCHAR(150),
	_last_name VARCHAR(150),
	_phone VARCHAR(150),
	_email VARCHAR(150)
)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO salesperson(salesperson_id, first_name, last_name, phone, email)
	VALUES(_salesperson_id, _first_name, _last_name, _phone, _email);
END;
$MAIN$
LANGUAGE plpgsql;
	
-- Calling add_salesperson Function 
SELECT add_salesperson(1, 'Jared', 'wills', '450,566,9900', 'jared.w@gmail.com');
SELECT add_salesperson(2, 'Julie', 'Baker', '450,578,3480', 'julie.b@gmail.com');

-- Testing 
SELECT * FROM salesperson


-- Stored Function to insert info into the Mechanic Table
CREATE OR REPLACE FUNCTION add_mechanic(
	_mech_id INTEGER,
	_first_name VARCHAR(150),
	_last_name VARCHAR(150),
	_phone VARCHAR(150),
	_email VARCHAR(150)
)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO mechanic(mech_id, first_name, last_name, phone, email)
	VALUES(_mech_id, _first_name, _last_name, _phone, _email);
END;
$MAIN$
LANGUAGE plpgsql;
	
-- Calling add_mechanic Function 
SELECT add_mechanic(1, 'Fred', 'Kelly', '450,223,3456', 'fred.k@gmail.com');
SELECT add_mechanic(2, 'Robert', 'Nickman', '450,567,7821', 'robert.n@gmail.com');

-- Testing 
SELECT * FROM mechanic


-- Stored Function to insert info into the Parts Inventory Table
CREATE OR REPLACE FUNCTION add_part_inventory(
	_part_id INTEGER,
	_part_name VARCHAR(100),
	_part_quantity INTEGER
)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO part_inventory(part_id, part_name, part_quantity)
	VALUES(_part_id, _part_name, _part_quantity);
END;
$MAIN$
LANGUAGE plpgsql;
	
-- Calling add_Parts_inventory Function 
SELECT add_part_inventory(1, 'Tire', 2);
SELECT add_part_inventory(2, 'windshield', 1);

-- Testing 
SELECT * FROM part_inventory


-- Stored Function to insert info into the Customer Table
CREATE OR REPLACE FUNCTION add_customer(
	_customer_id INTEGER,
	_first_name VARCHAR(150),
	_last_name VARCHAR(150),
	_email VARCHAR(100),
	_address VARCHAR(200),
	_billing_info VARCHAR(40),
	_service_id INTEGER
)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO customer(customer_id, first_name, last_name, email, address, billing_info, service_id)
	VALUES(_customer_id, _first_name, _last_name, _email, _address, _billing_info, _service_id);
END;
$MAIN$
LANGUAGE plpgsql;
	
-- Calling add_Customer Function 
SELECT add_customer (1, 'Clair', 'Richmond', 'clair.r@gmail.com', '555 Main street, apt 23, 58960', '2020-3412-3490-1098 12/2023 123', 1);
SELECT add_customer (2, 'Bob', 'Taylor', 'bob.t@gmail.com', '500 Grape street, apt 12, 58960', '2125-3412-8490-1558 555 10/2022 103', 2);

-- Testing 
SELECT * FROM customer


-- Stored Function to insert info into the Car Inventory Table
CREATE OR REPLACE FUNCTION add_car_inventory(
	_car_id INTEGER,
	_car_model VARCHAR(15),
	_car_made VARCHAR(15),
	_car_year INTEGER,
	_salesperson_id INTEGER,
	_customer_id INTEGER
)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO car_inventory(car_id, car_model, car_made, car_year, salesperson_id, customer_id)
	VALUES(_car_id, _car_model, _car_made, _car_year, _salesperson_id, _customer_id);
END;
$MAIN$
LANGUAGE plpgsql;
	
-- Calling add_car_inventory Function 
SELECT add_car_inventory (12, 'Impala', 'GM', 2015, 1, 1);
SELECT add_car_inventory (162, 'Escape', 'Ford', 2012, 1, 19);

-- Testing 
SELECT * FROM car_inventory;


-- Insert info into Service/Repair Table
INSERT INTO service(
	service_id,
	service_type,
	part_id,
	mech_id 
)VALUES(
	14,
	'oil changing',
	230,
	2
);
INSERT INTO service(
	service_id,
	service_type,
	part_id,
	mech_id 
)VALUES(
	20,
	'calibrate',
	67,
	1
);

-- Testing 
SELECT * FROM service;

-- Insert info into Invoice Table
INSERT INTO invoice(
	sale_invoice_id,
	car_price,
	part_price,
	invoice_type,
	car_id,
	salesperson_id,
	customer_id,
	service_id,
	part_id 
)VALUES(
	89034,
	20000.00,
	1200.50,
	'service',
	356,
	1,
	209,
	18,
	6098	
);
INSERT INTO invoice(
	sale_invoice_id,
	car_price,
	part_price,
	invoice_type,
	car_id,
	salesperson_id,
	customer_id,
	service_id,
	part_id 
)VALUES(
	123407,
	15000.00,
	200.00,
	'sale',
	1100,
	2,
	118,
	2087,
	111	
);

-- Testing
SELECT * FROM invoice;

-- Testing All
SELECT * FROM salesperson;
SELECT * FROM mechanic;
SELECT * FROM part_inventory;
SELECT * FROM service;
SELECT * FROM customer;
SELECT * FROM car_inventory;
SELECT * FROM invoice;




