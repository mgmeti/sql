/*
A subquery in the WHERE clause of a SELECT statement is also called a nested subquery.
A subquery in the FROM clause of a SELECT statement is also called an inline view.
*/

--Single row subsquery

--Q7
select ename, sal, deptno
from scott.emp
where sal = (select sal 
                from scott.emp
                where ename='SCOTT') and deptno in (10, 20)
                and substr(ename, 1, 1) in ('A', 'E', 'I', 'O', 'U');

--Q8
select *
from scott.emp
where ename like 'A%' and
        deptno = (select deptno from scott.emp where ename = 'BLAKE');


--Q9
select ename, hiredate
from scott.emp
where hiredate > '31-DEC-80' and hiredate <(
    select hiredate from scott.emp where ename='KING');


--Q10
select ename
from scott.emp
where sal > (select sal 
                from scott.emp 
                where ename = 'MILLER');

--Q11
select ename, sal *12 "AnnualSal", job "Designation"
from scott.emp
where (sal*12) > (select sal * 12
                    from scott.emp
                    where ename='SMITH');

--Q12
select ename
from scott.emp
where sal > (select round(avg(sal))
                from scott.emp);

--Q13
select ename
from scott.emp
where sal != (select sal 
                from scott.emp 
                where ename = 'SCOTT');

--Q14
select ename
from scott.emp
where sal >= (select sal 
                from scott.emp 
                where ename = 'ALLEN');
--Q15
select ename
from scott.emp
where sal <= (select sal 
                from scott.emp 
                where ename = 'MILLER');

--Q
select ename
from scott.emp
where sal > (select sal from scott.emp where ename='MILLER')
        and sal <  (select sal from scott.emp where ename='ALLEN');

select deptno, round(avg(sal))
from scott.emp
group by deptno
having avg(sal) > (select round(avg(sal)) from scott.emp);


--CASE 2
--Display the data from one table, condition from another table
 