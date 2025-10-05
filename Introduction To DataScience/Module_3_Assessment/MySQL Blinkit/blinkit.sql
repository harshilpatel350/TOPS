create database blinkit;
use blinkit;
create table users(
	user_id int primary key auto_increment,
    username varchar(50),
    email varchar(100),
    created_at datetime
	);
create table category(
	category_id int primary key auto_increment,
    category_name varchar(50)
    );
create table staff(
	staff_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    position varchar(50),
    salary decimal(10,2),
    user_id int,
    foreign key (user_id) references users(user_id)
	);
create table product(
	product_id int primary key auto_increment,
    product_name varchar(50),
    price decimal(10,2),
    stock int,
    category_id int,
    foreign key (category_id) references category(category_id)
    );
create table suppliers(
	supplier_id int primary key auto_increment,
    supplier_name varchar(100),
    contact_person varchar(100),
    email varchar(100),
    phone varchar(20)
    );
create table product_suppliers(
	product_id int,
    supplier_id int,
    foreign key (product_id) references product(product_id),
    foreign key (supplier_id) references suppliers(supplier_id)
    );
create table orders(
	order_id int primary key auto_increment,
    user_id int,
    staff_id int,
    order_date datetime,
    total_amount decimal(10,2),
    foreign key (user_id) references users(user_id),
    foreign key (staff_id) references staff(staff_id)
    );
create table order_items(
	order_item_id int primary key auto_increment,
    order_id int,
    product_id int,
    subtotal decimal(10,2),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references product(product_id)
	);

insert into users (username, email, created_at) 
values
("rahul90", "rahul.sharma90@gmail.com", "2021-01-15 10:23:45"),
("anita87", "anita.patel87@gmail.com", "2021-02-10 14:11:30"),
("vikas92", "vikas.kumar92@gmail.com", "2021-03-05 09:45:12"),
("neha88", "neha.verma88@gmail.com", "2021-04-12 19:21:05"),
("arjun91", "arjun.singh91@gmail.com", "2021-05-08 08:12:54"),
("priya89", "priya.mehra89@gmail.com", "2021-06-17 12:35:40"),
("amit85", "amit.jain85@gmail.com", "2021-07-03 17:59:20"),
("sneha93", "sneha.reddy93@gmail.com", "2021-08-14 20:40:55"),
("rohit90", "rohit.kapoor90@gmail.com", "2021-09-01 09:10:30"),
("pallavi86", "pallavi.nair86@gmail.com", "2021-09-22 15:44:19"),
("deepak92", "deepak.bose92@gmail.com", "2021-10-11 11:21:14"),
("sunita88", "sunita.iyer88@gmail.com", "2021-11-05 16:35:22"),
("kiran87", "kiran.agarwal87@gmail.com", "2021-12-09 18:55:12"),
("manoj91", "manoj.gupta91@gmail.com", "2022-01-13 07:20:00"),
("rekha89", "rekha.rao89@gmail.com", "2022-02-15 21:44:05"),
("ajay92", "ajay.desai92@gmail.com", "2022-03-19 10:11:50"),
("shweta85", "shweta.mishra85@gmail.com", "2022-04-23 13:59:33"),
("tarun90", "tarun.chopra90@gmail.com", "2022-05-30 08:15:27"),
("pooja93", "pooja.bhatt93@gmail.com", "2022-06-11 17:39:44"),
("karan88", "karan.ahluwalia88@gmail.com", "2022-07-05 19:22:12"),
("jyoti87", "jyoti.sen87@gmail.com", "2022-08-19 12:05:09"),
("naveen89", "naveen.pillai89@gmail.com", "2022-09-25 09:31:47"),
("meera86", "meera.shetty86@gmail.com", "2022-10-15 14:48:22"),
("suresh92", "suresh.rana92@gmail.com", "2022-11-07 16:18:59"),
("geeta91", "geeta.khanna91@gmail.com", "2022-12-28 20:50:33"),
("alok90", "alok.tyagi90@gmail.com", "2023-01-09 10:07:11"),
("tanya93", "tanya.kohli93@gmail.com", "2023-02-21 18:25:56"),
("raj85", "raj.saxena85@gmail.com", "2023-03-12 07:40:45"),
("lata89", "lata.trivedi89@gmail.com", "2023-04-04 15:10:30"),
("vivek87", "vivek.pathak87@gmail.com", "2023-05-18 11:55:42"),
("savita92", "savita.shukla92@gmail.com", "2023-06-06 20:19:51"),
("dev90", "dev.arora90@gmail.com", "2023-07-21 09:41:17"),
("mona91", "mona.bhalla91@gmail.com", "2023-08-17 13:35:12"),
("anil88", "anil.chandra88@gmail.com", "2023-09-23 16:55:03"),
("ritu85", "ritu.tiwari85@gmail.com", "2023-10-15 18:20:59"),
("sanjay92", "sanjay.ghosh92@gmail.com", "2023-11-01 07:22:14"),
("swati89", "swati.chaturvedi89@gmail.com", "2023-12-05 12:45:39"),
("pankaj87", "pankaj.menon87@gmail.com", "2023-12-30 19:30:12"),
("alka93", "alka.singhania93@gmail.com", "2024-01-09 09:14:55"),
("harish90", "harish.kulkarni90@gmail.com", "2024-02-16 20:11:20"),
("sonali86", "sonali.dey86@gmail.com", "2024-03-14 14:37:33"),
("dinesh91", "dinesh.bhagat91@gmail.com", "2024-04-20 10:21:19"),
("kavita88", "kavita.banerjee88@gmail.com", "2024-05-07 17:55:22"),
("mahesh85", "mahesh.ravindra85@gmail.com", "2024-06-11 07:10:40"),
("seema92", "seema.murthy92@gmail.com", "2024-07-18 13:42:15"),
("rajesh90", "rajesh.iyengar90@gmail.com", "2024-08-22 16:25:33"),
("usha87", "usha.bhat87@gmail.com", "2024-09-10 11:39:09"),
("arvind89", "arvind.kashyap89@gmail.com", "2024-09-29 08:44:50"),
("sarla93", "sarla.bhargava93@gmail.com", "2024-09-30 12:55:11"),
("ramesh90", "ramesh.joshi90@gmail.com", "2024-10-01 10:00:00");

