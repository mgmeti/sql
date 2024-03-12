--BETWEEN operator
--It used for range purose(To get values between two values for particular column)
--Syntax--> Column_name BETWEEN low_value and high_value
--Hired between year 81 and 85 and  also 87-88
select *
from emp
where hiredate between '01-jan-81' and '31-dec-85' or hiredate between '01-jan-87' and '31-dec-88';
--13 rows selected.

--Hired between year 80 and 85.
select *
from emp
where hiredate between '01-jan-80' and '31-dec-85'
--12 rows selected.

--Hired between year 80 and 85, except for the year 82
select *
from emp
where hiredate between '01-jan-80' and '31-dec-85' and hiredate not between '01-jan-82' and '31-dec-82';
--11 rows selected.

--Hired between year 80 and 87, except for the year 81 and 82
select *
from emp
where hiredate between '01-jan-80' and '31-dec-87' and  hiredate not between '01-jan-81' and '31-dec-82';
--3 rows selected.

--Q1
--Get employee's who has salary between 1000 to 4000;
select * 
from emp
where sal between 1000 and 4000;
--11 rows selected.

--Q2
--Display name, hiredate of employee's who hired in the year 80 to 85 as salesman.
select ename, hiredate
from emp
where hiredate between '01-jan-80' and '31-dec-85' and job = 'SALESMAN';
--4 rows selected.

--Q3
--Name, hiredate, salary and department for the employee's who has salary between 500 to 1000 as clerk or salesman 
--in department 10 or 20 hired from year 84 to 87.
select ename, hiredate, sal, deptno
from emp
where sal between 500 and 1000 and hiredate between '01-jan-84' and '31-dec-87' and job in ('CLERK', 'SALESMAN') and deptno in (10, 20);
--no rows selected

--NOT BETWEEN operator
-- It is opposite of between operator, instead of selecting the given range it will reject the values.
--Syntax--> Column_name not between low_value and high_value;

--Q1
--Get employee's details except who are earning salary of 900 to 2000;
select * 
from emp
where sal not between 900 and 2000;
--7 rows selected.

--Q2
--Employee's who is not hired in year 82.
select ename, hiredate
from emp
where  hiredate not between '01-jan-82' and '31-dec-82';
--13 rows selected.

--Q3
--Hired between year 81 and 85, except for the year 82
select ename, hiredate
from emp
where hiredate  between '01-jan-81' and '31-dec-85' and hiredate not between '01-jan-82' and '31-dec-82';
--10 rows selected.
