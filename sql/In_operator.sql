--IN operator
--Used to evaluate multiple values in a specified column
--It selects the data/values given in RHS
--LHS takes only one argument and RHS takes multiple values
--Syntax--> column_name in (value1, value2....);

--Q1
--Employee' working in department in 10 or 20.
select *
from emp
where deptno in (20, 10);
--8 rows selected.

--Q2
--Employee's with name smith, allen, or martin.
select ename, sal
from emp
where ename in ('SMITH', 'ALLEN', 'MARTIN');
--3 rows selected.

--Q3
--Employee earning more than 2000 and less than 5000. as analyst or manager in department 20 or 30 and also hired afer year 81.
select *
from  emp
where sal > 2000 and sal < 5000 and job in ('ANALYST', 'MANAGER') and deptno in (20, 30) and hiredate > '31-dec-81';
--1 rows selected.

--Q4
select ename, deptno
from emp
where deptno in (10, 20, 30, 40, 50);
--14 rows selected.

--NOT IN operator
--Used to evaluate multiple values in a specified column
--It will selects the data/values given in RHS
--LHS takes only one argument and RHS takes multiple values
--Syntax--> column_name not in (value1, value2....);

select ename, job, sal, deptno
from emp
where deptno in (10, 20) and empno not in (3, 4);


--Q3
select ename, sal, deptno, job
from emp
where job not in ('CLERK', 'SALESMAN') and deptno not in (10, 30);
--3 rows selected.

--Q4
select *
from emp
where comm is null and deptno is not null and job in ('CLERK', 'SALESMAN') and deptno not in (20, 30);
--1 rows selected.
