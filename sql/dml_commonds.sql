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

--To insert multiple records at time in sqlplus
--insert into table_name values(&col_name1, &col_name2);
--ENTER the data per record, per column by using the enter button
--For the next record use '/'.

--TO copy data from another table 
--insert into to_table_name(col_names) select col_names from from_table_name;
insert into vpc(pid, pd) select prod_id, prod_desc from vp;

--UPDATE COMMAND
--syntax: update t_name set col_name='new_value' where <condition>;
update trainer set course='js' where id=10;

--for multiple values for multiple columns
update trainer set name='rajkumar', course='drama' where id=5;

--TO update the whole column at a time
update trainer set course='same_course';
--To swap data from one column to another
update trainer set course=name, name=course;
--NOTE: Datatype and size should be checked before swapping data;




--NOTE:
  set autocommit on;
	set autocommit off;
	commit;
