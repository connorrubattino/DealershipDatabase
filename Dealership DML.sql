--Adding data -- going to get some in first and then add via stored procedure.
INSERT INTO customer(
	first_name,
	last_name,
	phone
) VALUES (
	'John',
	'Doe',
	1555555555
),(
	'Jane',
	'Doe',
	1540925599
),(
	'Steph',
	'Curry',
	1333333333
),(
	'Caitlin',
	'Clark',
	1234567890
),(
	'Jim',
	'Zakko',
	1589435555
),(
	'Aldon',
	'Smith',
	0987654321
),(
	'Sheila',
	'Ferrari',
	139288754
);

SELECT *
FROM customer;



INSERT INTO salesperson(
	first_name,
	last_name
) VALUES (
	'Sleeze',
	'Johnson'
),(
	'Jordan',
	'Belfort'
),(
	'Larry',
	'David'
),(
	'Christina',
	'Adams'
),(
	'Hugh',
	'Aster'
),(
	'Bill',
	'Buckener'
),(
	'Steve',
	'Biggins'
);

SELECT *
FROM salesperson;




INSERT INTO mechanic(
	first_name,
	last_name,
	m_level
) VALUES (
	'Carlos',
	'Stongman',
	1
),(
	'Filip',
	'Beaster',
	3
),(
	'Sirague',
	'Mashup',
	2
),(
	'Brute',
	'Boggins',
	5
);

SELECT *
FROM mechanic;





INSERT INTO car(
	make,
	model,
	color,
	car_year,
	miles
) VALUES (
	'Chevy',
	'Silverado',
	'Blue',
	2013,
	43576
),(
	'Chevy',
	'Malibu',
	'Green',
	2020,
	33686
),(
	'BMW',
	'530i',
	'White',
	2007,
	197356
),(
	'Mazda',
	'Miata',
	'Silver',
	2003,
	143576
),(
	'Chevy',
	'Corvette',
	'Red',
	2024,
	0
),(
	'Tesla',
	'T500',
	'Matte Black',
	2024,
	0
);

SELECT *
FROM car;



INSERT INTO invoice(
	car_id,
	customer_id,
	salesperson_id,
	purchase_date,
	price
) VALUES (
	5,
	1,
	3,
	'2024-01-08 09:05:06',
	70000
),(
	6,
	2,
	1,
	'2024-03-09 07:15:06',
	100000
);

SELECT *
FROM invoice;



INSERT INTO service(
	car_id,
	customer_id,
	mechanic_id,
	bring_in_date,
	price,
	hrs_maint
) VALUES (
	4,
	3,
	1,
	'2024-02-07 09:05:06',
	250,
	24
),(
	3,
	4,
	3,
	'2024-03-19 09:15:06',
	2475,
	72
),(
	2,
	6,
	3,
	'2024-02-17 09:05:06',
	1350,
	48
);

SELECT *
FROM service;

UPDATE service 
SET service_type = 'Tire rotation'
WHERE service_id = 1;

UPDATE service 
SET service_type = 'Axle repair'
WHERE service_id = 2;

UPDATE service 
SET service_type = 'Hood and bumper fix'
WHERE service_id = 3;


SELECT *
FROM customer;

SELECT *
FROM salesperson;

SELECT *
FROM mechanic;

SELECT *
FROM car;

SELECT *
FROM invoice;

SELECT *
FROM service;




---stored procedure to add cars

CREATE OR REPLACE PROCEDURE add_car(make VARCHAR, model VARCHAR, color VARCHAR, car_year INTEGER, miles INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car(make, model, color, car_year, miles)
	VALUES (make, model, color, car_year, miles);
END;
$$;

CALL add_car('Tesla','Cyber Truck', 'Galaxy', 2025, 0)


---stored function to add a service ticket using now 

CREATE OR REPLACE PROCEDURE add_service(car_id INTEGER, customer_id INTEGER, mechanic_id INTEGER, price INTEGER, hrs_maint INTEGER, service_type VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service(car_id, customer_id, mechanic_id, price, hrs_maint, service_type, bring_in_date)
	VALUES (car_id, customer_id, mechanic_id, price, hrs_maint, service_type, NOW());
END;
$$;

CALL add_service(7, 6, 4, 1250, 48);
CALL add_service(7, 6, 4, 0, 1, 'Finished Galaxy tint, quick tint');

UPDATE service 
SET service_type = 'Galaxy tint'
WHERE service_id = 4;



UPDATE customer 
SET phone = '(555)555-5555'
WHERE customer_id = 1;

UPDATE customer 
SET phone = '(123)876-3874'
WHERE customer_id = 2;

UPDATE customer 
SET phone = '(321)154-7492'
WHERE customer_id = 3;

UPDATE customer 
SET phone = '(444)957-9872'
WHERE customer_id = 4;

UPDATE customer 
SET phone = '(666)563-5930'
WHERE customer_id = 5;

UPDATE customer 
SET phone = '(987)338-9863'
WHERE customer_id = 6;

UPDATE customer 
SET phone = '(789)647-6645'
WHERE customer_id = 7;