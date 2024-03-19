create table otp_details(
    mob_no number(10),
    otp number(6),
    otp_generated_time date,
    otp_expired_time  date
);

select dbms_random.value(1, 10) "random value" from dual;

select trunc(dbms_random.value(1, 10)) "random value" from dual;

select sysdate from dual;

select to_char(sysdate, 'dd-mm-yyyy HH24:MI:SS') from dual;

select to_char(sysdate+1, 'dd-mm-yyyy HH24:MI:SS') from dual;

select to_char(sysdate, 'dd-mm-yyyy HH24:MI:SS') from dual;

select to_char(sysdate+(1/24), 'dd-mm-yyyy HH24:MI:SS') from dual;

select to_char(sysdate+(1/(24*60)), 'dd-mm-yyyy HH24:MI:SS') from dual;

select to_char(sysdate+(5/(24*60)), 'dd-mm-yyyy HH24:MI:SS') from dual;

insert into otp_details values(
    '1234567890',
    trunc(dbms_random.value(1, 10)),
    to_char(sysdate+1, 'dd-mm-yyyy HH24:MI:SS'),
    to_char(sysdate+(1/(24*60)), 'dd-mm-yyyy HH24:MI:SS')
);

insert into otp_details values(
    '1234567890',
    trunc(dbms_random.value(1, 10)),
    sysdate,
    sysdate+(1/(24*60))
);


create table dt(
    mob_no number(10),
    otp number(6),
    otp_generated_time timestamp,
    otp_expired_time  timestamp
);

insert into dt values(
    1234567890,
    trunc(dbms_random.value(1, 10)),
    sysdate,
    sysdate+(3/(24*60))
);

select * from dt;

select * 
from dt
where mob_no = 1234567890 and otp = 5 and sysdate between otp_generated_time and otp_expired_time ;