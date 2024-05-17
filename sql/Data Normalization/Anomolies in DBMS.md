In Database Management System (DBMS), 
anomaly means the inconsistency occurred in the 
relational table during the operations performed on the relational table.

They prevent update anomalies and inconsistencies in the data.

There can be three types of an anomaly in the database

[The Basics of Database Normalization](https://www.lifewire.com/database-normalization-basics-1019735)


Normalization is the process of efficiently organizing data in a database.

There are two goals of the normalization process: eliminating redundant data (for example, storing the same data in more than one table) and ensuring data dependencies make sense (only storing related data in a table).
 
as they reduce the amount of space a database consumes and ensure that data is logically stored.

#### The Normal Forms
The database community has developed a series of guidelines for ensuring that databases are normalized.

In practical applications, you'll often see 1NF, 2NF, and 3NF, along with the occasional 4NF.

First Normal Form (1NF)
First normal form (1NF) sets the fundamental rules for an organized database:

    a. Eliminate duplicative columns from the same table.
    b. Create separate tables for each group of related data and identify each row with a unique column or set of columns (the primary key).

Second Normal Form (2NF)
Second normal form (2NF) further addresses the concept of removing duplicative data:
    a. Meet all the requirements of the first normal form.
    b. Remove subsets of data that apply to multiple rows of a table and place them in separate tables.
    c. Create relationships between these new tables and their predecessors through the use of foreign keys.

Third Normal Form (3NF)
Third normal form (3NF) goes one significant step further:
    a. Meet all the requirements of the second normal form.
    b. Remove columns that are not dependent upon the primary key.

Boyce-Codd Normal Form (BCNF or 3.5NF)
The Boyce-Codd Normal Form, also referred to as the "third and half (3.5) normal form," adds one more requirement:

        Meet all the requirements of the third normal form.
        Every determinant must be a candidate key.
Fourth Normal Form (4NF)
Finally, fourth normal form (4NF) has one additional requirement:

        Meet all the requirements of the third normal form.
        A relation is in 4NF if it has no multi-valued dependencies.

