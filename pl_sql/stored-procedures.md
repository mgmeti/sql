It is set of statements with name which is executed everytime whenever it is called.






```sql
create or replace procedure update_sal_by_empno(target_empno in number, amount in number)
as
begin 
    update emp
    set sal = sal + amount
    where empno =  target_empno;
end;
/
```

Syntax to execute plsql statements
```sql
exec procedure_names(arg1, arg2, arg3, .....);
```


Create stored proceudre to update the commission of particular employee.
```sql
create or replace procedure update_commission_by_empno(target_emono in number, commission_amount in number)
as
begin
    update emp
    set comm = commission_amount
    where empno = target_emono;
end;
/
```

re-write above query to commit after update and give successful message with commission amount.
```sql
create or replace procedure update_comm_with_msg(target_empno in number, commission_amount in number, msg out number)
as
begin
    update emp
    set comm = commission_amount
    where empno = target_empno;
    commit; 
    select comm into msg from emp where empno = target_empno;
end;
/


```
syntax for binding the variables.
```sql
variable variable_name varaible_type;
```

What is binding variable?
It is variable which is used to store the out-type parameter from the procedure.

Note: 
    Binding variables must be always defined using :bind_variable_name

```sql
print :bind_variable_name;
```
