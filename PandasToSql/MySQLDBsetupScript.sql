/* Db instance details */
endpoint: myawsmysqldb.czdvq5jjxd9p.us-east-1.rds.amazonaws.com
Databasename: sivadb

create table tips
(total_bill float, 
tip float,
sex varchar(10),
smoker varchar(3), 
day varchar(10), 
time varchar(10), 
size int);

desc tips;

select * from tips;
