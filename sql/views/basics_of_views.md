### VIEWS

A view is a virtual table or logical table based on other tables or views.

--> A view contains rows and columns, just like a real table, but it won't contains it own data.  instead, it retrieves the data from base table/view whenever the view is called.

--> It won't store the result of the query, instead stored the queries which you have written while creating view.

--> Syntax: create or replace view viem-name as select statement;

Example1: create or replace view v01 as select ename, job from emp;
Example2: create or replace view v02 as select sum(sal) as totalSal, deptno from emp group by deptno;


Note: When you give create or replace, it overrides the view which is already present in the database with same name.

there are two types of views:
        1. Simple view
        2. Complex view

Simple View: 
    if we create a view by using one or more than one table, and we can perform DML operation, that view will called as simple view.

--> No group functions involved in simple view.
--> Simple view will not contain distinct keyword or pseudocolumns.
--> we can perform DML operation.
--> It is also  known as updatable view.

Complex View:
    If we create a view by using one or more than one table joined but it can not perform DML operation.
--> Group frunction are allowed.
--> It can contain distinct or pseudocolumns.
--> We can not perform DML operation.
--> So, it is also known as non-updatable view.


Advantages of views:
    1. Data security (provide security layer by allowing user to access specific columns and rows by hiding sensitive information).
    2. Reuse of query logic (instead of duplicating complex queries accross multiple application or parts of an application, views promote us to reuse the query).
    3. Simplified querying (View allows for complex queries to be stored in single, so that accessing data is easy).
    4. Performance optimization (performance is good because of pre computed values).

What is materialized view: 
--> It is a database object that stores query output.
--> It cannot be refereshed automatically like a normal view, instead materialized view is upadated manually.
--> Materialized view responds faster than view as the materialized view is pre-computed.
--> Materialized view utilizes the memory space as it is stored on the disk whereas, the view is just a display hence it is not require memory space.

Syntax to create a Materialized View(user should have permission for the same):
connect
sys as sysdba
tiger

Syntax: grant create materialized view to user;
Example: grant create materialized view to scott;


--> create materialized view M-V-Name as select statement;
Example: create materialized view mv1 as select max(sal) from emp group by deptno;


To manually update:
    exacute dbms_mview.refresh('mv1');