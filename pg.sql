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






