--ADD_MONTHS returns the date date plus integer months. 
-- after one day
select ADD_MONTHS('28-feb-2023', 1)  from dual;

--After 5 years
select ADD_MONTHS(current_date,5*12)  from dual;
ADD_MONTH
---------
13-MAR-29

select systimestamp from dual;
--current_date = 13-03-2024
select current_date - 13 from dual;
CURRENT_D
---------
29-FEB-24
select current_date - 12 from dual;
CURRENT_D
---------
01-MAR-24


select ADD_MONTHS(current_date - 13, -3)  from dual;
ADD_MONTH
---------
30-NOV-23

select ADD_MONTHS(current_date -12, -3)  from dual;
ADD_MONTH
---------
01-DEC-23

select ADD_MONTHS(current_date -12, -3)  from dual;
select ADD_MONTHS(current_date , -3)  from dual;
ADD_MONTH
---------
13-DEC-23

--Q1
select current_date  from dual;

--Q2
select sysdate from dual;

--Q3
select current_date + 10 from dual;

--Q4
select systimestamp from dual;


--ADD_MONTHS(arg1, arg2)
--ADD_MONTHS(date, # of months)
select *
from emp
where hiredate < ADD_MONTHS(current_date, -3);

select *
from emp
where hiredate > ADD_MONTHS(current_date -12, -3);


--Q1
select ename, hiredate, ADD_MONTHS(hiredate, 12)
from emp;

--Q2
-- current date After 5 years
select ADD_MONTHS(current_date,5 * 12)  from dual;

--Q3
--After 2 years column
select ename, hiredate,job,  ADD_MONTHS(hiredate, 2 * 12)
from emp;

--Q4
--Before 3 years column
select ename, hiredate,job,  ADD_MONTHS(hiredate, -3 * 12)
from emp;

--Q5
--Before 3 months
select ename
from emp
where hiredate < ADD_MONTHS('01'||substr(current_date, 3), -3)  ;

select ename
from emp
where hiredate < trunc(ADD_MONTHS(current_date, -3), 'MON');

--Q6
--After 3 months
select ename
from emp
where hiredate >= ADD_MONTHS('01'||substr(current_date, 3), -3)  ;

select ename
from emp
where hiredate >= trunc(ADD_MONTHS(current_date, -3), 'MON');

select substr(current_date, 3)  from dual;
select '01'||substr(current_date, 3)  from dual;
select ADD_MONTHS('01'||substr(current_date, 3), 1)  from dual;

select ADD_MONTHS('01'||substr(current_date, 3), -1)  from dual;
select ADD_MONTHS('01'||substr(current_date, 3), -3)  from dual;


--trunc(date, 'mon') -- will give first day of the month
--trunc(date, 'yy') -- will give first day of the year
--trunc(date, 'dd') -- will give same day with 12 am

select trunc(current_date, 'MON') "1dayMon" from dual; 
select trunc(current_date, 'MM') "1dayMon"  from dual; 

select trunc(current_date, 'YEAR') "1dayYear"  from dual; 
select trunc(current_date, 'YY') "1dayYear"   from dual; 
select trunc(current_date, 'Y') "1dayYear"   from dual; 

select trunc(current_date, 'DD') "samedayAM" from dual; 
select to_char(trunc(current_date, 'DD'), 'dd:mon: yyyy hh12:mi:ss') "1dayMon"  from dual; 
select to_char(trunc(current_date, 'DD'), 'hh24:mi:ss') "1dayMon"  from dual; 


--MONTHS_BETWEEN returns number of months between dates date1 and date2.

 
