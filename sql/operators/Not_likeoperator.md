### Not like operator
It is just opposite to like operator.
It rejects the given pattern
Syntax: column_name not like 'pattern';

Names who does not starts with 'S'.
```sql
select ename
from emp
where ename not like 'S%';
```
12 rows selected.

```sql
select ename
from emp
where ename not like 'A%' 
and  ename not like 'S%';
```
10 rows selected.

Names starts with consonants only.
```sql
select ename
from emp
where ename not like 'A%' 
and  ename not like 'E%'
 and ename not like 'I%' 
 and ename not like 'O%' 
 and  ename not like 'U%' ;
 ```
12 rows selected.

Names ends with consonants only.
```sql
select ename
from emp
where ename not like '%A' 
and ename not like '%E' 
and ename not like '%I' 
and ename not like '%O' 
and ename not like '%U' ;
```
13 rows selected.

Names with exactly two 'A' characters
```sql
select ename
from emp
where ename like '%A%A%'
 and ename not like '%A%A%A%';
```