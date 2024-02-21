--Athor: ARJUN
--date: 21-02-2022


--Keywords used to work with sqlPlus software
--SHOW:
--It is used to show curent user, tab, pages and lines size
show tab;
show user;
show pages;
show lines;

--SET:
--It is used to set pages and & lines size
--It is not permanent change, and changes are session specific.
set pages 200 lines 200;

--CL SCR:
--It is used to clear current screen
cl scr;

--DESC/DESCRIBE:
--It is used to decribe the a table
--It will give details like column names, about null contraint, datatypes with sizes
desc table_name;
decribe table_name;

--ED:
--It used to edit previous sql statement in notepad
--After changes made, save the file, and close the notepad.
-- Enter '/' to run statement.
ed;

--CONNECT:
--It is used to connect to different user in the database by entering username and password.

--TO CREATE NEW USER 
--Need to login as sys user
connect;
--enter: sys as sysdba
--password
--create a user
create user user_name  identified by password;
create user a1 identified by tiger;

--Grant resource
grant resource, connect to a1;


