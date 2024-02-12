--Author: Arjun
--Date: 12-02-2024


--Independent tables -> The tables which does not have FK 

create table department(
dept_id number(2) primary key,
name varchar2(25)
);

 create table insurance(
 insur_id number(5) primary key,
 name varchar2(25)
 );

create table office(
id number(3) primary key,
name varchar2(25)
);


--Dependent tables -> The tables does have FK
create table employee(
emp_id number(3) primary key,
name varchar2(25),
age number(2),
gender char(1),
dept_id number(2),
insur_id number(5),
foreign key(dept_id) references department(dept_id),
foreign key(insur_id) references insurance(insur_id)
);

create table employee_office(
id number(3) primary key,
emp_id number(3),
office_id number(3),
foreign key(emp_id) references employee(emp_id),
foreign key(office_id) references office(id)
);
