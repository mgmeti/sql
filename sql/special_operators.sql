--Special Operators
--IS
--It id used to evaluate null values
--Syntax--> column_name IS NULL;

--Employee who does not have manager assigned
select * 
from emp
where mgr is null;

--Employee who does not get commision 
select * 
from emp
where comm is null;

--Employee who does not get commision and not assigned manager
select * 
from emp
where comm is null and mgr is null;

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

select *
from emp
where deptno is not null and sal is not null and comm is null;


