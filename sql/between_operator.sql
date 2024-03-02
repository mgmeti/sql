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

