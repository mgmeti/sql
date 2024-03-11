--Number function --> Used to perform operation based on numeric values.
--mod(m, n);
--MOD returns the remainder of m divided by n. Returns m if n is 0.
select mod(8, 2) from dual;
--0

select mod(7, 2) from dual;
--1

--Q1
select ename, job
from emp
where mod(empno,  2) = 0;
--10 rows selected.

--Q2
select ename, job
from emp
where mod(empno,  2) != 0;
--4 rows selected.

-Q3
select ename, mgr, job
from emp
where mod(mgr,  2) != 0;
--3 rows selected.

--Q4
select ename, job
from emp
where mod(deptno,  2) != 0;
-- 0 rows selected

--Q5
select ename
from emp
where mod(length(ename),  2) = 0;
--6 rows selected.


--round() := Used to round off the given value
--round(number)
--round(number, #of decimals)
-- If # of decimals is positive --> left to right starting from '.'
-- If # of decimals is negative --> right to left starting from '.'
--if the value is the range of 0 - 4 --> it gives actual integer value
-- for example, to x+1 when x.0 to x.4 is positive 
-- if the value is the range of 5-9 --> it gives next integer
-- for example, to x+1 when x.5 to x.9 is positive 

select round(25.3) from dual;
--25

select round(25.5) from dual;
--26

select round(25.46) from dual;
--25

select round(123456.6012, 0) from dual;
--123457

select round(123456.6012, 1) from dual;
--123456.6

select round(123456.789, 2) from dual;
--123456.79

--rounding with negative index from decimal point

select round(12354.78, -1) from dual;
--12350

select round(12354.78, -2) from dual;
--12400

select round(12354.78, -3) from dual;
--12000

select round(12354.78, -4) from dual;
--10000

select round(16354.78, -4) from dual;
--20000

select round(16354.78, -5) from dual;
--0

select round(16354.78, -6) from dual;
--0

select round(-2.56) from dual;
--(-3)
select round(-2.56, 1) from dual;
-- (-2.6)
select round(-2.5689, 2) from dual;
--(-2.57)
select round(-2.36) from dual;
--(-2)

SELECT ROUND(15.193,-1) "Round" FROM DUAL;
--20
SELECT ROUND(1.5), ROUND(2.5) FROM DUAL;
-- 2, 3
SELECT ROUND(1.5f), ROUND(2.5f) FROM DUAL;
--  2.0E+00, 2.0E+000
SELECT ROUND(3.5f), ROUND(3.2f) FROM DUAL;
-- 4.0E+000, 3.0E+000


--trunc() -- used to remove/truncate the decimal value
--trunc(arg1)
--trunc(arg1, arg2)
select trunc(25.5) from dual;
--25
select trunc(25.556, 1) from dual;
--25.5
select trunc(25.568, 2) from dual;
--25.56

select trunc(12345.5) from dual;
--12345
select trunc(12345.5, -1) from dual;
--12340
select trunc(12345.5, -2) from dual;
--12300
select trunc(12345.5, -3) from dual;
--12000

SELECT TRUNC(15.79,1) "Truncate" FROM DUAL;
--15.7
SELECT TRUNC(15.79,-1) "Truncate" FROM DUAL;
--10