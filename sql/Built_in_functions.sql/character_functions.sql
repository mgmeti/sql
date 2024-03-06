--lower(char) - Used to convert given data intoo lowercase.
SELECT LOWER('MR. SCOTT MCMILLAN') "Lowercase"
   FROM DUAL;

Lowercase
------------------
mr. scott mcmillan

--Q1
select lower(ename) as Names
from emp;

--Q2
select lower('jspiders') as Lowercase
from dual;

--Q3
select ename
from emp
where lower(ename) = 'smith';


-- upper(char) -> UPPER returns char, with all letters uppercase. (reutrns same datatype as given)
SELECT UPPER('Large') "Uppercase"
   FROM DUAL;

--Q1
select upper(ename) as Names
from emp;

--Q2
select upper(ename) as Names, upper(job) as job
from emp;

--Q3
select upper('jspydersbtm') "UpperCase" from dual;

UpperCase
-----------
JSPYDERSBTM

--INITCAP(char) - INITCAP returns char, with the first letter of each word in uppercase, all other letters in lowercase.

select initcap(' e SALa cup nAMDE') as Name FROM DUAL;

NAME
-----------------
 E Sala Cup Namde


--length(char) --> The LENGTH functions return the length of char. 
select ename
From emp
where length(ename) = 4;

--Q1
select ename,length(ename) "Length in charcters" 
from emp;
--14 rows selected.

--Q2
select ename
From emp
where length(ename) = 5;
--8 rows selected.

--Q3
select ename, length(ename) as "Length in charcters"
from emp
where ename in ('ALLEN', 'WARD');

--Q4
select ename, length(ename) as "Length in charcters"
from emp
where length(ename) in (4, 5);

--reverse(cahr type) --> used to reverse the given input
--Q1
select reverse(ename) as reverse, ename
from emp;

--Q2
select reverse('jspiders') "rvrsName" 
from dual;

--Q3
select reverse('malayalam') "Palindrome"
from dual;

--concat(c)