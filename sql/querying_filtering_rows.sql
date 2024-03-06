create table toys (
  toy_name varchar2(100),
  colour   varchar2(10),
  price    number(10, 2)
);

insert into toys values ( 'Sir Stripypants', 'red', 0.01 );
insert into toys values ( 'Miss Smelly_bottom', 'blue', 6.00 );
insert into toys values ( 'Cuteasaurus', 'blue', 17.22 );
insert into toys values ( 'Mr Bunnykins', 'red', 14.22 );
insert into toys values ( 'Baby Turtle', 'green', null );

commit;


-- Selecting Rows

select * from toys;

select price, colour, toy_name 
from toys;

--Selecting only necessary columns improves performance by reducing data sent over the network, 
--making applications faster and code more resilient. 
--Avoid using '*' to prevent errors when columns are added or removed from the table.


-- Filtering Data
select * from toys
where  colour = 'red';
--The query only returns rows where the whole clause is true.

--Combining Criteria
--AND
--This returns the rows where both conditions are true.
select * from toys
where  toy_name = 'Sir Stripypants'
and    colour = 'green';

--OR
--OR fetches all the rows where either of the criteria are true
select * from toys
where  toy_name = 'Sir Stripypants' or
       colour = 'green';

--Order of Precedence
--AND has higher priority than OR. 
select * from toys
where  toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle'
and    colour = 'green';
--The colour is green and the toy_name is "Baby Turtle"
--Or the toy_name is "Mr Bunnykins"

select * from toys
where  colour = 'green'
and    toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle';
--The colour is green and the toy_name is "Mr Bunnykins"
--r the toy_name is "Baby Turtle"

select * from toys
where  ( toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle' )
and    colour = 'green';
--Both will give same result as ( ) processed first by database
select * from toys
where  colour = 'green'
and    ( toy_name = 'Mr Bunnykins' or toy_name = 'Baby Turtle' );


--Lists of Values match in a column
select * from toys
where  colour in ( 'red' , 'green' );

--Ranges of Values
select * from toys
where  price < 10;

select * from toys
where  price >= 6;

select * from toys
where  price between 6 and 20;

select * from toys
where  price >= 6
and    price <= 20;

select * from toys
where  price > 6 
and    price <= 20;

select *
From toys
where colour in ('red', 'blue') and (price >= 6 and price <14.22)


--Wildcards
--Underscore (_) matches exactly one character
--Percent (%) matching zero or more characters
select * from toys
where  colour like 'b%';

select * from toys
where  colour like '%n';

--finds all the rows with toy_names eleven characters long
select * from toys
where  toy_name like '___________';

select * from toys
where  colour like '_e_';
--> _e_ => any colour with exactly one character either side of e (red)

select * from toys
where  colour like '%e%';
--> %e% => any colour that contains e anywhere in the string (red, blue, green)

select * from toys
where  colour like '%_e_%';
--> %_e_% => any colour with at least one character either side of e (red, green)

--Searching for Wildcard Characters
select * from toys
where  toy_name like '%\_%' escape '\';

select * from toys
where  toy_name like '%#_%' escape '#';

select toy_name
from toys
where toy_name like '%B%';

--null This is neither equal to nor not equal to anything!
select * from toys
where  price is null;

--Negation
select *
from   toys 
where  not colour = 'green';

select *
from  toys 
where colour <> 'green';

select *
from   toys 
where  colour is not null;

select toy_name
from toys
where colour <> 'green' and price <> 6;

