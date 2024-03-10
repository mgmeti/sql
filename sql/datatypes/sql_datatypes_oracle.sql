--Datatypes
--It is applied at column level
--Specified while creating table
--char, varchar2(), number(p, s), date, timestamp, clob, blob

--char -> FIXED MEMORY, Stores alphanumeric values, 
        --'value' -> single quotes are used
        -- default size if char is 1
--varchar2(size) -> FLEXIBLE MEMORY, stores alphanumeric values, 
        --'value' -> single quotes are used
        -- should give size argument.
--number(p, s) -> p-precision, s-scale
        --> number(3, 0) -->-999, 999
        -->number(3, 1) --> -99.9, 99.9
        -->number(3, -1) --> 990, -990

create table data_type(
    date_col date,
    num_col number(3),
    varchar_col varchar2(25),
    timestamp_col timestamp,
    blob_col blob,
    clob_col clob,
)