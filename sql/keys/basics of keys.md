### KEYS
Attribute or set of attributes which help you uniquely indentify a record or row data in a table.

#### Keys Types
        1. super key
        2. candidate key
        3. primary key
        4. foreign key
        5. alternative key
        6. unique key


#### Super Keys 
An attribute or set of attributes that can be used to indentify the row data in a table is a super key.
A super key in Oracle is a set of attributes that can uniquely identify a row in a table. 
For example, in a "Students" table, 
Attributes: are regid, sid, sname, email, phno 
In this the regid, sid, and email can not be duplicated where the super keys are: 
regid, email, sid, sid+email, email+regid, regid+sid+email etc.....



#### Candidate Keys
A minimal subset of super key.
A candidate key is a minimal super key, meaning it is a super key with no redundant attributes. 

A candidate key is a subset of a super key, and all candidate keys are super keys, but not all super keys are candidate keys. 

sid, regid, and email can be the candidate keys.
In this the regid, sid, and email can not be duplicated 

#### Primary Key
A primary key is one of the candidate key which is uniquely used to identify.
sid || regid || email any one of it can be made it as primary key.


A primary key is a specific super key set of attributes that is picked to serve as the unique identifier for rows of a table. 

            Every table must have one or more fields designated as the primary key. 
            This designation occurs at the time that the table is created, and cannot be changed after the fact. 
            A table's primary key uniquely identifies every row in the table. 
            In the simplest case, it is used to retrieve a specific row so that it can be examined and/or modified.




#### Alternate keys
The keys other than primary key in candidate keys are called as alternate keys.

#### unique key
It is a attribute which can contain only one null value in it and all other values are different from one another.

#### foriegn key
It is used to build a relation between one table to another table.

#### composite key
It is combination of two or more attibute which uniquely identify records.
 
You can use multiple fields for your primary key, which is termed as a composite key.

The composite keys are useful in cases where the keys conjointly help in identifying a unique row.

