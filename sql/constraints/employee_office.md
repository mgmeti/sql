Author: Arjun

Independent tables -> The tables which does not have FK 

Create a table department with id and name.
```sql
create table department
(
dept_id number(2) primary key,
name varchar2(25)
);
```
Create a table insurance with id, name
```sql
 create table insurance(
 insur_id number(5) primary key,
 name varchar2(25)
 );
```
Create a table office with id, name
```sql
create table office(
id number(3) primary key,
name varchar2(25)
);
```

Dependent tables -> The tables does have FK
Create a table with id, name, age, gender, department_id, insurance_id attributes of table.
```sql
create table employee
(
emp_id number(3) primary key,
name varchar2(25),
age number(2),
gender char(1),
dept_id number(2),
insur_id number(5),
foreign key(dept_id) references department(dept_id),
foreign key(insur_id) references insurance(insur_id)
);
```

Create a table employee_office with id, employee_id, office_id as it's attributes.
```sql
create table employee_office(
id number(3) primary key,
emp_id number(3),
office_id number(3),
foreign key(emp_id) references employee(emp_id),
foreign key(office_id) references office(id)
);
```