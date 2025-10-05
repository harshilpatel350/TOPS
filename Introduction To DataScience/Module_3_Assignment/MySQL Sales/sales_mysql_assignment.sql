create database sales;

use sales;

create table customers(
	customer_id int primary key auto_increment,
    customer_name varchar(100),
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100),
    phone varchar(20),
    address varchar(200),
    city varchar(100),
    state varchar(50),
    zip_code varchar(100),
    country varchar(100),
    grade int,
    salesman_id int
    );

create table orders(
	order_id int primary key auto_increment,
    customer_id int,
    product_id int,
    order_date date,
    shipped_date date,
    ship_address varchar(200),
    ship_city varchar(100),
    ship_state varchar(50),
    ship_zip_code varchar(20),
    ship_country varchar(100),
    status varchar(50),
    order_total decimal(10,2),
    purchase_amount decimal(10,2),
    target_value decimal(10,2),
    achieved_percentage decimal(10,2),
    unachieved_percentage decimal(10,2),
    foreign key (customer_id) references customers(customer_id),
    foreign key (product_id) references products(product_id)
    );

create table products(
	product_id int primary key auto_increment,
    product_name varchar(100),
    description text,
    category varchar(100),
    price decimal(10,2),
    quantity int
    );

create table employees(
	employee_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    phone varchar(20),
    hire_date date,
    job_title varchar(100),
    department_id int,
    manager_id int,
    salary decimal(10,2),
    commission_pct decimal(10,2),
    department_name varchar(100),
    foreign key (department_id) references departments(department_id)
    );

create table departments(
	department_id int primary key auto_increment,
    department_name varchar(100),
    location varchar(100)
    );

insert into customers(customer_name,first_name,last_name,email,phone,address,city,state,zip_code,country,grade,salesman_id)
values
('Sophia Hernandez', 'Sophia', 'Hernandez', 'sophia.hernandez@protonmail.com', '555-1234', '123 Oak St', 'Los Angeles', 'CA', '90001', 'USA', 85, 201),
('Michael Nguyen', 'Michael', 'Nguyen', 'michael.nguyen@gmail.com', '555-5678', '456 Maple Rd', 'Chicago', 'IL', '60601', 'USA', 92, 202),
('Olivia Gonzalez', 'Olivia', 'Gonzalez', 'olivia.gonzalez@yahoo.com', '555-9012', '789 Pine Ave', 'Houston', 'TX', '77001', 'USA', 78, 203),
('William Patel', 'William', 'Patel', 'william.patel@hotmail.com', '555-3456', '321 Elm St', 'Seattle', 'WA', '98101', 'USA', 88, 204),
('Emma Tanaka', 'Emma', 'Tanaka', 'emma.tanaka@outlook.com', '555-7890', '654 Oak Rd', 'Miami', 'FL', '33101', 'USA', 91, 205),
('Jacob Müller', 'Jacob', 'Müller', 'jacob.muller@zohomail.com', '555-2345', '987 Maple Ave', 'Boston', 'MA', '02101', 'USA', 83, 206),
('Isabella Moreno', 'Isabella', 'Moreno', 'isabella.moreno@proton.me', '555-6789', '159 Pine St', 'Denver', 'CO', '80201', 'USA', 90, 207),
('Ethan Sato', 'Ethan', 'Sato', 'ethan.sato@gmail.com', '555-0123', '753 Oak Rd', 'Portland', 'OR', '97201', 'USA', 87, 208),
('Ava Nguyen', 'Ava', 'Nguyen', 'ava.nguyen@zohomail.com', '555-4567', '951 Elm Ave', 'Atlanta', 'GA', '30301', 'USA', 93, 209),
('Benjamin Ramirez', 'Benjamin', 'Ramirez', 'benjamin.ramirez@hotmail.com', '555-8901', '357 Maple St', 'Phoenix', 'AZ', '85001', 'USA', 85, 210);

