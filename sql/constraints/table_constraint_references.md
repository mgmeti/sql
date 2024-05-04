create table with constraints with references
```sql
create table doctor(
id number(3),
name varchar2(25),
spec varchar2(15),
constraint pk_id  primary key(id),
constraint uniq_spec unique(spec)
);
```


```sql
create table patient(
id number(5),
name varchar2(25) not null,
disease varchar2(30),
did number(3),
constraint pid_pk primary key(id),
constraint did_fk foreign key(did) references doctor(id)
);
```

