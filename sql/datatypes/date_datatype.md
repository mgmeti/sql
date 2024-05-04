DATE datatype
'DD-MON-YYYY'

Q1
Employee hired on '23-jan-82'
```sql
select *
from emp
where hiredate = '23-jan-82';
```
1 rows selected.

Q2
Employee hired-after  '03-dec-81'
```sql
select *
from emp
where hiredate > '03-dec-81';
```
3 rows selected.

Q3
Employee hired-after year '81'
```sql
select *
from emp
where hiredate > '31-dec-81';
```
3 rows selected.

Q4
Employee hired-after year '83' and works in department 10 or 20.
```sql
select *
from emp
where hiredate > '31-dec-83' and deptno in (10, 20);
```
2 rows selected.

Q5
Hired before  '10-jan-81'
```sql
select *
from emp
where hiredate <'10-jan-81';
```
1 rows selected.

Q6
Hired before year 85 and works as clerk or manager in department 10 or 20.
```sql
select *
from emp
where hiredate < '31-dec-85' and job in ('CLERK', 'MANAGER') and deptno in (10, 20);
```
4 rows selected.

Q7
Hired after year 81 and hired before year 85.
```sql
select *
from emp
where hiredate > '31-dec-81'  and hiredate < '31-dec-85';
```
1 rows selected.

Q8
Hired after year 81 and except salesman
```sql
select *
from emp
where hiredate >= '01-jan-81' and job !='SALESMAN';
```
9 rows selected.



