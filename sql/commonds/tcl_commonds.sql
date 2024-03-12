--TCL --> Transaction Control Language [COMMIT, ROLLBACK, SAVEPOINT]
--TCL are applied to only for DML trasactions like insert, update, and delete
--TCL commonds are used to control transaction done by DML commonds.
--NOTE: 
        --Transaction: one unit of work is done by using one or more sql commonds

--COMMIT --> Saves the data permanently into the database.
-- Syntax: commit;
commit;

--ROLLBACK --> used to undo the transaction till last commit.
-- syntax: rollback;
rollback;
