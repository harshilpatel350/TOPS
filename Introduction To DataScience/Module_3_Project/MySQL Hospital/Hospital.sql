drop database hospital;
create database hospital;
use hospital;

create table patients (
    patient_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    dob date,
    gender enum('Male','Female','Other'),
    contact varchar(15),
    address varchar(150)
);

create table doctors (
    doctor_id int primary key auto_increment,
    doctor_name varchar(100),
    specialization varchar(50),
    department_id int,
    phone varchar(15),
    email varchar(100) unique,
    salary decimal(10,2),
    joining_date date,
    foreign key (department_id) references departments(department_id)
);

create table appointments (
    appointment_id int primary key auto_increment,
    patient_id int,
    doctor_id int,
    appointment_date date,
    status enum('Scheduled','Completed','Cancelled','No-show'),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

create table treatments (
    treatment_id int primary key auto_increment,
    patient_id int,
    doctor_id int,
    treatment_date date,
    description text,
    cost decimal(10,2),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

create table billing (
    bill_id int primary key auto_increment,
    treatment_id int,
    patient_id int,
    amount decimal(10,2),
    billing_date date,
    paid int,
    foreign key (treatment_id) references treatments(treatment_id),
	foreign key (patient_id) references patients(patient_id)
);

create table departments (
    department_id int primary key auto_increment,
    department_name varchar(50),
    location varchar(100)
);

create table staff (
    staff_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    role varchar(50),
    department_id int,
    contact_number varchar(15),
    foreign key (department_id) references departments(department_id)
);

insert into doctors (doctor_id, doctor_name, specialization, department_id, phone, email, salary, joining_date) 
values
(1, 'Dr. Aarav Sharma', 'Cardiology', 1, '9810001001', 'aarav.sharma@hospital.com', 125000, '2019-01-10'),
(2, 'Dr. Priya Menon', 'Neurology', 2, '9820002002', 'priya.menon@hospital.com', 118000, '2018-06-15'),
(3, 'Dr. Arjun Singh', 'Orthopedics', 3, '9830003003', 'arjun.singh@hospital.com', 110000, '2020-02-01'),
(4, 'Dr. Meera Iyer', 'Pediatrics', 4, '9840004004', 'meera.iyer@hospital.com', 95000, '2017-09-21'),
(5, 'Dr. Rohan Gupta', 'Oncology', 5, '9850005005', 'rohan.gupta@hospital.com', 150000, '2019-03-19'),
(6, 'Dr. Kavita Nair', 'Dermatology', 6, '9860006006', 'kavita.nair@hospital.com', 102000, '2016-12-30'),
(7, 'Dr. Neha Patel', 'Gynecology', 7, '9870007007', 'neha.patel@hospital.com', 98000, '2020-05-17'),
(8, 'Dr. Aniket Verma', 'ENT', 8, '9880008008', 'aniket.verma@hospital.com', 90000, '2018-04-11'),
(9, 'Dr. Sneha Rao', 'Ophthalmology', 9, '9890009009', 'sneha.rao@hospital.com', 97000, '2019-08-23'),
(10, 'Dr. Ishaan Khanna', 'Urology', 10, '9900010000', 'ishaan.khanna@hospital.com', 115000, '2021-01-14'),
(11, 'Dr. Maria Dsouza', 'Psychiatry', 11, '9810011001', 'maria.dsouza@hospital.com', 105000, '2017-05-19'),
(12, 'Dr. Vikram Joshi', 'Gastroenterology', 12, '9820012002', 'vikram.joshi@hospital.com', 112000, '2018-10-05'),
(13, 'Dr. Shruti Das', 'Endocrinology', 13, '9830013003', 'shruti.das@hospital.com', 108000, '2019-09-09'),
(14, 'Dr. Nitin Bansal', 'Pulmonology', 14, '9840014004', 'nitin.bansal@hospital.com', 111000, '2020-07-27'),
(15, 'Dr. Rajesh Singh', 'Nephrology', 15, '9850015005', 'rajesh.singh@hospital.com', 125000, '2016-11-02'),
(16, 'Dr. Karishma Kapoor', 'Rheumatology', 16, '9860016006', 'karishma.kapoor@hospital.com', 107000, '2018-03-18'),
(17, 'Dr. Abhinav Jain', 'Radiology', 17, '9870017007', 'abhinav.jain@hospital.com', 120000, '2019-12-22'),
(18, 'Dr. Lata Roy', 'Pathology', 18, '9880018008', 'lata.roy@hospital.com', 97000, '2020-02-15'),
(19, 'Dr. Imran Sheikh', 'Hematology', 19, '9890019009', 'imran.sheikh@hospital.com', 99000, '2017-07-12'),
(20, 'Dr. Aditi Malhotra', 'General Medicine', 20, '9900020000', 'aditi.malhotra@hospital.com', 95000, '2019-10-30'),
(21, 'Dr. George Mathew', 'Cardiology', 21, '9810021001', 'george.mathew@hospital.com', 127000, '2021-03-03'),
(22, 'Dr. Pooja Reddy', 'Neurology', 22, '9820022002', 'pooja.reddy@hospital.com', 118500, '2018-12-01'),
(23, 'Dr. Raj Malhotra', 'Orthopedics', 23, '9830023003', 'raj.malhotra@hospital.com', 113000, '2017-06-25'),
(24, 'Dr. Ishita Dasgupta', 'Pediatrics', 24, '9840024004', 'ishita.dasgupta@hospital.com', 97000, '2019-05-14'),
(25, 'Dr. Sahil Kapoor', 'Oncology', 25, '9850025005', 'sahil.kapoor@hospital.com', 152000, '2018-09-10'),
(26, 'Dr. Tanya Bose', 'Dermatology', 26, '9860026006', 'tanya.bose@hospital.com', 104000, '2020-01-06'),
(27, 'Dr. Nisha Pillai', 'Gynecology', 27, '9870027007', 'nisha.pillai@hospital.com', 100000, '2020-11-09'),
(28, 'Dr. Karan Mehta', 'ENT', 28, '9880028008', 'karan.mehta@hospital.com', 94000, '2021-05-05'),
(29, 'Dr. Smita Aggarwal', 'Ophthalmology', 29, '9890029009', 'smita.aggarwal@hospital.com', 96500, '2019-07-21'),
(30, 'Dr. Farhan Ali', 'Urology', 30, '9900030000', 'farhan.ali@hospital.com', 116000, '2020-10-18'),
(31, 'Dr. Harini Krishnan', 'Psychiatry', 31, '9810031001', 'harini.krishnan@hospital.com', 104000, '2018-04-15'),
(32, 'Dr. Devraj Bhat', 'Gastroenterology', 32, '9820032002', 'devraj.bhat@hospital.com', 111500, '2019-03-09'),
(33, 'Dr. Ritu Varma', 'Endocrinology', 33, '9830033003', 'ritu.varma@hospital.com', 108000, '2021-07-22'),
(34, 'Dr. Anwar Khan', 'Pulmonology', 34, '9840034004', 'anwar.khan@hospital.com', 112000, '2018-05-12'),
(35, 'Dr. Sanya Arora', 'Nephrology', 35, '9850035005', 'sanya.arora@hospital.com', 126000, '2020-06-28'),
(36, 'Dr. Deepak Rawal', 'Radiology', 36, '9860036006', 'deepak.rawal@hospital.com', 122000, '2019-10-16'),
(37, 'Dr. Bhavana Nair', 'Pathology', 37, '9870037007', 'bhavana.nair@hospital.com', 96000, '2020-09-20'),
(38, 'Dr. Anil Thomas', 'Hematology', 38, '9880038008', 'anil.thomas@hospital.com', 98000, '2018-11-19'),
(39, 'Dr. Simran Oberoi', 'General Medicine', 39, '9890039009', 'simran.oberoi@hospital.com', 94000, '2017-12-10'),
(40, 'Dr. Henry Dsouza', 'Cardiology', 40, '9900040000', 'henry.dsouza@hospital.com', 130000, '2021-04-12'),
(41, 'Dr. Parth Trivedi', 'Neurology', 41, '9810041001', 'parth.trivedi@hospital.com', 118000, '2020-01-20'),
(42, 'Dr. Geeta Deshmukh', 'Orthopedics', 42, '9820042002', 'geeta.deshmukh@hospital.com', 114000, '2018-08-22'),
(43, 'Dr. Mohan Krishnan', 'Pediatrics', 43, '9830043003', 'mohan.krishnan@hospital.com', 96000, '2021-02-09'),
(44, 'Dr. Richa Jain', 'Oncology', 44, '9840044004', 'richa.jain@hospital.com', 153000, '2019-03-03'),
(45, 'Dr. Alan Fernandez', 'Dermatology', 45, '9850045005', 'alan.fernandez@hospital.com', 101000, '2020-05-10'),
(46, 'Dr. Jaya Mishra', 'Gynecology', 46, '9860046006', 'jaya.mishra@hospital.com', 99500, '2018-06-28'),
(47, 'Dr. Kiran Sethi', 'ENT', 47, '9870047007', 'kiran.sethi@hospital.com', 92000, '2017-07-18'),
(48, 'Dr. Natasha Rai', 'Ophthalmology', 48, '9880048008', 'natasha.rai@hospital.com', 98000, '2021-03-05'),
(49, 'Dr. Zaid Hussain', 'Urology', 49, '9890049009', 'zaid.hussain@hospital.com', 117000, '2020-02-14'),
(50, 'Dr. Isha Kapoor', 'Psychiatry', 50, '9900050000', 'isha.kapoor@hospital.com', 105000, '2019-12-01'),
(51, 'Dr. Manish Tiwari', 'Gastroenterology', 51, '9810051001', 'manish.tiwari@hospital.com', 113000, '2021-06-17'),
(52, 'Dr. Rupal Shah', 'Endocrinology', 52, '9820052002', 'rupal.shah@hospital.com', 107500, '2018-09-23'),
(53, 'Dr. Ajay Kumar', 'Pulmonology', 53, '9830053003', 'ajay.kumar@hospital.com', 110000, '2019-04-12'),
(54, 'Dr. Sreedevi Menon', 'Nephrology', 54, '9840054004', 'sreedevi.menon@hospital.com', 128000, '2017-05-26'),
(55, 'Dr. Ashok Pillai', 'Radiology', 55, '9850055005', 'ashok.pillai@hospital.com', 121000, '2020-03-19'),
(56, 'Dr. Varsha Bhatt', 'Pathology', 56, '9860056006', 'varsha.bhatt@hospital.com', 97000, '2021-08-08'),
(57, 'Dr. Rehan Mirza', 'Hematology', 57, '9870057007', 'rehan.mirza@hospital.com', 99500, '2018-12-05'),
(58, 'Dr. Charu Sinha', 'General Medicine', 58, '9880058008', 'charu.sinha@hospital.com', 96000, '2019-01-14'),
(59, 'Dr. Dinesh Kripalani', 'Cardiology', 59, '9890059009', 'dinesh.kripalani@hospital.com', 129000, '2021-09-09'),
(60, 'Dr. Asha Nambiar', 'Neurology', 60, '9900060000', 'asha.nambiar@hospital.com', 119000, '2020-12-12'),
(61, 'Dr. Tarun Arora', 'Orthopedics', 61, '9810061001', 'tarun.arora@hospital.com', 112500, '2018-08-01'),
(62, 'Dr. Ritu Ghosh', 'Pediatrics', 62, '9820062002', 'ritu.ghosh@hospital.com', 97000, '2019-02-26'),
(63, 'Dr. Nirmal John', 'Oncology', 63, '9830063003', 'nirmal.john@hospital.com', 154000, '2020-11-17'),
(64, 'Dr. Kavya Ramaswamy', 'Dermatology', 64, '9840064004', 'kavya.ramaswamy@hospital.com', 103500, '2021-01-09'),
(65, 'Dr. Udayan Patil', 'Gynecology', 65, '9850065005', 'udayan.patil@hospital.com', 98500, '2018-05-13'),
(66, 'Dr. Snehal More', 'ENT', 66, '9860066006', 'snehal.more@hospital.com', 94000, '2019-09-10'),
(67, 'Dr. Suresh Narayan', 'Ophthalmology', 67, '9870067007', 'suresh.narayan@hospital.com', 97500, '2017-04-29'),
(68, 'Dr. Arpita Jain', 'Urology', 68, '9880068008', 'arpita.jain@hospital.com', 118000, '2020-10-10'),
(69, 'Dr. Veena Bhattacharya', 'Psychiatry', 69, '9890069009', 'veena.bhattacharya@hospital.com', 104500, '2019-03-15'),
(70, 'Dr. Nihar Shetty', 'Gastroenterology', 70, '9900070000', 'nihar.shetty@hospital.com', 115000, '2018-07-22'),
(71, 'Dr. Kanchan Patel', 'Endocrinology', 71, '9810071001', 'kanchan.patel@hospital.com', 109000, '2020-02-03'),
(72, 'Dr. Anuj Das', 'Pulmonology', 72, '9820072002', 'anuj.das@hospital.com', 111000, '2019-01-11'),
(73, 'Dr. Vinod Krishnan', 'Nephrology', 73, '9830073003', 'vinod.krishnan@hospital.com', 124000, '2020-09-06'),
(74, 'Dr. Shreya Nanda', 'Radiology', 74, '9840074004', 'shreya.nanda@hospital.com', 120000, '2021-03-19'),
(75, 'Dr. Yusuf Ali', 'Pathology', 75, '9850075005', 'yusuf.ali@hospital.com', 95500, '2018-11-28'),
(76, 'Dr. Bhavik Mehta', 'Hematology', 76, '9860076006', 'bhavik.mehta@hospital.com', 98000, '2017-08-13'),
(77, 'Dr. Lavanya Reddy', 'General Medicine', 77, '9870077007', 'lavanya.reddy@hospital.com', 96000, '2019-06-21'),
(78, 'Dr. Alok Singh', 'Cardiology', 78, '9880078008', 'alok.singh@hospital.com', 128000, '2021-04-04'),
(79, 'Dr. Preeti Jain', 'Neurology', 79, '9890079009', 'preeti.jain@hospital.com', 120000, '2019-05-02'),
(80, 'Dr. Gautam Kapoor', 'Orthopedics', 80, '9900080000', 'gautam.kapoor@hospital.com', 115000, '2020-08-11'),
(81, 'Dr. Mala Sen', 'Pediatrics', 81, '9810081001', 'mala.sen@hospital.com', 96000, '2018-02-09'),
(82, 'Dr. Raghav Nair', 'Oncology', 82, '9820082002', 'raghav.nair@hospital.com', 156000, '2019-10-27'),
(83, 'Dr. Ashima Dey', 'Dermatology', 83, '9830083003', 'ashima.dey@hospital.com', 103000, '2020-04-05'),
(84, 'Dr. Pranav Gaur', 'Gynecology', 84, '9840084004', 'pranav.gaur@hospital.com', 99000, '2021-01-16'),
(85, 'Dr. Divya Krishnan', 'ENT', 85, '9850085005', 'divya.krishnan@hospital.com', 93500, '2019-09-03'),
(86, 'Dr. Rahul Desai', 'Ophthalmology', 86, '9860086006', 'rahul.desai@hospital.com', 97000, '2017-12-25'),
(87, 'Dr. Esha Bedi', 'Urology', 87, '9870087007', 'esha.bedi@hospital.com', 117500, '2020-03-23'),
(88, 'Dr. Vikas Sharma', 'Psychiatry', 88, '9880088008', 'vikas.sharma@hospital.com', 105000, '2018-06-10'),
(89, 'Dr. Namrata Paul', 'Gastroenterology', 89, '9890089009', 'namrata.paul@hospital.com', 114000, '2019-01-05'),
(90, 'Dr. Ajit Menon', 'Endocrinology', 90, '9900090000', 'ajit.menon@hospital.com', 110500, '2020-05-27'),
(91, 'Dr. Farida Noor', 'Pulmonology', 91, '9810091001', 'farida.noor@hospital.com', 112000, '2021-02-22'),
(92, 'Dr. Ramesh Pillai', 'Nephrology', 92, '9820092002', 'ramesh.pillai@hospital.com', 125000, '2017-09-14'),
(93, 'Dr. Chitra Ghosh', 'Radiology', 93, '9830093003', 'chitra.ghosh@hospital.com', 119000, '2020-11-08'),
(94, 'Dr. Aftab Alam', 'Pathology', 94, '9840094004', 'aftab.alam@hospital.com', 96500, '2018-03-30'),
(95, 'Dr. Snehal Shah', 'Hematology', 95, '9850095005', 'snehal.shah@hospital.com', 98500, '2019-12-17'),
(96, 'Dr. Tejas Naik', 'General Medicine', 96, '9860096006', 'tejas.naik@hospital.com', 95000, '2021-07-25'),
(97, 'Dr. Harpreet Kaur', 'Cardiology', 97, '9870097007', 'harpreet.kaur@hospital.com', 130000, '2018-05-09'),
(98, 'Dr. Ananya Sahu', 'Neurology', 98, '9880098008', 'ananya.sahu@hospital.com', 118000, '2019-02-27'),
(99, 'Dr. Nilesh Rao', 'Orthopedics', 99, '9890099009', 'nilesh.rao@hospital.com', 114000, '2020-08-31'),
(100, 'Dr. Diya Banerjee', 'Pediatrics', 100, '9900100000', 'diya.banerjee@hospital.com', 97500, '2019-10-15'),
(101, 'Dr. Aditya Nambiar', 'Oncology', 101, '9810101001', 'aditya.nambiar@hospital.com', 155000, '2020-03-11'),
(102, 'Dr. Rina Thomas', 'Dermatology', 102, '9820102002', 'rina.thomas@hospital.com', 104000, '2018-12-09'),
(103, 'Dr. Rohit Prasad', 'Gynecology', 103, '9830103003', 'rohit.prasad@hospital.com', 99000, '2019-07-14'),
(104, 'Dr. Aishwarya Naidu', 'ENT', 104, '9840104004', 'aishwarya.naidu@hospital.com', 95000, '2020-02-21'),
(105, 'Dr. Sanjay Reddy', 'Ophthalmology', 105, '9850105005', 'sanjay.reddy@hospital.com', 97500, '2018-08-12'),
(106, 'Dr. Bhavana Joshi', 'Urology', 106, '9860106006', 'bhavana.joshi@hospital.com', 118000, '2019-11-01'),
(107, 'Dr. Rajiv Chandra', 'Psychiatry', 107, '9870107007', 'rajiv.chandra@hospital.com', 104500, '2017-05-25'),
(108, 'Dr. Anjali Das', 'Gastroenterology', 108, '9880108008', 'anjali.das@hospital.com', 115500, '2021-01-19'),
(109, 'Dr. Kiran Shah', 'Endocrinology', 109, '9890109009', 'kiran.shah@hospital.com', 108000, '2020-04-13'),
(110, 'Dr. Nisha Bhat', 'Pulmonology', 110, '9900110000', 'nisha.bhat@hospital.com', 111000, '2018-02-08'),
(111, 'Dr. Mahesh Patil', 'Nephrology', 111, '9810111001', 'mahesh.patil@hospital.com', 126000, '2019-06-16'),
(112, 'Dr. Priyanka Ghosh', 'Radiology', 112, '9820112002', 'priyanka.ghosh@hospital.com', 119500, '2020-05-07'),
(113, 'Dr. Tarika Sen', 'Pathology', 113, '9830113003', 'tarika.sen@hospital.com', 96000, '2021-03-22'),
(114, 'Dr. Amitabh Roy', 'Hematology', 114, '9840114004', 'amitabh.roy@hospital.com', 98500, '2018-09-04'),
(115, 'Dr. Nivedita Rao', 'General Medicine', 115, '9850115005', 'nivedita.rao@hospital.com', 97000, '2019-08-19'),
(116, 'Dr. Akash Menon', 'Cardiology', 116, '9860116006', 'akash.menon@hospital.com', 132000, '2020-11-09'),
(117, 'Dr. Meenal Pillai', 'Neurology', 117, '9870117007', 'meenal.pillai@hospital.com', 118500, '2019-02-17'),
(118, 'Dr. Gaurav Tiwari', 'Orthopedics', 118, '9880118008', 'gaurav.tiwari@hospital.com', 113000, '2020-07-25'),
(119, 'Dr. Reema Bansal', 'Pediatrics', 119, '9890119009', 'reema.bansal@hospital.com', 96500, '2017-11-30'),
(120, 'Dr. Vijay Khatri', 'Oncology', 120, '9900120000', 'vijay.khatri@hospital.com', 157000, '2021-05-02'),
(121, 'Dr. Neeraja Sethi', 'Dermatology', 121, '9810121001', 'neeraja.sethi@hospital.com', 104500, '2018-03-11'),
(122, 'Dr. Deepak Goel', 'Gynecology', 122, '9820122002', 'deepak.goel@hospital.com', 99000, '2019-10-09'),
(123, 'Dr. Tanvi Rao', 'ENT', 123, '9830123003', 'tanvi.rao@hospital.com', 94500, '2020-08-23'),
(124, 'Dr. Parth Agarwal', 'Ophthalmology', 124, '9840124004', 'parth.agarwal@hospital.com', 98000, '2021-04-17'),
(125, 'Dr. Simran Chatterjee', 'Urology', 125, '9850125005', 'simran.chatterjee@hospital.com', 116500, '2019-09-06'),
(126, 'Dr. Javed Khan', 'Psychiatry', 126, '9860126006', 'javed.khan@hospital.com', 105000, '2017-12-01'),
(127, 'Dr. Kavya Sinha', 'Gastroenterology', 127, '9870127007', 'kavya.sinha@hospital.com', 114500, '2019-06-20'),
(128, 'Dr. Shashank Verma', 'Endocrinology', 128, '9880128008', 'shashank.verma@hospital.com', 108000, '2020-09-19'),
(129, 'Dr. Hema Nair', 'Pulmonology', 129, '9890129009', 'hema.nair@hospital.com', 113000, '2018-07-12'),
(130, 'Dr. Rajeev Das', 'Nephrology', 130, '9900130000', 'rajeev.das@hospital.com', 127000, '2019-03-25'),
(131, 'Dr. Aparna Iyer', 'Radiology', 131, '9810131001', 'aparna.iyer@hospital.com', 120000, '2020-01-30'),
(132, 'Dr. Saurabh Mishra', 'Pathology', 132, '9820132002', 'saurabh.mishra@hospital.com', 97000, '2021-02-24'),
(133, 'Dr. Rachita Sharma', 'Hematology', 133, '9830133003', 'rachita.sharma@hospital.com', 99500, '2018-11-03'),
(134, 'Dr. Adnan Siddiqui', 'General Medicine', 134, '9840134004', 'adnan.siddiqui@hospital.com', 95500, '2019-07-28'),
(135, 'Dr. Sneha Patil', 'Cardiology', 135, '9850135005', 'sneha.patil@hospital.com', 131000, '2020-10-15'),
(136, 'Dr. Devyani Raut', 'Neurology', 136, '9860136006', 'devyani.raut@hospital.com', 119000, '2019-04-18'),
(137, 'Dr. Mitesh Jain', 'Orthopedics', 137, '9870137007', 'mitesh.jain@hospital.com', 112000, '2020-08-03'),
(138, 'Dr. Priti Deshmukh', 'Pediatrics', 138, '9880138008', 'priti.deshmukh@hospital.com', 96000, '2017-09-14'),
(139, 'Dr. Manav Kapoor', 'Oncology', 139, '9890139009', 'manav.kapoor@hospital.com', 158000, '2021-06-10'),
(140, 'Dr. Rupal Kaur', 'Dermatology', 140, '9900140000', 'rupal.kaur@hospital.com', 104000, '2018-05-04'),
(141, 'Dr. Ashish Kumar', 'Gynecology', 141, '9810141001', 'ashish.kumar@hospital.com', 98000, '2019-12-17'),
(142, 'Dr. Kritika Joshi', 'ENT', 142, '9820142002', 'kritika.joshi@hospital.com', 94000, '2020-07-05'),
(143, 'Dr. Neel Mehta', 'Ophthalmology', 143, '9830143003', 'neel.mehta@hospital.com', 97500, '2019-10-12'),
(144, 'Dr. Aarushi Bhatia', 'Urology', 144, '9840144004', 'aarushi.bhatia@hospital.com', 118000, '2021-08-21'),
(145, 'Dr. Tanmay Reddy', 'Psychiatry', 145, '9850145005', 'tanmay.reddy@hospital.com', 104000, '2017-02-08'),
(146, 'Dr. Meera Shah', 'Gastroenterology', 146, '9860146006', 'meera.shah@hospital.com', 116000, '2020-12-14'),
(147, 'Dr. Deepa Pillai', 'Endocrinology', 147, '9870147007', 'deepa.pillai@hospital.com', 107500, '2018-03-20'),
(148, 'Dr. Sidharth Menon', 'Pulmonology', 148, '9880148008', 'sidharth.menon@hospital.com', 111500, '2019-06-23'),
(149, 'Dr. Payal Jain', 'Nephrology', 149, '9890149009', 'payal.jain@hospital.com', 126500, '2020-09-08'),
(150, 'Dr. Rohan Malhotra', 'Radiology', 150, '9900150000', 'rohan.malhotra@hospital.com', 119000, '2021-05-27'),
(151, 'Dr. Ananya Verma', 'Pathology', 151, '9810151001', 'ananya.verma@hospital.com', 97000, '2018-04-16'),
(152, 'Dr. Kunal Bansal', 'Hematology', 152, '9820152002', 'kunal.bansal@hospital.com', 99000, '2019-08-05'),
(153, 'Dr. Ritu Sharma', 'General Medicine', 153, '9830153003', 'ritu.sharma@hospital.com', 95500, '2020-11-12'),
(154, 'Dr. Ankit Jain', 'Cardiology', 154, '9840154004', 'ankit.jain@hospital.com', 132000, '2017-05-20'),
(155, 'Dr. Sakshi Mehra', 'Neurology', 155, '9850155005', 'sakshi.mehra@hospital.com', 118500, '2019-02-28'),
(156, 'Dr. Raghav Gupta', 'Orthopedics', 156, '9860156006', 'raghav.gupta@hospital.com', 113500, '2020-06-10'),
(157, 'Dr. Ishita Nair', 'Pediatrics', 157, '9870157007', 'ishita.nair@hospital.com', 96500, '2018-10-03'),
(158, 'Dr. Aditya Malhotra', 'Oncology', 158, '9880158008', 'aditya.malhotra@hospital.com', 159000, '2021-07-22'),
(159, 'Dr. Neha Kapoor', 'Dermatology', 159, '9890159009', 'neha.kapoor@hospital.com', 104500, '2018-12-17'),
(160, 'Dr. Sameer Reddy', 'Gynecology', 160, '9900160000', 'sameer.reddy@hospital.com', 98500, '2019-09-21'),
(161, 'Dr. Pooja Sharma', 'ENT', 161, '9810161001', 'pooja.sharma@hospital.com', 94500, '2020-08-15'),
(162, 'Dr. Vikram Singh', 'Ophthalmology', 162, '9820162002', 'vikram.singh@hospital.com', 98000, '2021-03-27'),
(163, 'Dr. Reema Nair', 'Urology', 163, '9830163003', 'reema.nair@hospital.com', 117500, '2019-05-11'),
(164, 'Dr. Pranav Desai', 'Psychiatry', 164, '9840164004', 'pranav.desai@hospital.com', 104500, '2017-11-28'),
(165, 'Dr. Sanya Joshi', 'Gastroenterology', 165, '9850165005', 'sanya.joshi@hospital.com', 116500, '2020-01-19'),
(166, 'Dr. Rishi Mehta', 'Endocrinology', 166, '9860166006', 'rishi.mehta@hospital.com', 107500, '2018-06-23'),
(167, 'Dr. Anjali Bhat', 'Pulmonology', 167, '9870167007', 'anjali.bhat@hospital.com', 112500, '2019-04-12'),
(168, 'Dr. Varun Kapoor', 'Nephrology', 168, '9880168008', 'varun.kapoor@hospital.com', 127500, '2020-09-29'),
(169, 'Dr. Shreya Ghosh', 'Radiology', 169, '9890169009', 'shreya.ghosh@hospital.com', 119500, '2021-05-18'),
(170, 'Dr. Mohit Jain', 'Pathology', 170, '9900170000', 'mohit.jain@hospital.com', 97500, '2018-03-04'),
(171, 'Dr. Kriti Verma', 'Hematology', 171, '9810171001', 'kriti.verma@hospital.com', 99500, '2019-08-22'),
(172, 'Dr. Akshay Singh', 'General Medicine', 172, '9820172002', 'akshay.singh@hospital.com', 96000, '2020-12-02'),
(173, 'Dr. Meera Sharma', 'Cardiology', 173, '9830173003', 'meera.sharma@hospital.com', 131500, '2017-06-15'),
(174, 'Dr. Rohan Gupta', 'Neurology', 174, '9840174004', 'rohan.gupta1@hospital.com', 118500, '2019-02-05'),
(175, 'Dr. Tanya Kapoor', 'Orthopedics', 175, '9850175005', 'tanya.kapoor@hospital.com', 113500, '2020-07-12'),
(176, 'Dr. Aarav Sharma', 'Pediatrics', 176, '9860176006', 'aarav.sharma1@hospital.com', 97000, '2018-09-28'),
(177, 'Dr. Ishani Reddy', 'Oncology', 177, '9870177007', 'ishani.reddy@hospital.com', 160000, '2021-06-14'),
(178, 'Dr. Devanshi Nair', 'Dermatology', 178, '9880178008', 'devanshi.nair@hospital.com', 105000, '2018-05-29'),
(179, 'Dr. Manish Joshi', 'Gynecology', 179, '9890179009', 'manish.joshi@hospital.com', 99000, '2019-10-11'),
(180, 'Dr. Ayesha Singh', 'ENT', 180, '9900180000', 'ayesha.singh@hospital.com', 95000, '2020-08-30'),
(181, 'Dr. Ankit Mehra', 'Ophthalmology', 181, '9810181001', 'ankit.mehra@hospital.com', 98500, '2021-04-05'),
(182, 'Dr. Nisha Verma', 'Urology', 182, '9820182002', 'nisha.verma@hospital.com', 118500, '2019-03-21'),
(183, 'Dr. Raghav Sharma', 'Psychiatry', 183, '9830183003', 'raghav.sharma@hospital.com', 105500, '2017-12-18'),
(184, 'Dr. Sakshi Kapoor', 'Gastroenterology', 184, '9840184004', 'sakshi.kapoor@hospital.com', 117000, '2020-01-26'),
(185, 'Dr. Karan Malhotra', 'Endocrinology', 185, '9850185005', 'karan.malhotra@hospital.com', 108000, '2018-06-09'),
(186, 'Dr. Priya Reddy', 'Pulmonology', 186, '9860186006', 'priya.reddy@hospital.com', 113500, '2019-04-30'),
(187, 'Dr. Arjun Nair', 'Nephrology', 187, '9870187007', 'arjun.nair@hospital.com', 128000, '2020-10-11'),
(188, 'Dr. Rhea Sharma', 'Radiology', 188, '9880188008', 'rhea.sharma@hospital.com', 120000, '2021-05-09'),
(189, 'Dr. Nikhil Verma', 'Pathology', 189, '9890189009', 'nikhil.verma@hospital.com', 98000, '2018-03-15'),
(190, 'Dr. Simran Gupta', 'Hematology', 190, '9900190000', 'simran.gupta@hospital.com', 99500, '2019-08-30'),
(191, 'Dr. Rohan Nair', 'General Medicine', 191, '9810191001', 'rohan.nair@hospital.com', 96000, '2020-12-10'),
(192, 'Dr. Tanya Verma', 'Cardiology', 192, '9820192002', 'tanya.verma@hospital.com', 131000, '2017-07-25'),
(193, 'Dr. Aditya Sharma', 'Neurology', 193, '9830193003', 'aditya.sharma@hospital.com', 119000, '2019-02-15'),
(194, 'Dr. Aarushi Kapoor', 'Orthopedics', 194, '9840194004', 'aarushi.kapoor@hospital.com', 114000, '2020-08-08'),
(195, 'Dr. Manav Malhotra', 'Pediatrics', 195, '9850195005', 'manav.malhotra@hospital.com', 97500, '2018-10-20'),
(196, 'Dr. Rupal Nair', 'Oncology', 196, '9860196006', 'rupal.nair@hospital.com', 161000, '2021-06-28'),
(197, 'Dr. Shreya Reddy', 'Dermatology', 197, '9870197007', 'shreya.reddy@hospital.com', 105500, '2018-05-18'),
(198, 'Dr. Kunal Sharma', 'Gynecology', 198, '9880198008', 'kunal.sharma@hospital.com', 99500, '2019-11-07'),
(199, 'Dr. Priyanka Kapoor', 'ENT', 199, '9890199009', 'priyanka.kapoor@hospital.com', 95500, '2020-09-12'),
(200, 'Dr. Akash Verma', 'Ophthalmology', 200, '9900200000', 'akash.verma@hospital.com', 99000, '2021-04-30');

insert into departments (department_id, department_name, location)
values
(1, 'Cardiology', 'Building A - Floor 2'),
(2, 'Neurology', 'Building B - Floor 3'),
(3, 'Orthopedics', 'Building C - Floor 1'),
(4, 'Pediatrics', 'Building A - Floor 1'),
(5, 'Dermatology', 'Building D - Floor 2'),
(6, 'ENT', 'Building E - Floor 2'),
(7, 'Gastroenterology', 'Building F - Floor 3'),
(8, 'Urology', 'Building G - Floor 2'),
(9, 'Ophthalmology', 'Building H - Floor 1'),
(10, 'Oncology', 'Building I - Floor 2'),
(11, 'Radiology', 'Building J - Floor 1'),
(12, 'Pathology', 'Building K - Floor 2'),
(13, 'Endocrinology', 'Building L - Floor 3'),
(14, 'Nephrology', 'Building M - Floor 2'),
(15, 'Anesthesiology', 'Building N - Floor 1'),
(16, 'Pulmonology', 'Building O - Floor 3'),
(17, 'Rheumatology', 'Building P - Floor 2'),
(18, 'Psychiatry', 'Building Q - Floor 2'),
(19, 'Hematology', 'Building R - Floor 3'),
(20, 'Immunology', 'Building S - Floor 2'),
(21, 'Emergency Medicine', 'Building T - Ground'),
(22, 'General Surgery', 'Building A - Floor 4'),
(23, 'Plastic Surgery', 'Building B - Floor 4'),
(24, 'Neurosurgery', 'Building C - Floor 4'),
(25, 'Gynecology', 'Building D - Floor 3'),
(26, 'Dental', 'Building E - Floor 1'),
(27, 'Sports Medicine', 'Building F - Floor 2'),
(28, 'Rehabilitation', 'Building G - Floor 3'),
(29, 'Family Medicine', 'Building H - Floor 2'),
(30, 'Occupational Therapy', 'Building I - Floor 1'),
(31, 'Audiology', 'Building J - Floor 1'),
(32, 'Nutrition', 'Building K - Floor 2'),
(33, 'Critical Care', 'Building L - Floor 1'),
(34, 'Pain Management', 'Building M - Floor 1'),
(35, 'Forensic Medicine', 'Building N - Floor 2'),
(36, 'Microbiology', 'Building O - Floor 3'),
(37, 'Biochemistry', 'Building P - Floor 2'),
(38, 'Genetics', 'Building Q - Floor 3'),
(39, 'Infectious Diseases', 'Building R - Floor 1'),
(40, 'Nuclear Medicine', 'Building S - Floor 2'),
(41, 'Transfusion Medicine', 'Building T - Floor 2'),
(42, 'Public Health', 'Building U - Floor 3'),
(43, 'Preventive Medicine', 'Building V - Floor 1'),
(44, 'Speech Therapy', 'Building W - Floor 2'),
(45, 'Genomics', 'Building X - Floor 1'),
(46, 'Geriatrics', 'Building Y - Floor 3'),
(47, 'Palliative Care', 'Building Z - Floor 1'),
(48, 'Clinical Pharmacology', 'Building AA - Floor 2'),
(49, 'Biomedical Engineering', 'Building BB - Floor 1'),
(50, 'Medical Informatics', 'Building CC - Floor 3'),
(51, 'Neonatology', 'Building DD - Floor 1'),
(52, 'Tropical Medicine', 'Building EE - Floor 2'),
(53, 'Otolaryngology', 'Building FF - Floor 3'),
(54, 'Toxicology', 'Building GG - Floor 1'),
(55, 'Veterinary Medicine', 'Building HH - Floor 2'),
(56, 'Marine Medicine', 'Building II - Floor 2'),
(57, 'Military Medicine', 'Building JJ - Floor 3'),
(58, 'Space Medicine', 'Building KK - Floor 1'),
(59, 'Hyperbaric Medicine', 'Building LL - Floor 2'),
(60, 'Allergy Clinic', 'Building MM - Floor 3'),
(61, 'Diabetology', 'Building NN - Floor 1'),
(62, 'Sleep Medicine', 'Building OO - Floor 1'),
(63, 'Occupational Health', 'Building PP - Floor 3'),
(64, 'Naturopathy', 'Building QQ - Floor 1'),
(65, 'Homeopathy', 'Building RR - Floor 2'),
(66, 'Ayurveda', 'Building SS - Floor 2'),
(67, 'Unani', 'Building TT - Floor 3'),
(68, 'Siddha', 'Building UU - Floor 1'),
(69, 'Chiropractic', 'Building VV - Floor 2'),
(70, 'Physical Medicine', 'Building WW - Floor 3'),
(71, 'Laser Surgery', 'Building XX - Floor 2'),
(72, 'Cosmetic Dermatology', 'Building YY - Floor 3'),
(73, 'Hair Transplant', 'Building ZZ - Floor 1'),
(74, 'Clinical Nutrition', 'Building AAA - Floor 2'),
(75, 'Molecular Medicine', 'Building BBB - Floor 3'),
(76, 'Cytology', 'Building CCC - Floor 2'),
(77, 'Histopathology', 'Building DDD - Floor 1'),
(78, 'Dental Surgery', 'Building EEE - Floor 3'),
(79, 'Maxillofacial Surgery', 'Building FFF - Floor 2'),
(80, 'Speech Pathology', 'Building GGG - Floor 3'),
(81, 'Telemedicine', 'Building HHH - Floor 2'),
(82, 'Health Informatics', 'Building III - Floor 1'),
(83, 'Radiotherapy', 'Building JJJ - Floor 3'),
(84, 'Emergency Trauma', 'Building KKK - Ground'),
(85, 'Blood Bank', 'Building LLL - Floor 2'),
(86, 'Biostatistics', 'Building MMM - Floor 1'),
(87, 'Hospital Administration', 'Building NNN - Floor 3'),
(88, 'Clinical Research', 'Building OOO - Floor 2'),
(89, 'Epidemiology', 'Building PPP - Floor 3'),
(90, 'Reproductive Medicine', 'Building QQQ - Floor 2'),
(91, 'Liver Transplant', 'Building RRR - Floor 2'),
(92, 'Kidney Transplant', 'Building SSS - Floor 3'),
(93, 'Cardiothoracic Surgery', 'Building TTT - Floor 1'),
(94, 'Vascular Surgery', 'Building UUU - Floor 3'),
(95, 'Imaging Sciences', 'Building VVV - Floor 2'),
(96, 'Robotic Surgery', 'Building WWW - Floor 1'),
(97, 'Emergency ICU', 'Building XXX - Floor 1'),
(98, 'High Dependency Unit', 'Building YYY - Floor 2'),
(99, 'Gynae Oncology', 'Building ZZZ - Floor 3'),
(100, 'Obstetrics', 'Building AAAA - Floor 2'),
(101, 'Cardiac Surgery', 'Building BBBB - Floor 3'),
(102, 'Nuclear Imaging', 'Building CCCC - Floor 1'),
(103, 'Fertility Clinic', 'Building DDDD - Floor 2'),
(104, 'IVF Centre', 'Building EEEE - Floor 2'),
(105, 'Pain Therapy', 'Building FFFF - Floor 3'),
(106, 'Preventive Cardiology', 'Building GGGG - Floor 1'),
(107, 'Bone Marrow Transplant', 'Building HHHH - Floor 2'),
(108, 'Stroke Unit', 'Building IIII - Floor 3'),
(109, 'Heart Failure Clinic', 'Building JJJJ - Floor 2'),
(110, 'Dialysis Unit', 'Building KKKK - Floor 1'),
(111, 'Radiation Oncology', 'Building LLLL - Floor 3'),
(112, 'Neuro Rehab', 'Building MMMM - Floor 2'),
(113, 'Pain Block Clinic', 'Building NNNN - Floor 1'),
(114, 'Cardiac Rehab', 'Building OOOO - Floor 2'),
(115, 'Child Psychology', 'Building PPPP - Floor 1'),
(116, 'Clinical Psychology', 'Building QQQQ - Floor 2'),
(117, 'Burn Unit', 'Building RRRR - Floor 1'),
(118, 'Infection Control', 'Building SSSS - Floor 2'),
(119, 'Respiratory Therapy', 'Building TTTT - Floor 3'),
(120, 'Cardiac ICU', 'Building UUUU - Floor 1'),
(121, 'Neuro ICU', 'Building VVVV - Floor 1'),
(122, 'Medical ICU', 'Building WWWW - Floor 2'),
(123, 'Surgical ICU', 'Building XXXX - Floor 3'),
(124, 'Pediatric ICU', 'Building YYYY - Floor 1'),
(125, 'NICU', 'Building ZZZZ - Floor 1'),
(126, 'Onco Surgery', 'Building AAAAB - Floor 2'),
(127, 'Cardiac Research', 'Building BBBBB - Floor 2'),
(128, 'Neuro Research', 'Building CCCCC - Floor 3'),
(129, 'Lung Transplant', 'Building DDDDD - Floor 1'),
(130, 'Sleep Lab', 'Building EEEEE - Floor 2'),
(131, 'Allergy Testing', 'Building FFFFF - Floor 3'),
(132, 'Genetic Testing', 'Building GGGGG - Floor 2'),
(133, 'Medical Records', 'Building HHHHH - Floor 1'),
(134, 'Pharmacy', 'Building IIIII - Floor 1'),
(135, 'Cafeteria', 'Building JJJJJ - Floor 1'),
(136, 'Waste Management', 'Building KKKKK - Ground'),
(137, 'Security', 'Building LLLLL - Ground'),
(138, 'Administration', 'Building MMMMM - Floor 2'),
(139, 'Research & Development', 'Building NNNNN - Floor 3'),
(140, 'Innovation Lab', 'Building OOOOO - Floor 1'),
(141, 'Medical Simulation', 'Building PPPPP - Floor 2'),
(142, 'Health Analytics', 'Building QQQQQ - Floor 3'),
(143, 'Clinical Audit', 'Building RRRRR - Floor 1'),
(144, 'Financial Audit', 'Building SSSSS - Floor 1'),
(145, 'IT Support', 'Building TTTTT - Floor 2'),
(146, 'Networking', 'Building UUUUU - Floor 2'),
(147, 'Bioinformatics', 'Building VVVVV - Floor 3'),
(148, 'Data Science', 'Building WWWWW - Floor 2'),
(149, 'AI Research', 'Building XXXXX - Floor 1'),
(150, 'Automation Lab', 'Building YYYYY - Floor 2'),
(151, 'Tele ICU', 'Building ZZZZZ - Floor 1'),
(152, 'Tele Consultation', 'Building AAAAAA - Floor 2'),
(153, 'Public Awareness', 'Building BBBBBB - Floor 3'),
(154, 'CSR Activities', 'Building CCCCCC - Floor 1'),
(155, 'Legal Affairs', 'Building DDDDDD - Floor 2'),
(156, 'Patient Relations', 'Building EEEEEE - Floor 3'),
(157, 'HR Department', 'Building FFFFFF - Floor 1'),
(158, 'Procurement', 'Building GGGGGG - Floor 2'),
(159, 'Maintenance', 'Building HHHHHH - Ground'),
(160, 'Training & Development', 'Building IIIIII - Floor 2'),
(161, 'Inventory', 'Building JJJJJJ - Floor 1'),
(162, 'Sterilization', 'Building KKKKKK - Floor 1'),
(163, 'Transport', 'Building LLLLLL - Ground'),
(164, 'Laundry', 'Building MMMMMM - Ground'),
(165, 'Catering', 'Building NNNNNN - Floor 1'),
(166, 'Waste Disposal', 'Building OOOOOO - Ground'),
(167, 'Equipment Management', 'Building PPPPPP - Floor 2'),
(168, 'Documentation', 'Building QQQQQQ - Floor 1'),
(169, 'Patient Experience', 'Building RRRRRR - Floor 2'),
(170, 'Facility Management', 'Building SSSSSS - Ground'),
(171, 'Corporate Health', 'Building TTTTTT - Floor 2'),
(172, 'Occupational Therapy Advanced', 'Building UUUUUU - Floor 3'),
(173, 'Pediatric Surgery', 'Building VVVVVV - Floor 2'),
(174, 'Endoscopy', 'Building WWWWWW - Floor 3'),
(175, 'Cath Lab', 'Building XXXXXX - Floor 2'),
(176, 'Medical Equipment Testing', 'Building YYYYYY - Floor 1'),
(177, 'Sterile Supply Unit', 'Building ZZZZZZ - Floor 1'),
(178, 'Nursing Administration', 'Building AAAAAA - Floor 2'),
(179, 'Outpatient Services', 'Building BBBBBB - Floor 1'),
(180, 'Inpatient Services', 'Building CCCCCC - Floor 3'),
(181, 'Housekeeping', 'Building DDDDDD - Ground'),
(182, 'Ambulance Unit', 'Building EEEEEE - Ground'),
(183, 'Fire Safety', 'Building FFFFFF - Ground'),
(184, 'Patient Registration', 'Building GGGGGG - Floor 1'),
(185, 'Health Records Digitization', 'Building HHHHHH - Floor 1'),
(186, 'Insurance Desk', 'Building IIIIII - Floor 2'),
(187, 'Pharmacy Administration', 'Building JJJJJJ - Floor 2'),
(188, 'Data Governance', 'Building KKKKKK - Floor 3'),
(189, 'Telemedicine Support', 'Building LLLLLL - Floor 1'),
(190, 'Medical Coding', 'Building MMMMMM - Floor 1'),
(191, 'Clinical Governance', 'Building NNNNNN - Floor 2'),
(192, 'Safety Audit', 'Building OOOOOO - Floor 1'),
(193, 'Infection Surveillance', 'Building PPPPPP - Floor 2'),
(194, 'Patient Safety', 'Building QQQQQQ - Floor 1'),
(195, 'Biomedical Calibration', 'Building RRRRRR - Floor 1'),
(196, 'Nursing Education', 'Building SSSSSS - Floor 3'),
(197, 'Medical Education', 'Building TTTTTT - Floor 3'),
(198, 'Clinical Simulation', 'Building UUUUUU - Floor 2'),
(199, 'Digital Transformation', 'Building VVVVVV - Floor 3'),
(200, 'Health Innovation', 'Building WWWWWW - Floor 2');

insert into patients (patient_id, first_name, last_name, dob, gender, contact, address)
values
(1, 'Aarav', 'Sharma', '1985-01-10', 'Male', '9810000001', 'Mumbai, India'),
(2, 'Ananya', 'Verma', '1990-02-15', 'Female', '9810000002', 'Delhi, India'),
(3, 'Rohan', 'Gupta', '1978-03-22', 'Male', '9810000003', 'Bangalore, India'),
(4, 'Sanya', 'Joshi', '1988-04-05', 'Female', '9810000004', 'Chennai, India'),
(5, 'Aditya', 'Malhotra', '1975-05-19', 'Male', '9810000005', 'Kolkata, India'),
(6, 'Ishita', 'Nair', '1992-06-25', 'Female', '9810000006', 'Pune, India'),
(7, 'Kunal', 'Bansal', '1980-07-12', 'Male', '9810000007', 'Ahmedabad, India'),
(8, 'Neha', 'Kapoor', '1983-08-30', 'Female', '9810000008', 'Hyderabad, India'),
(9, 'Varun', 'Singh', '1979-09-17', 'Male', '9810000009', 'Jaipur, India'),
(10, 'Ritu', 'Sharma', '1991-10-22', 'Female', '9810000010', 'Lucknow, India'),
(11, 'Arjun', 'Mehta', '1982-01-18', 'Male', '9810000011', 'Bhopal, India'),
(12, 'Sakshi', 'Ghosh', '1986-02-20', 'Female', '9810000012', 'Nagpur, India'),
(13, 'Raghav', 'Reddy', '1977-03-13', 'Male', '9810000013', 'Indore, India'),
(14, 'Aarushi', 'Bhat', '1993-04-02', 'Female', '9810000014', 'Surat, India'),
(15, 'Mohit', 'Jain', '1981-05-25', 'Male', '9810000015', 'Patna, India'),
(16, 'Meera', 'Saxena', '1990-06-19', 'Female', '9810000016', 'Varanasi, India'),
(17, 'Ravi', 'Roy', '1984-07-07', 'Male', '9810000017', 'Bhubaneswar, India'),
(18, 'Priya', 'Chopra', '1987-08-23', 'Female', '9810000018', 'Indore, India'),
(19, 'Aman', 'Rao', '1976-09-11', 'Male', '9810000019', 'Guwahati, India'),
(20, 'Anjali', 'Patel', '1992-10-05', 'Female', '9810000020', 'Gurgaon, India'),
(21, 'Karan', 'Sharma', '1980-11-02', 'Male', '9810000021', 'Kanpur, India'),
(22, 'Sneha', 'Singh', '1991-12-14', 'Female', '9810000022', 'Thiruvananthapuram, India'),
(23, 'Vikram', 'Gupta', '1983-01-28', 'Male', '9810000023', 'Raipur, India'),
(24, 'Nisha', 'Rao', '1979-02-19', 'Female', '9810000024', 'Srinagar, India'),
(25, 'Rohit', 'Kumar', '1990-03-07', 'Male', '9810000025', 'Jammu, India'),
(26, 'Shalini', 'Sharma', '1985-04-12', 'Female', '9810000026', 'Udaipur, India'),
(27, 'Ajay', 'Patel', '1988-05-20', 'Male', '9810000027', 'Aizawl, India'),
(28, 'Kavita', 'Singh', '1992-06-03', 'Female', '9810000028', 'Shillong, India'),
(29, 'Harish', 'Gupta', '1977-07-27', 'Male', '9810000029', 'Imphal, India'),
(30, 'Anita', 'Rao', '1989-08-15', 'Female', '9810000030', 'Itanagar, India'),
(31, 'Mohan', 'Sharma', '1990-09-09', 'Male', '9810000031', 'Kohima, India'),
(32, 'Rekha', 'Patel', '1982-10-28', 'Female', '9810000032', 'Dibrugarh, India'),
(33, 'Suresh', 'Yadav', '1981-11-16', 'Male', '9810000033', 'Noida, India'),
(34, 'Kiran', 'Nair', '1990-12-25', 'Female', '9810000034', 'Kochi, India'),
(35, 'Gaurav', 'Chopra', '1978-01-05', 'Male', '9810000035', 'Amritsar, India'),
(36, 'Divya', 'Mishra', '1992-02-14', 'Female', '9810000036', 'Patna, India'),
(37, 'Ashok', 'Tiwari', '1980-03-29', 'Male', '9810000037', 'Varanasi, India'),
(38, 'Seema', 'Bansal', '1985-04-17', 'Female', '9810000038', 'Nagpur, India'),
(39, 'Naveen', 'Jain', '1983-05-08', 'Male', '9810000039', 'Surat, India'),
(40, 'Ritika', 'Kapoor', '1991-06-12', 'Female', '9810000040', 'Agra, India'),
(41, 'Devendra', 'Saxena', '1976-07-19', 'Male', '9810000041', 'Meerut, India'),
(42, 'Pallavi', 'Sinha', '1993-08-05', 'Female', '9810000042', 'Ranchi, India'),
(43, 'Alok', 'Tripathi', '1982-09-14', 'Male', '9810000043', 'Jabalpur, India'),
(44, 'Isha', 'Pillai', '1990-10-21', 'Female', '9810000044', 'Madurai, India'),
(45, 'Raghav', 'Menon', '1985-11-07', 'Male', '9810000045', 'Coimbatore, India'),
(46, 'Sonal', 'Bhatt', '1992-12-26', 'Female', '9810000046', 'Dehradun, India'),
(47, 'Tarun', 'Shetty', '1987-01-15', 'Male', '9810000047', 'Mysore, India'),
(48, 'Megha', 'Gill', '1991-02-27', 'Female', '9810000048', 'Amravati, India'),
(49, 'Arvind', 'Bose', '1980-03-08', 'Male', '9810000049', 'Gwalior, India'),
(50, 'Komal', 'Das', '1992-04-19', 'Female', '9810000050', 'Siliguri, India'),
(51, 'Yogesh', 'Roy', '1984-05-11', 'Male', '9810000051', 'Jodhpur, India'),
(52, 'Poonam', 'Chatterjee', '1990-06-22', 'Female', '9810000052', 'Howrah, India'),
(53, 'Ankit', 'Sharma', '1979-07-09', 'Male', '9810000053', 'Delhi, India'),
(54, 'Neha', 'Gupta', '1987-08-28', 'Female', '9810000054', 'Mumbai, India'),
(55, 'Rajat', 'Kumar', '1982-09-13', 'Male', '9810000055', 'Bangalore, India'),
(56, 'Anushka', 'Verma', '1991-10-04', 'Female', '9810000056', 'Chennai, India'),
(57, 'Vivek', 'Singh', '1980-11-19', 'Male', '9810000057', 'Kolkata, India'),
(58, 'Sonal', 'Patel', '1985-12-23', 'Female', '9810000058', 'Pune, India'),
(59, 'Rohit', 'Mehta', '1978-01-16', 'Male', '9810000059', 'Ahmedabad, India'),
(60, 'Aishwarya', 'Bhat', '1990-02-05', 'Female', '9810000060', 'Hyderabad, India'),
(61, 'Amit', 'Rao', '1983-03-22', 'Male', '9810000061', 'Jaipur, India'),
(62, 'Kavya', 'Kapoor', '1992-04-18', 'Female', '9810000062', 'Lucknow, India'),
(63, 'Harish', 'Tiwari', '1981-05-07', 'Male', '9810000063', 'Bhopal, India'),
(64, 'Divya', 'Sharma', '1989-06-21', 'Female', '9810000064', 'Nagpur, India'),
(65, 'Suresh', 'Jain', '1977-07-29', 'Male', '9810000065', 'Indore, India'),
(66, 'Ritika', 'Mishra', '1991-08-14', 'Female', '9810000066', 'Surat, India'),
(67, 'Ajay', 'Gupta', '1980-09-11', 'Male', '9810000067', 'Patna, India'),
(68, 'Anita', 'Singh', '1986-10-26', 'Female', '9810000068', 'Varanasi, India'),
(69, 'Vikram', 'Sharma', '1979-11-09', 'Male', '9810000069', 'Bhubaneswar, India'),
(70, 'Meera', 'Patel', '1993-12-17', 'Female', '9810000070', 'Indore, India'),
(71, 'Raghav', 'Verma', '1982-01-05', 'Male', '9810000071', 'Guwahati, India'),
(72, 'Preeti', 'Kapoor', '1990-02-11', 'Female', '9810000072', 'Gurgaon, India'),
(73, 'Aman', 'Rao', '1978-03-23', 'Male', '9810000073', 'Nashik, India'),
(74, 'Anjali', 'Sharma', '1992-04-07', 'Female', '9810000074', 'Vadodara, India'),
(75, 'Karan', 'Singh', '1980-05-18', 'Male', '9810000075', 'Kanpur, India'),
(76, 'Sneha', 'Gupta', '1991-06-25', 'Female', '9810000076', 'Thiruvananthapuram, India'),
(77, 'Vikram', 'Rao', '1984-07-12', 'Male', '9810000077', 'Raipur, India'),
(78, 'Nisha', 'Patel', '1982-08-29', 'Female', '9810000078', 'Srinagar, India'),
(79, 'Rohit', 'Sharma', '1990-09-17', 'Male', '9810000079', 'Jammu, India'),
(80, 'Shalini', 'Verma', '1985-10-06', 'Female', '9810000080', 'Udaipur, India'),
(81, 'Ajay', 'Kumar', '1988-11-22', 'Male', '9810000081', 'Aizawl, India'),
(82, 'Kavita', 'Sharma', '1992-12-19', 'Female', '9810000082', 'Shillong, India'),
(83, 'Harish', 'Gupta', '1979-01-28', 'Male', '9810000083', 'Imphal, India'),
(84, 'Anita', 'Rao', '1989-02-15', 'Female', '9810000084', 'Itanagar, India'),
(85, 'Mohan', 'Sharma', '1990-03-10', 'Male', '9810000085', 'Kohima, India'),
(86, 'Rekha', 'Patel', '1982-04-21', 'Female', '9810000086', 'Dibrugarh, India'),
(87, 'Suresh', 'Yadav', '1981-05-08', 'Male', '9810000087', 'Noida, India'),
(88, 'Kiran', 'Nair', '1990-06-30', 'Female', '9810000088', 'Kochi, India'),
(89, 'Gaurav', 'Chopra', '1978-07-16', 'Male', '9810000089', 'Amritsar, India'),
(90, 'Divya', 'Mishra', '1992-08-25', 'Female', '9810000090', 'Patna, India'),
(91, 'Ashok', 'Tiwari', '1980-09-12', 'Male', '9810000091', 'Varanasi, India'),
(92, 'Seema', 'Bansal', '1985-10-04', 'Female', '9810000092', 'Nagpur, India'),
(93, 'Naveen', 'Jain', '1983-11-19', 'Male', '9810000093', 'Surat, India'),
(94, 'Ritika', 'Kapoor', '1991-12-15', 'Female', '9810000094', 'Agra, India'),
(95, 'Devendra', 'Saxena', '1976-01-09', 'Male', '9810000095', 'Meerut, India'),
(96, 'Pallavi', 'Sinha', '1993-02-20', 'Female', '9810000096', 'Ranchi, India'),
(97, 'Alok', 'Tripathi', '1982-03-05', 'Male', '9810000097', 'Jabalpur, India'),
(98, 'Isha', 'Pillai', '1990-04-27', 'Female', '9810000098', 'Madurai, India'),
(99, 'Raghav', 'Menon', '1985-05-13', 'Male', '9810000099', 'Coimbatore, India'),
(100, 'Sonal', 'Bhatt', '1992-06-30', 'Female', '9810000100', 'Dehradun, India'),
(101, 'Tarun', 'Shetty', '1983-07-08', 'Male', '9810000101', 'Mysore, India'),
(102, 'Megha', 'Gill', '1990-08-19', 'Female', '9810000102', 'Amravati, India'),
(103, 'Arvind', 'Bose', '1985-09-24', 'Male', '9810000103', 'Gwalior, India'),
(104, 'Komal', 'Das', '1992-10-14', 'Female', '9810000104', 'Siliguri, India'),
(105, 'Yogesh', 'Roy', '1988-11-02', 'Male', '9810000105', 'Jodhpur, India'),
(106, 'Poonam', 'Chatterjee', '1991-12-18', 'Female', '9810000106', 'Howrah, India'),
(107, 'Ankit', 'Sharma', '1982-01-27', 'Male', '9810000107', 'Delhi, India'),
(108, 'Neha', 'Gupta', '1989-02-13', 'Female', '9810000108', 'Mumbai, India'),
(109, 'Rajat', 'Kumar', '1980-03-05', 'Male', '9810000109', 'Bangalore, India'),
(110, 'Anushka', 'Verma', '1993-04-21', 'Female', '9810000110', 'Chennai, India'),
(111, 'Vivek', 'Singh', '1981-05-17', 'Male', '9810000111', 'Kolkata, India'),
(112, 'Sonal', 'Patel', '1990-06-30', 'Female', '9810000112', 'Pune, India'),
(113, 'Rohit', 'Mehta', '1979-07-12', 'Male', '9810000113', 'Ahmedabad, India'),
(114, 'Aishwarya', 'Bhat', '1988-08-28', 'Female', '9810000114', 'Hyderabad, India'),
(115, 'Amit', 'Rao', '1984-09-19', 'Male', '9810000115', 'Jaipur, India'),
(116, 'Kavya', 'Kapoor', '1992-10-10', 'Female', '9810000116', 'Lucknow, India'),
(117, 'Harish', 'Tiwari', '1983-11-23', 'Male', '9810000117', 'Bhopal, India'),
(118, 'Divya', 'Sharma', '1989-12-05', 'Female', '9810000118', 'Nagpur, India'),
(119, 'Suresh', 'Jain', '1980-01-15', 'Male', '9810000119', 'Indore, India'),
(120, 'Ritika', 'Mishra', '1991-02-26', 'Female', '9810000120', 'Surat, India'),
(121, 'Ajay', 'Gupta', '1978-03-30', 'Male', '9810000121', 'Patna, India'),
(122, 'Anita', 'Singh', '1990-04-17', 'Female', '9810000122', 'Varanasi, India'),
(123, 'Vikram', 'Sharma', '1981-05-09', 'Male', '9810000123', 'Bhubaneswar, India'),
(124, 'Meera', 'Patel', '1992-06-24', 'Female', '9810000124', 'Indore, India'),
(125, 'Raghav', 'Verma', '1985-07-13', 'Male', '9810000125', 'Guwahati, India'),
(126, 'Preeti', 'Kapoor', '1990-08-29', 'Female', '9810000126', 'Gurgaon, India'),
(127, 'Aman', 'Rao', '1982-09-05', 'Male', '9810000127', 'Nashik, India'),
(128, 'Anjali', 'Sharma', '1993-10-21', 'Female', '9810000128', 'Vadodara, India'),
(129, 'Karan', 'Singh', '1980-11-17', 'Male', '9810000129', 'Kanpur, India'),
(130, 'Sneha', 'Gupta', '1991-12-06', 'Female', '9810000130', 'Thiruvananthapuram, India'),
(131, 'Vikram', 'Rao', '1984-01-19', 'Male', '9810000131', 'Raipur, India'),
(132, 'Nisha', 'Patel', '1982-02-25', 'Female', '9810000132', 'Srinagar, India'),
(133, 'Rohit', 'Sharma', '1990-03-11', 'Male', '9810000133', 'Jammu, India'),
(134, 'Shalini', 'Verma', '1985-04-27', 'Female', '9810000134', 'Udaipur, India'),
(135, 'Ajay', 'Kumar', '1988-05-09', 'Male', '9810000135', 'Aizawl, India'),
(136, 'Kavita', 'Sharma', '1992-06-30', 'Female', '9810000136', 'Shillong, India'),
(137, 'Harish', 'Gupta', '1979-07-18', 'Male', '9810000137', 'Imphal, India'),
(138, 'Anita', 'Rao', '1989-08-02', 'Female', '9810000138', 'Itanagar, India'),
(139, 'Mohan', 'Sharma', '1990-09-20', 'Male', '9810000139', 'Kohima, India'),
(140, 'Rekha', 'Patel', '1982-10-07', 'Female', '9810000140', 'Dibrugarh, India'),
(141, 'Suresh', 'Yadav', '1981-11-21', 'Male', '9810000141', 'Noida, India'),
(142, 'Kiran', 'Nair', '1990-12-13', 'Female', '9810000142', 'Kochi, India'),
(143, 'Gaurav', 'Chopra', '1978-01-06', 'Male', '9810000143', 'Amritsar, India'),
(144, 'Divya', 'Mishra', '1992-02-25', 'Female', '9810000144', 'Patna, India'),
(145, 'Ashok', 'Tiwari', '1980-03-16', 'Male', '9810000145', 'Varanasi, India'),
(146, 'Seema', 'Bansal', '1985-04-29', 'Female', '9810000146', 'Nagpur, India'),
(147, 'Naveen', 'Jain', '1983-05-21', 'Male', '9810000147', 'Surat, India'),
(148, 'Ritika', 'Kapoor', '1991-06-17', 'Female', '9810000148', 'Agra, India'),
(149, 'Devendra', 'Saxena', '1976-07-05', 'Male', '9810000149', 'Meerut, India'),
(150, 'Pallavi', 'Sinha', '1993-08-30', 'Female', '9810000150', 'Ranchi, India'),
(151, 'Alok', 'Tripathi', '1981-09-12', 'Male', '9810000151', 'Jabalpur, India'),
(152, 'Isha', 'Pillai', '1992-10-24', 'Female', '9810000152', 'Madurai, India'),
(153, 'Raghav', 'Menon', '1987-11-05', 'Male', '9810000153', 'Coimbatore, India'),
(154, 'Sonal', 'Bhatt', '1984-12-18', 'Female', '9810000154', 'Dehradun, India'),
(155, 'Tarun', 'Shetty', '1990-01-30', 'Male', '9810000155', 'Mysore, India'),
(156, 'Megha', 'Gill', '1993-02-16', 'Female', '9810000156', 'Amravati, India'),
(157, 'Arvind', 'Bose', '1986-03-22', 'Male', '9810000157', 'Gwalior, India'),
(158, 'Komal', 'Das', '1991-04-07', 'Female', '9810000158', 'Siliguri, India'),
(159, 'Yogesh', 'Roy', '1989-05-12', 'Male', '9810000159', 'Jodhpur, India'),
(160, 'Poonam', 'Chatterjee', '1990-06-29', 'Female', '9810000160', 'Howrah, India'),
(161, 'Ankit', 'Sharma', '1982-07-21', 'Male', '9810000161', 'Delhi, India'),
(162, 'Neha', 'Gupta', '1988-08-10', 'Female', '9810000162', 'Mumbai, India'),
(163, 'Rajat', 'Kumar', '1980-09-26', 'Male', '9810000163', 'Bangalore, India'),
(164, 'Anushka', 'Verma', '1991-10-14', 'Female', '9810000164', 'Chennai, India'),
(165, 'Vivek', 'Singh', '1983-11-08', 'Male', '9810000165', 'Kolkata, India'),
(166, 'Sonal', 'Patel', '1990-12-25', 'Female', '9810000166', 'Pune, India'),
(167, 'Rohit', 'Mehta', '1981-01-16', 'Male', '9810000167', 'Ahmedabad, India'),
(168, 'Aishwarya', 'Bhat', '1989-02-07', 'Female', '9810000168', 'Hyderabad, India'),
(169, 'Amit', 'Rao', '1984-03-19', 'Male', '9810000169', 'Jaipur, India'),
(170, 'Kavya', 'Kapoor', '1991-04-04', 'Female', '9810000170', 'Lucknow, India'),
(171, 'Harish', 'Tiwari', '1983-05-20', 'Male', '9810000171', 'Bhopal, India'),
(172, 'Divya', 'Sharma', '1990-06-11', 'Female', '9810000172', 'Nagpur, India'),
(173, 'Suresh', 'Jain', '1980-07-30', 'Male', '9810000173', 'Indore, India'),
(174, 'Ritika', 'Mishra', '1991-08-15', 'Female', '9810000174', 'Surat, India'),
(175, 'Ajay', 'Gupta', '1979-09-05', 'Male', '9810000175', 'Patna, India'),
(176, 'Anita', 'Singh', '1988-10-21', 'Female', '9810000176', 'Varanasi, India'),
(177, 'Vikram', 'Sharma', '1981-11-09', 'Male', '9810000177', 'Bhubaneswar, India'),
(178, 'Meera', 'Patel', '1992-12-28', 'Female', '9810000178', 'Indore, India'),
(179, 'Raghav', 'Verma', '1985-01-17', 'Male', '9810000179', 'Guwahati, India'),
(180, 'Preeti', 'Kapoor', '1990-02-09', 'Female', '9810000180', 'Gurgaon, India'),
(181, 'Aman', 'Rao', '1982-03-27', 'Male', '9810000181', 'Nashik, India'),
(182, 'Anjali', 'Sharma', '1993-04-16', 'Female', '9810000182', 'Vadodara, India'),
(183, 'Karan', 'Singh', '1980-05-30', 'Male', '9810000183', 'Kanpur, India'),
(184, 'Sneha', 'Gupta', '1991-06-21', 'Female', '9810000184', 'Thiruvananthapuram, India'),
(185, 'Vikram', 'Rao', '1984-07-11', 'Male', '9810000185', 'Raipur, India'),
(186, 'Nisha', 'Patel', '1982-08-03', 'Female', '9810000186', 'Srinagar, India'),
(187, 'Rohit', 'Sharma', '1990-09-18', 'Male', '9810000187', 'Jammu, India'),
(188, 'Shalini', 'Verma', '1985-10-06', 'Female', '9810000188', 'Udaipur, India'),
(189, 'Ajay', 'Kumar', '1988-11-23', 'Male', '9810000189', 'Aizawl, India'),
(190, 'Kavita', 'Sharma', '1992-12-12', 'Female', '9810000190', 'Shillong, India'),
(191, 'Harish', 'Gupta', '1979-01-28', 'Male', '9810000191', 'Imphal, India'),
(192, 'Anita', 'Rao', '1989-02-15', 'Female', '9810000192', 'Itanagar, India'),
(193, 'Mohan', 'Sharma', '1990-03-31', 'Male', '9810000193', 'Kohima, India'),
(194, 'Rekha', 'Patel', '1982-04-14', 'Female', '9810000194', 'Dibrugarh, India'),
(195, 'Suresh', 'Yadav', '1981-05-29', 'Male', '9810000195', 'Noida, India'),
(196, 'Kiran', 'Nair', '1990-06-17', 'Female', '9810000196', 'Kochi, India'),
(197, 'Gaurav', 'Chopra', '1978-07-09', 'Male', '9810000197', 'Amritsar, India'),
(198, 'Divya', 'Mishra', '1992-08-23', 'Female', '9810000198', 'Patna, India'),
(199, 'Ashok', 'Tiwari', '1980-09-07', 'Male', '9810000199', 'Varanasi, India'),
(200, 'Seema', 'Bansal', '1985-10-25', 'Female', '9810000200', 'Nagpur, India');

insert into staff(first_name, last_name, role, department_id, contact_number)
values
("Amit","Sharma","Nurse",1,"9100001001"),
("Pooja","Gupta","Technician",2,"9100001002"),
("Ravi","Verma","Receptionist",3,"9100001003"),
("Sneha","Patel","Nurse",4,"9100001004"),
("Vikram","Rao","Ward Boy",5,"9100001005"),
("Anjali","Nair","Lab Assistant",6,"9100001006"),
("Suresh","Mehta","Pharmacist",7,"9100001007"),
("Kavya","Menon","Nurse",8,"9100001008"),
("Arjun","Yadav","Technician",9,"9100001009"),
("Meera","Singh","Nurse",10,"9100001010"),
("Raj","Chopra","Receptionist",11,"9100001011"),
("Divya","Pillai","Lab Assistant",12,"9100001012"),
("Kunal","Sinha","Nurse",13,"9100001013"),
("Ritika","Kapoor","Technician",14,"9100001014"),
("Aditya","Bose","Nurse",15,"9100001015"),
("Neha","Das","Ward Boy",16,"9100001016"),
("Manoj","Gill","Receptionist",17,"9100001017"),
("Simran","Roy","Nurse",18,"9100001018"),
("Ramesh","Banerjee","Pharmacist",19,"9100001019"),
("Shalini","Mishra","Lab Assistant",20,"9100001020"),
("Ashwin","Tripathi","Nurse",21,"9100001021"),
("Komal","Reddy","Technician",22,"9100001022"),
("Rajesh","Agarwal","Nurse",23,"9100001023"),
("Tanvi","Bansal","Receptionist",24,"9100001024"),
("Tarun","Chatterjee","Nurse",25,"9100001025"),
("Alok","Joshi","Ward Boy",26,"9100001026"),
("Priya","Bhatt","Nurse",27,"9100001027"),
("Dev","Shetty","Pharmacist",28,"9100001028"),
("Rohini","Gill","Lab Assistant",29,"9100001029"),
("Varun","Khanna","Nurse",30,"9100001030"),
("Sanjana","Menon","Technician",31,"9100001031"),
("Naveen","Purohit","Nurse",32,"9100001032"),
("Gayatri","Singhal","Receptionist",33,"9100001033"),
("Harish","Tiwari","Nurse",34,"9100001034"),
("Sonia","Monga","Lab Assistant",35,"9100001035"),
("Amit","Saxena","Ward Boy",36,"9100001036"),
("Kiran","Pathak","Nurse",37,"9100001037"),
("Nikita","Kulkarni","Technician",38,"9100001038"),
("Arvind","Shukla","Nurse",39,"9100001039"),
("Pallavi","Mahajan","Pharmacist",40,"9100001040"),
("Deepak","Verma","Nurse",41,"9100001041"),
("Swati","Rastogi","Technician",42,"9100001042"),
("Nikhil","Rawat","Nurse",43,"9100001043"),
("Charu","Kohli","Receptionist",44,"9100001044"),
("Rajesh","Chauhan","Nurse",45,"9100001045"),
("Maya","Sethi","Ward Boy",46,"9100001046"),
("Anil","Dubey","Lab Assistant",47,"9100001047"),
("Lavanya","Thakur","Nurse",48,"9100001048"),
("Bhavesh","Ghosh","Technician",49,"9100001049"),
("Charu","Choudhary","Nurse",50,"9100001050"),
("Rohan","Kapoor","Nurse",1,"9100001051"),
("Sanya","Verma","Technician",2,"9100001052"),
("Vivek","Sharma","Receptionist",3,"9100001053"),
("Anika","Patel","Nurse",4,"9100001054"),
("Kunal","Rao","Ward Boy",5,"9100001055"),
("Nidhi","Mehta","Lab Assistant",6,"9100001056"),
("Siddharth","Gupta","Pharmacist",7,"9100001057"),
("Tanya","Menon","Nurse",8,"9100001058"),
("Arnav","Yadav","Technician",9,"9100001059"),
("Isha","Singh","Nurse",10,"9100001060"),
("Rahul","Chopra","Receptionist",11,"9100001061"),
("Aditi","Pillai","Lab Assistant",12,"9100001062"),
("Mayank","Sinha","Nurse",13,"9100001063"),
("Ritika","Kapoor","Technician",14,"9100001064"),
("Aditya","Bose","Nurse",15,"9100001065"),
("Neha","Das","Ward Boy",16,"9100001066"),
("Manoj","Gill","Receptionist",17,"9100001067"),
("Simran","Roy","Nurse",18,"9100001068"),
("Ramesh","Banerjee","Pharmacist",19,"9100001069"),
("Shalini","Mishra","Lab Assistant",20,"9100001070"),
("Ashwin","Tripathi","Nurse",21,"9100001071"),
("Komal","Reddy","Technician",22,"9100001072"),
("Rajesh","Agarwal","Nurse",23,"9100001073"),
("Tanvi","Bansal","Receptionist",24,"9100001074"),
("Tarun","Chatterjee","Nurse",25,"9100001075"),
("Alok","Joshi","Ward Boy",26,"9100001076"),
("Priya","Bhatt","Nurse",27,"9100001077"),
("Dev","Shetty","Pharmacist",28,"9100001078"),
("Rohini","Gill","Lab Assistant",29,"9100001079"),
("Varun","Khanna","Nurse",30,"9100001080"),
("Sanjana","Menon","Technician",31,"9100001081"),
("Naveen","Purohit","Nurse",32,"9100001082"),
("Gayatri","Singhal","Receptionist",33,"9100001083"),
("Harish","Tiwari","Nurse",34,"9100001084"),
("Sonia","Monga","Lab Assistant",35,"9100001085"),
("Amit","Saxena","Ward Boy",36,"9100001086"),
("Kiran","Pathak","Nurse",37,"9100001087"),
("Nikita","Kulkarni","Technician",38,"9100001088"),
("Arvind","Shukla","Nurse",39,"9100001089"),
("Pallavi","Mahajan","Pharmacist",40,"9100001090"),
("Deepak","Verma","Nurse",41,"9100001091"),
("Swati","Rastogi","Technician",42,"9100001092"),
("Nikhil","Rawat","Nurse",43,"9100001093"),
("Charu","Kohli","Receptionist",44,"9100001094"),
("Rajesh","Chauhan","Nurse",45,"9100001095"),
("Maya","Sethi","Ward Boy",46,"9100001096"),
("Anil","Dubey","Lab Assistant",47,"9100001097"),
("Lavanya","Thakur","Nurse",48,"9100001098"),
("Bhavesh","Ghosh","Technician",49,"9100001099"),
("Charu","Choudhary","Nurse",50,"9100001100"),
("Rohan","Kapoor","Nurse",1,"9100001051"),
("Sanya","Verma","Technician",2,"9100001052"),
("Vivek","Sharma","Receptionist",3,"9100001053"),
("Anika","Patel","Nurse",4,"9100001054"),
("Kunal","Rao","Ward Boy",5,"9100001055"),
("Nidhi","Mehta","Lab Assistant",6,"9100001056"),
("Siddharth","Gupta","Pharmacist",7,"9100001057"),
("Tanya","Menon","Nurse",8,"9100001058"),
("Arnav","Yadav","Technician",9,"9100001059"),
("Isha","Singh","Nurse",10,"9100001060"),
("Rahul","Chopra","Receptionist",11,"9100001061"),
("Aditi","Pillai","Lab Assistant",12,"9100001062"),
("Mayank","Sinha","Nurse",13,"9100001063"),
("Ritika","Kapoor","Technician",14,"9100001064"),
("Aditya","Bose","Nurse",15,"9100001065"),
("Neha","Das","Ward Boy",16,"9100001066"),
("Manoj","Gill","Receptionist",17,"9100001067"),
("Simran","Roy","Nurse",18,"9100001068"),
("Ramesh","Banerjee","Pharmacist",19,"9100001069"),
("Shalini","Mishra","Lab Assistant",20,"9100001070"),
("Ashwin","Tripathi","Nurse",21,"9100001071"),
("Komal","Reddy","Technician",22,"9100001072"),
("Rajesh","Agarwal","Nurse",23,"9100001073"),
("Tanvi","Bansal","Receptionist",24,"9100001074"),
("Tarun","Chatterjee","Nurse",25,"9100001075"),
("Alok","Joshi","Ward Boy",26,"9100001076"),
("Priya","Bhatt","Nurse",27,"9100001077"),
("Dev","Shetty","Pharmacist",28,"9100001078"),
("Rohini","Gill","Lab Assistant",29,"9100001079"),
("Varun","Khanna","Nurse",30,"9100001080"),
("Sanjana","Menon","Technician",31,"9100001081"),
("Naveen","Purohit","Nurse",32,"9100001082"),
("Gayatri","Singhal","Receptionist",33,"9100001083"),
("Harish","Tiwari","Nurse",34,"9100001084"),
("Sonia","Monga","Lab Assistant",35,"9100001085"),
("Amit","Saxena","Ward Boy",36,"9100001086"),
("Kiran","Pathak","Nurse",37,"9100001087"),
("Nikita","Kulkarni","Technician",38,"9100001088"),
("Arvind","Shukla","Nurse",39,"9100001089"),
("Pallavi","Mahajan","Pharmacist",40,"9100001090"),
("Deepak","Verma","Nurse",41,"9100001091"),
("Swati","Rastogi","Technician",42,"9100001092"),
("Nikhil","Rawat","Nurse",43,"9100001093"),
("Charu","Kohli","Receptionist",44,"9100001094"),
("Rajesh","Chauhan","Nurse",45,"9100001095"),
("Maya","Sethi","Ward Boy",46,"9100001096"),
("Anil","Dubey","Lab Assistant",47,"9100001097"),
("Lavanya","Thakur","Nurse",48,"9100001098"),
("Bhavesh","Ghosh","Technician",49,"9100001099"),
("Charu","Choudhary","Nurse",50,"9100001100"),
("Rhea","Sharma","Receptionist",1,"9100001101"),
("Advik","Gupta","Nurse",2,"9100001102"),
("Ira","Verma","Technician",3,"9100001103"),
("Raghav","Patel","Ward Boy",4,"9100001104"),
("Sakshi","Rao","Lab Assistant",5,"9100001105"),
("Karan","Mehta","Pharmacist",6,"9100001106"),
("Ananya","Menon","Nurse",7,"9100001107"),
("Dhruv","Yadav","Technician",8,"9100001108"),
("Tanisha","Singh","Receptionist",9,"9100001109"),
("Ritvik","Chopra","Nurse",10,"9100001110"),
("Mahi","Pillai","Lab Assistant",11,"9100001111"),
("Aarav","Sinha","Nurse",12,"9100001112"),
("Sia","Kapoor","Technician",13,"9100001113"),
("Parth","Bose","Nurse",14,"9100001114"),
("Naina","Das","Ward Boy",15,"9100001115"),
("Kabir","Gill","Receptionist",16,"9100001116"),
("Myra","Roy","Nurse",17,"9100001117"),
("Veer","Banerjee","Pharmacist",18,"9100001118"),
("Isha","Mishra","Lab Assistant",19,"9100001119"),
("Arnav","Tripathi","Nurse",20,"9100001120"),
("Tara","Reddy","Technician",21,"9100001121"),
("Yash","Agarwal","Nurse",22,"9100001122"),
("Kiara","Bansal","Receptionist",23,"9100001123"),
("Neil","Chatterjee","Nurse",24,"9100001124"),
("Ansh","Joshi","Ward Boy",25,"9100001125"),
("Prisha","Bhatt","Nurse",26,"9100001126"),
("Kabir","Shetty","Pharmacist",27,"9100001127"),
("Aanya","Gill","Lab Assistant",28,"9100001128"),
("Reyansh","Khanna","Nurse",29,"9100001129"),
("Diya","Menon","Technician",30,"9100001130"),
("Kshitij","Purohit","Nurse",31,"9100001131"),
("Navya","Singhal","Receptionist",32,"9100001132"),
("Rudra","Tiwari","Nurse",33,"9100001133"),
("Samaira","Monga","Lab Assistant",34,"9100001134"),
("Aarav","Saxena","Ward Boy",35,"9100001135"),
("Anvi","Pathak","Nurse",36,"9100001136"),
("Ishaan","Kulkarni","Technician",37,"9100001137"),
("Rhea","Shukla","Nurse",38,"9100001138"),
("Vihaan","Mahajan","Pharmacist",39,"9100001139"),
("Saanvi","Verma","Nurse",40,"9100001140"),
("Reyansh","Rastogi","Technician",41,"9100001141"),
("Tanya","Rawat","Nurse",42,"9100001142"),
("Arjun","Kohli","Receptionist",43,"9100001143"),
("Anaya","Chauhan","Nurse",44,"9100001144"),
("Devansh","Sethi","Ward Boy",45,"9100001145"),
("Kiara","Dubey","Lab Assistant",46,"9100001146"),
("Shaurya","Thakur","Nurse",47,"9100001147"),
("Prisha","Ghosh","Technician",48,"9100001148"),
("Riaan","Choudhary","Nurse",49,"9100001149"),
("Tara","Sharma","Receptionist",50,"9100001150");

insert into appointments(patient_id, doctor_id, appointment_date, status) 
values
(1, 4, "2023-05-31", "Scheduled"),
(2, 5, "2023-06-01", "Completed"),
(3, 6, "2023-06-02", "Cancelled"),
(4, 7, "2023-06-03", "Scheduled"),
(5, 8, "2023-06-04", "Completed"),
(6, 9, "2023-06-05", "Scheduled"),
(7, 10, "2023-06-06", "Cancelled"),
(8, 11, "2023-06-07", "Completed"),
(9, 12, "2023-06-08", "Scheduled"),
(10, 13, "2023-06-09", "Completed"),
(11, 14, "2023-06-10", "Scheduled"),
(12, 15, "2023-06-11", "Cancelled"),
(13, 16, "2023-06-12", "Completed"),
(14, 17, "2023-06-13", "Scheduled"),
(15, 18, "2023-06-14", "Completed"),
(16, 19, "2023-06-15", "Scheduled"),
(17, 20, "2023-06-16", "Cancelled"),
(18, 21, "2023-06-17", "Completed"),
(19, 22, "2023-06-18", "Scheduled"),
(20, 23, "2023-06-19", "Completed"),
(21, 24, "2023-06-20", "Scheduled"),
(22, 25, "2023-06-21", "Cancelled"),
(23, 26, "2023-06-22", "Completed"),
(24, 27, "2023-06-23", "Scheduled"),
(25, 28, "2023-06-24", "Completed"),
(26, 29, "2023-06-25", "Scheduled"),
(27, 30, "2023-06-26", "Cancelled"),
(28, 31, "2023-06-27", "Completed"),
(29, 32, "2023-06-28", "Scheduled"),
(30, 33, "2023-06-29", "Completed"),
(31, 34, "2023-06-30", "Scheduled"),
(32, 35, "2023-07-01", "Cancelled"),
(33, 36, "2023-07-02", "Completed"),
(34, 37, "2023-07-03", "Scheduled"),
(35, 38, "2023-07-04", "Completed"),
(36, 39, "2023-07-05", "Scheduled"),
(37, 40, "2023-07-06", "Cancelled"),
(38, 41, "2023-07-07", "Completed"),
(39, 42, "2023-07-08", "Scheduled"),
(40, 43, "2023-07-09", "Completed"),
(41, 44, "2023-07-10", "Scheduled"),
(42, 45, "2023-07-11", "Cancelled"),
(43, 46, "2023-07-12", "Completed"),
(44, 47, "2023-07-13", "Scheduled"),
(45, 48, "2023-07-14", "Completed"),
(46, 49, "2023-07-15", "Scheduled"),
(47, 50, "2023-07-16", "Cancelled"),
(48, 1, "2023-07-17", "Completed"),
(49, 2, "2023-07-18", "Scheduled"),
(50, 3, "2023-07-19", "Completed"),
(51, 11, "2023-06-01", "Scheduled"),
(52, 12, "2023-06-02", "Completed"),
(53, 13, "2023-06-03", "Cancelled"),
(54, 14, "2023-06-04", "Scheduled"),
(55, 15, "2023-06-05", "Completed"),
(56, 16, "2023-06-06", "Scheduled"),
(57, 17, "2023-06-07", "Cancelled"),
(58, 18, "2023-06-08", "Completed"),
(59, 19, "2023-06-09", "Scheduled"),
(60, 20, "2023-06-10", "Completed"),
(61, 21, "2023-06-11", "Scheduled"),
(62, 22, "2023-06-12", "Cancelled"),
(63, 23, "2023-06-13", "Completed"),
(64, 24, "2023-06-14", "Scheduled"),
(65, 25, "2023-06-15", "Completed"),
(66, 26, "2023-06-16", "Scheduled"),
(67, 27, "2023-06-17", "Cancelled"),
(68, 28, "2023-06-18", "Completed"),
(69, 29, "2023-06-19", "Scheduled"),
(70, 30, "2023-06-20", "Completed"),
(71, 31, "2023-06-21", "Scheduled"),
(72, 32, "2023-06-22", "Cancelled"),
(73, 33, "2023-06-23", "Completed"),
(74, 34, "2023-06-24", "Scheduled"),
(75, 35, "2023-06-25", "Completed"),
(76, 36, "2023-06-26", "Scheduled"),
(77, 37, "2023-06-27", "Cancelled"),
(78, 38, "2023-06-28", "Completed"),
(79, 39, "2023-06-29", "Scheduled"),
(80, 40, "2023-06-30", "Completed"),
(81, 41, "2023-07-01", "Scheduled"),
(82, 42, "2023-07-02", "Cancelled"),
(83, 43, "2023-07-03", "Completed"),
(84, 44, "2023-07-04", "Scheduled"),
(85, 45, "2023-07-05", "Completed"),
(86, 46, "2023-07-06", "Scheduled"),
(87, 47, "2023-07-07", "Cancelled"),
(88, 48, "2023-07-08", "Completed"),
(89, 49, "2023-07-09", "Scheduled"),
(90, 50, "2023-07-10", "Completed"),
(91, 1, "2023-07-11", "Scheduled"),
(92, 2, "2023-07-12", "Cancelled"),
(93, 3, "2023-07-13", "Completed"),
(94, 4, "2023-07-14", "Scheduled"),
(95, 5, "2023-07-15", "Completed"),
(96, 6, "2023-07-16", "Scheduled"),
(97, 7, "2023-07-17", "Cancelled"),
(98, 8, "2023-07-18", "Completed"),
(99, 9, "2023-07-19", "Scheduled"),
(100, 10, "2023-07-20", "Completed"),
(101, 1, "2023-05-01", "Scheduled"),
(102, 2, "2023-05-02", "Completed"),
(103, 3, "2023-05-03", "Cancelled"),
(104, 4, "2023-05-04", "Scheduled"),
(105, 5, "2023-05-05", "Completed"),
(106, 6, "2023-05-06", "Scheduled"),
(107, 7, "2023-05-07", "Cancelled"),
(108, 8, "2023-05-08", "Completed"),
(109, 9, "2023-05-09", "Scheduled"),
(110, 10, "2023-05-10", "Completed"),
(111, 11, "2023-05-11", "Scheduled"),
(112, 12, "2023-05-12", "Cancelled"),
(113, 13, "2023-05-13", "Completed"),
(114, 14, "2023-05-14", "Scheduled"),
(115, 15, "2023-05-15", "Completed"),
(116, 16, "2023-05-16", "Scheduled"),
(117, 17, "2023-05-17", "Cancelled"),
(118, 18, "2023-05-18", "Completed"),
(119, 19, "2023-05-19", "Scheduled"),
(120, 20, "2023-05-20", "Completed"),
(121, 21, "2023-05-21", "Scheduled"),
(122, 22, "2023-05-22", "Cancelled"),
(123, 23, "2023-05-23", "Completed"),
(124, 24, "2023-05-24", "Scheduled"),
(125, 25, "2023-05-25", "Completed"),
(126, 26, "2023-05-26", "Scheduled"),
(127, 27, "2023-05-27", "Cancelled"),
(128, 28, "2023-05-28", "Completed"),
(129, 29, "2023-05-29", "Scheduled"),
(130, 30, "2023-05-30", "Completed"),
(131, 31, "2023-05-31", "Scheduled"),
(132, 32, "2023-06-01", "Cancelled"),
(133, 33, "2023-06-02", "Completed"),
(134, 34, "2023-06-03", "Scheduled"),
(135, 35, "2023-06-04", "Completed"),
(136, 36, "2023-06-05", "Scheduled"),
(137, 37, "2023-06-06", "Cancelled"),
(138, 38, "2023-06-07", "Completed"),
(139, 39, "2023-06-08", "Scheduled"),
(140, 40, "2023-06-09", "Completed"),
(141, 41, "2023-06-10", "Scheduled"),
(142, 42, "2023-06-11", "Cancelled"),
(143, 43, "2023-06-12", "Completed"),
(144, 44, "2023-06-13", "Scheduled"),
(145, 45, "2023-06-14", "Completed"),
(146, 46, "2023-06-15", "Scheduled"),
(147, 47, "2023-06-16", "Cancelled"),
(148, 48, "2023-06-17", "Completed"),
(149, 49, "2023-06-18", "Scheduled"),
(150, 50, "2023-06-19", "Completed"),
(151, 1, "2023-06-20", "Scheduled"),
(152, 2, "2023-06-21", "Completed"),
(153, 3, "2023-06-22", "Cancelled"),
(154, 4, "2023-06-23", "Scheduled"),
(155, 5, "2023-06-24", "Completed"),
(156, 6, "2023-06-25", "Scheduled"),
(157, 7, "2023-06-26", "Cancelled"),
(158, 8, "2023-06-27", "Completed"),
(159, 9, "2023-06-28", "Scheduled"),
(160, 10, "2023-06-29", "Completed"),
(161, 11, "2023-06-30", "Scheduled"),
(162, 12, "2023-07-01", "Cancelled"),
(163, 13, "2023-07-02", "Completed"),
(164, 14, "2023-07-03", "Scheduled"),
(165, 15, "2023-07-04", "Completed"),
(166, 16, "2023-07-05", "Scheduled"),
(167, 17, "2023-07-06", "Cancelled"),
(168, 18, "2023-07-07", "Completed"),
(169, 19, "2023-07-08", "Scheduled"),
(170, 20, "2023-07-09", "Completed"),
(171, 21, "2023-07-10", "Scheduled"),
(172, 22, "2023-07-11", "Cancelled"),
(173, 23, "2023-07-12", "Completed"),
(174, 24, "2023-07-13", "Scheduled"),
(175, 25, "2023-07-14", "Completed"),
(176, 26, "2023-07-15", "Scheduled"),
(177, 27, "2023-07-16", "Cancelled"),
(178, 28, "2023-07-17", "Completed"),
(179, 29, "2023-07-18", "Scheduled"),
(180, 30, "2023-07-19", "Completed"),
(181, 31, "2023-07-20", "Scheduled"),
(182, 32, "2023-07-21", "Cancelled"),
(183, 33, "2023-07-22", "Completed"),
(184, 34, "2023-07-23", "Scheduled"),
(185, 35, "2023-07-24", "Completed"),
(186, 36, "2023-07-25", "Scheduled"),
(187, 37, "2023-07-26", "Cancelled"),
(188, 38, "2023-07-27", "Completed"),
(189, 39, "2023-07-28", "Scheduled"),
(190, 40, "2023-07-29", "Completed"),
(191, 41, "2023-07-30", "Scheduled"),
(192, 42, "2023-07-31", "Cancelled"),
(193, 43, "2023-08-01", "Completed"),
(194, 44, "2023-08-02", "Scheduled"),
(195, 45, "2023-08-03", "Completed"),
(196, 46, "2023-08-04", "Scheduled"),
(197, 47, "2023-08-05", "Cancelled"),
(198, 48, "2023-08-06", "Completed"),
(199, 49, "2023-08-07", "Scheduled"),
(200, 50, "2023-08-08", "Completed");

insert into treatments(patient_id, doctor_id, treatment_date, description, cost)
values
(1, 1, "2023-01-01", "General checkup and consultation", 500.00),
(2, 2, "2023-01-02", "Neurological assessment", 1200.00),
(3, 3, "2023-01-03", "Orthopedic examination", 800.00),
(4, 4, "2023-01-04", "Skin allergy treatment", 600.00),
(5, 5, "2023-01-05", "Child vaccination", 700.00),
(6, 6, "2023-01-06", "Cancer screening", 2000.00),
(7, 7, "2023-01-07", "X-ray and imaging", 1000.00),
(8, 8, "2023-01-08", "Pregnancy consultation", 1500.00),
(9, 9, "2023-01-09", "Psychiatric evaluation", 900.00),
(10, 10, "2023-01-10", "Kidney function test", 1100.00),
(11, 11, "2023-01-11", "Cardiac health check", 1800.00),
(12, 12, "2023-01-12", "Neurological therapy", 2200.00),
(13, 13, "2023-01-13", "Bone fracture treatment", 2500.00),
(14, 14, "2023-01-14", "Skin infection medication", 750.00),
(15, 15, "2023-01-15", "Pediatric consultation", 650.00),
(16, 16, "2023-01-16", "Chemotherapy session", 5000.00),
(17, 17, "2023-01-17", "MRI scan", 3000.00),
(18, 18, "2023-01-18", "Gynecology checkup", 1400.00),
(19, 19, "2023-01-19", "Depression therapy", 2000.00),
(20, 20, "2023-01-20", "Urology procedure", 2800.00),
(21, 21, "2023-01-21", "Heart surgery follow-up", 3500.00),
(22, 22, "2023-01-22", "Brain scan and evaluation", 3200.00),
(23, 23, "2023-01-23", "Joint pain treatment", 1200.00),
(24, 24, "2023-01-24", "Cosmetic skin procedure", 4500.00),
(25, 25, "2023-01-25", "Child nutrition consultation", 800.00),
(26, 26, "2023-01-26", "Tumor removal surgery", 15000.00),
(27, 27, "2023-01-27", "CT scan", 3500.00),
(28, 28, "2023-01-28", "Fertility consultation", 2000.00),
(29, 29, "2023-01-29", "Anxiety treatment", 1800.00),
(30, 30, "2023-01-30", "Kidney dialysis session", 4000.00),
(31, 31, "2023-01-31", "Cardiac monitoring", 2100.00),
(32, 32, "2023-02-01", "Neurological surgery", 20000.00),
(33, 33, "2023-02-02", "Spine correction procedure", 12000.00),
(34, 34, "2023-02-03", "Laser skin treatment", 6000.00),
(35, 35, "2023-02-04", "Child immunization", 900.00),
(36, 36, "2023-02-05", "Chemotherapy cycle", 7000.00),
(37, 37, "2023-02-06", "Ultrasound imaging", 1500.00),
(38, 38, "2023-02-07", "Maternity care", 5000.00),
(39, 39, "2023-02-08", "Psychological counseling", 2500.00),
(40, 40, "2023-02-09", "Bladder surgery", 18000.00),
(41, 41, "2023-02-10", "Heart valve replacement", 22000.00),
(42, 42, "2023-02-11", "Epilepsy treatment", 5000.00),
(43, 43, "2023-02-12", "Knee replacement surgery", 30000.00),
(44, 44, "2023-02-13", "Skin biopsy", 3500.00),
(45, 45, "2023-02-14", "Child growth consultation", 1200.00),
(46, 46, "2023-02-15", "Radiation therapy", 16000.00),
(47, 47, "2023-02-16", "CT-guided biopsy", 8000.00),
(48, 48, "2023-02-17", "C-section delivery", 25000.00),
(49, 49, "2023-02-18", "Addiction treatment", 7000.00),
(50, 50, "2023-02-19", "Kidney stone removal", 12000.00),
(51, 1, "2023-02-20", "General checkup and consultation", 510.00),
(52, 2, "2023-02-21", "Neurological assessment", 1210.00),
(53, 3, "2023-02-22", "Orthopedic examination", 810.00),
(54, 4, "2023-02-23", "Skin allergy treatment", 610.00),
(55, 5, "2023-02-24", "Child vaccination", 710.00),
(56, 6, "2023-02-25", "Cancer screening", 2010.00),
(57, 7, "2023-02-26", "X-ray and imaging", 1010.00),
(58, 8, "2023-02-27", "Pregnancy consultation", 1510.00),
(59, 9, "2023-02-28", "Psychiatric evaluation", 910.00),
(60, 10, "2023-03-01", "Kidney function test", 1110.00),
(61, 11, "2023-03-02", "Cardiac health check", 1810.00),
(62, 12, "2023-03-03", "Neurological therapy", 2210.00),
(63, 13, "2023-03-04", "Bone fracture treatment", 2510.00),
(64, 14, "2023-03-05", "Skin infection medication", 760.00),
(65, 15, "2023-03-06", "Pediatric consultation", 660.00),
(66, 16, "2023-03-07", "Chemotherapy session", 5010.00),
(67, 17, "2023-03-08", "MRI scan", 3010.00),
(68, 18, "2023-03-09", "Gynecology checkup", 1410.00),
(69, 19, "2023-03-10", "Depression therapy", 2010.00),
(70, 20, "2023-03-11", "Urology procedure", 2810.00),
(71, 21, "2023-03-12", "Heart surgery follow-up", 3510.00),
(72, 22, "2023-03-13", "Brain scan and evaluation", 3210.00),
(73, 23, "2023-03-14", "Joint pain treatment", 1210.00),
(74, 24, "2023-03-15", "Cosmetic skin procedure", 4510.00),
(75, 25, "2023-03-16", "Child nutrition consultation", 810.00),
(76, 26, "2023-03-17", "Tumor removal surgery", 15010.00),
(77, 27, "2023-03-18", "CT scan", 3510.00),
(78, 28, "2023-03-19", "Fertility consultation", 2010.00),
(79, 29, "2023-03-20", "Anxiety treatment", 1810.00),
(80, 30, "2023-03-21", "Kidney dialysis session", 4010.00),
(81, 31, "2023-03-22", "Cardiac monitoring", 2110.00),
(82, 32, "2023-03-23", "Neurological surgery", 20010.00),
(83, 33, "2023-03-24", "Spine correction procedure", 12010.00),
(84, 34, "2023-03-25", "Laser skin treatment", 6010.00),
(85, 35, "2023-03-26", "Child immunization", 910.00),
(86, 36, "2023-03-27", "Chemotherapy cycle", 7010.00),
(87, 37, "2023-03-28", "Ultrasound imaging", 1510.00),
(88, 38, "2023-03-29", "Maternity care", 5010.00),
(89, 39, "2023-03-30", "Psychological counseling", 2510.00),
(90, 40, "2023-03-31", "Bladder surgery", 18010.00),
(91, 41, "2023-04-01", "Heart valve replacement", 22010.00),
(92, 42, "2023-04-02", "Epilepsy treatment", 5010.00),
(93, 43, "2023-04-03", "Knee replacement surgery", 30010.00),
(94, 44, "2023-04-04", "Skin biopsy", 3510.00),
(95, 45, "2023-04-05", "Child growth consultation", 1210.00),
(96, 46, "2023-04-06", "Radiation therapy", 16010.00),
(97, 47, "2023-04-07", "CT-guided biopsy", 8010.00),
(98, 48, "2023-04-08", "C-section delivery", 25010.00),
(99, 49, "2023-04-09", "Addiction treatment", 7010.00),
(100, 50, "2023-04-10", "Kidney stone removal", 12010.00),
(101, 1, "2023-05-11", "General checkup and consultation", 550.00),
(102, 2, "2023-05-12", "Neurological assessment", 1250.00),
(103, 3, "2023-05-13", "Orthopedic examination", 850.00),
(104, 4, "2023-05-14", "Skin allergy treatment", 650.00),
(105, 5, "2023-05-15", "Child vaccination", 720.00),
(106, 6, "2023-05-16", "Cancer screening", 2100.00),
(107, 7, "2023-05-17", "X-ray and imaging", 1050.00),
(108, 8, "2023-05-18", "Pregnancy consultation", 1550.00),
(109, 9, "2023-05-19", "Psychiatric evaluation", 950.00),
(110, 10, "2023-05-20", "Kidney function test", 1150.00),
(111, 11, "2023-05-21", "Cardiac health check", 1850.00),
(112, 12, "2023-05-22", "Neurological therapy", 2250.00),
(113, 13, "2023-05-23", "Bone fracture treatment", 2550.00),
(114, 14, "2023-05-24", "Skin infection medication", 800.00),
(115, 15, "2023-05-25", "Pediatric consultation", 680.00),
(116, 16, "2023-05-26", "Chemotherapy session", 5100.00),
(117, 17, "2023-05-27", "MRI scan", 3050.00),
(118, 18, "2023-05-28", "Gynecology checkup", 1450.00),
(119, 19, "2023-05-29", "Depression therapy", 2050.00),
(120, 20, "2023-05-30", "Urology procedure", 2850.00),
(121, 21, "2023-05-31", "Heart surgery follow-up", 3550.00),
(122, 22, "2023-06-01", "Brain scan and evaluation", 3250.00),
(123, 23, "2023-06-02", "Joint pain treatment", 1250.00),
(124, 24, "2023-06-03", "Cosmetic skin procedure", 4550.00),
(125, 25, "2023-06-04", "Child nutrition consultation", 820.00),
(126, 26, "2023-06-05", "Tumor removal surgery", 15100.00),
(127, 27, "2023-06-06", "CT scan", 3550.00),
(128, 28, "2023-06-07", "Fertility consultation", 2050.00),
(129, 29, "2023-06-08", "Anxiety treatment", 1850.00),
(130, 30, "2023-06-09", "Kidney dialysis session", 4050.00),
(131, 31, "2023-06-10", "Cardiac monitoring", 2150.00),
(132, 32, "2023-06-11", "Neurological surgery", 20100.00),
(133, 33, "2023-06-12", "Spine correction procedure", 12150.00),
(134, 34, "2023-06-13", "Laser skin treatment", 6100.00),
(135, 35, "2023-06-14", "Child immunization", 980.00),
(136, 36, "2023-06-15", "Chemotherapy cycle", 7050.00),
(137, 37, "2023-06-16", "Ultrasound imaging", 1550.00),
(138, 38, "2023-06-17", "Maternity care", 5050.00),
(139, 39, "2023-06-18", "Psychological counseling", 2550.00),
(140, 40, "2023-06-19", "Bladder surgery", 18100.00),
(141, 41, "2023-06-20", "Heart valve replacement", 22100.00),
(142, 42, "2023-06-21", "Epilepsy treatment", 5050.00),
(143, 43, "2023-06-22", "Knee replacement surgery", 30100.00),
(144, 44, "2023-06-23", "Skin biopsy", 3550.00),
(145, 45, "2023-06-24", "Child growth consultation", 1250.00),
(146, 46, "2023-06-25", "Radiation therapy", 16100.00),
(147, 47, "2023-06-26", "CT-guided biopsy", 8050.00),
(148, 48, "2023-06-27", "C-section delivery", 25100.00),
(149, 49, "2023-06-28", "Addiction treatment", 7050.00),
(150, 50, "2023-06-29", "Kidney stone removal", 12150.00),
(151, 1, "2023-06-30", "General checkup and consultation", 560.00),
(152, 2, "2023-07-01", "Neurological assessment", 1260.00),
(153, 3, "2023-07-02", "Orthopedic examination", 860.00),
(154, 4, "2023-07-03", "Skin allergy treatment", 660.00),
(155, 5, "2023-07-04", "Child vaccination", 730.00),
(156, 6, "2023-07-05", "Cancer screening", 2120.00),
(157, 7, "2023-07-06", "X-ray and imaging", 1060.00),
(158, 8, "2023-07-07", "Pregnancy consultation", 1560.00),
(159, 9, "2023-07-08", "Psychiatric evaluation", 960.00),
(160, 10, "2023-07-09", "Kidney function test", 1160.00),
(161, 11, "2023-07-10", "Cardiac health check", 1860.00),
(162, 12, "2023-07-11", "Neurological therapy", 2260.00),
(163, 13, "2023-07-12", "Bone fracture treatment", 2560.00),
(164, 14, "2023-07-13", "Skin infection medication", 810.00),
(165, 15, "2023-07-14", "Pediatric consultation", 690.00),
(166, 16, "2023-07-15", "Chemotherapy session", 5150.00),
(167, 17, "2023-07-16", "MRI scan", 3060.00),
(168, 18, "2023-07-17", "Gynecology checkup", 1460.00),
(169, 19, "2023-07-18", "Depression therapy", 2060.00),
(170, 20, "2023-07-19", "Urology procedure", 2860.00),
(171, 21, "2023-07-20", "Heart surgery follow-up", 3560.00),
(172, 22, "2023-07-21", "Brain scan and evaluation", 3260.00),
(173, 23, "2023-07-22", "Joint pain treatment", 1260.00),
(174, 24, "2023-07-23", "Cosmetic skin procedure", 4560.00),
(175, 25, "2023-07-24", "Child nutrition consultation", 830.00),
(176, 26, "2023-07-25", "Tumor removal surgery", 15150.00),
(177, 27, "2023-07-26", "CT scan", 3560.00),
(178, 28, "2023-07-27", "Fertility consultation", 2060.00),
(179, 29, "2023-07-28", "Anxiety treatment", 1860.00),
(180, 30, "2023-07-29", "Kidney dialysis session", 4060.00),
(181, 31, "2023-07-30", "Cardiac monitoring", 2160.00),
(182, 32, "2023-07-31", "Neurological surgery", 20150.00),
(183, 33, "2023-08-01", "Spine correction procedure", 12160.00),
(184, 34, "2023-08-02", "Laser skin treatment", 6120.00),
(185, 35, "2023-08-03", "Child immunization", 990.00),
(186, 36, "2023-08-04", "Chemotherapy cycle", 7060.00),
(187, 37, "2023-08-05", "Ultrasound imaging", 1560.00),
(188, 38, "2023-08-06", "Maternity care", 5060.00),
(189, 39, "2023-08-07", "Psychological counseling", 2560.00),
(190, 40, "2023-08-08", "Bladder surgery", 18150.00),
(191, 41, "2023-08-09", "Heart valve replacement", 22150.00),
(192, 42, "2023-08-10", "Epilepsy treatment", 5060.00),
(193, 43, "2023-08-11", "Knee replacement surgery", 30150.00),
(194, 44, "2023-08-12", "Skin biopsy", 3560.00),
(195, 45, "2023-08-13", "Child growth consultation", 1260.00),
(196, 46, "2023-08-14", "Radiation therapy", 16150.00),
(197, 47, "2023-08-15", "CT-guided biopsy", 8060.00),
(198, 48, "2023-08-16", "C-section delivery", 25150.00),
(199, 49, "2023-08-17", "Addiction treatment", 7060.00),
(200, 50, "2023-08-18", "Kidney stone removal", 12160.00);

insert into billing(treatment_id, patient_id, amount, billing_date, paid)
values
(1, 1, 500.00, "2023-01-02", 1),
(2, 2, 1200.00, "2023-01-03", 1),
(3, 3, 800.00, "2023-01-04", 1),
(4, 4, 600.00, "2023-01-05", 1),
(5, 5, 700.00, "2023-01-06", 1),
(6, 6, 2000.00, "2023-01-07", 1),
(7, 7, 1000.00, "2023-01-08", 1),
(8, 8, 1500.00, "2023-01-09", 1),
(9, 9, 900.00, "2023-01-10", 1),
(10, 10, 1100.00, "2023-01-11", 1),
(11, 11, 1800.00, "2023-01-12", 1),
(12, 12, 2200.00, "2023-01-13", 1),
(13, 13, 2500.00, "2023-01-14", 1),
(14, 14, 750.00, "2023-01-15", 1),
(15, 15, 650.00, "2023-01-16", 1),
(16, 16, 5000.00, "2023-01-17", 1),
(17, 17, 3000.00, "2023-01-18", 1),
(18, 18, 1400.00, "2023-01-19", 1),
(19, 19, 2000.00, "2023-01-20", 1),
(20, 20, 2800.00, "2023-01-21", 1),
(21, 21, 3500.00, "2023-01-22", 1),
(22, 22, 3200.00, "2023-01-23", 1),
(23, 23, 1200.00, "2023-01-24", 1),
(24, 24, 4500.00, "2023-01-25", 1),
(25, 25, 800.00, "2023-01-26", 1),
(26, 26, 15000.00, "2023-01-27", 1),
(27, 27, 3500.00, "2023-01-28", 1),
(28, 28, 2000.00, "2023-01-29", 1),
(29, 29, 1800.00, "2023-01-30", 1),
(30, 30, 4000.00, "2023-01-31", 1),
(31, 31, 2100.00, "2023-02-01", 1),
(32, 32, 20000.00, "2023-02-02", 1),
(33, 33, 12000.00, "2023-02-03", 1),
(34, 34, 6000.00, "2023-02-04", 1),
(35, 35, 900.00, "2023-02-05", 1),
(36, 36, 7000.00, "2023-02-06", 1),
(37, 37, 1500.00, "2023-02-07", 1),
(38, 38, 5000.00, "2023-02-08", 1),
(39, 39, 2500.00, "2023-02-09", 1),
(40, 40, 18000.00, "2023-02-10", 1),
(41, 41, 22000.00, "2023-02-11", 1),
(42, 42, 5000.00, "2023-02-12", 1),
(43, 43, 30000.00, "2023-02-13", 1),
(44, 44, 3500.00, "2023-02-14", 1),
(45, 45, 1200.00, "2023-02-15", 1),
(46, 46, 16000.00, "2023-02-16", 1),
(47, 47, 8000.00, "2023-02-17", 1),
(48, 48, 25000.00, "2023-02-18", 1),
(49, 49, 7000.00, "2023-02-19", 1),
(50, 50, 12000.00, "2023-02-20", 1),
(51, 1, 510.00, "2023-02-21", 1),
(52, 2, 1210.00, "2023-02-22", 1),
(53, 3, 810.00, "2023-02-23", 1),
(54, 4, 610.00, "2023-02-24", 1),
(55, 5, 710.00, "2023-02-25", 1),
(56, 6, 2010.00, "2023-02-26", 1),
(57, 7, 1010.00, "2023-02-27", 1),
(58, 8, 1510.00, "2023-02-28", 1),
(59, 9, 910.00, "2023-03-01", 1),
(60, 10, 1110.00, "2023-03-02", 1),
(61, 11, 1810.00, "2023-03-03", 1),
(62, 12, 2210.00, "2023-03-04", 1),
(63, 13, 2510.00, "2023-03-05", 1),
(64, 14, 760.00, "2023-03-06", 1),
(65, 15, 660.00, "2023-03-07", 1),
(66, 16, 5010.00, "2023-03-08", 1),
(67, 17, 3010.00, "2023-03-09", 1),
(68, 18, 1410.00, "2023-03-10", 1),
(69, 19, 2010.00, "2023-03-11", 1),
(70, 20, 2810.00, "2023-03-12", 1),
(71, 21, 3510.00, "2023-03-13", 1),
(72, 22, 3210.00, "2023-03-14", 1),
(73, 23, 1210.00, "2023-03-15", 1),
(74, 24, 4510.00, "2023-03-16", 1),
(75, 25, 810.00, "2023-03-17", 1),
(76, 26, 15010.00, "2023-03-18", 1),
(77, 27, 3510.00, "2023-03-19", 1),
(78, 28, 2010.00, "2023-03-20", 1),
(79, 29, 1810.00, "2023-03-21", 1),
(80, 30, 4010.00, "2023-03-22", 1),
(81, 31, 2110.00, "2023-03-23", 1),
(82, 32, 20010.00, "2023-03-24", 1),
(83, 33, 12010.00, "2023-03-25", 1),
(84, 34, 6010.00, "2023-03-26", 1),
(85, 35, 910.00, "2023-03-27", 1),
(86, 36, 7010.00, "2023-03-28", 1),
(87, 37, 1510.00, "2023-03-29", 1),
(88, 38, 5010.00, "2023-03-30", 1),
(89, 39, 2510.00, "2023-03-31", 1),
(90, 40, 18010.00, "2023-04-01", 1),
(91, 41, 22010.00, "2023-04-02", 1),
(92, 42, 5010.00, "2023-04-03", 1),
(93, 43, 30010.00, "2023-04-04", 1),
(94, 44, 3510.00, "2023-04-05", 1),
(95, 45, 1210.00, "2023-04-06", 1),
(96, 46, 16010.00, "2023-04-07", 1),
(97, 47, 8010.00, "2023-04-08", 1),
(98, 48, 25010.00, "2023-04-09", 1),
(99, 49, 7010.00, "2023-04-10", 1),
(100, 50, 12010.00, "2023-04-11", 1),
(101, 51, 520.00, "2023-04-12", 1),
(102, 52, 1220.00, "2023-04-13", 1),
(103, 53, 820.00, "2023-04-14", 1),
(104, 54, 620.00, "2023-04-15", 1),
(105, 55, 720.00, "2023-04-16", 1),
(106, 56, 2020.00, "2023-04-17", 1),
(107, 57, 1020.00, "2023-04-18", 1),
(108, 58, 1520.00, "2023-04-19", 1),
(109, 59, 920.00, "2023-04-20", 1),
(110, 60, 1120.00, "2023-04-21", 1),
(111, 61, 1820.00, "2023-04-22", 1),
(112, 62, 2220.00, "2023-04-23", 1),
(113, 63, 2520.00, "2023-04-24", 1),
(114, 64, 770.00, "2023-04-25", 1),
(115, 65, 670.00, "2023-04-26", 1),
(116, 66, 5020.00, "2023-04-27", 1),
(117, 67, 3020.00, "2023-04-28", 1),
(118, 68, 1420.00, "2023-04-29", 1),
(119, 69, 2020.00, "2023-04-30", 1),
(120, 70, 2820.00, "2023-05-01", 1),
(121, 71, 3520.00, "2023-05-02", 1),
(122, 72, 3220.00, "2023-05-03", 1),
(123, 73, 1220.00, "2023-05-04", 1),
(124, 74, 4520.00, "2023-05-05", 1),
(125, 75, 820.00, "2023-05-06", 1),
(126, 76, 15020.00, "2023-05-07", 1),
(127, 77, 3520.00, "2023-05-08", 1),
(128, 78, 2020.00, "2023-05-09", 1),
(129, 79, 1820.00, "2023-05-10", 1),
(130, 80, 4020.00, "2023-05-11", 1),
(131, 81, 2120.00, "2023-05-12", 1),
(132, 82, 20020.00, "2023-05-13", 1),
(133, 83, 12020.00, "2023-05-14", 1),
(134, 84, 6020.00, "2023-05-15", 1),
(135, 85, 920.00, "2023-05-16", 1),
(136, 86, 7020.00, "2023-05-17", 1),
(137, 87, 1520.00, "2023-05-18", 1),
(138, 88, 5020.00, "2023-05-19", 1),
(139, 89, 2520.00, "2023-05-20", 1),
(140, 90, 18020.00, "2023-05-21", 1),
(141, 91, 22020.00, "2023-05-22", 1),
(142, 92, 5020.00, "2023-05-23", 1),
(143, 93, 30020.00, "2023-05-24", 1),
(144, 94, 3520.00, "2023-05-25", 1),
(145, 95, 1220.00, "2023-05-26", 1),
(146, 96, 16020.00, "2023-05-27", 1),
(147, 97, 8020.00, "2023-05-28", 1),
(148, 98, 25020.00, "2023-05-29", 1),
(149, 99, 7020.00, "2023-05-30", 1),
(150, 100, 12020.00, "2023-05-31", 1),
(151, 101, 530.00, "2023-06-01", 1),
(152, 102, 1230.00, "2023-06-02", 1),
(153, 103, 830.00, "2023-06-03", 1),
(154, 104, 630.00, "2023-06-04", 1),
(155, 105, 730.00, "2023-06-05", 1),
(156, 106, 2030.00, "2023-06-06", 1),
(157, 107, 1030.00, "2023-06-07", 1),
(158, 108, 1530.00, "2023-06-08", 1),
(159, 109, 930.00, "2023-06-09", 1),
(160, 110, 1130.00, "2023-06-10", 1),
(161, 111, 1830.00, "2023-06-11", 1),
(162, 112, 2230.00, "2023-06-12", 1),
(163, 113, 2530.00, "2023-06-13", 1),
(164, 114, 780.00, "2023-06-14", 1),
(165, 115, 680.00, "2023-06-15", 1),
(166, 116, 5030.00, "2023-06-16", 1),
(167, 117, 3030.00, "2023-06-17", 1),
(168, 118, 1430.00, "2023-06-18", 1),
(169, 119, 2030.00, "2023-06-19", 1),
(170, 120, 2830.00, "2023-06-20", 1),
(171, 121, 3530.00, "2023-06-21", 1),
(172, 122, 3230.00, "2023-06-22", 1),
(173, 123, 1230.00, "2023-06-23", 1),
(174, 124, 4530.00, "2023-06-24", 1),
(175, 125, 830.00, "2023-06-25", 1),
(176, 126, 15030.00, "2023-06-26", 1),
(177, 127, 3530.00, "2023-06-27", 1),
(178, 128, 2030.00, "2023-06-28", 1),
(179, 129, 1830.00, "2023-06-29", 1),
(180, 130, 4030.00, "2023-06-30", 1),
(181, 131, 2130.00, "2023-07-01", 1),
(182, 132, 20030.00, "2023-07-02", 1),
(183, 133, 12030.00, "2023-07-03", 1),
(184, 134, 6030.00, "2023-07-04", 1),
(185, 135, 930.00, "2023-07-05", 1),
(186, 136, 7030.00, "2023-07-06", 1),
(187, 137, 1530.00, "2023-07-07", 1),
(188, 138, 5030.00, "2023-07-08", 1),
(189, 139, 2530.00, "2023-07-09", 1),
(190, 140, 18030.00, "2023-07-10", 1),
(191, 141, 22030.00, "2023-07-11", 1),
(192, 142, 5030.00, "2023-07-12", 1),
(193, 143, 30030.00, "2023-07-13", 1),
(194, 144, 3530.00, "2023-07-14", 1),
(195, 145, 1230.00, "2023-07-15", 1),
(196, 146, 16030.00, "2023-07-16", 1),
(197, 147, 8030.00, "2023-07-17", 1),
(198, 148, 25030.00, "2023-07-18", 1),
(199, 149, 7030.00, "2023-07-19", 1),
(200, 150, 12030.00, "2023-07-20", 1);

-- display the names and contact numbers of all female patients --
select first_name, last_name, contact from patients where gender = 'female';

-- retrieve all doctors who specialize in "cardiology" --
select doctor_name, specialization, phone from doctors where specialization = 'cardiology';

-- show all appointments scheduled for '2023-01-15' --
select * from appointments where appointment_date = '2023-01-15';

-- list all treatments that cost more than 5000 --
select * from treatments where cost > 5000;

-- display all pending payments from the billing table --
select * from billing where paid = 0;

-- show all departments headed by a doctor whose last name is 'sharma' --
select d.department_name, d.location
from departments d
join doctors doc on d.department_id = doc.department_id
where doc.doctor_name like '%sharma%';

-- retrieve the names of staff working in the 'radiology' department --
select s.first_name, s.last_name
from staff s
join departments d on s.department_id = d.department_id
where d.department_name = 'radiology';

-- count how many male and female patients are registered --
select gender, count(*) as total from patients group by gender;

-- find the total amount billed for all completed treatments --
select sum(amount) as total_billed
from billing where paid = 1;

-- list all patients treated by doctor id 1 --
select distinct p.first_name, p.last_name
from patients p
join treatments t on p.patient_id = t.patient_id
where t.doctor_id = 1;

-- display each appointment along with patient and doctor names --
select a.appointment_id, p.first_name, p.last_name, doc.doctor_name, a.appointment_date, a.status
from appointments a
join patients p on a.patient_id = p.patient_id
join doctors doc on a.doctor_id = doc.doctor_id;

-- list treatments with patient name, doctor name, and treatment cost --
select t.treatment_id, p.first_name, p.last_name, doc.doctor_name, t.cost
from treatments t
join patients p on t.patient_id = p.patient_id
join doctors doc on t.doctor_id = doc.doctor_id;

-- show all patients along with their billing status --
select p.first_name, p.last_name, b.amount, b.paid
from patients p
join billing b on p.patient_id = b.patient_id;

-- display department name and all doctors in it --
select d.department_name, doc.doctor_name, doc.specialization
from departments d
join doctors doc on d.department_id = doc.department_id;

-- retrieve staff names along with their department names --
select s.first_name, s.last_name, d.department_name
from staff s
join departments d on s.department_id = d.department_id;

-- list all appointments where the doctor’s specialization is 'dermatology' --
select a.appointment_id, p.first_name, p.last_name, a.appointment_date, a.status
from appointments a
join doctors doc on a.doctor_id = doc.doctor_id
join patients p on a.patient_id = p.patient_id
where doc.specialization = 'dermatology';

-- find all patients who have had at least one completed appointment --
select distinct p.first_name, p.last_name
from patients p
join appointments a on p.patient_id = a.patient_id
where a.status = 'completed';

-- display patients and doctors where appointment status is 'cancelled' --
select p.first_name, p.last_name, doc.doctor_name
from appointments a
join patients p on a.patient_id = p.patient_id
join doctors doc on a.doctor_id = doc.doctor_id
where a.status = 'cancelled';

-- show each treatment with total billed amount and payment status --
select t.treatment_id, p.first_name, p.last_name, t.cost, b.amount, b.paid
from treatments t
join billing b on t.treatment_id = b.treatment_id
join patients p on t.patient_id = p.patient_id;

-- retrieve all doctors who have provided treatment costing above 10000 --
select distinct doc.doctor_name, doc.specialization
from treatments t
join doctors doc on t.doctor_id = doc.doctor_id
where t.cost > 10000;

-- find the highest treatment cost in the hospital --
select max(cost) as highest_cost from treatments;

-- display doctors with the average treatment cost they’ve provided --
select doc.doctor_name, avg(t.cost) as average_cost
from doctors doc
join treatments t on doc.doctor_id = t.doctor_id
group by doc.doctor_id;

-- show total revenue generated per department --
select d.department_name, sum(t.cost) as total_revenue
from departments d
join doctors doc on d.department_id = doc.department_id
join treatments t on doc.doctor_id = t.doctor_id
group by d.department_id;

-- find the patient who has paid the highest total amount --
select p.first_name, p.last_name, sum(b.amount) as total_paid
from patients p
join billing b on p.patient_id = b.patient_id
where b.paid = 1
group by p.patient_id
order by total_paid desc limit 1;

-- count the total number of appointments for each doctor --
select doc.doctor_name, count(a.appointment_id) as total_appointments
from doctors doc
join appointments a on doc.doctor_id = a.doctor_id
group by doc.doctor_id;

-- retrieve all patients who have more than 2 appointments --
select p.first_name, p.last_name, count(a.appointment_id) as appointments_count
from patients p
join appointments a on p.patient_id = a.patient_id
group by p.patient_id
having appointments_count > 2;

-- display the total unpaid amount (sum of pending bills) --
select sum(amount) as total_unpaid from billing where paid = 0;

-- show the doctor with the most treatments handled --
select doc.doctor_name, count(t.treatment_id) as treatments_count
from doctors doc
join treatments t on doc.doctor_id = t.doctor_id
group by doc.doctor_id
order by treatments_count desc limit 1;

-- find all departments having more than 3 staff members --
select d.department_name, count(s.staff_id) as staff_count
from departments d
join staff s on d.department_id = s.department_id
group by d.department_id
having staff_count > 3;

-- display the top 5 most expensive treatments --
select t.treatment_id, p.first_name, p.last_name, t.cost
from treatments t
join patients p on t.patient_id = p.patient_id
order by t.cost desc limit 5;

-- create a view patientbillinginfo that shows patient name, treatment description, total amount, and payment status --
create view patientbillinginfo as
select p.first_name, p.last_name, t.description, b.amount, b.paid
from patients p
join treatments t on p.patient_id = t.patient_id
join billing b on t.treatment_id = b.treatment_id;

-- create a view doctortreatmentsummary that displays doctor name, specialization, and total treatments done --
create view doctortreatmentsummary as
select doc.doctor_name, doc.specialization, count(t.treatment_id) as total_treatments
from doctors doc
join treatments t on doc.doctor_id = t.doctor_id
group by doc.doctor_id;

-- create a stored procedure addnewpatient to insert a new record into patients --
delimiter //
create procedure addnewpatient(
in fname varchar(50),
in lname varchar(50),
in dob_date date,
in gndr enum('Male','Female','Other'),
in phone varchar(15),
in addr varchar(150)
)
begin
insert into patients(first_name, last_name, dob, gender, contact, address)
values (fname, lname, dob_date, gndr, phone, addr);
end //
delimiter ;

-- create a stored procedure getdoctorappointments that lists all appointments for a given doctor --
delimiter //
create procedure getdoctorappointments(in docid int)
begin
select a.appointment_id, p.first_name, p.last_name, a.appointment_date, a.status
from appointments a
join patients p on a.patient_id = p.patient_id
where a.doctor_id = docid;
end //
delimiter ;

-- create a stored procedure updatepaymentstatus that updates billing when payment is received --
delimiter //
create procedure updatepaymentstatus(in billid int, in status int)
begin
update billing set paid = status where bill_id = billid;
end //
delimiter ;

-- create a stored procedure getdepartmentdoctors that returns all doctors in a given department --
delimiter //
create procedure getdepartmentdoctors(in deptid int)
begin
select doctor_name, specialization from doctors where department_id = deptid;
end //
delimiter ;

-- create a stored procedure calculatepatientbill that shows total bill amount for a given patient id --
delimiter //
create procedure calculatepatientbill(in pid int)
begin
select sum(amount) as total_bill from billing where patient_id = pid;
end //
delimiter ;

-- create a stored procedure getpendingbills that returns all patients with unpaid bills --
delimiter //
create procedure getpendingbills()
begin
select p.first_name, p.last_name, b.amount
from patients p
join billing b on p.patient_id = b.patient_id
where b.paid = 0;
end //
delimiter ;

-- create a stored procedure scheduleappointment to add a new appointment record --
delimiter //
create procedure scheduleappointment(
in pid int,
in did int,
in app_date date,
in stat enum('Scheduled','Completed','Cancelled','No-show')
)
begin
insert into appointments(patient_id, doctor_id, appointment_date, status)
values (pid, did, app_date, stat);
end //
delimiter ;

-- create a stored procedure deletecancelledappointments that removes all cancelled appointments --
delimiter //
create procedure deletecancelledappointments()
begin
delete from appointments where status = 'Cancelled';
end //
delimiter ;

-- create a trigger beforeinsertappointment that prevents appointments from being created for inactive doctors --
delimiter //
create trigger beforeinsertappointment
before insert on appointments
for each row
begin
if (select count(*) from doctors where doctor_id = new.doctor_id) = 0 then
signal sqlstate '45000' set message_text = 'cannot schedule appointment for inactive doctor';
end if;
end //
delimiter ;

-- create a trigger afterinserttreatment that automatically creates a billing record when a new treatment is added --
delimiter //
create trigger afterinserttreatment
after insert on treatments
for each row
begin
insert into billing(treatment_id, patient_id, amount, billing_date, paid)
values (new.treatment_id, new.patient_id, new.cost, curdate(), 0);
end //
delimiter ;

-- create a trigger updatepaymentdate to set billing_date automatically when paid changes to 1 --
delimiter //
create trigger updatepaymentdate
before update on billing
for each row
begin
if new.paid = 1 and old.paid = 0 then
set new.billing_date = curdate();
end if;
end //
delimiter ;

-- create a trigger checktreatmentcost that ensures cost cannot be negative --
delimiter //
create trigger checktreatmentcost
before insert on treatments
for each row
begin
if new.cost < 0 then
signal sqlstate '45000' set message_text = 'treatment cost cannot be negative';
end if;
end //
delimiter ;

-- create a trigger logdeletedappointments to record details of deleted appointments in a log table --
create table deleted_appointments_log (
log_id int primary key auto_increment,
appointment_id int,
patient_id int,
doctor_id int,
deleted_at datetime
);
delimiter //
create trigger logdeletedappointments
after delete on appointments
for each row
begin
insert into deleted_appointments_log(appointment_id, patient_id, doctor_id, deleted_at)
values (old.appointment_id, old.patient_id, old.doctor_id, now());
end //
delimiter ;

-- list patients who have appointments in more than one department --
select p.first_name, p.last_name
from patients p
join appointments a on p.patient_id = a.patient_id
join doctors d on a.doctor_id = d.doctor_id
group by p.patient_id
having count(distinct d.department_id) > 1;

-- display the total earnings of each doctor (sum of treatment costs) --
select d.doctor_name, sum(t.cost) as total_earnings
from doctors d
join treatments t on d.doctor_id = t.doctor_id
group by d.doctor_id;

-- find the department generating the highest revenue --
select dep.department_name, sum(t.cost) as total_revenue
from departments dep
join doctors d on dep.department_id = d.department_id
join treatments t on d.doctor_id = t.doctor_id
group by dep.department_id
order by total_revenue desc limit 1;

-- retrieve doctors who have never performed any treatment --
select doctor_name from doctors
where doctor_id not in (select doctor_id from treatments);

-- display patients who have completed treatments but haven’t paid yet --
select p.first_name, p.last_name
from patients p
join billing b on p.patient_id = b.patient_id
where b.paid = 0;

-- find the youngest and oldest patients in the database --
select min(dob) as oldest, max(dob) as youngest from patients;

-- retrieve details of all treatments performed in march 2023 --
select * from treatments where month(treatment_date) = 3 and year(treatment_date) = 2023;

-- display the total number of staff in each department --
select dep.department_name, count(s.staff_id) as total_staff
from departments dep
join staff s on dep.department_id = s.department_id
group by dep.department_id;

-- list all doctors whose names start with 'a' --
select * from doctors where doctor_name like 'a%';

-- update the contact number of patient id 5 --
update patients set contact = '9999999999' where patient_id = 5;

-- change the specialization of doctor id 3 to “sports medicine” --
update doctors set specialization = 'sports medicine' where doctor_id = 3;

-- add a not null constraint on appointment_date --
alter table appointments modify appointment_date date not null;

-- add a unique constraint on contact in the patients table --
alter table patients add unique(contact);

-- add a foreign key from staff to departments --
alter table staff add constraint fk_staff_department foreign key(department_id) references departments(department_id);

-- rename the column role in staff to designation --
alter table staff change role designation varchar(50);

-- drop the foreign key linking billing and treatments --
alter table billing drop foreign key billing_ibfk_1;

-- show the total number of appointments, treatments, and bills per patient --
select p.patient_id, p.first_name, p.last_name,
count(distinct a.appointment_id) as total_appointments,
count(distinct t.treatment_id) as total_treatments,
count(distinct b.bill_id) as total_bills
from patients p
left join appointments a on p.patient_id = a.patient_id
left join treatments t on p.patient_id = t.patient_id
left join billing b on p.patient_id = b.patient_id
group by p.patient_id;

-- find patients who have made full payments and had more than one treatment --
select p.first_name, p.last_name
from patients p
join billing b on p.patient_id = b.patient_id
join treatments t on p.patient_id = t.patient_id
group by p.patient_id
having sum(b.paid) = count(b.bill_id) and count(t.treatment_id) > 1;

-- generate a list of doctors whose average treatment cost is above ₹5,000 --
select d.doctor_name, avg(t.cost) as avg_cost
from doctors d
join treatments t on d.doctor_id = t.doctor_id
group by d.doctor_id
having avg_cost > 5000;

-- list the top 3 departments with the most appointments --
select dep.department_name, count(a.appointment_id) as total_appointments
from departments dep
join doctors d on dep.department_id = d.department_id
join appointments a on d.doctor_id = a.doctor_id
group by dep.department_id
order by total_appointments desc limit 3;

-- display all patients and doctors who share the same last name --
select p.first_name as patient_first, p.last_name as last_name, d.doctor_name as doctor_full
from patients p
join doctors d on p.last_name = substring_index(d.doctor_name,' ',-1);

-- display doctors who have handled treatments in more than 2 different departments --
select d.doctor_name, count(distinct dep.department_id) as dept_count
from doctors d
join treatments t on d.doctor_id = t.doctor_id
join departments dep on d.department_id = dep.department_id
group by d.doctor_id
having dept_count > 2;

-- show patients who have appointments with more than 1 doctor on the same day --
select p.patient_id, p.first_name, p.last_name, a.appointment_date, count(distinct a.doctor_id) as doctor_count
from patients p
join appointments a on p.patient_id = a.patient_id
group by p.patient_id, a.appointment_date
having doctor_count > 1;

-- list top 5 doctors who have generated the highest total billing amount --
select d.doctor_name, sum(b.amount) as total_billing
from doctors d
join treatments t on d.doctor_id = t.doctor_id
join billing b on t.treatment_id = b.treatment_id
group by d.doctor_id
order by total_billing desc
limit 5;