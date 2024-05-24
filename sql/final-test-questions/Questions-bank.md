1. Update the salary of employees to be 10% higher if they have been with the company for more than 5 years.
```sql
update emp
set sal = sal * 1.1
where round(months_between(current_Date, hiredate)/12) > 5
;
```
2. Update NULL values in a certain column with the average value for that column.
```sql
update emp
set your_column  = (select avg(uour_column) from your_table)
where your_column is null;
```

3. Find the average salary, excluding NULL values, for each department.
```sql
select deptno,  avg(sal)
from emp
where sal is not null
group by deptno;
```
4. Create a query to find the departments where the average salary is greater than the company's average salary.
```sql
select dname
from emp
join dept
on emp.deptno = dept.deptno
group by dname
having avg(sal) > (select avg(sal) from emp);
```

5. display deptname, no. of employees with max salary of each dept if at least  2 managers working in each department.
```sql
select dname, count(*) as "no of employee", max(sal)
from emp
join dept
on emp.deptno = dept.deptno
where job = 'MANAGER'
group by dname
having count(*) >= 2
;
```

6. delete duplicates from employee table.
```sql
delete from emp
where rowid not in (select max(rowid) from emp grouby by empno, ename, sal, deptno);
```


7. Display employee name who dont have manager without using is null.
```sql
select *
from emp
where nvl(mgr, 0)=0;
```

```sql
select e.ename
from emp e
where e.mgr not in (select m.empno from emp m where m.empno = e.mgr);