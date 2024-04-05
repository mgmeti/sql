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

    