
/*
MRF ()
It takes n number of inputs and then executes and produces one single output per group.

MRF's can not be written in where clause.
MRF's can be written in select,order by and having clauses.
Along with MRF's we can not include anyother column name in select without using it in group by clause.
MRF's ignore's null values of mentioned column.
count() is the only function which takes * as an argument.
max, min, avg, sum, count
*/
select max(sal), min(sal), median(sal), sum(sal), avg(sal), count(sal) 
from emp;

select deptno, max(sal)
from emp
group by deptno;

select max(ename), min(ename)
from emp;
MAX(ENAME) MIN(ENAME)
---------- ----------
WARD       ADAMS

--Q1
select max(sal) 
from emp;

--Q2
select max(sal) 
from emp
where job = 'SALESMAN';

--Q3
select max(sal) 
from emp
where deptno=10 and (ename like 'A%' or ename like 'S%');

--Q4
select max(sal) 
from emp
where job ='CLERK' and deptno in (10, 20, 30);

--Q5
select max(sal) 
from emp
where job='MANAGER' and deptno in (10, 30) and instr(translate(ename, 'AEIOU', '-----'), '-', 1) != 0;
--Q6
select max(sal) 
from emp
where deptno=30 and job in ('CLERK', 'MANAGER') and substr(reverse(ename), 1, 1) ='K';

--Q7
select max(sal) 
from emp
where job = 'PRESIDENT' and
        (sal * 12) > 10000 and 
        deptno in (10, 20) and 
        mgr is null and 
        substr(ename, 1, 1) not in ('A', 'E', 'I', 'O', 'U') and 
        (sal between 1000 and 5000) and 
        length(ename) = 4 and
        to_char(hiredate, 'MON') like '__V' and 
        substr(ename, 1, 1) != substr(job, 1, 1) and
        mod(empno, 2) != 0 and
        round(months_between(current_date , hiredate)/12) > 40 ;

