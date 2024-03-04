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

