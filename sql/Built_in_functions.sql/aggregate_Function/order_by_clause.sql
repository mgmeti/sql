/*
order by clause:
        1. sort the data ascending ASC / descending DESC.
        2. Can be used with SRF(), MRF()
        3. we can use more than one column to sort in order byc clause
        4. we  can use column numbers generated by system while sorting using order by clause.
        

Syntax:
    select group function/columns/expressions  ->5
    from table_name   ->1
    where <condition>  -> 2
    group by column_1, column_2   -> 3
    having <condition>     -> 4
    order by column_1, column_2;  -> 6

Note:
    # we can skip using group by, having and where conditions
*/

--Sort the result table by sal in descending
select sal 
from scott.emp
order by sal desc;

--Sort the result table by sal in ascending
select sal ,ename
from scott.emp
order by sal asc;
-- using column number of result set(table)
select ename, sal 
from scott.emp
order by 2 desc;

select ename, length(ename)
from emp
order by length(ename);


select ename, round(months_between(current_date,hiredate)/12)as exp
from emp
order by exp desc;


select ename, round((current_date - hiredate)/365)as exp
from emp
order by exp desc;

 


