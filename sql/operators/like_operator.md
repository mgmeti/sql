### LIKE
It used for pattern matching
Syntax--> column_name LIKE 'pattern';
Note --> Pattern is case sensitive i.e '%M%' and '%m%' are different patterns.

Employee names starts wtih "M".
```sql
select *
from emp
where ename like 'M%';
```
2 rows selected

Employee names starts wtih "m".
```sql
select *
from emp
where ename like '%m%';
```
0 rows selected
Employees names which contain  "LL".
```sql
select *
from emp
where ename like '%LL%';
```
2 rows selected
Job which are ends with "MAN".
```sql
select *
from emp
where job like '%MAN';
```
3 rows selected.

Employees who hired in the year of 81.
```sql
select *
from emp
where hiredate like '%81';
```
10 rows selected.

Employees who hired in the year of 98.
```sql
select *
from emp
where mgr like '%98';
```
5 rows selected.

Name starts with A
```sql
select *
from emp
where ename like 'A%';
```
Name ends with N
```sql
select *
from emp
where ename like '%N';
```

Name with exact 5 characters
```sql
select *
from emp
where ename like '_____';
```
8 rows selected.
##### Note
sample table to understand escape character for '%' and '_'
'_' underscore try match exaclty onle letter.
'%' it try match one or more number of letters
'\anycharcter' will be used match the anycharcter in given string.
'\' used to escape the special charcter meaning while using it in like operator.
```sql
select * from sts;
```
   ID EMAIL
----- ---------------
    1 a_12@gmail.com
    2 a%12@gmail.com
    4 _a%@gmail.com
```sql
select * 
from sts
where email like '%\_%' escape '\';
```
 ID EMAIL
--- ---------------
  1 a_12@gmail.com
  4 _a%@gmail.com
```sql
select * 
from sts
where email like '%\%%' escape '\';
```

 ID EMAIL
--- ---------------
  2 a%12@gmail.com
  4 _a%@gmail.com
```sql
select * 
from sts
where email like '_\%%' escape '\';
```
  ID EMAIL
---- ---------------
   2 a%12@gmail.com

```sql
select * from sts
where email like '%\%%\_%' escape '\';
```
NO rows selected
```sql
select * from sts
where email like '%\_%\%%' escape '\';
```
    ID EMAIL
------ ---------------
     4 _a%@gmail.com

##### Practice Questions on like operator.
Q1
Names starts with "A"
```sql
select ename
from emp
where ename like 'A%';
```
2 rows selected.

Q2
Names starts with "S"
```sql
select ename
from emp
where ename like 'S%';
```
2 rows selected.

Q3
```sql
select ename
from emp
where (ename like 'A%' or ename like 'M%') 
and deptno in (10, 30);
```
3 rows selected.

Q4
Names starts with "A" and ends with "M"
```sql
select ename
from emp
where ename like 'A%M';
```
no rows selected

Q5
Names which have letter "A"
```sql
select ename
from emp
where ename like '%A%';
```
7 rows selected.

Q6
Names which have two "A" charcters and hiredate has "FEB"
```sql
select ename
from emp
where ename like '%A%A%' 
and hiredate like '%FEB%';
```
no rows selected

Q7
Names which have exactly 4 charcters and salary of 4 digits.
```sql
select ename, sal
from emp
where ename like '____' 
and sal like '____';
```
3 rows selected

Q8
Names which have second last charcter as "E" and Salary ending with "0".
```sql
select ename, sal
from emp
where ename like '%E_' 
and sal like '%0';
```
4 rows selected

Q9
```sql
select ename
from emp
where ename like '%LL%' 
and sal not between 2000 and 4000;
```
2 rows selected

Q10
```sql
select ename
from emp
where ename like '__M%' 
and deptno in (10, 40);
```
no rows selected

Q11
```sql
select ename, hiredate
from emp
where hiredate like '%FEB%';
```
2 rows selected

Q12
```sql
select ename, hiredate
from emp
where hiredate like '%81';
```
10 rows selected.

Q13
```sql
select ename, job
from emp
where ename like 'A%' 
and job like 'S%';
```
1 rows selected.

Q14
```sql
select *
from emp
where ename like 'A%' 
or ename like 'E%' 
or ename like 'I%' 
or ename like 'O%' 
or ename like 'U%' ;
```
2 rows selected.

Q15
```sql
select *
from emp
where ename like '%A' 
or ename like '%E' 
or ename like '%I' 
or ename like '%O' 
or ename like '%U' ;
```
1 rows selected.

Q16
```sql
select ename
from emp
where ename like '%@%';
```
0 rows selected.

Q17
```sql
select ename
from emp
where ename like '%\_%' escape '\';
```
0 rows selected.

Q18
```sql
select ename
from emp
where ename like '%\%%' escape '\';
```
0 rows selected.

Q19
```sql
select ename
from emp
where ename like  '\_%' escape '\';
```
0 rows selected.

Q20
```sql
select ename
from emp
where ename like '%\%' escape '\';
```
0 rows selected.