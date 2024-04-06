### JOINS
Define:
    Joins are used to combine rows of two or more tables using related column.

    Joins are used retrieve or fetch fro multiple tables simulatneaously.

Joins are used to combine data from multiple tables to form a single result set.

    1. we use join condition to join the rows.
    2. Join condtiotion is written using related column(FK).
    3. If the join conditon is written is on  WHERE clause is known as ORACLE syntax.
    4. If the join conditon is written is on ON clause is known as ANCI syntax.
    5. ANSI SYNTAX -> Join condition with ON clause.
    6. ORACLE SYNTAX -> Join condition with WHERE clause.


Why?? ->  To avoid querying same table multiple times

ON and WHERE clauses are used to establish relationa between tables.



#### Types Of Joins
    1. [INNER] JOIN (EQUI JOIN)
    2. OUTER JOIN
            a. LEFT
            b. RIGHT
            c. FULL
    3. CROSS JOIN (CARTESIAN JOIN)
    4. NATURAL JOIN
    5. SELF JOIN


#### [INNER] JOIN
An INNER JOIN combines data from two tables where there is a match on the joining column(s) in both tables.

It gives only matching records from multiplet tables.

Syntax:
ANCI:
        select */Column_names
        from table_1  t1
        join table_2 t2
        on <join conditon>;

ORACLE:
        SELECT */Column_names
        FROM table_1  t1, table_2 t2
        WHERE <join condition>;

select e.ename, e.deptno, d.dname, d.loc
from emp e
join dept d
on e.deptno = d.deptno;

NOTE: null columns can not be compared assignment operator.
    To deal with null values, use is null, is not null, nvl() function.


select ename, dname, d.deptno
from emp e
    join dept d    on e.deptno=d.deptno
;

Q1.Display ename with their dname

```sql 
select e.ename, d.dname
    from emp e
        join  dept d on e.deptno=d.deptno
    ; 
```

Q2.Display employee details and department details
ANCI SYNTAX:
```sql
select *
  from emp e
        join  dept d on e.deptno=d.deptno
    ; 
```
ORACLE SYNTAX:
```sql
select *
    from emp e, dept d
        where e.deptno=d.deptno
;
```
Q3.Display name, department name, loc if employees are working in NEW YORK.

```sql
select e.ename, d.dname, d.loc
    from emp e
        join dept d on e.deptno=d.deptno
    where d.loc='NEW YORK'
;
```

Q4.Display name, job and department name, if employee work as SALESMAN
```sql
select e.ename, e.job, d.dname
    from emp e
        join dept d on e.deptno=d.deptno
    where e.job='SALESMAN'
;
```

Q5. Display name, job and department name, if employees are working as clerk and the employee names with consonants
```sql
select e.ename, e.job, d.dname
    from emp e
        join dept d on e.deptno=d.deptno
    where e.job='CLERK' and substr(e.ename, 1, 1) not in ('A', 'E', 'I', 'O', 'U')
;
```

Q6. Display name, job, deptno, loc and department name, if employees are working as manager and the employee working in deptno 20 or 10
```sql
select e.ename, e.job, e.deptno,  d.dname, d.loc
    from emp e
        join dept d on e.deptno=d.deptno
    where e.job='MANAGER' and e.deptno in (10, 20)
;
```

Q7. Display name, job and department name, if employees are working as salesman and the employee works in sales dept
```sql
select e.ename, e.job, d.dname
    from emp e
        join dept d on e.deptno=d.deptno
    where e.job='SALESMAN' and d.dname='SALES'
;
```

Q8. Display name, job, department name and loc, if employees are working as salesman and the employee works in sales dept
```sql
select e.ename, e.job, d.dname, d.loc
    from emp e
        join dept d on e.deptno=d.deptno
    where e.job in ('CLERK', 'PRESIDENT') and d.loc in ('CHICAGO', 'DALLAS')
;
```
Q9. Display name, mgr, department name and loc, if employee reporting manager is 7788 or 7839 and also works in research or accounting dept
```sql
select e.ename, e.mgr, d.dname, d.loc
    from emp e
        join dept d on e.deptno=d.deptno
    where e.mgr in ('7788', '7839') and d.dname in ('RESEARCH', 'ACCOUNTING')
;
```

Q10. Display ename, employee deptno, sal, dname of the employees working in dept 20 with a salary more than 1800
```sql
select e.ename, e.deptno, e.sal,  d.dname
    from emp e
        join dept d on e.deptno=d.deptno
    where e.deptno=20  and e.sal > 1800
;
```

Q11. Display ename, dname of the employees having character 'A' on their name and hired after year 83
```sql
select e.ename,  d.dname
    from emp e
        join dept d on e.deptno=d.deptno
    where e.ename like '%A%'  and e.hiredate > '31-DEC-83'
;
```

Q11. Display ename, dname, if ename starting character must not be same as dname last character.
```sql
select e.ename,  d.dname
    from emp e
        join dept d on e.deptno=d.deptno
    where substr(e.ename, 1, 1) <> substr(d.dname, -1, 1)
;
```