insert into staff (first_name, last_name, position, salary, user_id)
values
("Rahul", "Sharma", "Manager", 65000.00, 1),
("Anita", "Patel", "Sales Executive", 35000.00, 2),
("Vikas", "Kumar", "Cashier", 28000.00, 3),
("Neha", "Verma", "Customer Support", 30000.00, 4),
("Arjun", "Singh", "Assistant Manager", 50000.00, 5),
("Priya", "Mehra", "HR Executive", 40000.00, 6),
("Amit", "Jain", "Inventory Manager", 45000.00, 7),
("Sneha", "Reddy", "Sales Executive", 36000.00, 8),
("Rohit", "Kapoor", "Cashier", 29000.00, 9),
("Pallavi", "Nair", "Receptionist", 25000.00, 10),
("Deepak", "Bose", "Delivery Staff", 22000.00, 11),
("Sunita", "Iyer", "Sales Executive", 34000.00, 12),
("Kiran", "Agarwal", "Accountant", 42000.00, 13),
("Manoj", "Gupta", "Assistant Manager", 48000.00, 14),
("Rekha", "Rao", "Customer Support", 31000.00, 15),
("Ajay", "Desai", "Inventory Manager", 46000.00, 16),
("Shweta", "Mishra", "Sales Executive", 37000.00, 17),
("Tarun", "Chopra", "Cashier", 27000.00, 18),
("Pooja", "Bhatt", "Receptionist", 26000.00, 19),
("Karan", "Ahluwalia", "Delivery Staff", 23000.00, 20),
("Jyoti", "Sen", "HR Executive", 39000.00, 21),
("Naveen", "Pillai", "Customer Support", 32000.00, 22),
("Meera", "Shetty", "Sales Executive", 35500.00, 23),
("Suresh", "Rana", "Manager", 64000.00, 24),
("Geeta", "Khanna", "Cashier", 28500.00, 25),
("Alok", "Tyagi", "Accountant", 43000.00, 26),
("Tanya", "Kohli", "Receptionist", 25500.00, 27),
("Raj", "Saxena", "Delivery Staff", 21000.00, 28),
("Lata", "Trivedi", "Customer Support", 30500.00, 29),
("Vivek", "Pathak", "Inventory Manager", 47000.00, 30),
("Savita", "Shukla", "HR Executive", 39500.00, 31),
("Dev", "Arora", "Assistant Manager", 51000.00, 32),
("Mona", "Bhalla", "Sales Executive", 34500.00, 33),
("Anil", "Chandra", "Cashier", 29500.00, 34),
("Ritu", "Tiwari", "Customer Support", 31500.00, 35),
("Sanjay", "Ghosh", "Manager", 66000.00, 36),
("Swati", "Chaturvedi", "Receptionist", 24000.00, 37),
("Pankaj", "Menon", "Delivery Staff", 22500.00, 38),
("Alka", "Singhania", "HR Executive", 40500.00, 39),
("Harish", "Kulkarni", "Accountant", 44000.00, 40),
("Sonali", "Dey", "Sales Executive", 36500.00, 41),
("Dinesh", "Bhagat", "Cashier", 28000.00, 42),
("Kavita", "Banerjee", "Customer Support", 33000.00, 43),
("Mahesh", "Ravindra", "Inventory Manager", 46000.00, 44),
("Seema", "Murthy", "Assistant Manager", 49000.00, 45),
("Rajesh", "Iyengar", "Sales Executive", 35000.00, 46),
("Usha", "Bhat", "Receptionist", 24500.00, 47),
("Arvind", "Kashyap", "Delivery Staff", 21500.00, 48),
("Sarla", "Bhargava", "Customer Support", 32500.00, 49),
("Ramesh", "Joshi", "Manager", 67000.00, 50);

