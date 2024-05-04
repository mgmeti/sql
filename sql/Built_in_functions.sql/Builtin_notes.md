# Function 
It is set of instruction to perform a task
function contains: 
1. function name
2. number of arguments
3. return type

Built-in function - Ex: Upper(), Length(), Lower()....
Scalar function - It is Single row fucntion (SRF) used in select, where and order by.
Aggreagate function - It is a Multi row function (MRF) Ex: max(), min(), sum(), avg() and count() 
User defined function - which is created by user for specific task by giving function name, number of arguments and return type.

1. Single Row Function (SRF) : Scalar function
2. Multi Row Function (MRF) : aggregate/group function

SRF() - It takes n number of inputs and executes and produce n number of outputs
    - These functions can appear in select lists, WHERE clauses, START WITH and CONNECT BY clauses, and HAVING clauses.
types of SRF():
        1. charcter function
        2. Number fucntion
        3. Date function
        4. Conversion fucntion
        5. Collection function
        6. Special function 

## Charcter Function  
Source: https://docs.oracle.com/cd/B13789_01/server.101/b10759/functions001.htm 
1. Character Functions Returning Character Values: 
    Return values of the same datatype as the input argument.



2. Character Functions Returning Number Values 
   Return number values can take as their argument any character datatype.



# Note:
dual - a dummy table with one row and one column;
dual table is dummy table present inside the database with 1 row and 1 column and by default it contains value X with varchar2(1) type.
If user want to perform operation based on his own data, he can use of dummy table in his sql statements.
```sql
select * from dual;
```

D   
-
X

# UDF -user defined function
```sql
--Declaration starts
create or replace function sample(v1 number, v2 number)
 return number
 is
 v3 number;
--Declaration ends
--Logic starts
 begin
 v3 := v1 +v2;
 return v3;
 end;
 ```
--Logic ends
```sql
select sample(10, 15) as total from dual;
```

TOTAL
-----
   25

