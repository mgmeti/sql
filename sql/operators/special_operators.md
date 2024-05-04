### Special Operators
#### IS NULL
It id used to evaluate null values
Syntax--> column_name IS NULL;
Used to evaluate NULL values inside the specific column.

Employee who does not get commision and not assigned manager
```sql
select * 
from emp
where comm is null 
and mgr is null;
```

Q1
Employee who does not have manager assigned
```sql
select * 
from emp
where mgr is null;
```

Q2
Employee who does not get commision 
```sql
select * 
from emp
where comm is null;
```

Q3
Employee's who are not working in any department.
```sql
select *
from emp
where deptno is null;
```

Q4
Employee's except employee who works as clerk also except salesman and employee's do not earn any commission
```sql
select *
from emp
where job !='CLERK' 
and  job !='SALESMAN' 
and comm is null;
```

#### IS NOT NULL
Used to evaluate NOT NULL values inside the specific column.
Syntax--> column_name IS NOT NULL;

Works in some department
```sql
 select *
 from emp
 where deptno is not null;
 ```

all employee who get some salary
```sql
select *
from emp
where sal is not null;
```

Employee's who do not get commision and works in department and gets salary
```sql
select *
from emp
where deptno is not null 
and sal is not null 
and comm is null;
```

Q1
```sql
select *
from emp
where sal is not null 
and deptno=10;
```
3 rows selected.

Q2
Employee's who have manager
```sql
select *
from emp
where mgr is not null;
```
13 rows selected.

Q3
```sql
select *
from emp
where comm is not null;
```
4 rows selected.

Q4
```sql
select ename, sal, deptno
from emp
where sal is not null 
and deptno is not null;
```
14 rows selected.

Q5
```sql
select *
from emp
where comm is null  
and deptno is not null 
and mgr is not null;
```
9 rows selected.