insert into category (category_name)
values
("Electronics"),
("Mobile Phones"),
("Laptops"),
("Tablets"),
("Televisions"),
("Cameras"),
("Headphones"),
("Speakers"),
("Home Appliances"),
("Refrigerators"),
("Washing Machines"),
("Microwaves"),
("Air Conditioners"),
("Kitchen Appliances"),
("Furniture"),
("Sofas"),
("Beds"),
("Wardrobes"),
("Dining Tables"),
("Chairs"),
("Clothing"),
("Men's Wear"),
("Women's Wear"),
("Kids' Wear"),
("Footwear"),
("Sportswear"),
("Watches"),
("Jewellery"),
("Books"),
("Fiction"),
("Non-Fiction"),
("Stationery"),
("Toys"),
("Sports Equipment"),
("Groceries"),
("Fruits & Vegetables"),
("Beverages"),
("Snacks"),
("Personal Care"),
("Health & Wellness"),
("Beauty Products"),
("Pharmaceuticals"),
("Automotive"),
("Car Accessories"),
("Bike Accessories"),
("Gardening"),
("Pet Supplies"),
("Office Supplies"),
("Musical Instruments"),
("Gaming Consoles");

insert into product (product_name, price, stock, category_id)
values
("Samsung Galaxy S21", 55000.00, 25, 2),
("Apple iPhone 13", 70000.00, 18, 2),
("OnePlus 9 Pro", 60000.00, 20, 2),
("Dell Inspiron 15", 48000.00, 15, 3),
("HP Pavilion x360", 52000.00, 12, 3),
("MacBook Air M1", 95000.00, 10, 3),
("iPad Pro 11", 75000.00, 14, 4),
("Samsung Galaxy Tab S7", 65000.00, 16, 4),
("Sony Bravia 55inch", 82000.00, 8, 5),
("LG OLED 65inch", 120000.00, 5, 5),
("Canon EOS 90D", 98000.00, 7, 6),
("Nikon D7500", 85000.00, 9, 6),
("Sony WH-1000XM4", 25000.00, 30, 7),
("JBL Tune 750BT", 8000.00, 40, 7),
("Bose SoundLink Speaker", 15000.00, 22, 8),
("Sony Bluetooth Speaker", 12000.00, 25, 8),
("Samsung Refrigerator 350L", 40000.00, 11, 10),
("LG Washing Machine 7kg", 35000.00, 13, 11),
("IFB Microwave 25L", 15000.00, 20, 12),
("Voltas AC 1.5 Ton", 42000.00, 10, 13),
("Prestige Mixer Grinder", 5500.00, 40, 14),
("Wooden Sofa Set", 28000.00, 8, 16),
("King Size Bed", 45000.00, 6, 17),
("Wardrobe 3 Door", 32000.00, 7, 18),
("Dining Table 6 Seater", 38000.00, 5, 19),
("Office Chair", 8000.00, 15, 20),
("Men's Formal Shirt", 1800.00, 50, 21),
("Women's Kurti", 1500.00, 45, 22),
("Kids' T-shirt", 800.00, 60, 23),
("Nike Sports Shoes", 6000.00, 25, 25),
("Adidas Tracksuit", 4500.00, 20, 26),
("Fastrack Watch", 2500.00, 30, 27),
("Titan Gold Jewellery", 55000.00, 4, 28),
("The Alchemist", 400.00, 35, 29),
("Sapiens: A Brief History", 550.00, 28, 30),
("Notebook A5", 120.00, 100, 32),
("Remote Control Car", 1500.00, 20, 33),
("Cricket Bat SS", 3500.00, 15, 34),
("Apple Red (1kg)", 200.00, 60, 36),
("Tropicana Juice 1L", 120.00, 50, 37),
("Lays Chips 100g", 30.00, 200, 38),
("Dove Shampoo 650ml", 450.00, 40, 39),
("Dettol Soap (Pack of 4)", 140.00, 70, 40),
("Lakme Lipstick", 499.00, 35, 41),
("Paracetamol 500mg (10 tabs)", 35.00, 100, 42),
("Car Seat Cover", 4500.00, 12, 43),
("Bike Helmet", 2500.00, 15, 44),
("Garden Hose Pipe 20m", 1200.00, 10, 45),
("Dog Food 5kg", 1500.00, 20, 46),
("Office Printer A4", 12000.00, 8, 47),
("Yamaha Acoustic Guitar", 15000.00, 6, 48),
("PlayStation 5", 55000.00, 5, 50);

