select;
--Select commond
--Expression



--Operators
--Arithmatic --> +, -, *, /
select ename, sal, sal*1.1 as hike_salary
from emp;

select ename, sal, sal * 1.1 as hike_salary
from emp
where sal * 1.1 > 2000;

--Ralational operators --> <, >, <=, >=, !=, <>
--NULL can not be evaluated using relational operators 

-- Details of the employee who is getting salary more than 2000
select *
from emp
where sal > 2000;

--Display ename, sal, job of employee's except job clerk
select ename, sal, job
from emp
where job != 'CLERK';

select ename, sal, job
from emp
where job <> 'SALESMAN';


select ename, sal, job
from emp
where mgr <> 7839;

--Q1
select * 
from emp 
where sal > 3000;

--Q2
select * 
from emp 
where  sal < 1000;

--Q3
select * 
from emp 
where deptno <> 10;

--Q4
select * 
from emp 
where job <> 'ANALYST';

--Q5
select * 
from emp 
where mgr <> 7698;

--Q6
select * 
from emp 
where job = 'MANAGER';

--Q7
select * 
from emp 
where sal >= 3000;

--Q8
select emp.*, sal * 12 as Annaul_Salary
from emp 
where sal * 12 >= 36000;

--Q9
select ename,job,  deptno, sal
from emp
where job = 'MANAGER' and sal >2500;

-- Relational operators
select ename, job, sal
from emp
where sal > 1000 and sal < 3000 and job='ANALYST';

--ORDER OF EXECUTION --> FROM -> WHERE -> SELECT ( as of now)