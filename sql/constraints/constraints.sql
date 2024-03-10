--Constraints
        --NOT NULL
        --UNIQUE
        --PRIMARY KEY
        --FOREIGN KEY
        --CHECK
        --DEFAULT

--NOT NULL ->To avoid null vlaues(empty space)
column_name number(5) not null;

--UNIQUE --> To avoid duplicate values
column_name number(5) unique;

--PRIMARY KEY --> It is combination of not null and unique constraints
    --> it will act as index to access the records in the table.
    --> Only one per table
column_name number(5) primary key;

--FOREIGN KEY --> It will help to establish a relation between tables
        -->A table can have more than one FK
        -->It can hold null and duplicate values.
column_name number(5),
foreign key(column_name) references parent_table_name(column_name);

--CHECK -->A predfined condition for values to include
column_name number(10) check(length(column_name)=10);

--DEFAULT --> A predefined value tpo store in column if the user did not give value while insertion
column_name number(10) default 91919191991;
branch varchar2(5) default 'MECH';