insert into suppliers (supplier_name, contact_person, email, phone)
values
("Tech Distributors Pvt Ltd", "Amit Sharma", "amit.sharma@techdist.com", "9876500001"),
("Gadget World Suppliers", "Neha Verma", "neha.verma@gadgetworld.com", "9876500002"),
("ElectroHub Traders", "Rajesh Gupta", "rajesh.gupta@electrohub.com", "9876500003"),
("Appliance Mart", "Pooja Mehta", "pooja.mehta@apmart.com", "9876500004"),
("Smart Devices Co", "Karan Patel", "karan.patel@smartdevices.com", "9876500005"),
("Future Electronics", "Anita Rao", "anita.rao@futureelec.com", "9876500006"),
("Bright Vision Traders", "Deepak Kumar", "deepak.kumar@bvtraders.com", "9876500007"),
("NextGen Suppliers", "Sunita Iyer", "sunita.iyer@nextgensup.com", "9876500008"),
("Prime Mobiles", "Arjun Singh", "arjun.singh@primemobiles.com", "9876500009"),
("Elite Laptops", "Priya Nair", "priya.nair@elitelaptops.com", "9876500010"),
("Camera King Distributors", "Manoj Desai", "manoj.desai@cameraking.com", "9876500011"),
("SoundTech Supplies", "Shweta Kapoor", "shweta.kapoor@soundtech.com", "9876500012"),
("Home Essentials Pvt Ltd", "Rohit Bansal", "rohit.bansal@homeessentials.com", "9876500013"),
("KitchenMate Traders", "Lata Reddy", "lata.reddy@kitchenmate.com", "9876500014"),
("Furniture House", "Vikas Chandra", "vikas.chandra@furnhouse.com", "9876500015"),
("Clothify Distributors", "Anjali Saxena", "anjali.saxena@clothify.com", "9876500016"),
("Shoe World Suppliers", "Tarun Khanna", "tarun.khanna@shoeworld.com", "9876500017"),
("TimeZone Traders", "Geeta Pillai", "geeta.pillai@timezone.com", "9876500018"),
("JewelsKart Distributors", "Ajay Bose", "ajay.bose@jewelskart.com", "9876500019"),
("BookHub Suppliers", "Meera Sharma", "meera.sharma@bookhub.com", "9876500020"),
("Toy Universe", "Suresh Agarwal", "suresh.agarwal@toyuniv.com", "9876500021"),
("SportsPro Distributors", "Savita Menon", "savita.menon@sportspro.com", "9876500022"),
("FreshMart Groceries", "Ramesh Joshi", "ramesh.joshi@freshmart.com", "9876500023"),
("Daily Beverages Co", "Jyoti Tyagi", "jyoti.tyagi@dailybev.com", "9876500024"),
("Snacky Traders", "Pankaj Kohli", "pankaj.kohli@snacky.com", "9876500025"),
("CarePlus Suppliers", "Alka Mishra", "alka.mishra@careplus.com", "9876500026"),
("HealthFirst Distributors", "Harish Kulkarni", "harish.kulkarni@healthfirst.com", "9876500027"),
("Glow Beauty Traders", "Sonali Banerjee", "sonali.banerjee@glowbeauty.com", "9876500028"),
("MediKart Distributors", "Dinesh Rana", "dinesh.rana@medikart.com", "9876500029"),
("AutoHub Suppliers", "Kavita Arora", "kavita.arora@autohub.com", "9876500030"),
("CarPlus Accessories", "Raj Kumar", "raj.kumar@carplus.com", "9876500031"),
("BikeMax Traders", "Ritu Verma", "ritu.verma@bikemax.com", "9876500032"),
("GreenLeaf Gardening", "Sanjay Chopra", "sanjay.chopra@greenleaf.com", "9876500033"),
("PetCare Distributors", "Seema Bhatt", "seema.bhatt@petcare.com", "9876500034"),
("OfficeMart Supplies", "Dev Arora", "dev.arora@officemart.com", "9876500035"),
("MusicWorld Traders", "Mona Dey", "mona.dey@musicworld.com", "9876500036"),
("GameZone Suppliers", "Naveen Shetty", "naveen.shetty@gamezone.com", "9876500037"),
("Vision Electronics", "Swati Tiwari", "swati.tiwari@visionelec.com", "9876500038"),
("Star Traders Pvt Ltd", "Mahesh Bhagat", "mahesh.bhagat@startraders.com", "9876500039"),
("Metro Distributors", "Kiran Deshmukh", "kiran.deshmukh@metro.com", "9876500040"),
("Royal Appliances", "Pooja Nanda", "pooja.nanda@royalappl.com", "9876500041"),
("Global Traders", "Vivek Rana", "vivek.rana@globaltraders.com", "9876500042"),
("Urban Essentials", "Shreya Jain", "shreya.jain@urbanessentials.com", "9876500043"),
("Cosmo Distributors", "Anil Bhatia", "anil.bhatia@cosmo.com", "9876500044"),
("NextStep Traders", "Rashmi Khurana", "rashmi.khurana@nextstep.com", "9876500045"),
("BrightMart Suppliers", "Lokesh Sharma", "lokesh.sharma@brightmart.com", "9876500046"),
("ValueKart Distributors", "Tanvi Mehta", "tanvi.mehta@valuekart.com", "9876500047"),
("MegaStore Suppliers", "Nikhil Kapoor", "nikhil.kapoor@megastore.com", "9876500048"),
("UniTrade Pvt Ltd", "Kalyan Reddy", "kalyan.reddy@unitrade.com", "9876500049"),
("Allied Traders", "Reena Saxena", "reena.saxena@allied.com", "9876500050");