insert into orders(customer_id,product_id,order_date,shipped_date,ship_address,ship_city,ship_state,ship_zip_code,ship_country,status,order_total,purchase_amount,target_value,achieved_percentage,unachieved_percentage)
values
(1, 1, '2023-01-15', '2023-01-20', '123 Oak St', 'Los Angeles', 'CA', '90001', 'USA', 'Shipped', 500.00, 500.00, 6000.00, 8.33, 91.67),
(2, 2, '2023-02-01', '2023-02-05', '456 Maple Rd', 'Chicago', 'IL', '60601', 'USA', 'Shipped', 800.00, 800.00, 6000.00, 13.33, 86.67),
(3, 3, '2023-03-10', '2023-03-15', '789 Pine Ave', 'Houston', 'TX', '77001', 'USA', 'Shipped', 650.00, 650.00, 6000.00, 10.83, 89.17),
(4, 4, '2023-04-05', '2023-04-10', '321 Elm St', 'Seattle', 'WA', '98101', 'USA', 'Shipped', 900.00, 900.00, 6000.00, 15.00, 85.00),
(5, 5, '2023-05-20', '2023-05-25', '654 Oak Rd', 'Miami', 'FL', '33101', 'USA', 'Shipped', 750.00, 750.00, 6000.00, 12.50, 87.50),
(6, 6, '2023-06-01', '2023-06-06', '987 Maple Ave', 'Boston', 'MA', '02101', 'USA', 'Shipped', 600.00, 600.00, 6000.00, 10.00, 90.00),
(7, 7, '2023-07-15', '2023-07-20', '159 Pine St', 'Denver', 'CO', '80201', 'USA', 'Shipped', 850.00, 850.00, 6000.00, 14.17, 85.83),
(8, 8, '2023-08-10', '2023-08-15', '753 Oak Rd', 'Portland', 'OR', '97201', 'USA', 'Shipped', 700.00, 700.00, 6000.00, 11.67, 88.33),
(9, 9, '2023-09-01', '2023-09-06', '951 Elm Ave', 'Atlanta', 'GA', '30301', 'USA', 'Shipped', 550.00, 550.00, 6000.00, 9.17, 90.83),
(10, 10, '2023-10-20', '2023-10-25', '357 Maple St', 'Phoenix', 'AZ', '85001', 'USA', 'Shipped', 800.00, 800.00, 6000.00, 13.33, 86.67);

insert into products(product_name,description,category,price,quantity)
values
('Wireless Headphones', 'High-quality wireless headphones with noise-cancelling technology', 'Electronics', 99.99, 50),
('Laptop Backpack', 'Durable and stylish backpack designed for laptops up to 15 inches', 'Bags', 59.99, 75),
('Mechanical Keyboard', 'Mechanical keyboard with customizable RGB lighting and tactile switches', 'Electronics', 79.99, 30),
('Outdoor Camping Tent', 'Lightweight and weatherproof tent for 4 people', 'Sports & Outdoors', 149.99, 20),
('Smart TV', '55-inch 4K smart TV with built-in streaming apps', 'Electronics', 499.99, 40),
('Fitness Tracker', 'Waterproof fitness tracker with heart rate monitoring and activity tracking', 'Health & Fitness', 79.99, 60),
('Leather Briefcase', 'Stylish and durable leather briefcase for professional use', 'Bags', 199.99, 25),
('Espresso Machine', 'Compact espresso machine with built-in milk frother', 'Home & Kitchen', 149.99, 35),
('Outdoor Grill', 'Portable charcoal grill for backyard and camping', 'Sports & Outdoors', 99.99, 15),
('Noise-Cancelling Headphones', 'Over-ear headphones with advanced noise-cancelling technology', 'Electronics', 199.99, 45);

