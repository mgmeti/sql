/*

1. SCALAR SUBQUERIES - returns one row and one column
2. NESTED (single- or multi-row) SUBQUERIES (in the WHERE clause)
        a)  A single-row subquery returns one row but multiple columns,
        b)  A multi-row subquery returns multiple rows and multiple columns.
3. CORRELATED SUBQUERIES, INLINE VIEWS( in the FROM clause)
4. FACTORED SUBQUERIES (in the WITH clause)(also know as CTEs- common table expressions outside Oracleland)
5. 

NESTED SUBQUERY
A subquery in the WHERE clause of a SELECT statement is also called a nested subquery.

INLINE VIEW
A subquery in the FROM clause of a SELECT statement is also called an inline view.

Note:
Subqueries ->  they can appear in almost any clause of DML statements with the exception of the GROUP BY clause.


*/

-- SCALAR SUBQUERIES
select ename, sal, (select round(avg(sal)) from scott.emp) as avg_salary
from scott.emp;
--Here scalar subquery runs number times of rows present in the emp table.


--Single row subsquery (SRS -returns only one row to the parent query)
--A single-row subquery returns one row but multiple columns, 

--Q7
select ename, sal, deptno
from scott.emp
where sal = (select sal 
                from scott.emp
                where ename='SCOTT') and deptno in (10, 20)
                and substr(ename, 1, 1) in ('A', 'E', 'I', 'O', 'U');

--Q8
select *
from scott.emp
where ename like 'A%' and
        deptno = (select deptno from scott.emp where ename = 'BLAKE');


--Q9
select ename, hiredate
from scott.emp
where hiredate > '31-DEC-80' and hiredate <(
    select hiredate from scott.emp where ename='KING');


--Q10
select ename
from scott.emp
where sal > (select sal 
                from scott.emp 
                where ename = 'MILLER');

--Q11
select ename, sal *12 "AnnualSal", job "Designation"
from scott.emp
where (sal*12) > (select sal * 12
                    from scott.emp
                    where ename='SMITH');

--Q12
select ename
from scott.emp
where sal > (select round(avg(sal))
                from scott.emp);

--Q13
select ename
from scott.emp
where sal != (select sal 
                from scott.emp 
                where ename = 'SCOTT');

--Q14
select ename
from scott.emp
where sal >= (select sal 
                from scott.emp 
                where ename = 'ALLEN');
--Q15
select ename
from scott.emp
where sal <= (select sal 
                from scott.emp 
                where ename = 'MILLER');

--Q16
select *
from scott.emp
where sal != (select max(sal)
                from scott.emp);

--Q17
select *
from scott.emp
where sal > (select round(avg(sal))
                from scott.emp
                where deptno=10);

--Q18
select ename, sal
from scott.emp
where sal < (select min(sal)
                from scott.emp
                where deptno=30);

--Q19
select ename, sal
from scott.emp
where sal = (select round(avg(sal))
                from scott.emp);

--Q
select ename
from scott.emp
where sal > (select sal from scott.emp where ename='MILLER')
        and sal <  (select sal from scott.emp where ename='ALLEN');

select deptno, round(avg(sal))
from scott.emp
group by deptno
having avg(sal) > (select round(avg(sal)) from scott.emp);


--CASE 2
--Display the data from one table, condition from another table
 

--Q1
select dname
from scott.dept
where deptno in ( select deptno
                        from scott.emp
                        where job ='CLERK');
--Q2
select *
from scott.dept
where deptno in ( select deptno
                        from scott.emp
                        where sal > 2000);

--Q3
select dname, loc
from scott.dept
where deptno in ( select deptno
                        from scott.emp
                        where job ='SALESMAN');

--Q4
select ename
from scott.emp
where deptno in (select deptno
                from scott.dept
                where loc = 'NEW YORK');

--Q5
select *
from scott.emp
where deptno in (select deptno
                from scott.dept
                where dname = 'SALES');

--Q6
select ename
from scott.emp
where deptno in (select deptno
                from scott.dept
                where loc in ('NEW YORK', 'DALLAS'));

--Q7
select dname, loc
from scott.dept
where deptno in ( select deptno
                        from scott.emp
                        where mgr is not null and 
                                sal is not null
                        ) and dname='ACCOUNTING';