insert into product_suppliers (product_id, supplier_id)
values
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 3),
(3, 4),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(7, 8),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50);

insert into orders (user_id, staff_id, order_date, total_amount)
values
(1, 1, "2024-01-05 10:15:22", 55000.00),
(2, 2, "2024-01-06 12:20:35", 70000.00),
(3, 3, "2024-01-07 14:35:10", 60000.00),
(4, 4, "2024-01-08 09:45:50", 48000.00),
(5, 5, "2024-01-09 16:25:15", 52000.00),
(6, 6, "2024-01-10 11:30:42", 95000.00),
(7, 7, "2024-01-11 13:15:05", 75000.00),
(8, 8, "2024-01-12 15:50:20", 65000.00),
(9, 9, "2024-01-13 10:05:45", 82000.00),
(10, 10, "2024-01-14 17:10:33", 120000.00),
(11, 11, "2024-01-15 08:25:55", 98000.00),
(12, 12, "2024-01-16 14:45:12", 85000.00),
(13, 13, "2024-01-17 12:15:40", 25000.00),
(14, 14, "2024-01-18 19:20:17", 8000.00),
(15, 15, "2024-01-19 10:30:05", 15000.00),
(16, 16, "2024-01-20 16:05:33", 12000.00),
(17, 17, "2024-01-21 09:45:22", 40000.00),
(18, 18, "2024-01-22 13:20:11", 35000.00),
(19, 19, "2024-01-23 11:50:45", 1500.00),
(20, 20, "2024-01-24 15:35:27", 1800.00),
(21, 21, "2024-01-25 10:15:10", 4500.00),
(22, 22, "2024-01-26 12:25:33", 6000.00),
(23, 23, "2024-01-27 14:40:50", 2500.00),
(24, 24, "2024-01-28 09:55:22", 55000.00),
(25, 25, "2024-01-29 17:10:12", 400.00),
(26, 26, "2024-01-30 11:45:33", 550.00),
(27, 27, "2024-01-31 13:20:47", 120.00),
(28, 28, "2024-02-01 10:35:22", 1500.00),
(29, 29, "2024-02-02 16:50:05", 3500.00),
(30, 30, "2024-02-03 08:20:40", 200.00),
(31, 31, "2024-02-04 14:10:12", 120.00),
(32, 32, "2024-02-05 09:45:55", 30.00),
(33, 33, "2024-02-06 15:25:30", 450.00),
(34, 34, "2024-02-07 12:05:22", 140.00),
(35, 35, "2024-02-08 16:40:10", 499.00),
(36, 36, "2024-02-09 10:15:45", 35.00),
(37, 37, "2024-02-10 13:50:22", 4500.00),
(38, 38, "2024-02-11 09:30:10", 2500.00),
(39, 39, "2024-02-12 14:05:55", 1200.00),
(40, 40, "2024-02-13 11:45:33", 1500.00),
(41, 41, "2024-02-14 15:25:12", 12000.00),
(42, 42, "2024-02-15 10:05:40", 15000.00),
(43, 43, "2024-02-16 16:35:27", 55000.00),
(44, 44, "2024-02-17 09:20:15", 82000.00),
(45, 45, "2024-02-18 14:50:05", 120000.00),
(46, 46, "2024-02-19 12:25:33", 98000.00),
(47, 47, "2024-02-20 08:45:50", 85000.00),
(48, 48, "2024-02-21 15:10:22", 25000.00),
(49, 49, "2024-02-22 11:35:05", 8000.00),
(50, 50, "2024-02-23 13:55:40", 15000.00);

