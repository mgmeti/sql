--DML[insert, delete, update]
--Data manipulation language
--These commands are not auto-committed(no permanent change until we use TCL commands)
--to save changes to db, we need to call commit.
-- select ... into -> dql -it is part of DML.

--INSERT
--insert values to the table
--insert into table_name[optional-column names] values ((one record-value1,value2..),(second record-value1, value2...));

insert into ord values(5, null);
insert into ord values(4, 'ORDER RECEIVED');


--It is used to insert values to specific columns.
insert into cust(cno, ono, name) values(6, 5, 'arjun');

--It will include null values for other columns.
insert into cust(cno) values(8); 

--NOTE:
  set autocommit on;
	set autocommit off;
	commit;
