-- Employee table
CREATE TABLE employee( 
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	role VARCHAR(100),
	dob DATE,
	salary INT
);

-- Address table
CREATE TABLE address(
	id SERIAL PRIMARY KEY,
	employee_id INT REFERENCES employee(id),
	house_no VARCHAR(10) NOT NULL,
	street_no VARCHAR(10) NOT NULL,
	city VARCHAR(30) NOT NULL,
	province VARCHAR(30) NOT NULL,
	zipcode VARCHAR(30)
);

-- Customer table
CREATE TABLE customer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone_no VARCHAR(20) NOT NULL UNIQUE
);

-- Supplier table
CREATE TABLE supplier(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone_no VARCHAR(20) NOT NULL UNIQUE
);

-- Category table
CREATE TABLE category(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description VARCHAR(255)
);

-- Product table
CREATE TABLE product(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	unit_price NUMERIC(10,2),
	cost_price NUMERIC(10,2),
	quantity INT,
	category_id INT REFERENCES category(id)
);

-- Sale table
CREATE TABLE sale(
	id SERIAL PRIMARY KEY,
	date DATE DEFAULT CURRENT_DATE,
	total_amount NUMERIC(10,2),
	employee_id INT REFERENCES employee(id),
	customer_id INT REFERENCES customer(id)
);

-- Sale Line Item table
CREATE TABLE sale_line_item(
	sale_id INT REFERENCES sale(id),
	product_id INT REFERENCES product(id),
	quantity INT NOT NULL,
	price NUMERIC(10,2) NOT NULL,
	PRIMARY KEY (sale_id, product_id)
);
-- Purchase Order Table
CREATE TABLE purchase_order(
	id SERIAL PRIMARY KEY,
	date DATE DEFAULT CURRENT_DATE,
	total_cost NUMERIC(10,2),
	employee_id		INT REFERENCES employee(id),
	supplier_id		INT	REFERENCES supplier(id)
);
-- Purchase Item Table
CREATE TABLE purchase_item(
	purchase_order_id INT REFERENCES purchase_order(id),
	product_id INT REFERENCES product(id),
	quantity INT NOT NULL,
	cost_price NUMERIC(10,2) NOT NULL,
	PRIMARY KEY (purchase_order_id, product_id)
);