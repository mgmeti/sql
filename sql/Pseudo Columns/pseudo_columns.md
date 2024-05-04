### Pseudo columns
These are special types of column which are not physically stored in table.

UseCases:
        Used in ranking and identifying unique rows.
        When the table information is unkown.
        We cannot insert, delete or update pseudo columns.
        if, user wants to see the pseudo columns, explicitly user must and should call the columns in select query.

Note: 1. Behaves like actual column but not stored in the table.
      2. Pseudocolumns typically return a different value for each row.



#### rownum
For each row returned by a query, the rownum pseudo column returns a number indicating the order in which selects the rows from a table.

it starts from 1 and increment by 1.

    used to limit number of rows retunrs in a query.
    it is dynamic.
    it is unique.
    can be used in select and where clause.
    rownum might change(dynamic) whenwe use order byclause in query.

```sql
select emp.*, rownum
from emp
where sal <=3000 and rownum <=2;
```

```sql
 select * 
 from (select * 
        from emp 
        where sal <= 3000 
        order by sal asc ) 
where  rownum <=2 ;
 ```


```sql
select e.*, rownum r1
from (select emp.*, rownum r
        from emp ) e
where e.r in (1,5, 10, 12);
```



```sql
select e.*, rownum r1
from (select emp.*, rownum r
        from emp ) e
where e.r =(select count(*) from emp);
```
Questions
Q1

```sql
select * 
from emp
rownum =1;
```
Q2
```sql
select * 
from emp
rownum <=5;
```

Q3
```sql
select * 
from emp
rownum <=10;
```
Q4
Get second row of emp by using rownum.
 ```sql
 select *
 from (select * 
        from emp 
        where rownum <= 2 
        order by rownum desc)
 where rownum=1;
 ```
 Q5
```sql
select e.*, rownum r1
from (select emp.*, rownum r
        from emp ) e
where e.r in (2, 4, 12);
```

Q6
```sql
select e.*, rownum r1  --(7)
from  -- (5) refers to e
(select emp.*, rownum r  --(2)
        from emp  --(1)
        order by r desc) e --(3) and aliasing --(4)
where rownum=1; --(6) takes first row from e
```
table emp  --(1)
empno | ename
e1      raj
e2      ram         --->>> --(2)
e1      raj                 empno | ename | r
                            e2      ram     1
                            e3      ranga   2
                            e3      ranga   3
                                    
                    --->>> --(3) and --(4) aliasing as e
                                empno | ename | r
                                e2      ram     3
                                e3      ranga   2
                                e3      ranga   1
                    --->>>--(5)
                                empno | ename | r |  
                                e2      ram     3       1
                    --->>> --(6)
                            rownum
                                1    1=1 true 
                    --->>> --(7)
                                empno | ename | r |  rownum
                                e2      ram     3       1
Q7
```sql
select e.*, rownum
from (select emp.*, rownum r
        from emp 
        order by r desc) e
where rownum <=2;
```

Q8
```sql
select e.*, rownum
from (select emp.*, rownum r
        from emp
        ) e
where rownum <=3
union
select e.*, rownum
from (select emp.*, rownum r
        from emp
        order by r desc
        ) e
where rownum <=3
;
```

Q9 
Get middle record of the employee table
```sql
 select *
 from (select emp.*, rownum r from emp)
 where r = (select round(count(*)/2) from emp);
 ```
Q10
get middle 3 records from the employee table
```sql
select *
 from (select emp.*, rownum r from emp)
 where r >= (select round(count(*)/2)-1 from emp) and r <= (select round(count(*)/2)+1 from emp) ;
```
Q11
Get first half records of the employee table
```sql
 select *
 from (select emp.*, rownum r from emp)
 where r <= (select round(count(*)/2) from emp);
 ```
 ```sql
select emp.*, rownum
from emp
where rownum <= (select round(count(*)/2) from emp);
 ```

 Q12
Get first half records of the employee table
```sql
 select *
 from (select emp.*, rownum r from emp)
 where r > (select round(count(*)/2) from emp);
 ```

Q13
Display first 2 oldest emplyee records(reference to hiredate)
```sql
select e.*, rownum r
from (select *
        from emp
        order by hiredate) e
where rownum <=2;
```
```sql
select *
from (
select emp.*, row_number() over (order by hiredate) rn
from emp
)
where rn <=2;
```

Q14
Get two latest employee's from employee table
```sql
select e.*, rownum r
from (select *
        from emp
        order by hiredate desc) e
where rownum <=2;
```

Q15
Top five employees hired based on empno
```sql
select e.*, rownum r
from (select *
        from emp
        order by empno asc) e
where rownum <=5;
```

