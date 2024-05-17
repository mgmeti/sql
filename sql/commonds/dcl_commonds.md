Select commond/ Expression

#### AND, OR, NOT

Operators
Arithmatic > +, -, *, /
print hike salary by 10%
```sql
select ename, sal, sal*1.1 as hike_salary
from emp;
```

Print names of employee's who's salary after hike is more than 2000
```sql
select ename, sal, sal * 1.1 as hike_salary
from emp
where (sal * 1.1) > 2000;
```

#### Ralational operators: 
       < less than, 
       > greater than, 
       <= less than or equal to , 
       >= greater than or equla to, 
       != not equal, 
       <> not equal

Note:
NULL can not be evaluated using relational operators 
Details of the employee who is getting salary more than 2000
```sql
select *
from emp
where sal > 2000;
```

Display ename, sal, job of employee's except  clerk job type
```sql
select ename, sal, job
from emp
where job != 'CLERK';
```

Display ename, sal, job of employee's except  salesman job type
```sql
select ename, sal, job
from emp
where job <> 'SALESMAN';
```

Display ename, sal, job of employee's except mgr number 7839
```sql
select ename, sal, job
from emp
where mgr <> 7839;
```

Q1 select employee detials who are all earning more than 3000
```sql
select * 
from emp 
where sal > 3000;
```

Q2 select employee detials who are all earning more than 1000
```sql
select * 
from emp 
where  sal < 1000;
```

Q3 select employee's who belongs to other than 10
```sql
select * 
from emp 
where deptno <> 10;
```

Q4 select employee's who is not analyst
```sql
select * 
from emp 
where job <> 'ANALYST';
```

Q5 select employee's who is not having mgr no as 7698
```sql
select * 
from emp 
where mgr <> 7698;
```

Q6 select employees who is working as manager
```sql
select * 
from emp 
where job = 'MANAGER';
```

Q7 select employees who is earning more than or equal to 3000
```sql
select * 
from emp 
where sal >= 3000;
```

Q8
```sql
select emp.*, sal * 12 as Annaul_Salary
from emp 
where sal * 12 >= 36000;
```

Q9
```sql
select ename,job,  deptno, sal
from emp
where job = 'MANAGER' 
and sal >2500;
```

####  Logical operators
##### AND operator:
it is used to combine multiple conditions in where clause
It add row to result set  when the all condititons are true given an expression

Q1
```sql
select ename, sal, deptno
from emp
where sal > 2000 
and deptno = 10;
```

Q2
```sql
select *
from emp
where empno = 7902 
and job='SALESMAN';
```

Q3
```sql
select ename, mgr, comm
from emp
where mgr = 7839 
and comm > 300;
```

Q4
```sql
select ename, hiredate, deptno
from emp
where deptno = 20 
and hiredate = '03-DEC-81';
```

Q5
```sql
select ename, job, deptno 
from emp
where deptno = 20 
and job = 'ANALYST';
```

Q6
```sql
select *
from emp
where sal > 1000 
and sal < 3000 
and job='ANALYST';
```

Q7
```sql
select ename
from emp
where empno=7788 
and job <> 'MANAGER' 
and job <>'CLERK';
```

##### OR operator
it used to combine muplitple conditions together
it gives true when any one condition is true among the given condtitons.

```sql
select * 
from emp
where job='MANAGER' 
or job='CLERK';
```
```sql
select ename
from emp
where (job='MANAGER' and deptno=30) 
or (job='CLERK' and deptno=10);
```

```sql
select * 
from emp
where deptno = 20 
or deptno=30;
```
```sql
select *
from emp
where ename='SMITH' 
or ename='SCOTT' or 
ename='ADAMS' or 
ename='FORD';
```

Q1
```sql
select * 
from emp
where deptno=10 
or deptno=20 
or deptno=30 
or deptno=40;
```

Q2
```sql
select ename, sal, job
from emp
where job='SALESMAN'  
or job='MANAGER';
```

ENAME             SAL JOB
  -
ALLEN            1600 SALESMAN
WARD             1250 SALESMAN
JONES            2975 MANAGER
MARTIN           1250 SALESMAN
BLAKE            2850 MANAGER
CLARK            2450 MANAGER
TURNER           1500 SALESMAN

Q3
```sql
select ename, sal, mgr, deptno, job
from emp
where ename='SMITH' 
or ename='MILLER';
```

ENAME             SAL        MGR     DEPTNO JOB
    -
SMITH             800       7902         20 CLERK
MILLER           1300       7782         10 CLERK

Q4
```sql
select empno, ename, job
from emp
where empno=7566 
or empno=7902;
```

     EMPNO ENAME      JOB
  -
      7566 JONES      MANAGER
      7902 FORD       ANALYST

Q5
```sql
select ename
from emp
where mgr=7839 
or mgr=7639;
```

ENAME

JONES
BLAKE
CLARK

##### COMBINATION of AND , OR
we use combination of both AND , OR operators to get required rows into result set in given query problem.
Q1
```sql
select ename, sal, deptno, job
from emp
where job='ANALYST' 
and (deptno=10 or deptno=20);
```

ENAME             SAL     DEPTNO JOB
   -
SCOTT            3000         20 ANALYST
FORD             3000         20 ANALYST

Q2
```sql
select ename, sal, deptno, job
from emp
where sal > 3000 
and (job='CLERK' or job='SALESMAN' or job='MANAGER');
```
 no rows selected

Q3
```sql
select ename, sal, job
from emp
where mgr=7839 
and (job='ANALYST' or job='PRESIDENT') 
and (deptno=10 or deptno=20);
```

 no rows selected


##### NOT operator:
syntax for NOT:
        NOT column_name=value;
```sql
select * 
from emp
where not deptno=20;
```
```sql
select *
from emp
where not (deptno=10 or deptno=20);
```
```sql
select *
from emp
where not deptno=10 and not deptno=20;
```
```sql
select *
from emp
where not (deptno=10 or deptno=20 or job='CLERK' or job='MANAGER');
```

Q1
```sql
select *
from emp
where not deptno=20;
```

Q2
```sql
select *
from emp
where not (job='CLERK' or job='SALESMAN');
```

Q3
```sql
select ename, sal
from emp
where not sal > 3000;
```

##### COMBINATION (AND, OR, NOT)
Q1
```sql
select ename, sal, deptno
from emp
where (sal >2000 and sal < 4000) 
and (job='CLERK' or job='SALESMAN') 
and not deptno=20;
```
Q2
```sql
select ename, sal, job, deptno
from emp
where (deptno=10 or deptno=20) 
and (job='CLERK' or job='MANAGER') 
and not (ename='SMITH' or ename='ALLEN');
```
Q3
```sql
select *
from emp
where sal > 3000 
and job='PRESIDENT' 
and (deptno=10 or deptno=20) 
and not (ename='MARTIN' or ename='MILLER');
```

Q4
```sql
select *
from emp
where sal < 3000 
and (deptno=20 or deptno=30) 
and not(job='MANAGER' or job='PRESIDENT');
```

ORDER OF EXECUTION > FROM -> WHERE -> SELECT ( as of now)