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

#### cross join
  

#### natural join
It act as inner join if the joining tables have common columns with same datatype.

It act as cross join if there are no common column between tables while joining.


#### Self Join
A table joining with itself.

    1. A table joining with itself is called as self join.
    2. It is used when you need to compare rows within the same table.
    3. we alias the table with different names to distinguish between the two objects(instances).
    4. each record of the table merges with each record of the same table.




Q1
```sql
select e1.ename ||' works for ' || e2.ename  "Employee and their managers"
from emp e1  join emp e2 on e1.mgr=e2.empno;
```



Q2
```sql
select e1.ename emp_name, e1.deptno, e2.ename manager
from emp e1  join emp e2 on e1.mgr=e2.empno
where e1.deptno in (10, 20);
```

Q3
```sql
select e1.ename employee, e2.ename manager, e2.job
from emp e1   join emp e2 on e1.mgr=e2.empno
where e2.job='MANAGER';
```

Q4
```sql
select e1.ename employee, e1.hiredate emp_hiredate,  e2.ename manager, e2.hiredate manager_hiredate
from emp e1   join emp e2 on e1.mgr=e2.empno
where e1.hiredate < e2.hiredate;
```


Q5
```sql
select e1.ename emp_name, e1.deptno, e2.ename manager, e2.deptno
from emp e1  join emp e2 on e1.mgr=e2.empno
where e2.deptno in (30, 50);
```
Q6
```sql
select e1.ename emp_name, e1.job, e2.ename manager, e2.job
from emp e1  join emp e2 on e1.mgr=e2.empno
where e1.job=e2.job;
```

Q7
```sql
select e1.ename employee, e1.sal emp_sal,  e2.ename manager
from emp e1   join emp e2 on e1.mgr=e2.empno
where substr(e2.ename, -1, 1) in ('A', 'E', 'I', 'O','U');
```
Q8
```sql
select e1.ename employee, e1.job, e1.sal, e1.deptno, e1.comm,
         e2.ename manager, e2.job, e2.sal, e2.deptno. e2.comm
from emp e1  join emp e2 on e1.mgr=e2.empno
where e1.comm > e2.comm and e1.deptno=10 and e2.job='MANAGER' and e1.hiredate < e2.hiredate;
```
 
Q9
employees and managers, and managers managers
```sql
select e.ename, m1.ename, m2.ename
from emp e join emp m1
on e.mgr=m1.empno
join emp m2
on m1.mgr=m2.empno;
```
Q9
```sql
select e.ename,  m2.ename
from emp e, emp m1, emp m2
where e.mgr=m1.empno and m1.mgr=m2.empno;
```

Q10
employees and managers, and managers managers, and managers managers manager.
```sql
select e.ename,  m3.ename, 
from emp e join emp m1
on e.mgr=m1.empno
join emp m2
on m1.mgr=m2.empno
join emp m3
on m2.mgr=m3.empno;
```

Q11append
```sql
select e.ename, m3.ename
from emp e join emp m1
on e.mgr=m1.empno
join emp m2
on m1.mgr=m2.empno
join emp m3
on m2.mgr=m3.empno
where m3.job='MANAGER' and m3.deptno in (10,20);
```

Display employee name, employee location along with their manager name.

```sql
select e.ename, d1.loc "emp loc", m1.ename "mngr"
from emp e
join dept d1
on e.deptno=d1.deptno
join emp m1
on m1.empno=e.mgr;
```


Display employee name, manager location along with their manager name.
```sql
select e.ename, m1.ename "mngr", d1.loc "mngr loc"
from emp e
join emp m1
on m1.empno=e.mgr
join dept d1
on m1.deptno=d1.deptno;
```