--Q8
select *
from scott.emp
where deptno in (select deptno
                from scott.dept
                where dname in ('SALES', 'RESEARCH'));

--Q9
select dname
from scott.dept
where deptno in ( select deptno
                        from scott.emp
                        where sal > 2000 and 
                        job in ('CLERK', 'MANAGER') and
                        deptno in (10, 30));

--Q10
select * 
from scott.emp 
where (sal, deptno) in (
                select sal, deptno
                from scott.emp
                group by sal, deptno
                having count(*) >1);


--CASE3 :- Finding maximum and minimum of columns.
-- Employees details who had maximum salary
select *
    from scott.emp
    where sal = (
        select max(sal)
        from scott.emp);
-- Employees details who had minimum salary
select *
    from scott.emp
    where sal = (
        select min(sal)
        from scott.emp);

--Employees details who hired on first day
select *
    from scott.emp
    where hiredate = (
        select min(hiredate)
        from scott.emp);

--Employees details who hired on last day
select *
    from scott.emp
    where hiredate = (
        select max(hiredate)
        from scott.emp);

--case3 finding maximum and minimum
--Q1
select *
    from scott.emp
    where sal = (
        select max(sal)
        from scott.emp);

--Q2
select *
    from scott.emp
    where sal = (
        select min(sal)
        from scott.emp);

--Q3
select *
    from scott.emp
    where hiredate = (
        select min(hiredate)
        from scott.emp);

--Q4
select *
    from scott.emp
    where hiredate = (
        select max(hiredate)
        from scott.emp);

--Q5
select max(sal)
    from scott.emp
    where sal < (
        select max(sal)
        from scott.emp);

--Q6
select *
from scott.emp
where sal = (
        select max(sal)
                from scott.emp
                where sal < (
                select max(sal)
                from scott.emp)
                );
--Q7
select min(sal)
    from scott.emp
    where sal > (
        select min(sal)
        from scott.emp
        where sal > (
                select min(sal)
                from scott.emp
                where sal > (
                        select min(sal)
                        from scott.emp)));
--Q8
select *
from scott.emp
where sal =(
        select min(sal)
        from scott.emp
        where sal > (
                select min(sal)
                from scott.emp
                where sal > (
                        select min(sal)
                        from scott.emp
                        where sal > (
                                select min(sal)
                                from scott.emp))))
                        ;
--Q9
select *
from scott.emp
where hiredate in (
        select min(hiredate)
        from scott.emp
        where hiredate >(
                select min(hiredate)
                        from scott.emp
                        where hiredate > (
                                select min(hiredate)
                                from scott.emp)
                                ));
--Q10
select *
from scott.emp
where hiredate in (
        select max(hiredate)
                from scott.emp
                where hiredate < (
                select max(hiredate)
                from scott.emp)
                );

--Q13
select *
from scott.emp
where sal > (select sal 
                from scott.emp
                where ename='SMITH')
        and sal <(
                select sal 
                from scott.emp
                where ename ='KING'
        );

--Q14
select ename, comm, deptno
from scott.emp
where comm is not null
        and  deptno =(
                select deptno 
                from scott.emp
                where ename ='ALLEN'

        )  
        and hiredate <(
                select hiredate 
                from scott.emp
                where ename ='SCOTT'
        );

--Q15
select ename
from scott.emp
where comm is not null
        and  deptno =(
                select deptno 
                from scott.emp
                where ename ='JAMES'

        )  
        and hiredate > (
                select hiredate 
                from scott.emp
                where ename ='MARTIN'
        )
         and sal > (
                select sal 
                from scott.emp
                where ename ='ADAMS'
        )
         and comm > (
                select comm 
                from scott.emp
                where ename ='WARD'
        );

--CASE 4
--subqueries with special operators.
--ANY , ALL
/*
It is a special operator used along with relational operators. <, <=, >, >=, =, <>,
To comapare the values present at the RHS 
ANY operator return true if one of the values at RHS have satsfied the condition.

ALL
It is a special operator used along with relational operators.
ALL operator becomes TRUE if the all the values at the RHS have satsfied the coonditon.

*/
--Q1
-- Display name the Employee if the Employee earn less than the Employees working as salesman.
select ename
from scott.emp
where sal < ALL (
                        select sal
                        from scott.emp
                        where job = 'SALESMAN'
                );
--alternative
select ename
from ecott.emp
where sal < (select min(sal)
                from scott.emp
                where job='SALESMAN');

