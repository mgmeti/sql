### TCL 
Transaction Control Language [COMMIT, ROLLBACK, SAVEPOINT]
TCL are applied to only for DML(Data Manipulation Language) trasactions like insert, update, and delete
TCL commonds are used to control transaction done by DML commonds.
NOTE: 
        Transaction: one unit of work is done by using one or more sql commonds

### COMMIT 
 Saves the data permanently into the database.
Syntax: 
        commit;
```sql
commit;
```

### ROLLBACK 
Used to undo the transaction till last commit.
syntax: 
        rollback;
```sql
rollback;
```
