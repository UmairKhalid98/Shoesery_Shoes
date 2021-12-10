-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
USE Shoesery;
DROP VIEW IF EXISTS transaction_confirmation;
DROP VIEW IF EXISTS shopping_cart;
DROP VIEW IF EXISTS shoes_for_sale;

DROP TABLE IF EXISTS SupplierOrder;
DROP TABLE IF EXISTS SupplierInvoice;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS Asset;
DROP TABLE IF EXISTS CustomerInvoice;
DROP TABLE IF EXISTS Shoe;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS SupplierOrder;
DROP TABLE IF EXISTS SupplierInvoice;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS Asset;
DROP TABLE IF EXISTS CustomerInvoice;
DROP TABLE IF EXISTS Shoe;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer
   (
    customer_id INT NOT NULL PRIMARY KEY, 
    customer_name VARCHAR(30) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10),
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL
    );
-- Create Supplier Table
CREATE TABLE Supplier
   (
    supplier_id INT NOT NULL PRIMARY KEY, 
    supplier_name VARCHAR(30) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10),
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL
    );
-- Create Shoe Table
CREATE TABLE Shoe(
    shoe_id INT NOT NULL,
	supplier_id INT,
    shoe_link varchar(100),
	shoe_name varchar(40),
    size int,
    color varchar(40),
    purchase_price float,
    sale_price float,
	quantity INT,
    PRIMARY KEY (shoe_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE CustomerInvoice(
    customer_invoice_id INT NOT NULL,
    customer_id INT,
    order_date date,
    shipping_charges float,
    PRIMARY KEY (Customer_Invoice_ID),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE CustomerOrder(
customer_order_id INT NOT NULL PRIMARY KEY,
shoe_id INT,
quantity INT NOT NULL,
customer_invoice_id INT,
FOREIGN KEY (shoe_id) REFERENCES Shoe(shoe_id),
FOREIGN KEY (customer_invoice_id) REFERENCES CustomerInvoice(customer_invoice_id)
);

CREATE TABLE SupplierInvoice(
supplier_invoice_id INT NOT NULL PRIMARY KEY,
supplier_id INT,
order_date DATE,
shipping_charges FLOAT,
total_price FLOAT,
FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE SupplierOrder(
supplier_order_id INT NOT NULL PRIMARY KEY,
shoe_id INT,
quantity INT NOT NULL,
supplier_invoice_id INT,
FOREIGN KEY (supplier_invoice_id) REFERENCES SupplierInvoice(supplier_invoice_id),
FOREIGN KEY (shoe_id) REFERENCES Shoe(shoe_id)
);

INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email) 
VALUES (1, 'Shannon Tanner', 'Baynes  Alley, 3290', 'Fayetteville', 'Minnesota','55106', '5-512-666-5581', 'Shannon_Tanner7725@kideod.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (2, 'Drew Plumb', 'Ashley Alley, 4088', 'Phoenix', 'Tennessee', '11706', '7-387-710-7152', 'Drew_Plumb9684@naiker.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (3, 'Abdul Lomax', 'Westbourne Walk, 9765', 'Lyon', 'Illinois', '47711','1-210-445-3154', 'Abdul_Lomax9640@sheye.org');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (4, 'Liam Taylor', 'Hickory   Avenue, 7978', 'Los Angeles', 'Montana', '34221','2-434-478-8565', 'Liam_Taylor9022@ovock.tech');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (5, 'Jenna Wright', 'Clere  Street, 8624', 'London', 'Montana', '37421','2-485-672-1415', 'Jenna_Wright7680@deavo.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (6, 'Owen Walter', 'Sheraton   Route, 2795', 'Tokyo', 'Maryland', '28645','2-254-217-7571', 'Owen_Walter9111@yahoo.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (7, 'Josh Andrews', 'Aylward   Rue, 40850', 'Kansas City', 'Vermont', '70001','7-568-075-3404', 'Josh_Andrews8145@sveldo.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (8, 'Danny Asher', 'Blore  Boulevard, 6270', 'Columbus', 'Maryland', '33139','3-337-315-2555', 'Danny_Asher2170@vetan.org');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (9, 'Ronald Lucas', 'Cavell   Tunnel, 1806', 'London', 'Missouri', '43560','1-667-784-5057', 'Ronald_Lucas2579@sveldo.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (10, 'Domenic Gardner', 'Western   Walk, 2562', 'Oklahoma City', 'Nevada', '20175','8-228-338-2333', 'Domenic_Gardner2716@kideod.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (11, 'Martin Rivers', 'Sheraton   Pass, 9397', 'Omaha', 'North Carolina', '11530','1-363-575-7315', 'Martin_Rivers4777@gmail.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (12, 'Aiden Bradley', 'Elystan  Rue, 7924', 'Boston', 'New Hampshire', '58201','6-018-180-0453', 'Aiden_Bradley8731@kideod.bizz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (13, 'Carter Stevenson', 'Chestnut  Rue, 4980', 'Lyon', 'Arizona', '21009','5-075-742-5266', 'Carter_Stevenson514@deavo.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (14, 'Ruth Moss', 'Fawn Crossroad, 4129', 'Saint Paul', 'Connecticut', '07002','7-736-533-5163', 'Ruth_Moss6555@iatim.tech');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (15, 'Chester Herbert', 'Magnolia Rue, 9377', 'Long Beach', 'Idaho', '23139','1-326-704-0556', 'Chester_Herbert6110@deons.tech');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (16, 'Tyler Driscoll', 'Eldon  Vale, 6681', 'Bridgeport', 'Oregon', '01020','3-200-404-2656', 'Tyler_Driscoll2156@bulaffy.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (17, 'Deborah Andrews', 'Durnford  Alley, 822', 'Lincoln', 'Texas', '08520','6-800-375-7758', 'Deborah_Andrews8692@gompie.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (18, 'Ronald Townend', 'Queen Caroline   Avenue, 3707', 'Lakewood','Rhode Island', '08234', '7-741-703-6550', 'Ronald_Townend7854@womeona.net');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (19, 'Hank Richardson', 'Blendon    Rue, 9444', 'Philadelphia', 'Oregon', '08865','3-303-277-5567', 'Hank_Richardson4556@vetan.org');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (20, 'Tony Rossi', 'Elba  Grove, 287', 'Toledo', 'Pennsylvania', '21206','1-243-607-7681', 'Tony_Rossi2924@dionrab.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (21, 'Bart Stevens', 'Queen Lane, 9148', 'Quebec', 'Maine', '20744','6-718-725-0478', 'Bart_Stevens3975@naiker.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (22, 'Harriet Stubbs', 'Berry  Walk, 7049', 'Las Vegas', 'Massachussets', '18062','4-154-267-7013', 'Harriet_Stubbs7999@famism.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (23, 'Owen Porter', 'Enford   Tunnel, 6531', 'Louisville', 'Maine', '22180','8-471-484-1023', 'Owen_Porter8153@liret.org');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (24, 'Matt Porter', 'Monroe Tunnel, 6429', 'Cincinnati', 'Maryland', '18052','6-322-424-2324', 'Matt_Porter3021@famism.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (25, 'Rihanna Stewart', 'Chandos  Boulevard, 9622', 'Fayetteville', 'Oregon', '60411','4-632-484-3365', 'Rihanna_Stewart493@liret.org');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (26, 'Jacob Roth', 'Chelsea Manor  Way, 8330', 'El Paso', 'Connecticut', '30052','2-060-486-4266', 'Jacob_Roth1580@kideod.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (27, 'Rufus Morris', 'Cockspur  Walk, 200', 'Charlotte', 'Texas', '48348','5-143-003-0321', 'Rufus_Morris2907@nickia.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (28, 'Aisha Knight', 'Vine  Pass, 9428', 'Chicago', 'Nebraska', '18102','3-144-215-8071', 'Aisha_Knight4948@supunk.biz');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (29, 'Danielle Irving', 'Norfolk  Alley, 2417', 'Valetta', 'Florida', '11413','4-405-712-2282', 'Danielle_Irving1455@bulaffy.com');
INSERT INTO Customer (customer_id, customer_name, address, city, state, zip_code, phone, email)
VALUES (30, 'Johnny Morgan', 'Elizabeth  Grove, 3933', 'Rochester', 'Maine', '54650','3-887-725-0723', 'Johnny_Morgan6345@hourpy.biz');
	
INSERT INTO Supplier VALUES(1,'Nike','One Bowerman Drive','Beaverton','Oregon',97005,'1-503-671-6453','media.relations@nike.com');
INSERT INTO Supplier VALUES(2,'Adidas','Linden Crossroad, 6858','San Diego','California',59339,'6-814-517-2712','bulksales@adidas.com');
INSERT INTO Supplier VALUES(3,'Reebok','Abbey Hill, 8691','Portland','Minnesota',77726,'1-866-870-1743','wholesales@reebok.com');
INSERT INTO Supplier VALUES(4,'Puma','Arundel Pass, 3212','Dallas','Texas',79234,'4-046-117-1653','sales.us@puma.com');
INSERT INTO Supplier VALUES(5,'Vans','1588 South Coast Dr','Costa Mesa','California',92626,'3-676-170-0448','manufacture@vans.com');

INSERT INTO Shoe VALUES('1',4,'https://rb.gy/wmafhm','Kaffir cat',5,'Beige',723.00,814.99,163);
INSERT INTO Shoe VALUES('2',3,'https://rb.gy/mteaos','Egyptian goose',7,'Sienna',605.50,544.99,169);
INSERT INTO Shoe VALUES('3',4,'https://rb.gy/bvwjpj','Galapagos sea lion',8,'Amethyst',518.99,852.99,84);
INSERT INTO Shoe VALUES('4',4,'https://rb.gy/e2verw','Feathertail glider',7,'Fuchsia',621.99,214.99,30);
INSERT INTO Shoe VALUES('5',2,'https://rb.gy/x53mzm','Brown capuchin',8,'Ultramarine',425.99,925.99,84);
INSERT INTO Shoe VALUES('6',4,'https://rb.gy/dzyo9e','Dodo',7,'Mauve',736.70,926.39,873);
INSERT INTO Shoe VALUES('7',2,'https://rb.gy/436mnz','Dusky gull',11,'Turquoise',974.59,284.83,10);
INSERT INTO Shoe VALUES('8',1,"https://rb.gy/vmxjhc",'Wallaby',6,'Cadet blue',385.52,748.56,73);
INSERT INTO Shoe VALUES('9',3,'https://rb.gy/j8cz74','Kelp gull',11,'Fuchsia',999.43,613.72,29);
INSERT INTO Shoe VALUES('10',2,'https://rb.gy/4suvtf','Sloth',8,'Azure',622.06,66.10,15);
INSERT INTO Shoe VALUES('11',2,'https://rb.gy/frrdhn','Cheetah',9,'Sky blue',157.02,112.78,49);
INSERT INTO Shoe VALUES('12',2,'https://rb.gy/yskkfu','Emerald green tree boa',5,'Pink',899.41,292.47,85);
INSERT INTO Shoe VALUES('13',3,'https://rb.gy/hdslmh','Indian giant squirrel',6,'Cerise',817.93,404.96,128);
INSERT INTO Shoe VALUES('14',2,'https://rb.gy/dfbd60','Giant girdled lizard',10,'Peach',49.11,236.96,150);
INSERT INTO Shoe VALUES('15',1,'https://rb.gy/3ao1pv','Eurasian red squirrel',6,'Emerald',941.15,435.56,94);



INSERT INTO CustomerInvoice VALUES('1',7,'2021-07-21',75);
INSERT INTO CustomerInvoice VALUES('2',9,'2021-04-21',80);
INSERT INTO CustomerInvoice VALUES('3',5,'2021-09-16',9);
INSERT INTO CustomerInvoice VALUES('4',29,'2021-06-19',54);
INSERT INTO CustomerInvoice VALUES('5',2,'2021-08-06',27);
INSERT INTO CustomerInvoice VALUES('6',4,'2021-04-13',12);
INSERT INTO CustomerInvoice VALUES('7',8,'2021-05-09',76);
INSERT INTO CustomerInvoice VALUES('8',25,'2020-10-15',56);
INSERT INTO CustomerInvoice VALUES('9',6,'2020-03-01',84);
INSERT INTO CustomerInvoice VALUES('10',5,'2020-11-03',40);
INSERT INTO CustomerInvoice VALUES('11',2,'2021-07-25',73);
INSERT INTO CustomerInvoice VALUES('12',6,'2021-08-14',45);
INSERT INTO CustomerInvoice VALUES('13',9,'2019-12-23',7);
INSERT INTO CustomerInvoice VALUES('14',1,'2021-07-31',51);
INSERT INTO CustomerInvoice VALUES('15',10,'2020-03-17',18);
INSERT INTO CustomerInvoice VALUES('16',28,'2021-03-14',97);
INSERT INTO CustomerInvoice VALUES('17',3,'2020-02-28',44);
INSERT INTO CustomerInvoice VALUES('18',21,'2021-01-03',49);
INSERT INTO CustomerInvoice VALUES('19',2,'2020-11-05',25);
INSERT INTO CustomerInvoice VALUES('20',5,'2019-11-23',20);
INSERT INTO CustomerInvoice VALUES('21',9,'2021-10-27',54);
INSERT INTO CustomerInvoice VALUES('22',16,'2020-07-12',91);
INSERT INTO CustomerInvoice VALUES('23',14,'2021-07-11',41);
INSERT INTO CustomerInvoice VALUES('24',6,'2021-05-15',10);
INSERT INTO CustomerInvoice VALUES('25',3,'2020-03-18',25);
INSERT INTO CustomerInvoice VALUES('26',1,'2020-12-31',92);
INSERT INTO CustomerInvoice VALUES('27',20,'2020-08-20',0);
INSERT INTO CustomerInvoice VALUES('28',14,'2021-06-27',48);
INSERT INTO CustomerInvoice VALUES('29',29,'2021-10-14',25);
INSERT INTO CustomerInvoice VALUES('30',25,'2020-08-30',67);

INSERT INTO CustomerOrder VALUES('1',14,56,25);
INSERT INTO CustomerOrder VALUES('2',13,37,16);
INSERT INTO CustomerOrder VALUES('3',1,50,24);
INSERT INTO CustomerOrder VALUES('4',15,35,22);
INSERT INTO CustomerOrder VALUES('5',5,40,26);
INSERT INTO CustomerOrder VALUES('6',8,46,26);
INSERT INTO CustomerOrder VALUES('7',13,62,29);
INSERT INTO CustomerOrder VALUES('8',9,13,7);
INSERT INTO CustomerOrder VALUES('9',5,92,12);
INSERT INTO CustomerOrder VALUES('10',10,91,14);
INSERT INTO CustomerOrder VALUES('11',5,22,2);
INSERT INTO CustomerOrder VALUES('12',5,77,7);
INSERT INTO CustomerOrder VALUES('13',13,37,20);
INSERT INTO CustomerOrder VALUES('14',1,85,13);
INSERT INTO CustomerOrder VALUES('15',15,31,16);
INSERT INTO CustomerOrder VALUES('16',4,79,8);
INSERT INTO CustomerOrder VALUES('17',2,31,4);
INSERT INTO CustomerOrder VALUES('18',7,53,13);
INSERT INTO CustomerOrder VALUES('19',12,28,13);
INSERT INTO CustomerOrder VALUES('20',9,56,14);
INSERT INTO CustomerOrder VALUES('21',2,36,18);
INSERT INTO CustomerOrder VALUES('22',6,64,5);
INSERT INTO CustomerOrder VALUES('23',10,99,19);
INSERT INTO CustomerOrder VALUES('24',10,67,3);
INSERT INTO CustomerOrder VALUES('25',3,78,24);
INSERT INTO CustomerOrder VALUES('26',8,64,25);
INSERT INTO CustomerOrder VALUES('27',11,6,4);
INSERT INTO CustomerOrder VALUES('28',3,57,19);
INSERT INTO CustomerOrder VALUES('29',5,84,21);
INSERT INTO CustomerOrder VALUES('30',10,56,15);

INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES (	'1'	,'2'	,	'2001-02-26','8.09'	,	'131.71'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('2'	,'2'	,	'2001-10-31'	,	'5.29'	,	'63.67'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('3'	,'4'	,'2006-06-21'	,'2.67'	,'18.17'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('4'	,'4'	,'2008-03-10'	,'5.76'	,'126.54'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('5'	,'3'	,'2008-04-11'	,'3.96'	,'144.99'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('6'	,'2'	,'2010-10-02'	,'8.62'	,'37.52'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('7'	,'3'	,'2010-11-27'	,'11.41','158.71'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('8'	,'4'	,'2012-07-14'	,'8.98','137.30'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('9','	5'		,'2013-09-16'	,'9.28'	,'86.62'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('10'	,'2'	,'2015-06-10'	,'14.12','114.37'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('11'	,'3'	,'2015-12-03'	,'6.50'	,'83.17'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('12'	,'4'	,'2018-08-03'	,'1.89'	,'140.31'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('13'	,'3'	,'2020-02-18'	,'4.74'	,'33.68'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('14'	,'4'	,'2021-04-19'	,'11.96','153.39'	);
INSERT INTO SupplierInvoice ( 	supplier_invoice_id, supplier_id, order_date, shipping_charges, total_price	) VALUES ('15'	,'5'	,'2021-08-26'	,'10.99','91.50'	);

INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	1	,	4	,	9	,	6	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	2	,	5	,	9	,	8	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	3	,	2	,	12	,	7	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	4	,	4	,	11	,	6	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	5	,	5	,	15	,	4	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	6	,	1	,	9	,	2	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	7	,	2	,	2	,	4	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	8	,	2	,	14	,	7	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	9	,	2	,	6	,	5	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	10	,	5	,	15	,	1	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	11	,	2	,	2	,	9	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	12	,	4	,	3	,	6	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	13	,	5	,	13	,	3	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	14	,	3	,	15	,	7	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	15	,	3	,	2	,	3	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	16	,	2	,	2	,	2	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	17	,	5	,	8	,	10	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	18	,	1	,	13	,	2	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	19	,	2	,	9	,	1	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	20	,	6	,	13	,	10	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	21	,	4	,	5	,	9	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	22	,	1	,	1	,	4	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	23	,	7	,	4	,	4	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	24	,	3	,	9	,	5	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	25	,	5	,	10	,	2	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	26	,	6	,	4	,	7	);
INSERT INTO SupplierOrder ( 	supplier_order_id, shoe_id, quantity, supplier_invoice_id	) VALUES (	27	,	7	,	5	,	1	);

-- -Shoes available for sale
CREATE VIEW shoes_for_sale AS
SELECT Shoe.shoe_name, Supplier.supplier_name AS Brand,Shoe.shoe_link AS IMG, Shoe.sale_price, Shoe.size, Shoe.color, Shoe.quantity
FROM Shoe, Supplier
WHERE Shoe.supplier_id = Supplier.supplier_id;	

-- -Shoes in your shopping cart
CREATE VIEW shopping_cart AS
SELECT Customer.customer_name, CustomerInvoice.customer_invoice_id, Shoe.shoe_name, Supplier.supplier_name AS Brand, Shoe.sale_price, CustomerOrder.quantity, (Shoe.sale_price * CustomerOrder.quantity) AS LinePrice, (Shoe.sale_price * CustomerOrder.quantity + CustomerInvoice.shipping_charges) AS TotalPrice
FROM Shoe, Supplier, CustomerOrder, CustomerInvoice, Customer
WHERE Customer.customer_id = 1
AND CustomerOrder.shoe_id = Shoe.shoe_id
AND CustomerOrder.customer_invoice_id = CustomerInvoice.customer_invoice_id
AND Shoe.supplier_id = Supplier.supplier_id
AND CustomerInvoice.customer_id = Customer.customer_id
AND CustomerOrder.quantity < Shoe.quantity;

-- -Checkout confirmation screen (after transaction)
CREATE VIEW transaction_confirmation AS
SELECT Customer.customer_name, CustomerInvoice.customer_invoice_id, CustomerInvoice.order_date, Shoe.shoe_name, Supplier.supplier_name AS Brand, Shoe.sale_price, CustomerOrder.quantity, CustomerInvoice.shipping_charges, 0.1 AS Tax, ((Shoe.sale_price * CustomerOrder.quantity + CustomerInvoice.shipping_charges) * 1.1) AS TotalPrice, Customer.address
FROM Shoe, Supplier, CustomerOrder, CustomerInvoice, Customer
WHERE CustomerInvoice.customer_invoice_id = 26
AND CustomerOrder.shoe_id = Shoe.shoe_id
AND CustomerOrder.customer_invoice_id = CustomerInvoice.customer_invoice_id
AND Shoe.supplier_id = Supplier.supplier_id
AND CustomerInvoice.customer_id = Customer.customer_id
AND CustomerOrder.quantity < Shoe.quantity;

-- SELECT * from shoes_for_sale;  