insert into employees(first_name,last_name,email,phone,hire_date,job_title,department_id,manager_id,salary,commission_pct,department_name)
values
('Aarav', 'Sharma', 'aarav.sharma@company.com', '9876543210', '2019-03-15', 'Sales Executive', 1, 101, 55000.00, 5.00, 'Sales'),
('Emma', 'Wilson', 'emma.wilson@company.com', '9988776655', '2020-07-10', 'Marketing Manager', 2, 102, 72000.00, 7.50, 'Marketing'),
('Rohan', 'Patel', 'rohan.patel@company.com', '9123456789', '2021-01-20', 'Software Engineer', 3, 103, 68000.00, 0.00, 'IT'),
('Sophia', 'Fernandez', 'sophia.fernandez@company.com', '8765432190', '2018-06-12', 'HR Executive', 4, 104, 48000.00, 3.00, 'Human Resources'),
('Liam', 'Brown', 'liam.brown@company.com', '9456781230', '2022-03-05', 'Finance Analyst', 5, 105, 62000.00, 4.50, 'Finance'),
('Isha', 'Nair', 'isha.nair@company.com', '9654321870', '2019-11-15', 'Product Manager', 3, 103, 81000.00, 6.00, 'IT'),
('Noah', 'Kim', 'noah.kim@company.com', '9123098765', '2017-02-18', 'Operations Manager', 6, 106, 90000.00, 8.00, 'Operations'),
('Ananya', 'Verma', 'ananya.verma@company.com', '9988123456', '2020-09-22', 'Sales Associate', 1, 101, 46000.00, 4.00, 'Sales'),
('Lucas', 'Garcia', 'lucas.garcia@company.com', '9765123489', '2021-05-11', 'Data Analyst', 3, 103, 58000.00, 0.00, 'IT'),
('Meera', 'Reddy', 'meera.reddy@company.com', '9345612789', '2019-12-02', 'Finance Executive', 5, 105, 52000.00, 2.50, 'Finance'),
('Oliver', 'Johnson', 'oliver.johnson@company.com', '9876012345', '2016-08-17', 'HR Manager', 4, 104, 75000.00, 5.00, 'Human Resources'),
('Priya', 'Kaur', 'priya.kaur@company.com', '9987765544', '2023-01-25', 'Junior Developer', 3, 103, 45000.00, 0.00, 'IT'),
('Ethan', 'Nguyen', 'ethan.nguyen@company.com', '9123344556', '2018-10-09', 'Operations Supervisor', 6, 106, 67000.00, 4.00, 'Operations'),
('Aditi', 'Menon', 'aditi.menon@company.com', '9345078123', '2019-04-14', 'Marketing Executive', 2, 102, 53000.00, 3.50, 'Marketing'),
('William', 'Chow', 'william.chow@company.com', '9876504321', '2021-11-28', 'Software Tester', 3, 103, 49000.00, 0.00, 'IT'),
('Nisha', 'Desai', 'nisha.desai@company.com', '9123409876', '2022-06-18', 'Sales Manager', 1, 101, 78000.00, 7.00, 'Sales'),
('Daniel', 'Martinez', 'daniel.martinez@company.com', '9345678123', '2020-02-11', 'Accountant', 5, 105, 57000.00, 2.00, 'Finance'),
('Tanya', 'Bhatt', 'tanya.bhatt@company.com', '9988123012', '2017-09-20', 'HR Coordinator', 4, 104, 50000.00, 3.00, 'Human Resources'),
('Ryan', 'Singh', 'ryan.singh@company.com', '9345612908', '2018-12-07', 'IT Support Specialist', 3, 103, 52000.00, 0.00, 'IT'),
('Sara', 'Lopez', 'sara.lopez@company.com', '9123012456', '2021-07-01', 'Operations Executive', 6, 106, 55000.00, 2.50, 'Operations');

insert into departments(department_name,location)
values
('Sales', 'Mumbai'),
('Marketing', 'New Delhi'),
('IT', 'Bengaluru'),
('Human Resources', 'Chennai'),
('Finance', 'Hyderabad'),
('Operations', 'Pune'),
('Customer Support', 'Kolkata'),
('Logistics', 'Ahmedabad'),
('Legal', 'Gurugram'),
('Research & Development', 'Noida');

-- 1. write a SQL query to find customers who are either from the city 'Denver' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id. --
select customer_id,customer_name,city,grade,salesman_id from customers
where city='Denver' or grade <= 100;

--  2. write a SQL query to find all the customers in ‘Denver’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id. --
select customer_id,customer_name,city,grade,salesman_id from customers
where city='Denver' and grade > 100;

-- 3. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000. --
select order_id, purchase_amount, achieved_percentage, unachieved_percentage from orders
where target_value > (50/100)*6000;

--  4. write a SQL query to calculate the total purchase amount of all orders. Return total purchase amount. --
select sum(purchase_amount) as total_purchase_amount from orders;

-- 5. write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. --
select customer_id, max(purchase_amount) as "maximum purchase amount" from orders group by customer_id;

-- 6. write a SQL query to calculate the average product price. Return average product price. --
select avg(price) as average_product_price from products;

-- 7. write a SQL query to find those employees whose department is located at ‘Mumbai’. Return first name, last name, employee ID, job ID. --
select e.first_name, e.last_name, e.employee_id, e.job_title from employees as e 
inner join departments as d on 
e.department_id=d.department_id 
where location='Mumbai';

--  8. write a SQL query to find those employees whose salary is lower than that of employees whose job title is "Product Manager". Exclude employees of the Job title ‘Product Manager’. Return employee ID, first name, last name, job ID. --
select employee_id, first_name, last_name, job_title from employees
where salary < (select max(salary) from employees where job_title='Product Manager')
and
job_title != 'Product Manager';

