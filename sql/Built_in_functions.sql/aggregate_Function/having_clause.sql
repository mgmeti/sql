/*
having clause
1. It is used to filter the groups generated by group by clause
2. Executes after the group by  clause
3. MRF conndition's can be written having clause

Difference between Where and Having clause's
Where - Filter records
      - where clause executes row by row
      - written before group by clause
      - Group by clause not needed
      - MRF condition can not be used in where clause.
      - where clause is implemented on rows.

Having - Filter groups
       - having clause executes group by group
       - written after group by clause
       - Group by is must to use having clause
       - MRF condition can  be used in having clause.
       - having clause is implemented on columns.

Syntax:
        select gf/group by expression -->5 (group by group)
        from table_name    --> 1
        where <condition>  --> (row by row)
        group by expression   -->3
        having <condition>;    -->4 group by group

The HAVING condition cannot contain a scalar subquery expression.

*/
--Display number of employees working? in each department,
--if atleast 2 employees wroking in each department.

select deptno, count(ename)   -- 4
from emp   -- 1
group by deptno  -- 2
having count(ename) >= 2;  -- 3

--Display highest salary given to each department,
--if the employee's are working in department 20 or 30,
--also the highest salary of each department should be more than 1000

select deptno, max(sal)  -- 5
from emp   -- 1
where deptno in (20, 30) -- 2
group by deptno -- 3
having max(sal) > 1000; -- 4

--Display the salary that is repeated.
select sal, count(sal)  -- 4
from emp    -- 1
group by sal  -- 2
having count(sal) >= 2;  -- 3


--Display the names that is repeated.
select ename, count(ename)  
from emp    
group by ename  
having count(ename) >= 2;  

--Display department, salary where the employee earnig same salary in same department.
select deptno, sal
from emp
group by sal, deptno
having count(*) > 1;

-- Job's which has atleast 3 employees
select job, count(ename)"# employees"
from emp
group by job
having count(ename) >= 3;

--Departments which has atleast 5 employees
select deptno, count(ename)"# employees"
from emp
group by deptno
having count(ename) >= 5;

--Display department if it has atleast 2 manager's.
select deptno
from emp
where job = 'MANAGER'
group by deptno
having count(job) >= 2;

select max(sal), min(sal), avg(sal)
from emp
group by deptno
having min(sal) < avg(sal);

select max(sal), min(sal), avg(sal)
from emp
group by deptno
having min(sal) < avg(sal);

select max(ename), min(ename), count(*)
from emp
group by deptno
having count(*)>1;

--Q1
select deptno, count(ename)
from emp
group by deptno
having count(ename) >=2;

--Q2
select job, count(ename)
from emp
group by job
having count(ename) >=3;

--Q3
--Display the salary that is repeated.
select sal, count(sal)  
from emp    
group by sal  
having count(sal) >= 2;  

--Q4
--Display the names that is repeated.
select ename, count(ename)  
from emp    
group by ename  
having count(ename) >= 2; 

--Q5
select deptno, count(ename)
from emp
where job = 'CLERK'
group by deptno
having count(job) >=2;

--Q6
select deptno, sum(sal)
from emp
group by deptno
having count(ename) >= 4;

--Q7
select job, count(ename), sum(sal)
from emp
where sal > 1200
group by job
having sum(sal) >3800 ;

--Q8
select deptno, count(ename)
from emp
where job = 'ANALYST'
group by deptno
having count(ename) >=2;

--Q9
select job, min(sal), max(sal)
from emp
group by job
having min(sal) > 1000 and max(sal) < 5000;

--Q10
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) > 3000 and max(sal) > 2600;


--Q11
select hiredate
from emp
group by hiredate
having count(hiredate) >= 2;


























