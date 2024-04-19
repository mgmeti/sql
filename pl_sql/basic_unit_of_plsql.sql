--BLOCKS are basic units
-- # blocks are there
        -- DECLARATION BLOCK (OPTIONAL)
        -- EXECUTION BLOCK (MUST)
        -- EXCEPTION HANDLING BLOCK (OPTIONAL)

--------------------------------
declare
    v_name varchar2(25);
    v_number number;
begin 
        v_name := 'arjun';
        v_number := 1000;

        dbms_output.put_line('Name '|| v_name);
        dbms_output.put_line('number '|| v_number);
end;
/
----------------------------------------

--Select into..
declare
        name varchar2(20);
        salary number(8);
begin
        select ename, sal into name, salary
        from emp
        where empno = 7686;
        dbms_output.put_line('Name '|| name || ' and salary '||salary);
end;
/

----------------------------------------------
declare
 num number := 100;
begin
   dbms_output.put_line(num);
end;
/
