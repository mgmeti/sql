### DDl commonds
create
drop
rename 
alter
truncate
Note: all ddl commonds are brings permanent changes

#### CREATE
```sql
create table table_name (
    id number(5),
    col_name number(2),
    col_varchar varchar2(5),
    col_date date,
    constraint pk_id primary key(id),
    constraint uniq unique(col_name)
)

create table parts
 (
 pid number(4) primary key,
 pname varchar(50),
 pdescription varchar2(150)
 )
```

#### DROP
```sql
drop table table_name;

drop table parts;
```
Note:
1. Dropped table moves to recyclebin and bin address will be stored in current user tab.
2. To restore any dropped table
 2.a flashback restores latest dropped table(for name conflict)

```sql
flashback table table_name to before drop;

flashback table parts to before drop;
```

3. To remove table from recyclebin permanently.
```sql
purge table table_name;

purge table parts;
```


4. TO REMOVE TABLE STRUCTURE AND RECORDS PERMANENTLY (WITHOUT MOVING TABLE TO RECYCLBIN)
```sql
drop table table_name purge;
drop table p1 purge;
```


#### TRUNCATE
 removes only records (records con't be restored)
 table structures remains

```sql
truncate table table_name;

truncate table p1;

```

#### RENAME
To change name of table
```sql
rename old_table_name to new_table_name;
```

Note:
TO copy columns and records from one table to new table.
```sql
create table new_table_name as select * from old_table_name; 
```

1. To store the data in a specific new column or at specific cell, we need to use update.
2. insert always creates a new record in table.

#### ALTER
General syntax form:
```sql
alter table table_name add/drop/rename/modify
```

##### Add a column to a table 
```sql
alter table table_name add col_name datatype;
alter table emp1 add email varchar2(25);
alter table p add email varchar2(25);
```

##### drop a column from a table
```sql
alter table table_name drop column col_name;
alter table emp1 drop column comm;
alter table p drop column email;
```

##### rename a column
```sql
alter table table_name rename column old_col_name to new_col_name;
alter table emp1 rename column hiredate to joindate;
alter table p rename column comm to commision;
```
Note: rename  a table
```sql
alter table table_name raname to new_table_name;
alter table emp1 rename to emp2;
```

##### change the datatype with contraints
```sql
alter table table_name modify column_name new_datatype;
alter table emp2 modify email varchar2(20);
```

NOTE: 
	Columns needs to be empty while changing to new datatype of column
	We can increase datatype size or decrease upto maximum size of stored data in column

#### drop constraints
To drop a primary key from a table
 First need to drop constraints from child tables
 then we can drop primary key from the parent table
```sql
alter table child_table_name drop constraint constraint_fre_name;
alter table parent_table_name drop primary key;
```


 add  FK's
 Need to add column to the child table with column name and datatype,
```sql
alter table child_tab_name add col_name datatyp(size);
alter table cust add ono number(5);
```

Need to make that new column as FK by referncing to the parent table
```sql
alter table child_tab_name add foreign key(new_col_name) references  	parent_tab_name(col_name);
alter table cust add foreign key(ono) references ord(ono);
```
