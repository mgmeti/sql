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
--AND--> used to combine multiple conditions in where clause

--Q1
select ename, sal, deptno
from emp
where sal > 2000 and deptno = 10;

--Q2
select *
from emp
where empno = 7902 and job='SALESMAN';

--Q3
select ename, mgr, comm
from emp
where mgr = 7839 and comm > 300;

--Q4
select ename, hiredate, deptno
from emp
where deptno = 20 and hiredate = '03-DEC-81';

--Q5
select ename, job, deptno 
from emp
where deptno = 20 and job = 'ANALYST';

--Q6
select *
from emp
where sal > 1000 and sal < 3000 and job='ANALYST';

--Q7
select ename
from emp
where empno=7788 and job<>'MANAGER' and job<>'CLERK';

--OR --> 
select * 
from emp
where job='MANAGER' or job='CLERK';

select ename
from emp
where (job='MANAGER' and deptno=30) or (job='CLERK' and deptno=10);

select * 
from emp
where deptno = 20 or deptno=30;

select *
from emp
where ename='SMITH' or ename='SCOTT' or ename='ADAMS' or ename='FORD';






--ORDER OF EXECUTION --> FROM -> WHERE -> SELECT ( as of now)