--  9. write a SQL query to find all those employees who work in department ID 8 or 4. Return first name, last name, department number and department name. --
select e.first_name, e.last_name, d.department_id, d.department_name 
from employees as e 
inner join departments as d
on e.department_id=d.department_id
where d.department_id in (4,8);

--  10. write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. Return department name, average salary and number of employees. --
select department_name, avg(salary) as 'Average Salary', count(employee_id) as 'Number Of Employees',count(commission_pct) as 'Recieving Commission' from employees group by department_name;

--  11. write a SQL query to find out which employees have the same designation as the employee whose ID is 44. Return first name, last name, department ID and job ID. --
select first_name, last_name, department_id, job_title from employees
where job_title=(select job_title from employees where employee_id=44);

-- 12. write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name. --
select employee_id, first_name, last_name from employees
where salary > (select avg(salary) as avg_salary from employees);

--  13. write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name. --
select d.department_id, e.first_name, e.job_title, d.department_name from employees as e
inner join departments as d on
e.department_id=d.department_id
where d.department_name='Finance';

--  14. From the following table, write a SQL query to find the employees who earn less than the employee of ID 48. Return first name, last name and salary. --
select first_name, last_name, salary from employees
where employee_id = (select employee_id from employees where salary < (select salary from employees where employee_id=48));

--  15. Create a stored procedure CountEmployeesByDept that returns the number of employees in each department. --
delimiter //
create procedure CountEmployeesByDept()
begin
select count(employee_id) as 'Number Of Employees',department_name from employees
group by department_name;
end //
delimiter ;
call CountEmployeesByDept();

--  16. Create a stored procedure AddNewEmployee that adds a new employee to the database. --
insert into departments (department_id, department_name, location)
values (70, 'Data', 'Bangalore');
delimiter //
create procedure AddNewEmployee(
	in first_name varchar(50),
    in last_name varchar(50),
    in email varchar(50),
    in phone varchar(20),
    in hire_date date,
    in job_title varchar(50),
    in department_id int,
    in manager_id int,
    in salary decimal(10,2),
    in commission_pct decimal(10,2),
    in department_name varchar(20)
)
begin
insert into employees(first_name,last_name,email,phone,hire_date,job_title,department_id,manager_id,salary,commission_pct,department_name)
values(first_name,last_name,email,phone,hire_date,job_title,department_id,manager_id,salary,commission_pct,department_name);
end //
delimiter ;
drop procedure AddNewEmployee;
call AddNewEmployee('Ajay', 'Mehra', 'ajay.mehra@zohomail.com', '9587632495', '2025-10-04', 'Data Engineer', 70, 155, 60000, 9, 'Data');

-- 17. Create a stored procedure DeleteEmployeesByDept that removes all employees from a specific department. --
delimiter //
create procedure DeleteEmployeesByDept(
    in p_department_id int
)
begin
    delete from employees
    where department_id = p_department_id;
end //
delimiter ;
call DeleteEmployeesByDept(10);

-- 18.Create a stored procedure GetTopPaidEmployees that retrieves the highest-paid employee in each department. --
delimiter //
create procedure GetTopPaidEmployees()
begin
    select e.department_id,
           d.department_name,
           e.employee_id,
           e.first_name,
           e.last_name,
           e.salary
    from employees e
    join departments d on e.department_id = d.department_id
    where (e.department_id, e.salary) in (
        select department_id, max(salary)
        from employees
        group by department_id
    )
    order by e.department_id;
end //
delimiter ;
call GetTopPaidEmployees();

-- 19.Create a stored procedure PromoteEmployee that increases an employee’s salary and changes their job role. --
delimiter //
create procedure PromoteEmployee(
    in p_employee_id int,
    in p_new_job_title varchar(50),
    in p_salary_increase decimal(10,2)
)
begin
    update employees
    set job_title = p_new_job_title,
        salary = salary + p_salary_increase
    where employee_id = p_employee_id;
end //
delimiter ;
call PromoteEmployee(102, 'senior data engineer', 15000);

--  20.Create a stored procedure AssignManagerToDepartment that assigns a new manager to all employees in a specific department. --
delimiter //
create procedure AssignManagerToDepartment(
    in p_department_id int,
    in p_manager_id int
)
begin
    update employees
    set manager_id = p_manager_id
    where department_id = p_department_id;

    update departments
    set manager_id = p_manager_id
    where department_id = p_department_id;
end //
delimiter ;
alter table departments add column manager_id int null;
call AssignManagerToDepartment(20, 155);