insert into order_items (order_id, product_id, subtotal)
values
(1, 1, 55000.00),
(2, 2, 70000.00),
(3, 3, 60000.00),
(4, 4, 48000.00),
(5, 5, 52000.00),
(6, 6, 95000.00),
(7, 7, 75000.00),
(8, 8, 65000.00),
(9, 9, 82000.00),
(10, 10, 120000.00),
(11, 11, 98000.00),
(12, 12, 85000.00),
(13, 13, 25000.00),
(14, 14, 8000.00),
(15, 15, 15000.00),
(16, 16, 12000.00),
(17, 17, 40000.00),
(18, 18, 35000.00),
(19, 19, 1500.00),
(20, 20, 1800.00),
(21, 21, 4500.00),
(22, 22, 6000.00),
(23, 23, 2500.00),
(24, 24, 55000.00),
(25, 25, 400.00),
(26, 26, 550.00),
(27, 27, 120.00),
(28, 28, 1500.00),
(29, 29, 3500.00),
(30, 30, 200.00),
(31, 31, 120.00),
(32, 32, 30.00),
(33, 33, 450.00),
(34, 34, 140.00),
(35, 35, 499.00),
(36, 36, 35.00),
(37, 37, 4500.00),
(38, 38, 2500.00),
(39, 39, 1200.00),
(40, 40, 1500.00),
(41, 41, 12000.00),
(42, 42, 15000.00),
(43, 43, 55000.00),
(44, 44, 82000.00),
(45, 45, 120000.00),
(46, 46, 98000.00),
(47, 47, 85000.00),
(48, 48, 25000.00),
(49, 49, 8000.00),
(50, 50, 15000.00);

-- 1. List all users who have “gmail.com” in their email. --
select email from users where email like '%gmail.com';

-- 2. Find all products with price greater than 50,000. --
select product_name, price from product where price > 50000;

-- 3. Retrieve all staff whose position is “Cashier”. --
select first_name, last_name, position from staff where position = 'Cashier';

-- 4. Find staff who are either “Manager” or “Assistant Manager” **and** salary > 60,000. --
select first_name, last_name, position, salary from staff where position = 'Manager' or 'Assistant Manager' and salary > 60000;

-- 5. Get all orders with total_amount between 20,000 and 80,000 **and** order_date after ‘2024-01-15’. --
select order_id, user_id, total_amount, order_date from orders where total_amount >=20000 and total_amount <=80000 and order_date >= 2024-01-15;

-- 6. List products **not** in category_id 1 or 2. --
select product_id, product_name from product where category_id not in (1, 2);

-- 7. List users who have **never placed an order**. --
select o.user_id,u.username from orders as o left join users as u on o.user_id = u.username where o.order_id is null;

-- 8. Find products that are not in the categories “Electronics” or “Mobile Phones”. --
select p.product_name from product as p right join category as c on p.category_id = c.category_id where c.category_name not in ('Electronics','Mobile Phones');

-- 9. Show the top 5 most expensive products. --
select product_name, price from product order by price desc limit 5;

-- 10. List the last 10 orders by order_date. --
select order_date, total_amount from orders order by order_date desc limit 10;

-- 11. Retrieve staff ordered by salary descending, then first_name ascending. --
select * from staff order by salary desc;
select * from staff order by first_name asc;

-- 12. List staff without associated user accounts. --
select first_name, last_name from staff where user_id is null;

-- 13. Find products with no suppliers linked. --
select p.product_name from product as p left join product_suppliers as ps on p.product_id=ps.product_id where ps.product_id is null;

-- 14. Increase salary of all “Sales Executive” by 10%. --
update staff set salary = salary + (salary * 10/100) where position='Sales Executive';
select first_name,last_name,position,salary from staff where position='Sales Executive' order by first_name asc;

-- 15. Delete products with stock = 0. --
delete from product where stock = 0;
select * from product;

-- 16. Update email of user_id = 10 to a new email. --
update users set email = 'pallavi.nair104@proton.me' where user_id=10;
select * from users;

-- 17. Count the total number of orders. --
select count(order_id) from orders;

-- 18. Find average order amount per user. --
select user_id, avg(total_amount) as avg_amount_per_user from orders group by user_id;

-- 19. Find the most expensive product in each category. --
select p1.product_name, p1.price as expensive_price from product as p1 where p1.price = (select max(p2.price) from product as p2 where p1.category_id=p2.category_id) order by p1.price desc limit 5;

-- 20. Calculate total stock of products in the “Mobile Phones” category. --
select sum(stock) as total_stock from product where category_id = 2 group by category_id;

-- 21. List all products whose names start with “S”. --
select product_name from product where product_name like 'p%';

-- 22. Find users whose names contain “an”. --
select username from users where username like '%an%';

