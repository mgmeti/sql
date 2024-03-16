/*
special function: 
1) general single row function[srf] :- nvl, nvl2
    (NVL stands for null value)

nvl() -> used to replace a value of null
used to overcome the drawback null values.
--nvl(arg1, arg2)   
If arg1 is null, then NVL returns arg2. If arg1 is not null, then NVL returns arg1. 

*/
select nvl(null, 1) from dual;
-- 1

select nvl(null, 0) from dual;
-- 0

select nvl(null, 'A') from dual;
-- 'A'

-- get commission column with commission not applicable for the employee who do not get commission.
select ename, sal, nvl(to_char(comm), 'Not Applicable') "COMMISSION"
from emp;

--Q1
select ename, sal, sal + nvl(comm, 0) as total_salary
from emp;

--Q2
-- employee's who dont have reporting  manager assigned
select ename
from emp
where nvl(mgr, 0) = 0;

/*
nvl2() --> used to overcome the drawback of null values
nvl2(arg1, arg2, arg3)
NVL2 lets you determine the value returned by a query based on whether a specified expression is null or not null.
 If arg1 is not null, then NVL2 returns arg2. 
 If arg1 is null, then NVL2 returns arg3.
*/


select ename, sal, comm, nvl2(comm, sal+comm, sal) as total_salary 
from emp;

--Q1
select ename, comm, nvl2(comm, 'Earn commission', 'No commission') as commission 
from emp;


/*
2) conversion function --> SRF

to_char() --> used to convert date type to date string
syntax: to_char(arg1, arg2)
arg1 - date
arg2 - date format

*/

--sunday - 1
--saturday - 7
select to_char(current_date, 'd') from dual;
--6 (friday)
select to_char(current_date, 'dd') from dual;
--15
select to_char(current_date, 'dy') from dual;
--fri
select to_char(current_date, 'day') from dual;
--friday

select to_char(current_date, 'mm') from dual;
--03

select to_char(current_date, 'mon') from dual;
--MAR

select to_char(current_date, 'MONTH') from dual;
--MARCH

select to_char(current_date, 'month') from dual;
--march
--Note: arg2 is case sensitive - it return based on arg2 


select to_char(current_date, 'y') from dual;
--4
select to_char(current_date, 'yy') from dual;
--24

select to_char(current_date, 'yyy') from dual;
--024

select to_char(current_date, 'yyyy') from dual;
--2024

select to_char(current_date, 'year') from dual;
--twenty twenty-four

select to_char(current_date, 'HH12') from dual;
--06

select to_char(current_date, 'HH24') from dual;
--18

select to_char(current_date, 'MI') from dual;
--04


select to_char(current_date, 'SS') from dual;
--28


select to_char(current_date, 'mm-dd-yyyy') "MM-DD-YYYY" from dual;
select to_char(current_date, 'dd-mm-yyyy') "DD-MM-YYYY" from dual;
select to_char(current_date, 'yyyy-mm-dd') "YYYY-MM-DD" from dual;


select ename, to_char(hiredate, 'DAY') "HIREDAY" from emp;
--gives results for day's with whitespace as padding to have uniform string length of larger day string
--It will same thing forthe month's also
select ename, to_char(hiredate,'MONTH') "HIREMONTH", length( to_char(hiredate,'MONTH')) from emp;

select ename, to_char(hiredate,'FMMONTH') "HIREMONTH", length( to_char(hiredate,'FMMONTH')) from emp;
--Note: We use FM{MONTH | DAY} to remove trailing space of returned string.


select ename, hiredate
from emp
where to_char(hiredate, 'DAY') in ('WEDNESDAY');
--1 row selected


select ename, hiredate
from emp
where to_char(hiredate, 'day') in ('WEDNESDAY');
--0 row selected 

-- Note: to_char() is case sensitive

select to_char(date '2002-02-24', 'DAY') from dual;


select ename, hiredate
from emp
where to_char(hiredate, 'MON') ='FEB';
--2 row selected 


select ename, hiredate
from emp
where to_char(hiredate, 'dd-mon') ='20-feb';
--1 row selected