--Q2
--Display name of the employee earn less than at least a salesman.

select ename
from scott.emp
where sal < ANY (
                        select sal
                        from scott.emp
                        where job = 'SALESMAN'
                );
--alternative
select ename
from ecott.emp
where sal < (select max(sal)
                from scott.emp
                where job='SALESMAN');

--Q3
-- employees who earns more than ADAMS
select ename
from ecott.emp
where sal > ALL (select max(sal)
                from scott.emp
                where ename='ADAMS');
--alternative
select ename
from ecott.emp
where sal > (select max(sal)
                from scott.emp
                where ename='ADAMS');


--Q4
-- Display name the Employee if the Employee earn more than the Employees working as salesman.
select ename
from scott.emp
where sal > ALL (
                        select sal
                        from scott.emp
                        where job = 'SALESMAN'
                );
--alternative
select ename
from ecott.emp
where sal > (select max(sal)
                from scott.emp
                where job='SALESMAN');

--Q5
--Display name of the employee earn more than at least a salesman.

select ename
from scott.emp
where sal > ANY (
                        select sal
                        from scott.emp
                        where job = 'SALESMAN'
                );
--alternative
select ename
from ecott.emp
where sal > (select min(sal)
                from scott.emp
                where job='SALESMAN');

--Q6
select ename
from scott.emp
where hiredate > ALL (
                        select hiredate
                        from scott.emp
                        where job = 'CLERKS'
                );
--alternative
select ename
from scott.emp
where hiredate >  (
                        select max(hiredate)
                        from scott.emp
                        where job = 'CLERKS'
                );
--Q7

--Display name of the employee earn less than at least a manager.

select ename, sal
from scott.emp
where sal < ANY (
                        select sal
                        from scott.emp
                        where job = 'MANAGER'
                );
--alternative
select ename, sal
from ecott.emp
where sal < (select max(sal)
                from scott.emp
                where job='MANAGER');

--Q8
select ename, hiredate
from scott.emp
where hiredate < ALL (
                        select hiredate
                        from scott.emp
                        where job = 'MANAGER'
                );
--alternative
select ename, hiredate
from scott.emp
where hiredate <(
                        select min(hiredate)
                        from scott.emp
                        where job = 'MANAGER'
                );

--Q9
select ename, job, hiredate
from scott.emp
where hiredate > ALL (
                        select hiredate
                        from scott.emp
                        where job = 'MANAGER'
                ) and
                sal > ALL (
                        
                        select sal
                        from scott.emp
                        where job = 'CLERKS'
                );
                
--alternative
select ename
from scott.emp
where hiredate <(
                        select min(hiredate)
                        from scott.emp
                        where job = 'MANAGER'
                ) and
                sal >  (
                        select max(sal)
                        from scott.emp
                        where job = 'CLERKS'
                );
--Q10
select ename, job, hiredate
from scott.emp
where hiredate < ANY (
                        select hiredate
                        from scott.emp
                        where job = 'SALESMAN'
                )
                and
                job = 'CLERK';

--Q11
select ename, job, hiredate
from scott.emp
where hiredate > ALL (
                        select hiredate
                        from scott.emp
                        where deptno = 10
                )

--Q12
--ename, sal if employee earning more than avg sal of each department
select ename, sal
from scott.emp
where sal > ALL (
        select round(avg(sal), 0)
        from scott.emp
        group by deptno
);

--Q13
select deptno,  round(avg(sal), 2) as avg_salary
from scott.emp
group by deptno
having round(avg(sal), 2) >(
        select round(avg(sal), 2)
        from scott.emp

);

--Q14
select deptno, count(*)
from scott.emp
group by deptno
having count(*) > (
        select max(count(*))
        from scott.emp
        group by deptno
);


--NESTED subqueries:
--Option 1
 SELECT
   ...
 FROM
   tab_name
 WHERE
   col_name = ( SELECT ... FROM sub_tab_name ... )
 AND another_col_name = ( SELECT ... FROM sub_tab_name ... );

--Option 2
SELECT 
        ....
FROM
 tab_name

WHERE 
        (col_name, another_col_name) = (select agrregation(....), another_aggregation(...) 
                                        from sub_tab_name ..);

--Option 2 is preffered way as it minimizes the number of lookups in sub_tab_name.