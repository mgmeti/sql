--LOWER(char) - Used to convert given data intoo lowercase.
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


-- UPPER(char) -> UPPER returns char, with all letters uppercase. (reutrns same datatype as given)
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


--LENGTH(char) --> The LENGTH functions return the length of char(number). 
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

--REVERSE(cahr type) --> used to reverse the given input
--Q1
select reverse(ename) as reverse, ename
from emp;

--Q2
select reverse('jspiders') "rvrsName" 
from dual;

--Q3
select reverse('malayalam') "Palindrome"
from dual;

--CONCAT(chartype1, chartype2) --> Used to merge given inputs
--Note concat operator (||) can be used in select clause.

select concat('Hi', ename)
from emp;

select 'Hi ' || ename ||' how are you?'
from emp;

select concat(concat('Hi ', ename),  ' how are you?')
from emp;

--Q1
select 'Hi ' || ename 
from emp;

--Q2
select 'Hi ' || ename || ' your designation is ' || job as employee_details
from emp;

--Q3
select 'Hi ' || ename || ' your salary is hiked upto 10% ' || (sal + sal * 0.1) as employee_salary_details
from emp;

--Note: Note that for both CHAR and VARCHAR2 columns, the trailing blanks are preserved.

--TRIM() --> used to remove specific/particular cahracter from the given string.
--syntax: trim(leading/trailing/both 'char' from string)

--Remove leading 'A' from ename.
select trim(leading 'A' from ename) "NO_A" from emp;

select trim('A' from 'AAAsapAAA') from dual;
TRI
---
sap

--Note:
--If you do not specify trim_character, 
-- then the default value is a blank space.

select trim (' ' from '   adada  ') from dual;

--If you specify only trim_source, then Oracle removes leading and trailing blank spaces.
select trim('   adada  ') from dual;

select trim(trailing 'P' from 'POP') from dual;
--> 'PO'

select trim(leading 'P' from 'POP') from dual;
--> 'OP'

select trim(both 'P' from 'POP') from dual;
--> 'O'

select trim( 'P' from 'POP') from dual;
--> 'O'

select trim(  ' POP ') from dual;
--> 'POP' //Removes all the whitespaces


--trims all of the left-most x's and y's from a string
SELECT LTRIM('xyxXxyLAST WORD','xy') "LTRIM example"
FROM DUAL;

LTRIM exampl
------------
XxyLAST WORD

--trims all the right-most occurrences of period, slash, and equal sign from a string:

SELECT RTRIM('BROWNING: ./=./=./=./=./=.=','/=.') "RTRIM example" FROM DUAL;
 
RTRIM exam
----------
BROWNING:

--REPLACE() --> REPLACE returns char with every occurrence of search_string replaced with replacement_string. 
select replace('Qspiders', 'Q', 'J') "Changes " from dual;
REPLACE
-------
Jspiders

select replace('Qspiders', 'Q') from dual;
REPLACE
-------
spiders

SELECT REPLACE('JACK and JUE','J','BL') "Changes"
      FROM DUAL;

select length('ADAMS') -length(replace('ADAMS', 'A')) "Number of A's"
from dual;

--REPLACE lets you substitute one string for another 
--as well as to remove character strings.

syntax: replace(main_string, search_String, replace_String);
--Note: if you do not specify the replace_string, then search string is removed from main(source) string.
--Q1
select name, replace(name, 'R', 'D') from emp;

--Q2
select ename, length(ename) -length(replace(ename, 'A')) "Number of A's"
from emp;

--Q3
select ename, job, replace(job, 'K', 'MMMM')
from emp;

--Q4
select ename, replace(ename, 'R') 
from emp where deptno in (10, 20);

--Q5
select length('ADAMS') -length(replace('ADAMS', 'A')) "Number of A's"
from dual;

--Q6
select ename, job, replace(job, 'D', 'Z') 
from emp where mgr in (7788, 7839);

--Q7
select ename, length(replace(translate(ename, 'AEIOU','99999'), '9')) "# of consonants" from emp;

--Q8
select ename, length(ename)-length(replace(translate(ename, 'AEIOU','99999'), '9')) "# of vowels" from emp;



--TRANSLATE
--It used to replace the given charcter in string, but it replace charcter by charcter.
select TRANSLATE('ADAMS', 'AEIOU', '_____') from dual;
TRANS
-----
_D_MS

select replace(TRANSLATE('ADAMS', 'AEIOU', '_____'), '_') from dual;

REP
---
DMS

select translate('ADAMS', 'AEIOU', '     ') "new name" from dual;


SQL> select length(translate('ADAMS', ' AEIOU', ' ')) "# of consonants" from  dual;

# of consonants
---------------
              3

select translate('ADAMS', ' '||translate('ADAMS', ' AEIOU', ' '),' ')  "vowels" from  dual;
-->AA

select translate('HELLO', ' '||translate('HELLO', ' AEIOU', ' '),' ')  "vowels" from  dual;
-->EO