Q16
Top five employees hired based on empno
```sql
select e.*, rownum r
from (select *
        from emp
        order by empno desc) e
where rownum <=5;
```
Q17
Get second highest salary in employee table
```sql
select e1.sal
from (
        select e.*,rownum r
        from
        (
          select distinct sal
                from emp
                order by sal desc)e)e1
where e1.r=2;
```
Q18
Get second lowest salary in employee table
```sql
select e1.sal
from (
        select e.*,rownum r
        from
        (
          select distinct sal
                from emp
                order by sal asc)e)e1
where e1.r=2;
```

Q19
Get 2nd, 5th, and 8th highest salary in employee table
```sql
select e1.sal
from (
        select e.*,rownum r
        from
        (
          select distinct sal
                from emp
                order by sal desc)e)e1
where e1.r in (2, 5, 8);
```

Q20
Get second highest salary  employee details in employee table
```sql
select *
from emp
where sal =(
select e1.sal
from (
        select e.*,rownum r
        from
        (
          select  distinct sal
                from emp
                order by sal desc)e)e1
where e1.r=2) ;
```

Q21
Get  5 highest salary in employee table
```sql
select e1.*
from (
        select e.*,rownum r
        from
        (
          select  *
                from emp
                order by sal desc)e)e1
where e1.r<=5;
```

Q22
Get  5 lowest salary in employee table
```sql
select e1.*
from (
        select e.*,rownum r
        from
        (
          select  *
                from emp
                order by sal asc)e)e1
where e1.r<=5;
```

Assigment:
A1 first 5 employees from employee table, ordered by hiredate.
```sql
select *
from (select emp.*, row_number() over (order by hiredate) rn
        from emp)
where rn <=5;
```

A2 top 10 highest paid employees in emp table

```sql
select *
from (select emp.*, row_number() over (order by sal desc) rn
        from emp)
where rn <=10;
```

A3 Find the oldest 3 employees in the emp table.
```sql
select *
from (select emp.*, row_number() over (order by hiredate) rn
        from emp)
where rn <=3;
```

A4 employee details who is earning  lowest salary.
```sql
select *
from (select emp.*, row_number() over (order by sal asc) rn
        from emp)
where rn <=1;
```

A5 
```sql
select * 
from emp
where hiredate >= '01-jan-2023'
rownum <=10;
```


#### rowid
For each row in the database, the ROWID pseudocolumn returns the address of the row.

Physical address of records involves:
The data object number of the object -- 6
The data block in the data file in which the rows resides -- 3
The position of the row in the data block (first row is 0) --6
The row number --3

rowid is static
rowid may change, if and only the row is deleted and then inserted.
rowid can be used for fetching the record in fastest way.
rowid can be used in select and where clause.
rowid helps in deleting the duplicate records.
rowid is generated when the record is inserted.

Q1
Display the details the employees with row id's.
```sql
select emp.*, rowid address
from emp;
```
Q2
Last employee record in given table
 ```sql
 select e1.*
 from emp e1
 where 1 = (select count(e2.rowid)
                from emp e2
                where e1.rowid<=e2.rowid);
```
(OR)
```sql
select * 
from emp
where rowid = (select max(rowid)
                from emp
                )
;
```
Q3
First employee record in given table
 ```sql
 select e1.*
 from emp e1
 where 1 = (select count(e2.rowid)
                from emp e2
                where e1.rowid >=e2.rowid);
```
(OR)
```sql
select * 
from emp
where rowid = (select min(rowid)
                from emp
                )
;
```
Q4
First 2 employee record in given table
 ```sql
 select e1.*
 from emp e1
 where  (select count(e2.rowid)
                from emp e2
                where e1.rowid>=e2.rowid) in (1, 2)
;
```
Q5
Last 2 employee record in given table
 ```sql
 select e1.*
 from emp e1
 where  (select count(e2.rowid)
                from emp e2
                where e1.rowid<=e2.rowid) in (1, 2)
;
```

Q6
First 2 employee record in given table
 ```sql
 select e1.*
 from emp e1
 where  (select count(e2.rowid)
                from emp e2
                where e1.rowid>=e2.rowid) in (1, 4, 10)
;
```
Q7
First 2 employee record in given table
 ```sql
 select e1.*
 from emp e1
 where  (select count(e2.rowid)
                from emp e2
                where e1.rowid<=e2.rowid) in (2, 7)
;
```

Q8 
To delete duplicate row's
```sql
delete from emp
where  rowid not in (select max(rowid)
                        from emp
                        group by empno, ename, sal
);
```
Q9
Display the duplicate rows present in table
```sql
select *
from emp
where  rowid not in (select max(rowid)
                        from emp
                        group by empno, ename, sal
);
```

Q10
```sql
update emp set sal=8000 where rowid ='AAAMfPAAEAAAAAgAAD';
```

Q11
```sql
delete
from emp
where rowid='AAAMfPAAEAAAAAgAAE';
```
Q12
```sql
select e.ename, d.dname
from emp e
join dept d
on d.deptno=e.deptno
where d.rowid ='AAAMfNAAEAAAAAQAAB'
;
```
