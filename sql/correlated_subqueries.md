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

Employee's who are all earning less than their department avg salary
```sql
select  e.ename, e.deptno, e.sal
from emp e
where sal < (select avg(sal)
            from emp e1
            where e1.deptno = e.deptno )            
order by e.deptno;
```
Employee's who are all earning more than their department avg salary
```sql
select  e.ename, e.deptno, e.sal
from emp e
where sal > (select avg(sal)
            from emp e1
            where e1.deptno = e.deptno )            
order by e.deptno;
```

```sql
select  e.ename, e.deptno, e.sal,
         round((select avg(e1.sal)  
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
select ename, (select dname 
                from dept d 
                where d.deptno=e.deptno) "Deprtment"
from emp e;
```

```sql
select  (select dname 
        from dept d 
        where d.deptno=e.deptno) "Deprtment"
from emp e;
```

Get 3rd maximum salary in emp
```sql
select e1.sal
from emp e1
where 3 = (select count(distinct e2.sal) 
            from emp e2 
            where e2.sal >= e1.sal);
```


Get 6th maximum salary in emp
```sql
select e1.sal
from emp e1
where 6 = (select count(distinct e2.sal) 
            from emp e2 
            where e2.sal >= e1.sal);
```


Get 8th maximum salary in emp
```sql
select e1.sal
from emp e1
where 8 = (select count(distinct e2.sal) 
            from emp e2 
            where e2.sal >= e1.sal);
```

Get 1st, 3rd and 5th max salaries.
```sql
select distinct *
from emp e1
where (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal >= e1.sal) in (1,3,5);
```
Get 2nd, 4th and 8th max salaries.
```sql
select distinct *
from emp e1
where (select count(distinct e2.sal) 
        from emp e2 where e2.sal >= e1.sal) in (2, 4, 8);
```

get 5th minimum salary
```sql
select distinct *
from emp e1
where  (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal <= e1.sal) = 5
order by e1.sal;
```
get 2nd, 4th,5th and 7th minimum salaries
```sql
select distinct *
from emp e1
where  (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal <= e1.sal) in (2, 4, 5, 7)
order by e1.sal;
```

Get max 3 salaries and min 3 salaries.
```sql
select distinct *
from emp e1
where (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal >= e1.sal) <=3 
    or (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal <= e1.sal) <=3
order by e1.sal;
```

Get  5th max salary and  4th min salry.
```sql
select distinct *
from emp e1
where (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal >= e1.sal) = 5 
    or (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal <= e1.sal) = 4
order by e1.sal;
```

Get 3rd, 4th and  5th max salary and  4th, 5th and 6th min salry.
```sql
select distinct *
from emp e1
where (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal >= e1.sal) in (3, 4, 5) 
    or (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal <= e1.sal) in (4, 5, 6)
order by e1.sal;
```
Get 3rd, 4th and  5th max salary and  4th, 5th and 6th min salry using UNION Set
```sql
select distinct *
from emp e1
where (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal >= e1.sal) in (3, 4,5)
union
select distinct *
from emp e1
where  (select count(distinct e2.sal) 
        from emp e2 
        where e2.sal <= e1.sal) in ( 4, 5, 6) 
order by 6;
```
--> Note:
    get nth maximum of sal
```sql
select *
from emp e1
where 5-1 = (select count(distinct e2.sal)
            from emp e2
            where e2.sal > e1.sal);


select *
from emp e1
where 5-1 = (select count(distinct e2.sal)
            from emp e2
            where e1.sal < e2.sal);
```
#### EXISTS (other than null) -> retunrs true
Exists operator returns true if the subquery returns any value other than null.
```sql
select d1.dname
from dept d1
where exists (select 1
                from emp e1
                where e1.deptno = d1.deptno);
```
#### NOT EXISTS (for a null)  -> returns true
not exists operator returns true if the subquery returns null.
```sql
select d1.dname
from dept d1
where not exists (select 1
                from emp e1
                where e1.deptno = d1.deptno);
```



