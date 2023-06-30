/*1.	Pass DEPTNO to the function (named sumSalary) and calculate the sum of salary.(Use: EMP table)*/
DROP function if exists func1;
delimiter $
create function func1(dep int) returns int
deterministic
begin
set @x=0;
if (select deptno from dept where deptno=dep) is not null
then
select avg(sal) into @x from emp where deptno=dep;
end if;
RETURN @x;
end $
delimiter ; 

/*mysql> source C:\Users\IET\Desktop\MyPrograms\mySQL\Assignment 4\Assginment127.sql
Query OK, 0 rows affected (0.06 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> select func1(20);
+-----------+
| func1(20) |
+-----------+
|      2422 |
+-----------+
1 row in set (0.00 sec)*/

/*
2.	Create a new table called STUDENT_NEW having following columns (studentID, namefirst, namelast, DOB, and emailID). Write a function names autoNumber to return auto generate studentID and return the new value (Use: STUDENT_NEW table).*/

drop function if exists autoNumber;
delimiter #
create function autoNumber() returns INT
deterministic
begin 
declare x int DEFAULT 0;
select count(*)+1 into x from student_new;

return x;
end #
delimiter ;

/*mysql> select autoNumber();
+--------------+
| autoNumber() |
+--------------+
|            2 |
+--------------+
1 row in set (0.00 sec)*/

/*3.	Write a function which will accept email-ID from the user, if the email-ID is present return his username and password or else `Return “Employee not exists”. (Use: LOGIN table)*/

drop function if EXISTS username1;
delimiter $
create function username1(str1 varchar(90)) returns varchar(90) 
deterministic
begin
DECLARE str2 VARCHAR(100) DEFAULT "";
DECLARE str3 VARCHAR(100) DEFAULT "";
if (select emailid from login where emailid=str1) is not null
then
select concat("username:",username," password:",password) into str2 from login where emailid=str1 limit 1;
return str2;
else 
set str3="Rmployee does not exists";
return str3;
end if;
end $
delimiter ;

/*4.	Write a function which will accept studentID from the user and calculate the sum of (10th, 12th, and BE) marks.*/

drop function if exists username2;
delimiter $
create function username2(s_id int) returns int
begin 
declare i,j,k int;
select marks into i from student_qualifications where studentid=s_id and name='10';
select marks into j from student_qualifications where studentid=s_id and name='12';
select marks into k from student_qualifications where studentid=s_id and name='BE';
if k is not null 
then 
return i+j+k;
else
return i+j;
end if;
end $
delimiter ;