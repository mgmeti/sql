--LIKE
--It used for pattern matching
--Syntax--> column_name LIKE 'pattern';
--Note --> Pattern is case sensitive i.e '%M%' and '%m%' are different patterns.

select *
from emp
where ename like 'M%';
--2 rows selected

select *
from emp
where ename like '%m%';
--0 rows selected

select *
from emp
where ename like '%LL%';
--2 rows selected

select *
from emp
where job like '%MAN';
--3 rows selected.


select *
from emp
where hiredate like '%81';
--10 rows selected.

select *
from emp
where mgr like '%98';
--5 rows selected.

--Name starts with A
select *
from emp
where ename like 'A%';

--Name ends with N
select *
from emp
where ename like '%N';

--Name with exact 5 characters
select *
from emp
where ename like '_____';
--8 rows selected.

--sample table to understand escape character for '%' and '_'
select * from sts;

   ID EMAIL
----- ---------------
    1 a_12@gmail.com
    2 a%12@gmail.com
    4 _a%@gmail.com

select * from sts
where email like '%\_%' escape '\';
 ID EMAIL
--- ---------------
  1 a_12@gmail.com
  4 _a%@gmail.com

select * from sts
where email like '%\%%' escape '\';

 ID EMAIL
--- ---------------
  2 a%12@gmail.com
  4 _a%@gmail.com

select * from sts
where email like '_\%%' escape '\';
  ID EMAIL
---- ---------------
   2 a%12@gmail.com


select * from sts
where email like '%\%%\_%' escape '\';
--NO rows selected


select * from sts
where email like '%\_%\%%' escape '\';
    ID EMAIL
------ ---------------
     4 _a%@gmail.com

--Practice Questions on like operator.
--Q1
select ename
from emp
where ename like 'A%';
--2 rows selected.

--Q2
select ename
from emp
where ename like 'S%';
--2 rows selected.

--Q3
select ename
from emp
where (ename like 'A%' or ename like 'M%') and deptno in (10, 30);
--3 rows selected.

--Q4
select ename
from emp
where ename like 'A%M';
--no rows selected

--Q5
select ename
from emp
where ename like '%A%';
--7 rows selected.

--Q6
select ename
from emp
where ename like '%A%A%' and hiredate like '%FEB%';
--no rows selected

--Q7
select ename, sal
from emp
where ename like '____' and sal like '____';
--3 rows selected

--Q8
select ename, sal
from emp
where ename like '%E_' and sal like '%0';
--4 rows selected

--Q9
select ename
from emp
where ename like '%LL%' and sal between 2000 and 4000;
--no rows selected

--Q10
select ename
from emp
where ename like '__M%' and deptno in (1, 40);
--no rows selected

--Q11
select ename, hiredate
from emp
where hiredate like '%FEB%';
--2 rows selected

--Q12
select ename, hiredate
from emp
where hiredate like '%81';
--10 rows selected.

--Q13
select ename, job
from emp
where ename like 'A%' and job like 'S%';
--1 rows selected.

--Q14
select *
from emp
where ename like 'A%' or ename like 'E%' or ename like 'I%' or ename like 'O%' or ename like 'U%' ;
--2 rows selected.

--Q15
select *
from emp
where ename like '%A' or ename like '%E' or ename like '%I' or ename like '%O' or ename like '%U' ;
--1 rows selected.

--Q16
select ename
from emp
where ename like '%@%';
--0 rows selected.

--Q17
select ename
from emp
where ename like '%\_%' escape '\';
--0 rows selected.

--Q18
select ename
from emp
where ename like '%\%%' escape '\';
--0 rows selected.

--Q19
select ename
from emp
where ename like  '\_%' escape '\';
--0 rows selected.

--Q20
select ename
from emp
where ename like '%\%' escape '\';
--0 rows selected.





