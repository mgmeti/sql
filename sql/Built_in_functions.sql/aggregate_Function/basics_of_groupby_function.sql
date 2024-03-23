
/*
MRF ()
It takes n number of inputs and then executes and produces one single output per group.

MRF's can not be written in where clause.
MRF's can be written in select,order by and having clauses.
Along with MRF's we can not include anyother column name in select without using it in group by clause.
MRF's ignore's null values of mentioned column.
count() is the only function which takes * as an argument.
max, min, avg, sum, count

MAX(arg1)
MIN(arg1)
SUM(arg1)
*/
select max(sal), min(sal), median(sal), sum(sal), avg(sal), count(sal) 
from emp;

select deptno, max(sal)
from emp
group by deptno;

select max(ename), min(ename)
from emp;
MAX(ENAME) MIN(ENAME)
---------- ----------
WARD       ADAMS

--Q1
select max(sal) 
from emp;

--Q2
select max(sal) 
from emp
where job = 'SALESMAN';

--Q3
select max(sal) 
from emp
where deptno=10 and (ename like 'A%' or ename like 'S%');

--Q4
select max(sal) 
from emp
where job ='CLERK' and deptno in (10, 20, 30);

--Q5
select max(sal) 
from emp
where job='MANAGER' and deptno in (10, 30) and instr(translate(ename, 'AEIOU', '-----'), '-', 1) != 0;

--Q6
select max(sal) 
from emp
where deptno=30 and job in ('CLERK', 'MANAGER') and substr(reverse(ename), 1, 1) ='K';

--Q7
select max(sal) 
from emp
where job = 'PRESIDENT' and
        (sal * 12) > 10000 and 
        deptno in (10, 20) and 
        mgr is null and 
        substr(ename, 1, 1) not in ('A', 'E', 'I', 'O', 'U') and 
        (sal between 1000 and 5000) and 
        length(ename) = 4 and
        to_char(hiredate, 'MON') like '__V' and 
        substr(ename, 1, 1) != substr(job, 1, 1) and
        mod(empno, 2) != 0 and
        round(months_between(current_date , hiredate)/12) > 40 ;

--MIN(arg1) :- minimum/lowest values based on specific values

select min(sal)
from emp
where job='MANAGER';

--Q1
select min(sal)
from emp
where deptno = 10;

--Q2
select min(sal)
from emp
where deptno in (10, 20 ) and job = 'SALESMAN';

--Q3
select min(sal)
from emp
where deptno in (10, 30) and substr(ename, 1, 1) in ('A', 'E', 'I', 'O', 'U');

--Q4
select min(sal)
from emp
where deptno in (10, 30 ) and job = 'CLERK';

--Q5
select min(sal)
from emp
where deptno = 30 and job = 'MANAGER';


--SUM(arg1) :- total of values

select sum(sal)
from emp
where job = 'SALESMAN';

select sum(sal)
from emp
where deptno = 10;

--Q1
select sum(sal)
from emp;

--Q2
select sum(sal)
from emp
where  job = 'CLERK';

--Q3
select sum(sal)
from emp
where deptno in (20, 30);

--Q4
select sum(sal)
from emp
where deptno in (10, 20, 30) and substr(ename, -1, 1) in ('A', 'E', 'I', 'O', 'U') and job in ('CLERK', 'MANAGER');

--Q5
select max(sal) "MAX", min(sal) "MIN", sum(sal)"TOTAL"
from emp
where deptno = 20;


--EXTRA QUESTIONS:
--EQ1
-- what is the length of the shortest employee in the company.
select min(length(ename))
from emp;

--WQ2
-- what is the length of the shortest employee in the company.
select max(length(ename))
from emp;


select deptno, max(sal), min(sal), median(sal), sum(sal), avg(sal), count(sal) 
from emp
group by deptno;


select ename
from emp
where (length(ename) = (select min(length(ename))
from emp));

aggregate function:
avg() :- used to obtain the average value of given group of columns.
--Q1
select avg(sal) from emp;

--Q2
select avg(sal) from emp where deptno=20;

