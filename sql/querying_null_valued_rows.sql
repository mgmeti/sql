--Querying Null-valued Rows
create table toys (
  toy_id               integer not null primary key,
  toy_name             varchar2(100) not null,
  weight               number(10, 2) not null,
  quantity_of_stuffing integer,
  volume_of_wood       integer,
  times_lost           integer
);

insert into toys values (1, 'Mr. Penguin', 50, 100, null, 10);
insert into toys values (2, 'Blue Brick', 10, null, 10, null);
insert into toys values (3, 'Red Brick', 20, null, 20, 1);
commit;


select * from toys
where  volume_of_wood <> null;

select * from toys
where  volume_of_wood = null;
--Above queries will give no records
--Null is neither equal to nor not equal to anything. 

select *
from   toys
where  volume_of_wood is null;

select *
from toys
where times_lost is null;

select *
from   toys
where  volume_of_wood is not null;
     
select * from toys
where  volume_of_wood < 15 or
       volume_of_wood is null;

select * from toys
where  volume_of_wood < 15;
--Here no null values are returned.

--Null functions

--NVL
--This takes two arguments. If the first is null, it returns the second:

select toy_name, volume_of_wood, nvl ( volume_of_wood , 0 ) mapped_volume_of_wood
from   toys;

--Coalesce
--This is like NVL. But it can take any number of arguments. It returns the first non-null value it finds:

select t.*,
       coalesce ( volume_of_wood , 0 ) coalesce_two,
       coalesce ( times_lost, volume_of_wood , quantity_of_stuffing, 0 ) coalesce_many
from   toys t;


select *
from   toys
where  nvl ( volume_of_wood , 0 ) < 15;

select *
from   toys
where  coalesce ( volume_of_wood , 0) < 15;
--These two queries will give records including null values in volume_of_wood column
--Note: we have not used is null expression.

--to find all the rows where times_lost is less than 5 or null:
select *
From toys
where nvl(times_lost, 0) < 5;


--We can use magic values for null place but they will bring difficulty time elesewhere in the analysis.
--So using null function while dealing with null values is a recommended.

