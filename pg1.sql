create database NEW_data_db2;

create table students(
student_id int,
name       char(50),
age        int,
grade      char(1)
);

insert INTO students (student_id,age)
values  (1,21),
        (2,22);
select * from students;

INSERT INTO students
VALUES (5,'yash',21,'A')

select * from students;
select NAME from students;
select AGE from students;

select age from students where age = 21;
select name from students where name = 'yash';

 #NEW UPDATE
 
update students
set age=20
where name='yash';

update students
set grade = 'A'
where student_id = 1;

update students
set name = 'joy'
where student_id = 2;

# new DELETE

delete from students
where name='joy'

select * from students;
----------  IMP  ---------------

create table random(
ID serial primary key,
name varchar(100) not null,
email text unique ,
created_at date default now(),
age int check (age >= 18)
);

select * from random;
insert into random(name,age)
values('yash',21)

insert into random(name,age)
values('yashs',22)
insert into random(name,age)
values('jack',21)
====================NEW DATABASE-------------------


create database flipkart_db;

CREATE TABLE products(
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  sku_code CHAR(8) UNIQUE NOT NULL,
  price NUMERIC(10,2) CHECK (price > 0),
  stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
  is_available BOOLEAN DEFAULT TRUE,
  category TEXT NOT NULL,
  adden_on DATE DEFAULT CURRENT_DATE,
  last_update TIMESTAMP DEFAULT NOW()
);

select * from products;

INSERT INTO products (name, sku_code, price , stock_quantity, is_available, category)
VALUES
('Wireless Mouse', 'WM123456', 699.99, 50, TRUE, 'Electronics'),
('Bluetooth Speaker', 'BS234567', 1499.00, 30, TRUE, 'Electronics'),
('Laptop Stand', 'LS345678', 799.50, 20, TRUE, 'Accessories'),
('USB-C Hub', 'UC456789', 1299.99, 15, TRUE, 'Accessories'),
('Notebook', 'NB567890', 99.99, 100, TRUE, 'Stationery'),
('Pen Set', 'PS678901', 199.00, 200, TRUE, 'Stationery'),
('Coffee Mug', 'CM789012', 299.00, 75, TRUE, 'Home & Kitchen'),
('LED Desk Lamp', 'DL890123', 899.00, 40, TRUE, 'Home & Kitchen'),
('Yoga Mat', 'YM901234', 499.00, 25, TRUE, 'Fitness'),
('Water Bottle', 'WB012345', 349.00, 60, TRUE, 'Fitness');

#new IMP          " CLAUSES "

select name , price from products;
select * from products where category='Electronics';
select category from products group by category;
select category, count(*) from products group by category having count(*)>1;
select category, count(*) from products group by category having count(*)>2;
select * from products order by price;
select * from products order by price DESC;
select * from products order by name;
select * from products limit 3;
select name as item_name,price as item_price from products;
select distinct category from products;

#new   " aggregation function in sql "

select count(product_id) from products;
select sum(price) from products;
select sum(price) from products where category='Electronics' or category='Home & Kitchen';
select avg(price) from products;
select round (avg(price),2) from products;
select min(price) from products;
select max(price) from products;

#Test 2 Questions

Q1. Display the name and price of the cheapest product in the entire table.
SELECT name, price FROM products
WHERE price = (SELECT MIN(price) FROM products);

Q2. Find the average price of products that belong to 'Home & Kitchen' or 'Fitness'.
SELECT AVG(price) AS avg_price
FROM products
WHERE category IN ('Home & Kitchen', 'Fitness')
GROUP BY category;

Q3. Show product names and stock quantity where product is available, stock > 50, and price != 299.
SELECT name, stock_quantity FROM products
WHERE is_available = TRUE
AND stock_quantity > 50
AND price != 299.00;

Q4. Find the most expensive product in each category.
SELECT category, MAX(price) AS max_price
FROM products
GROUP BY category;

Q5. Show all unique categories in uppercase, sorted in descending order.
SELECT DISTINCT UPPER(category) AS category_upper
FROM products
ORDER BY category_upper DESC;

--------Alter in sql---------

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age BIGINT
);

INSERT INTO students (name, age)
VALUES 
('akarsh', 23),
('Ajali', 22);