-- 23. Get all suppliers whose names end with “Ltd”. --
select supplier_name from suppliers where supplier_name like '%Ltd';

-- 24. Find all orders made by users with user_id in (1, 5, 10). --
select u.username from users as u right join orders as o on u.user_id = o.user_id where o.user_id in (1 ,5, 10);

-- 25. Get all products priced between 20,000 and 80,000. --
select product_name, price from product where price between 20000 and 80000;

-- 26. Show product_name as `Product` and price as `Cost`. --
select product_name as "Product", price as "Cost" from product;

-- 27. Display orders with total_amount labeled `OrderValue`. --
select order_id,user_id,staff_id,order_date,total_amount as "OrderValue" from orders;

-- 28. List orders with user name, staff name, and total_amount. --
select u.username, s.first_name, s.last_name, o.total_amount from ((orders as o inner join users as u on o.user_id=u.user_id) inner join staff as s on s.staff_id=o.staff_id);

-- 29. Show all products along with suppliers; display NULL if no supplier exists. --
select ps.supplier_id,p.product_name from product as p left join product_suppliers as ps on p.product_id = ps.product_id where supplier_id;

-- 30. Display all suppliers and the products they supply, including suppliers with no products. --
select p.product_name,ps.supplier_id from product as p right join product_suppliers as ps on p.product_id = ps.product_id;

-- 31. Find staff pairs who have the same position but different salaries. --
select s1.first_name, s1.last_name, s2.first_name, s2.last_name, s1.position, s1.salary as salary1, s2.salary as salary2 from staff s1 inner join staff s2 on s1.position = s2.position and s1.salary != s2.salary where s1.staff_id < s2.staff_id;

-- 32. List users and total amount they spent using JOINs between users, orders, and order_items. --
select u.username, o.total_amount from ((users as u inner join orders as o on u.user_id=o.user_id) inner join order_items as oi on o.order_id=oi.order_id);

-- 33. Show staff who handled orders above the average order amount using JOINs. --
select s.first_name, s.last_name from staff as s inner join orders as o ON s.staff_id = o.staff_id where o.total_amount > (select avg(total_amount) from orders) order by o.total_amount desc;

-- 34. combine list of “sales executive” and “cashier” staff in a single column of names.
select first_name from staff where position='sales executive' 
union 
select first_name from staff where position='cashier';

-- 35. union of users and staff first names to see overlapping names.
select username as name from users 
union 
select first_name from staff;

-- 36. calculate total order amount per user.
select user_id, sum(total_amount) as total_spent from orders group by user_id;

-- 37. count of products per category.
select category_id, count(*) as product_count from product group by category_id;

-- 38. list categories having more than 10 products.
select category_id, count(*) as product_count from product group by category_id having count(*) > 10;

-- 39. average salary per position, only for positions with average salary > 40000.
select position, avg(salary) as avg_salary from staff group by position having avg(salary) > 40000;

-- 40. find products that have at least one supplier.
select p.product_id, p.product_name from product p where exists (select 1 from product_suppliers ps where ps.product_id = p.product_id);

-- 41. find users who have placed orders.
select u.user_id, u.username from users u where exists (select 1 from orders o where o.user_id = u.user_id);

-- 42. retrieve orders where total_amount > average order_amount.
select * from orders where total_amount > (select avg(total_amount) from orders);

-- 43. find products whose stock is not equal to 20.
select * from product where stock <> 20;

-- 44. identify tables with primary key, foreign key, unique, not null, and check constraints.
select table_name, constraint_name, constraint_type from information_schema.table_constraints where table_schema='blinkit';

-- 45. attempt to insert a product without a category and observe the foreign key constraint failure.
insert into product(product_name, price, stock) values ('invalid product', 100, 10);

-- 46. find all orders in january 2024.
select * from orders where month(order_date)=1 and year(order_date)=2024;

-- 47. list users who joined after 2024-01-01.
select * from users where created_at > '2024-01-01';

-- 48. count orders per month.
select year(order_date) as year, month(order_date) as month, count(*) as total_orders from orders group by year(order_date), month(order_date);

-- 49. identify columns that are decimal, varchar, int, or datetime.
select table_name, column_name, data_type from information_schema.columns where table_schema='blinkit' and data_type in ('decimal','varchar','int','datetime');

-- 50. convert created_at to just date without time.
select user_id, date(created_at) as created_date from users;

-- 51. find users who spent more than the average total_amount.
select user_id, sum(total_amount) as total_spent from orders group by user_id having sum(total_amount) > (select avg(total_amount) from orders);

-- 52. list products that cost more than the cheapest product in “laptops” category.
select * from product where price > (select min(price) from product where category_id=(select category_id from category where category_name='laptops'));