select translate('HELLO RAJ', ' '||translate('HELLO RAJ', ' AEIOU', ' '),' ')  "vowels" from  dual;
-->EO A
select replace(translate('HELLO RAJ', ' '||translate('HELLO RAJ', ' AEIOU', ' '),' '), ' ')  "vowels" from  dual;
-->EOA
select replace(translate('HELLO RAJ', ' AEIOU', ' '),' ')  "consonants" from  dual;
-->HLLRJ

select translate(ename, ' '||translate(ename, 'AEIOU', ' '),' ')  "vowels" from  emp;



--To get count of consonants in employee names.
select ename, length(replace(TRANSLATE(ename, 'AEIOU', '_____'), '_')) "Number of Consonants" from emp;

SELECT LPAD('Page 1',15,'*.') "LPAD example"
       FROM DUAL;

LPAD example
---------------
*.*.*.*.*Page 1


SELECT RPAD('Page 1',15,'*.') "RPAD example"
       FROM DUAL;
RPAD example
---------------
Page 1*.*.*.*.*


--SUBSTR() -- Used to extract the part of the string from given string.
--syntax: substr(main string, starting index number, number of charcaters)

--Note: In sql index of string start from 1.

select substr('jspider', 1, 2) "Substring" from dual;
--> js

select substr('jspider', 3) from dual;
--> pider
-- If substring_length is omitted, then Oracle returns all characters to the end of string.

select substr('jspider', 4, 2) from dual;
--> id
select substr('jspider', 4.3, 2) from dual;
-->id
select substr('jspider', 4.9, 2) from dual;
-->id
select substr('jspider', 4.9, 1.9) from dual;
-->i
--Note: Floating-point numbers passed as arguments to SUBSTR are automatically converted to integers.

select substr('jspider', 6, 2) from dual;
--> er

-- If position is negative, then Oracle counts backward from the end of string.
--Here negative start index access the elements from right handside (-5, -4, -3, -2, -1 for spider respectively)
--Here positive sart index access the elements from left handside (1. 2, 3, 4, 5 for spider respectively)
--Here number characters will taken from start index to the right hand side of string.

select substr('jspider', -1, 2) from dual;
--> r
select substr('jspider', 0, 2) from dual;
-->js

select substr('jspider', -3, 2) from dual;
--> de

select substr('jspider', -2, 2) from dual;
-->er

select substr('jspider', -3, -2) from dual;
-- If substring_length is less than 1, then Oracle returns null.

select ename
from emp
where substr(ename, 1, 1) = 'A';

ENAME
----------
ALLEN
ADAMS


--Names ends with vowels
select ename
from emp
where substr(ename, -1, 1) in('A', 'E','I','O','U');

--Names starts with consonants
select ename
from emp
where substr(ename, 1, 1) not in('A', 'E','I','O','U');

--Names ends with consonants
select ename
from emp
where substr(ename, -1, 1) not in('A', 'E','I','O','U');

-- names with last third charcter is 'T'
select ename
from emp
where substr(ename, -3, 1) = 'T';
-->MARTIN

select ename
from emp
where substr(reverse(ename), 3, 1) = 'T';
--> MARTIN

--Q1
select ename, substr(ename, 1, 3)"FR3"
from emp;

--Q2
select ename, substr(ename, -4)"LS4"
from emp;

--Q3
select ename, job, substr(reverse(job), -3)"RLS3"
from emp;

--Q4
select ename, substr(ename, -2) "LS2"
from emp
where length(ename) =4;


--Q5
select substr(reverse('SUMAN'), 1,2) "NA" from dual;

--Q6
select substr(reverse('amruth'), 3,2) "ur" from dual;

--Q7
select ename, job
from emp
where substr(ename, -1) = 'R' and substr(job, -1) = 'K';

ENAME      JOB
---------- --------
MILLER     CLERK

--Q8
select ename, job
from emp
where substr(ename, -1) in ('A', 'R');

--Q9
select ename, job
from emp
where substr(ename, 1, 1) in ('A', 'S');

--Q10
--Names starts with vowels
select ename
from emp
where substr(ename, 1, 1) in('A', 'E','I','O','U');

--Q11
--Names starts with consonants
select ename
from emp
where substr(ename, 1, 1) not in('A', 'E','I','O','U');

--Q12
--Names ends with consonants
select ename
from emp
where substr(ename, -1) not in('A', 'E','I','O','U');

--Q13
--Names starts with consonants
select ename
from emp
where substr(ename, -1)  in('A', 'E','I','O','U') and deptno in (10, 20, 30, 40);


select substr('1010101', 1, 1) as F from dual;
--> 1

--get first half
select ename, length(ename) as "#ofchars", substr(ename, 1, length(ename)/2) "First-half" from emp;
-- get second half
select ename, length(ename) as "#ofchars", substr(ename,  length(ename)/2+1) "Second-half" from emp;