SELECT * FROM students;

alter table students
add column email varchar(100) default 'NOT';

alter table students
drop column email ;

**** more new ****

alter table students
rename column name to full_name;

alter table students
alter column age type int;

alter table students
alter column age set Default 18;

alter table students
alter column age drop Default;

alter table students
add constraint age check (age>=0);

alter table students
drop constraint age;

alter table students
rename to new_students;

select * from new_students;

*** more functions ***

--The first set of functions are UPPER, LOWER, and LENGTH functions.

SELECT UPPER(name) FROM products;
--This query converts the values in the name column of the products table into uppercase letters.

SELECT LOWER(sku_code) FROM products;
--This query converts the values in the sku_code column of the products table into lowercase letters.

SELECT LENGTH(name) FROM products;
--This query returns the number of characters in each value of the name column from the products table.

select substring('hello yash',1,5);
#only hello show 

select name ,substring(sku_code,1,2) from products;
select substring(sku_code,1,2) from products;

select left(sku_code,2) from products;
select right(sku_code,2) from products;
select left('hi yash',2);
select right('hi yash',4);
select left(sku_code,2) from products;

---more STRING FUNCTIONS---
---CONCAT()---

#Some other functions are CONCAT().
#CONCAT joins two or more strings together.

SELECT CONCAT(name, ' : ', category) FROM products;
--This query joins the name and category columns from the products table with ":" between them.

SELECT CONCAT_WS(' : ', name, category) FROM products;
--This query joins the name and category columns from the products table using ":" as a separator between the values.

     --IMP CASE--

select * from products;

SELECT name, price,
CASE WHEN price > 1000 THEN 'Expensive'
    WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
    ELSE 'Cheap'
END AS price_tag
FROM products;

--add in table--
select * from products;

alter table products
add column price_tag text;

update products
set price_tag =
CASE 
    WHEN price > 1000 THEN 'Expensive'
    WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
    ELSE 'Cheap'
END;

--case--
Q1 --Ok now let’s do one important question. Inside the column you have 
boolean true and false. Show a new column with ‘In Stock’ and ‘Out of Stock’.

SELECT
  name,
  CASE
    WHEN is_available THEN 'In Stock'
    ELSE 'Out of Stock'
  END AS availability_status
FROM products;

--Topic Covered in case?--

What is CASE & why it used
CASE in SELECT to create custom columns
Using CASE with numeric, boolean, and category columns
Creating new columns with ALTER + UPDATE + CASE
Practical examples: price tag, stock status, availability

                   --One-to-One Relationship: Students & Profiles--
				   

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

INSERT INTO students (name)
VALUES
('Akarsh Vyas'), ('Simran Mehta'), ('Rohan Gupta');


select * from students;

CREATE TABLE student_profiles (
  student_id INT PRIMARY KEY,
  address TEXT,
  age INT,
  phone VARCHAR(15)
);

INSERT INTO student_profiles (student_id, address, age, phone)
VALUES
(1, 'Delhi, India', 22, '9999999999'),
(2, 'Mumbai, India', 21, '8888888888'),
(3, 'Bangalore, India', 23, '7777777777');

select * from student_profiles;

--Foreign Key Constraint--

ALTER TABLE student_profiles
ADD CONSTRAINT fk_student_id
FOREIGN KEY (student_id)
REFERENCES students(student_id);

--Join Query--

SELECT s.student_id, s.name, sp.address, sp.age, sp.phone
FROM students s
JOIN student_profiles sp ON s.student_id = sp.student_id;

