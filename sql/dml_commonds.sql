--DML[insert, delete, update]
--Data manipulation language
--These commonds are not auto-committed(no permanent chnage until we use TCL commonds)
--to save changes to db, we need to call commit.
-- select ... into -> dql -it is part of DML.

--INSERT
--insert values tot the table
--insert into table_name[optional-column names] values ((one record-value1,value2..),(second record-value1, value2...));

insert into ord values(5, null);
insert into ord values(4, 'ORDER RECEIVED');