-- 53. assign a rank to products by price within each category (rank).
select product_id, product_name, category_id, price, rank() over(partition by category_id order by price desc) as price_rank from product;

-- 54. show staff salary rank per position (dense_rank).
select staff_id, first_name, position, salary, dense_rank() over(partition by position order by salary desc) as salary_rank from staff;

-- 55. display top 3 expensive products per category using row_number.
select * from (select product_id, product_name, category_id, price, row_number() over(partition by category_id order by price desc) as rn from product) t where rn <= 3;

-- 56. use a cte to list users along with their total order amounts.
with user_totals as (select user_id, sum(total_amount) as total_spent from orders group by user_id) select u.username, ut.total_spent from users u join user_totals ut on u.user_id=ut.user_id;

-- 57. generate a list of dates from 2024-01-01 to 2024-01-31 using a recursive cte.
with recursive dates as (select date('2024-01-01') as dt union all select date_add(dt, interval 1 day) from dates where dt < '2024-01-31') select * from dates;

-- 58. use a cte with rank to find top staff based on total handled orders.
with staff_orders as (select staff_id, sum(total_amount) as total_handled from orders group by staff_id) select staff_id, total_handled, rank() over(order by total_handled desc) as rnk from staff_orders;

-- 59. identify top 5 categories with the highest revenue.
select c.category_name, sum(o.total_amount) as revenue from orders o join product p on o.order_id = p.product_id join category c on p.category_id=c.category_id group by c.category_id order by revenue desc limit 5;

-- 60. find repeat customers (users with more than 1 order).
select user_id, count(*) as order_count from orders group by user_id having count(*) > 1;

-- 61. determine staff performance based on total order amount handled.
select staff_id, sum(total_amount) as total_handled from orders group by staff_id order by total_handled desc;

-- 62. calculate average order value per month.
select year(order_date) as yr, month(order_date) as mn, avg(total_amount) as avg_order_value from orders group by year(order_date), month(order_date);

-- 63. detect outlier orders where total_amount is more than 2x standard deviation above average.
select * from orders where total_amount > (select avg(total_amount) + 2*stddev(total_amount) from orders);

-- 64. find suppliers who supply more than 5 different products.
select supplier_id, count(distinct product_id) as product_count from product_suppliers group by supplier_id having count(distinct product_id) > 5;

-- 65. identify products with stock lower than the average stock across all products.
select * from product where stock < (select avg(stock) from product);

-- 66. calculate cumulative revenue per month using window functions.
select year(order_date) as yr, month(order_date) as mn, sum(total_amount) as monthly_revenue, sum(sum(total_amount)) over(order by year(order_date), month(order_date)) as cumulative_revenue from orders group by year(order_date), month(order_date);

-- 67. find users whose first order amount was above the average order amount.
select user_id, total_amount from orders where (user_id, order_date) in (select user_id, min(order_date) from orders group by user_id) and total_amount > (select avg(total_amount) from orders);

-- 68. identify products supplied by more than one supplier.
select product_id, count(distinct supplier_id) as supplier_count from product_suppliers group by product_id having count(distinct supplier_id) > 1;

-- 69. list top 3 users by total spending in each category.
select * from (select u.user_id, c.category_name, sum(o.total_amount) as total_spent, row_number() over(partition by c.category_id order by sum(o.total_amount) desc) as rn from orders o join product p on o.order_id = p.product_id join category c on p.category_id=c.category_id join users u on o.user_id=u.user_id group by u.user_id, c.category_id) t where rn <= 3;

-- 70. find staff who never handled orders above 50000.
select s.staff_id, s.first_name from staff s where not exists (select 1 from orders o where o.staff_id=s.staff_id and o.total_amount > 50000);

-- 71. show monthly growth in total order amount.
select year(order_date) as yr, month(order_date) as mn, sum(total_amount) as monthly_revenue, sum(total_amount) - lag(sum(total_amount)) over(order by year(order_date), month(order_date)) as growth from orders group by year(order_date), month(order_date);

-- 72. identify products not sold in any order.
select * from product p where not exists (select 1 from order_items oi where oi.product_id=p.product_id);

-- 73. list the most frequent supplier for high-value products (>50000).
select supplier_id, product_id, count(*) as cnt from product_suppliers where product_id in (select product_id from product where price>50000) group by supplier_id, product_id order by cnt desc limit 1;

-- 74. calculate average order amount handled by each staff per month.
select staff_id, year(order_date) as yr, month(order_date) as mn, avg(total_amount) as avg_order from orders group by staff_id, year(order_date), month(order_date);

-- 75. find top 5 most expensive products supplied by each supplier.
select * from (select s.supplier_id, p.product_id, p.price, row_number() over(partition by s.supplier_id order by p.price desc) as rn from product p join product_suppliers s on p.product_id=s.product_id) t where rn <= 5;