--One to Many relationship--

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE marks (
    mark_id SERIAL PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (name)
VALUES ('Akarsh Vyas'), ('Simran Mehta'), ('Rohan Gupta');

INSERT INTO marks (student_id, subject, marks)
VALUES
(1, 'English', 85), (1, 'Math', 89), (1, 'Science', 92),
(2, 'English', 80), (2, 'Math', 75), (2, 'Science', 78),
(3, 'English', 72), (3, 'Math', 70), (3, 'Science', 74);

SELECT * FROM marks;
SELECT * FROM students;

--join--
inner join also as join 

SELECT s.name, m.subject, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id;

SELECT * FROM students s
JOIN marks m
ON s.student_id = m.student_id;

SELECT s.name, m.subject, m.marks
FROM students s
JOIN marks m
ON s.student_id = m.student_id
where name ='Akarsh Vyas';

--left join--
IMP

insert into students (name)
values ('yash ');

SELECT s.name, m.subject, m.marks
FROM students s
left JOIN marks m
ON s.student_id = m.student_id;

--right join--

SELECT s.name, m.subject, m.marks
FROM students s
right JOIN marks m
ON s.student_id = m.student_id;

--full join--

SELECT s.name, m.subject, m.marks
FROM students s
full JOIN marks m
ON s.student_id = m.student_id;

SELECT * FROM students s
full JOIN marks m
ON s.student_id = m.student_id;

--cross join--

SELECT s.name, m.subject, m.marks
FROM students s
cross JOIN marks m;

--One-to-Many: Products & Orders. (Files are attached in Github)--

CREATE TABLE productss (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category TEXT,
  price NUMERIC(10,2),
  stock_quantity INT,
  is_available BOOLEAN,
  added_on DATE
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  product_id INT,
  quantity INT,
  order_date DATE,
  customer_name VARCHAR(50),
  payment_method VARCHAR(50),
  CONSTRAINT fk_product FOREIGN KEY (product_id)
  REFERENCES products(product_id) ON DELETE CASCADE
);

select * from productss;
select * from orders;

INSERT INTO productss (product_id, product_name, category, price, stock_quantity, is_available, added_on) VALUES
(101, 'Wireless Mouse', 'Electronics', 1611.53, 79, FALSE, '2025-04-29'),
(102, 'Bluetooth Speaker', 'Electronics', 135.14, 23, TRUE, '2025-06-04'),
(103, 'Laptop Stand', 'Accessories', 1020.92, 161, FALSE, '2025-07-09'),
(104, 'USB-C Hub', 'Accessories', 408.39, 164, FALSE, '2025-05-12'),
(105, 'Notebook', 'Stationery', 1987.74, 116, TRUE, '2025-07-01'),
(106, 'Pen Set', 'Stationery', 1048.10, 150, TRUE, '2025-06-29'),
(107, 'Coffee Mug', 'Home & Kitchen', 1063.53, 76, FALSE, '2025-04-15'),
(108, 'LED Desk Lamp', 'Home & Kitchen', 239.10, 93, FALSE, '2025-05-23'),
(109, 'Yoga Mat', 'Fitness', 1514.86, 162, TRUE, '2025-05-05'),
(110, 'Water Bottle', 'Fitness', 420.99, 191, TRUE, '2025-05-09'),
(111, 'Smartphone', 'Electronics', 361.20, 200, FALSE, '2025-04-18'),
(112, 'Headphones', 'Electronics', 154.84, 178, TRUE, '2025-05-18'),
(113, 'Gaming Keyboard', 'Accessories', 103.24, 100, FALSE, '2025-04-19'),
(114, 'Monitor', 'Electronics', 305.20, 123, FALSE, '2025-05-20'),
(115, 'HDMI Cable', 'Accessories', 552.97, 105, TRUE, '2025-06-17'),
(116, 'Power Bank', 'Electronics', 831.88, 13, FALSE, '2025-07-01'),
(117, 'Backpack', 'Accessories', 1517.11, 64, TRUE, '2025-05-08'),
(118, 'Webcam', 'Electronics', 1428.30, 76, FALSE, '2025-06-11'),
(119, 'Desk Organizer', 'Home & Kitchen', 404.69, 136, FALSE, '2025-06-14'),
(120, 'Fitness Band', 'Fitness', 1451.69, 171, FALSE, '2025-05-06');

INSERT INTO orders 
(order_id, product_id, quantity, order_date, customer_name, payment_method)
VALUES
(1,120,5,'2025-06-26','Rohan','Cash on Delivery'),
(2,116,5,'2025-06-21','Anjali','Cash on Delivery'),
(3,101,3,'2025-06-23','Rohan','Credit Card'),
(4,115,3,'2025-06-16','Akarsh','Credit Card'),
(5,105,3,'2025-06-24','Simran','Credit Card'),
(6,118,4,'2025-06-19','Priya','UPI'),
(7,102,2,'2025-06-20','Rahul','UPI'),
(8,110,1,'2025-06-22','Neha','Debit Card'),
(9,108,6,'2025-06-25','Amit','Credit Card'),
(10,103,2,'2025-06-18','Pooja','Cash on Delivery'),
(11,119,5,'2025-06-27','Rohit','UPI'),
(12,111,3,'2025-06-17','Sneha','Debit Card'),
(13,106,4,'2025-06-21','Karan','Credit Card'),
(14,104,2,'2025-06-23','Anita','UPI'),
(15,112,3,'2025-06-24','Vikas','Debit Card'),
(16,117,1,'2025-06-26','Meena','Cash on Delivery'),
(17,107,5,'2025-06-19','Arjun','UPI'),
(18,109,2,'2025-06-20','Divya','Credit Card'),
(19,113,4,'2025-06-22','Manish','Debit Card'),
(20,114,3,'2025-06-25','Kavita','Cash on Delivery');


Sample Queries
Q1. Show each order along with the product name and price
SELECT o.order_id, o.customer_name, p.product_name, p.price
FROM orders o
JOIN products p ON o.product_id = p.product_id;

Q2. Show all products even if they were never ordered
SELECT p.product_name, o.order_id
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id;

Q3. Show orders for only 'Electronics' category
SELECT o.order_id, p.product_name, p.category
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE p.category = 'Electronics';

Q4. List all orders sorted by product price (high to low)
SELECT o.order_id, p.product_name, p.price
FROM orders o
JOIN products p ON o.product_id = p.product_id
ORDER BY p.price DESC;

Q5. Show number of orders placed for each product
SELECT p.product_name, COUNT(o.order_id) AS total_orders
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

Q6. Show total revenue earned per product
SELECT p.product_name, SUM(o.quantity * p.price) AS revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

Q7. Show products where total order revenue > ₹2000
SELECT p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name
HAVING SUM(o.quantity * p.price) > 2000;

Q8. Show unique customers who ordered 'Fitness' products
SELECT DISTINCT o.customer_name
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE p.category = 'Fitness';



--Many-to-Many: Students & Courses--
--not imp

--Tables & Sample Data--

CREATE TABLE studentss (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100)
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100)
);

