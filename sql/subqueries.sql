create table bricks (
  brick_id integer,
  colour   varchar2(10)
);

create table colours (
  colour_name           varchar2(10),
  minimum_bricks_needed integer
);

insert into colours values ( 'blue', 2 );
insert into colours values ( 'green', 3 );
insert into colours values ( 'red', 2 );
insert into colours values ( 'orange', 1);
insert into colours values ( 'yellow', 1 );
insert into colours values ( 'purple', 1 );

insert into bricks values ( 1, 'blue' );
insert into bricks values ( 2, 'blue' );
insert into bricks values ( 3, 'blue' );
insert into bricks values ( 4, 'green' );
insert into bricks values ( 5, 'green' );
insert into bricks values ( 6, 'red' );
insert into bricks values ( 7, 'red' );
insert into bricks values ( 8, 'red' );
insert into bricks values ( 9, null );

commit;


select * from    bricks;
select * from colours;

--Inline Views
--An inline view replaces a table in the from clause of your query.

select * from (select * from bricks);

select * from (
  select colour, count(*) "number of bricks"
  from   bricks
  group  by colour
) brick_counts

--This allows you to find out which colours you have fewer bricks of than the minimum needed defined in colours:
select * from (
  select colour, count(*) c
  from   bricks
  group  by colour
) brick_counts
right  join colours
on     brick_counts.colour = colours.colour_name
where  nvl ( brick_counts.c, 0 ) < colours.minimum_bricks_needed;


--using an inline view to find the min and max brick_id for each colour of brick:
select * from (
    select colour,
			min(brick_id),
    		max(brick_id)
    from bricks
	group by colour
) ;

--Nested Subqueries
--Nested subqueries go in your where clause. The query filters rows in the parent tables.
-- to find all the rows in colours where you have a matching brick
select * from colours c
where  c.colour_name in (
  select b.colour from bricks b
);

select * from colours c
where  exists (
  select null from bricks b
  where  b.colour = c.colour_name
);


select * from colours c
where  c.colour_name in (
  select b.colour from bricks b
  where  b.brick_id < 5
);


select * from colours c
where  exists (
  select null from bricks b
  where  b.colour = c.colour_name 
  and    b.brick_id < 5
);

--A subquery is correlated when it joins to a table from the parent query. If you don't, then it's uncorrelated.
--correlated
select * from colours
where  exists (
select null from bricks
where bricks.colour = colours.colour_name
        
);

--uncorrelated -- returns all the rows from colours
select * from colours
where  exists (
select null from bricks
);

-- find all the rows in colours without a matching colour in bricks,
select * from colours c
where  not exists (
  select null from bricks b
  where  b.colour = c.colour_name
);

--And your query returns nothing!
--This is because there is a row in bricks with a null colour.
select * from colours c
where  c.colour_name not in (
  select b.colour from bricks b
);

select * from colours c
where c.colour_name not in (
  select b.colour from bricks b
  where  b.colour is not null
);

--find all the rows in bricks with a colour where colours.minimum_bricks_needed = 2
select * from bricks b
where  b.colour in (
    select colour_name
    from colours 
    where colours.minimum_bricks_needed = 2

);

-- Scalar Subqueries
--Scalar subqueries return one column and at most one row.
--You can replace a column with a scalar subquery in most cases.
--to return a count of the number of bricks matching each colour, 
select colour_name, (
         select count(*) 
         from   bricks b
         where  b.colour = c.colour_name
         group  by b.colour
       ) brick_counts
from   colours c;

--Note the colours with no matching bricks return null. To show zero instead, you can use NVL or coalesce
select colour_name, nvl ( (
         select count(*) 
         from   bricks b
         where  b.colour = c.colour_name
         group  by b.colour
       ), 0 ) brick_counts
from   colours c;


--find those bricks you have less than the minimum needed
select colour, count(*) c
from   bricks b
group  by colour
having count(*) < (
  select c.minimum_bricks_needed 
  from   colours c
  where  c.colour_name = b.colour
);

--To find the minimum brick_id for each colour:
select c.colour_name, (select min(brick_id) from bricks b where b.colour = c.colour_name) min_brick_id
from colours c
where c.colour_name is not null;



--Common Table Expressions (CTE's)
--Common table expressions (CTEs) enable you to name subqueries.

with brick_colour_counts as (
  select colour, count(*) 
  from   bricks
  group  by colour
) 
  select * from brick_colour_counts ;


--CTEs: Reusable Subqueries
--to find:
    -- Which colours you have more bricks of than the minimum needed
    -- The average number of bricks you have of each colour

--Logic 
    -- You need to group the bricks by colour. 
    -- Then filter the colours table where this count is greater than the minimum_bricks_needed for that colour.
    -- And compute the mean of the counts.
with brick_counts as (
  select b.colour, count(*) c
  from   bricks b
  group  by b.colour
)
  select c.colour_name, 
         c.minimum_bricks_needed, (
           select avg ( bc.c )
           from   brick_counts bc
         ) mean_bricks_per_colour
  from   colours c
  where  c.minimum_bricks_needed < (
    select bc.c
    from   brick_counts bc
    where  bc.colour = c.colour_name
  );

with brick_counts as ( 
  -- 1. Count the bricks by colour
  select b.colour, count(*) c
  from   bricks b
  group  by b.colour
), average_bricks_per_colour as ( 
  -- 2. Take the average of these counts
  select avg ( c ) average_count
  from   brick_counts
)
  select * from brick_counts bc  
  join   average_bricks_per_colour ac
  -- 3. Return those rows where the value in step 1 is less than in step 2
  on     bc.c < average_count; 

--Testing Subqueries
  with brick_counts as (
  select b.colour, count(*) c
  from   bricks b
  group  by b.colour
), average_bricks_per_colour as (
  select avg ( c ) average_count
  from   brick_counts
)
  select * from brick_counts bc;

-- to count how many rows there are in colours:

with colour_count as (
select count(*)
from colours)

select * from colour_count;