--Q3
select avg(sal) from emp where job = 'MANAGER';

--Q4
select avg(sal) from emp where job = 'CLERK' and deptno=10;

count() :- used to obtain no. of values present in specified column.
Note: we can use * as argument.

--Q1
select count(*) from emp;

--Q2
select count(job) from emp where job='CLERK';

--Q3
select count(deptno) from emp where deptno=10;

--Q4
select count(ename) from emp where substr(ename, 1, 1) not in ('A', 'E', 'I', 'O', 'U');

--Q5
select count(ename) from emp where hiredate='03-dec-81';

--Q6
select count(ename) from emp where deptno in (10, 30) and job = 'MANAGER';

--Q7
select count(distinct sal) from emp;

--Q8
select count(job) - count(distinct) from emp;

--Q9
select max(sal), min(sal), avg(sal), count(ename)
from emp
where job = 'SALESMAN';


--Note:
select count(ename) from emp where hiredate between '03-dec-81' and '03-dec-81';

/*
Group by clause :  used to group the records.
The column that is written in the group by can be used in select clause along with MRF fucntions.
Syntax
        select group function/ group by expression
        from table_name
        where < conditon>
        group by column_1. column_2;

Order of execution -> 1. from
                      2. where (row by row)
                      3. group by 
                      4. select (group by group)

Note: Any clause that is executing after group by clause will be executing by group.
      Group by takes group of rows, if same vakues are present, it is going to group it one.


*/
select count(ename)
from emp
where substr(ename, 1, 1) not in ('A', 'E', 'I', 'O', 'U') or substr(ename, -1, 1) not in ('A', 
'I', 'O', 'U')
group by job;

select job, count(job)
from emp
group by job;

 select sal, count(sal)
 from emp
 group by sal;

--Q1
--Display maximum salary given to each department
select deptno, max(sal)
from emp
group by deptno;

--Q2
--Display minimum salary given to each department
select deptno, min(sal)
from emp
group by deptno;

--Q3
select job, max(sal)
from emp
where deptno in (10, 20)
group by job;

--Q4
select job, min(sal)
from emp
where comm is null
group by job;

--Q5
select deptno, sum(sal)
from emp
where job = 'CLERK'
group by deptno;

--Q6
select deptno, count(deptno) "# employees"
from emp
group by deptno;

--Q7
select job, count(job) "# employees"
from emp
group by job;

--Q8
select ename, count(ename) "# times"
from emp
group by ename;

--Q9
select sal, count(sal) "# times"
from emp
group by sal;

--Q10
select job,  count(job) "# employees"
from emp
where mgr is not null
group by job;

--Q11
select deptno, count(deptno) "# employees"
from emp
where substr(ename, -2, 1) ='r'
group by deptno;

--Q12
select deptno, count(deptno) "# employees"
from emp
where substr(ename, -1, 1) not in ('A', 'E', 'I', 'O', 'U')
group by deptno;

--Q13
select to_char(hiredate, 'FMMONTH') "MONTH", count(*) "# employees"
from emp
group by to_char(hiredate, 'FMMONTH');

--Q14
select length(ename) "# charcters", count(*)"# employees"
from emp
group by length(ename);

--Q15
-- employees hired on saturday
select to_char(hiredate, 'FMDAY') "SATURDAY", count(*) "# employees"
from emp
where to_char(hiredate, 'FMDAY')='SATURDAY'
group by to_char(hiredate, 'FMDAY');

/*
customer - cust_id, cust_name, email
product - prod_id, prod_name, category
sales - sales_id, prod_id, cust_id, amount, sales_date

*/
--Q1
--Total sales amount for each product
select prod_id, sum(amount)
from sales
group by prod_id;

--Q2
--The total number of products fro each customer
select cust_id, count(prod_id)
from sales
group by cust_id;

--Q3
--The avg purchage amount by each customer
select cust_id, avg(amount)
from sales
group by cust_id;

--Q4
-- The total sales amount per month
select to_char(sales_date, 'FMMONTH') "MONTH", sum(amount)
from sales
group by to_char(sales_date, 'FMMONTH');

