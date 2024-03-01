--Special Operators
--IS
--It id used to evaluate null values
--Syntax--> column_name IS NULL;
--Used to evaluate NULL values inside the specific column.

--Employee who does not get commision and not assigned manager
select * 
from emp
where comm is null and mgr is null;

--Q1
--Employee who does not have manager assigned
select * 
from emp
where mgr is null;

--Q2
--Employee who does not get commision 
select * 
from emp
where comm is null;

--Q3
--Employee's who are not working in any department.
select *
from emp
where deptno is null;

--Q4
--Employee's except employee who works as clerk also except salesman and employee's do not earn any commission
select *
from emp
where job!='CLERK' and not job='SALESMAN' and comm is null;




--IS NOT NULL
--Syntax--> column_name IS NOT NULL;
--Works in some department
 select *
 from emp
 where deptno is not null;


--all employee who get some salary
select *
from emp
where sal is not null;

--Employee's who have manager
select *
from emp
where mgr is not null;

--Employee's who do not get commision and works iin department and gets salary
select *
from emp
where deptno is not null and sal is not null and comm is null;



