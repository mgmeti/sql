#### Definition:
Correlated Subquery:
        It is a subquery that contains a reference to a table that also appears in the outer query.
A correlated subquery is also known as a repeating subquery or a synchronized subquery.

Oracle performs a correlated subquery when the subquery references a column from a table referred to in the parent statement. 
A correlated subquery is evaluated once for each row processed by the parent statement. 

Query which is written inside another query, where outer query and subquery both are interdependent is known as correlated subquery.

correlated subquery works with the principle of both sub query and joins.

join condition is mandatory and must be written in sub query.

Used when we need to reference columns from the outer query in the subquery's condition or calculation.

Syntax: 
        select */column-name 8
            from table-name -->(1, 7)
        (2, 6 )    where col-name in (select col-name  --> 5
                                from table-name  --> 3
                                where <join condition>);  ---> 4

workflow :-> outer query is executed 1st and produce partial output.
        --> Partial output of output query is taken as input to the inner query and get executed and produce output.
    --> the output of subquery is taken as input to the outer query and gets executed.
    --> outer query get executed and produce complete result.

```sql
select  e.ename, e.deptno, e.sal
from emp e
where sal < (select avg(sal)
            from emp e1
            where e1.deptno = e.deptno )            
order by e.deptno;
```

```sql
select  e.ename, e.deptno, e.sal
from emp e
where sal > (select avg(sal)
            from emp e1
            where e1.deptno = e.deptno )            
order by e.deptno;
```

```sql
select  e.ename, e.deptno, e.sal, round((select avg(e1.sal)
            from emp e1
            where e1.deptno = e.deptno ), 2) "avg_Sal"
from emp e       
order by e.deptno;
```
```sql
select  e.ename, e.deptno, e.sal, round((select avg(e1.sal)
            from emp e1
            where e1.deptno = e.deptno ), 2) "avg_Sal"
from emp e
where sal > (select avg(sal)
            from emp e2
            where e2.deptno = e.deptno )            
order by e.deptno;
```
```sql
select  e.ename, e.deptno, e.sal, round((select avg(e1.sal)
            from emp e1
            where e1.deptno = e.deptno ), 2) "avg_Sal"
from emp e
where sal < (select avg(sal)
            from emp e2
            where e2.deptno = e.deptno )            
order by e.deptno;
```

Department name where employees are working.
```sql
select dname
from dept d
where d.deptno in (select deptno
                    from emp e
                    where d.deptno=e.deptno);
```

Department name where employees are not working.
```sql
select dname
from dept d
where d.deptno not in (select deptno
                    from emp e
                    where d.deptno = e.deptno);
```

Get name and department name for each employee.
```sql
select ename, (select dname from dept d where d.deptno=e.deptno) "Deprtment"
from emp e;
```

```sql
select  (select dname from dept d where d.deptno=e.deptno) "Deprtment"
from emp e;
```

