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