CREATE TABLE student_courses (
  student_id INT,
  course_id INT,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES studentss(student_id),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Sample Mapping--

INSERT INTO studentss (student_id, student_name) VALUES
(1, 'Akarsh'),
(2, 'Simran'),
(3, 'Rohan');

INSERT INTO courses (course_id, course_name) VALUES
(101, 'Python'),
(102, 'SQL'),
(103, 'Power BI');


INSERT INTO student_courses (student_id, course_id) VALUES
(1, 101), -- Akarsh → Python
(1, 102), -- Akarsh → SQL
(2, 101), -- Simran → Python
(2, 103), -- Simran → Power BI
(3, 102); -- Rohan → SQL

Q1. Show student and course names

SELECT s.student_name, c.course_name
FROM student_courses sc
JOIN studentss s ON sc.student_id = s.student_id
JOIN courses c ON sc.course_id = c.course_id;

Q2. List all courses taken by 'Simran'

SELECT c.course_name
FROM student_courses sc
JOIN studentss s ON sc.student_id = s.student_id
JOIN courses c ON sc.course_id = c.course_id
WHERE s.student_name = 'Simran';


--View--

--View 1: Available Fitness Products

CREATE VIEW available_fitness_products AS
SELECT product_id, name, price, stock_quantity
FROM products
WHERE category = 'Fitness' AND is_available = TRUE;

select * from available_fitness_products;

--View 2: Low Stock Products

CREATE VIEW low_stock_products AS
SELECT name, category, stock_quantity
FROM products
WHERE stock_quantity < 30;

select * from low_stock_products;



--Add Product Procedure

CREATE PROCEDURE add_product(
    p_name VARCHAR,
    p_sku CHAR(8),
    p_price NUMERIC,
    p_qty INT,
    p_category TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO products(name, sku_code, price, stock_quantity, category)
    VALUES (p_name, p_sku, p_price, p_qty, p_category);

    RAISE NOTICE 'Product added successfully!';
END;
$$;

call add_product('box','123kkkhg',346.00,50000,'Home & Kitchen');

select * from products;

--------------END------------

