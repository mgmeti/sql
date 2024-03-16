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
--d --> 1,2,3.....(sunday - 1, monday - 2, teausday - 3, wednesday - 4, thursday - 5, friday - 6, saturday - 7 )
--6 (friday)
select to_char(current_date, 'dd') from dual;
--dd  --> date of day in numeric
--15
select to_char(current_date, 'dy') from dual;
--dy --> first  3 letters of day name.
--fri
select to_char(current_date, 'day') from dual;
-- day --> complete details of day
--friday

select to_char(current_date, 'mm') from dual;
--mm --> 01, 02, 03 .... (january - 01,   ..... december - 12)
--03

select to_char(current_date, 'mon') from dual;
--mon --> first 3 letters of month name.
--mar

select to_char(current_date, 'MONTH') from dual;
-- MONTH --> full name of the months(uppercase)
--MARCH

select to_char(current_date, 'month') from dual;
--march --> full name of the months(lowercase)
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
--HH12 --> 12 hours format
--06

select to_char(current_date, 'HH24') from dual;
--HH24  --> 24 hours format
--18

select to_char(current_date, 'MI') from dual;
--MI --> returns minutes
--04

select to_char(current_date, 'SS') from dual;
--SS  --> returns seconds
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

--Q1
select to_char(current_date, 'DAY') "DAY"
from dual;

--Q2
select ename, hiredate, to_char(hiredate, 'DAY') "HIREDAY" from emp; --day's with same length 
select ename, hiredate, to_char(hiredate, 'FMDAY') "HIREDAY" from emp; -- day's with different length

--Q3 employee's who hired on thursday.
select ename, hiredate
from emp
where to_char(hiredate, 'DY') = 'THU';

--Q4 employee's who hired on december.
select ename, hiredate
from emp
where to_char(hiredate, 'mm') = 12;

--Q5 employee's who hired on 20th.
select ename, hiredate
from emp
where to_char(hiredate, 'dd') = 20;

--Q6 employee's who has vowel in 4rth place when their month of hired was reversed.
select ename, hiredate, to_char(hiredate, 'FMMONTH') "MONTHOFHIRE"
from emp
where substr(reverse(to_char(hiredate, 'FMMONTH')), 4, 1) in ('A', 'E', 'I', 'O', 'U');

--Q7 employee's who's  the month of 3rd charcter is same as their day 3rd charcter.
select ename, hiredate
from emp
where substr(to_char(hiredate, 'FMMONTH'), 3, 1) = substr(to_char(hiredate, 'FMDAY'), 3, 1);

--Q8 employee's who hired in year nineteen eighty.
select ename, hiredate, to_char(hiredate, 'fmyear') "YEAR"
from emp
where to_char(hiredate, 'fmyear') = 'nineteen eighty';

select ename, hiredate, to_char(hiredate, 'fmyear') "YEAR"
from emp
where to_char(hiredate, 'year') = 'nineteen eighty-seven';

select ename, hiredate, to_char(hiredate, 'fmyear') "YEAR", length(to_char(hiredate, 'year'))
from emp;
--Note: fm is optional for year formation.

--to_date() function
-- It is used to convert date string to date type
select to_date('11MARCH2024', 'dd-mm-yyyy') from dual;
select to_date('20241603', 'yyyyddmm') from dual;

select to_date('16032024', 'ddmmyyyy') from dual;

