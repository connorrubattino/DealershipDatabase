CREATE TABLE IF NOT EXISTS salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL
);



CREATE TABLE IF NOT EXISTS mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	m_level INTEGER NOT NULL
);



CREATE TABLE IF NOT EXISTS customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	phone INTEGER NOT NULL
);


CREATE TABLE IF NOT EXISTS car (
	car_id SERIAL PRIMARY KEY,
	make VARCHAR NOT NULL,
	model VARCHAR NOT NULL,
	color VARCHAR NOT NULL,
	car_year INTEGER NOT NULL,
	miles INTEGER NOT NULL
);


CREATE TABLE IF NOT EXISTS invoice (
	invoice_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	purchase_date TIMESTAMP NOT NULL,
	price INTEGER NOT NULL
);


CREATE TABLE IF NOT EXISTS service (
	service_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	bring_in_date TIMESTAMP NOT NULL,
	price INTEGER NOT NULL,
	hrs_maint INTEGER
);

ALTER TABLE service
ADD COLUMN service_type VARCHAR;

ALTER TABLE customer 
DROP COLUMN phone;

ALTER TABLE customer 
ADD COLUMN phone VARCHAR;