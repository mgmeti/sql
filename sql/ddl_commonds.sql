-- DDl commonds
--create
--drop
--rename
--alter
--truncate
-- all ddl commonds are brings permanent changes

drop table table_name;

-- table moved to recyclebin and bin address will be stored in current user tab.
-- to restore dropped table
-- flashback restores latest dropped table(for name conflict)

flashback table table_name to before drop;

-- to remove table from recyclebin

purge table table_name;


--Note: TO REMOVE TABLE STRUCTURE AND RECORDS PERMANENTLY (WITHOUT MOVING TABLE TO RECYCLBIN)
drop table table_name purge;


--TRUNCATE
-- removes only records (records con't be restored)
-- table structures remains

truncate table table_name;

--RENAME
-- to change name of table

rename old_table_name to new_table_name;

--TO copy columns and records from one table to new table.

create table new_table_name as select * from old_table_name; 

--NOTE: 1) To store the data in a specific new column or at specific cell, we need to use 	update.
--	2) insert always creates a new record in table.

--ALTER
--Add a column, 
--alter table table_name add col_name datatype;
alter table emp1 add email varchar2(25);

--drop a column
--alter table table_name drop column col_name;
alter table emp1 drop column comm;

--rename a column
--alter table table_name rename column old_col_name to new_col_name;
alter table emp1 rename column hiredate to joindate;
-- rename  a table
--alter table table_name raname to new_table_name;
alter table emp1 rename to emp2;

-- change the datatype with contraints
--alter table table_name modify column_name new_datatype;
alter table emp2 modify email varchar2(20);

--NOTE: 
--	Columns needs to be empty while changing to new datatype of column
--	We can increase datatype size or derease upto maximum size of stored data in column

--drop contraints


-- add  FK's