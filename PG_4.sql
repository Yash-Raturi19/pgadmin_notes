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

