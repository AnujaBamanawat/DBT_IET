/*1.	Write a procedure to accept a string and print all characters in separate lines.
Input: - Ram
Output: - R
          a
          m
*/

DROP PROCEDURE IF EXISTS pro1;
delimiter $
CREATE PROCEDURE pro1(str VARCHAR(90))
BEGIN
DECLARE len int DEFAULT (1);
DECLARE str1 VARCHAR(78) DEFAULT "";
l1:LOOP
SELECT SUBSTR(str,len,1);
set len=len+1;
if len=LENGTH(str)+1 then 
leave l1;
end if;
end LOOP l1;
end $
delimiter ;

/*mysql> source C:\Users\IET\Desktop\MyPrograms\mySQL\Assignment 3\Assignment126.1.sql
Query OK, 0 rows affected (0.06 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> call pro1('ram');
+-------------------+
| SUBSTR(str,len,1) |
+-------------------+
| r                 |
+-------------------+
1 row in set (0.02 sec)

+-------------------+
| SUBSTR(str,len,1) |
+-------------------+
| a                 |
+-------------------+
1 row in set (0.02 sec)

+-------------------+
| SUBSTR(str,len,1) |
+-------------------+
| m                 |
+-------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.03 sec)*/


/*-----------------------------------------------------------------------*/

/*2.	Write a procedure to accept a string and print every character separated by a comm sign.
Input: - SALEEL
Output: - S, A, L, E, E, L
*/

DROP PROCEDURE IF EXISTS pro2;
delimiter $
CREATE PROCEDURE pro2(str VARCHAR(90))
BEGIN
DECLARE len int DEFAULT (0);
DECLARE str1 VARCHAR(90) DEFAULT "";
l1:LOOP
set str1 = concat(str1,substr(str,len,1));
set str1 = concat(str1,',');
set len=len+1;
if len = length(str)+1 THEN
leave l1;
end if;
end loop l1;
set str1 = substr(str1,2,length(str1)-2);
SELECT str1;
end $
delimiter ;

/*mysql> call pro2('saleel');
+-------------+
| str1        |
+-------------+
| s,a,l,e,e,l |
+-------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)*/

/*-----------------------------------------------------------------------*/

/*3.	Write a procedure to accept an alpha numeric string and separate number and characters of the string.
Input: - SAL1234EEL
Output: - SALEEL
                 1234
*/

DROP PROCEDURE IF EXISTS pro3;
delimiter $
CREATE procedure pro3(str VARCHAR(90))
BEGIN
DECLARE init int DEFAULT 1;
DECLARE str1 VARCHAR(90) DEFAULT "";
DECLARE str2 VARCHAR(78) DEFAULT "";
l1:LOOP
if find_in_set(substr(str,init,1),'0,1,2,3,4,5,6,7,8,9') then
set str1 = concat(str1, substr(str,init,1));
set init = init + 1;
else
set str2 = CONCAT(str2, substr(str,init,1));
set init = init + 1;
end if;
if init=length(str)+1 then 
leave l1; 
end if;
end loop l1;
select str1 as `Number String`;
select str2 as `Character String`;
end $
delimiter ;

/*-----------------------------------------------------------------------*/
/*
4.	Write a procedure to print all employee name and his job in following format.
Input: - KING PRESIDENT
              SCOTT ANALYST
Output: - K(ING) is [PRESIDENT]
                 S(COTT) is [ANALYST]

*/

drop PROCEDURE if EXISTS pro4;
delimiter $
create procedure pro4()
BEGIN
select concat(concat(substr(ename,1,1),'('),concat(substr(ename,2,length(ename)-1),')'),' as ','[',job,']') as result from emp;
end $
delimiter ;

/*mysql> call pro4();
+-------------------------------------+
| result                              |
+-------------------------------------+
| G(ITA) as [Compliance officers]     |
| V(RUSHALI) as [Compliance officers] |
| S(HARMIN) as [Public Relation]      |
| B(ANDISH) as [Public Relation]      |
| S(MITH) as [CLERK]                  |
| A(ARAV) as [CLERK]                  |
| T(HOMAS) as [CLERK]                 |
| A(LLEN) as [SALESMAN]               |
| W(ARD) as [SALESMAN]                |
| J(ONES) as [MANAGER]                |
| M(ARTIN) as [SALESMAN]              |
| B(LAKE) as [MANAGER]                |
| C(LARK) as [MANAGER]                |
| S(COTT) as [ANALYST]                |
| K(ING) as [PRESIDENT]               |
| F(RED) as [vice PRESIDENT]          |
| T(URNER) as [SALESMAN]              |
| A(DAMS) as [CLERK]                  |
| J(AMES) as [CLERK]                  |
| F(ORD) as [ANALYST]                 |
| H(OFFMAN) as [MANAGER]              |
| G(RASS) as [SALESMAN]               |
| M(ILLER) as [CLERK]                 |
| A(ARUSH) as [SALESMAN]              |
| A(LEX) as [MANAGER]                 |
| N(ATASHA) as [CLERK]                |
| S(ANGITA) as [Compliance officers]  |
| S(UPRIYA) as [ANALYST]              |
+-------------------------------------+
28 rows in set (0.00 sec)

Query OK, 0 rows affected (0.04 sec)*/


/*-----------------------------------------------------------------------*/
/*
5.	Write a procedure to print all upper and lower characters separately. 
Input: - AbCdEfG
Output: - ACEG
          bdf
*/

drop procedure if EXISTS pro5;
delimiter $
CREATE procedure pro5(str VARCHAR(66))
BEGIN
DECLARE init int DEFAULT 1;
DECLARE str1 VARCHAR(34) DEFAULT "";
DECLARE str2 VARCHAR(56) DEFAULT "";
l1:LOOP
if (binary substr(str, init, 1) BETWEEN 'a' and 'z')
THEN
set str1 = concat(str1, substr(str,init,1));
set init = init + 1;
else
set str2 = CONCAT(str2, substr(str,init,1));
set init = init + 1;
end if;
if init = LENGTH(str)+1 then leave l1; end if;
end loop l1;
select str1;
SELECT str2;
end $
delimiter ;

/*
mysql> call pro5('AbCdEfG');
+------+
| str1 |
+------+
| bdf  |
+------+
1 row in set (0.00 sec)

+------+
| str2 |
+------+
| ACEG |
+------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)*/


/*-----------------------------------------------------------------------*/
/*
6.	Write a procedure to find the number of vowels, digits and white spaces */


/*Needs fix*/
DROP PROCEDURE IF EXISTS pro6;
delimiter $
create procedure pro6(str VARCHAR(90))
BEGIN
DECLARE count1 int DEFAULT 0;
DECLARE init int DEFAULT 1;
l1:LOOP
if find_in_set(substr(str,init,1),'a,e,i,o,u')
then
set count1 = count1 + 1;
set init = init + 1;
elseif SUBSTR(str,init,1) BETWEEN 0 and 9
THEN
set count1 = count1 + 1;
set init = init + 1;
elseif SUBSTR(str,init,1)=' ' THEN
set count1 = count1 + 1;
set init = init + 1;
else
set init = init + 1;
end if;
if init = LENGTH(str)+1 
then leave l1; 
end if;
end loop l1;
select count1 as Total;
end $
delimiter ;

/*-----------------------------------------------------------------------*/
/*
7.	Write a procedure to remove all characters in a string except alphabets
Input: - saleel.bagde123@gmail.com
Output: - saleelbagdegmailcom*/


drop PROCEDURE if EXISTS pro7;
delimiter $
CREATE PROCEDURE pro7(str VARCHAR(90))
BEGIN
DECLARE init int DEFAULT 1;
DECLARE str1 VARCHAR(78) DEFAULT "";
l1:LOOP
	if SUBSTR(str,init,1) BETWEEN 'a' and 'z'
	THEN
	set str1 = CONCAT(str1,SUBSTR(str,init,1));
	set init = init + 1;
	else
	set init = init + 1;
	end if;
if init = LENGTH(str)+1 then
leave l1;	
end if;
end loop l1;
select str1 as 'Result String';
end $
delimiter ;

/*
mysql> call pro7('rohit7i@outlook.com');
+------------------+
| Result String    |
+------------------+
| rohitioutlookcom |
+------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)*/


/*-----------------------------------------------------------------------*/

/*-------------------------------PREPARE, EXECUTE AND DEALLOCATE PREPARE----------------------------------------*/

/*8.	Write a procedure to insert 10 rows in a table having following columns (using loop).
R (id int, message varchar(20)).
*/

drop PROCEDURE if exists pro8;
delimiter $
create PROCEDURE pro8()
begin 
DECLARE x int DEFAULT 1;
l1:loop
if x%2=0 THEN
insert into rr1 values (x,"i is even");
set x=x+1;
ELSE
insert into rr1 values (x,"i is odd");
set x=x+1;
end if;
if x=10 THEN
leave l1;
end if;
end loop l1;
select * from rr1;
end $
delimiter  ;

/*mysql> create table rr1(id int, message varchar(90));
Query OK, 0 rows affected (0.10 sec)

mysql> call pro8();
+------+-----------+
| id   | message   |
+------+-----------+
|    1 | i is odd  |
|    2 | i is even |
|    3 | i is odd  |
|    4 | i is even |
|    5 | i is odd  |
|    6 | i is even |
|    7 | i is odd  |
|    8 | i is even |
|    9 | i is odd  |
+------+-----------+
9 rows in set (0.21 sec)*/

/*9.	Write a procedure to print five highest paid employees from the emp table using cursor.*/

drop procedure if EXISTS pro9;
delimiter $
create procedure pro9()
begin
DECLARE _empno int;
DECLARE _ename VARCHAR(90);
DECLARE _sal int;
DECLARE c1 cursor for select empno, ename, sal from emp order by sal desc limit 5;

DECLARE exit handler for 1329 SELECT "This is end of table" as end;
open c1;
l1:LOOP
FETCH c1 into _empno, _ename, _sal;
SELECT _empno,_ename,_sal;
end loop l1;
close c1;
end $
delimiter ;


/*10.	Create the following table named (emp10, emp20, and emp30) which have the same structure of emp table.
Write a procedure to split employee records from emp table according to their department numbers and insert those records in the appropriate table using cursor.
*/


drop procedure if exists pro10;
delimiter $
create procedure pro10()
begin
DECLARE _deptno int;
DECLARE _empno int;
DECLARE _ename VARCHAR(90);
DECLARE _sal int;

declare c1 cursor for select empno,ename,sal,deptno from emp where deptno=10;
declare c2 cursor for select empno,ename,sal,deptno from emp where deptno=20;
declare c3 cursor for select empno,ename,sal,deptno from emp where deptno=30;
declare exit handler for 1329 select "This is end of loop" as exit;
open c1;

l1:loop
fetch c1 into _empno,_ename,_sal,_deptno;
INSERT into emp10 values (_empno,_ename,_sal,_deptno);
end loop l1;
close c1;
open c2;
l2:LOOP
fetch c2 into _empno,_ename,_sal,_deptno;
INSERT into emp20 values (_empno,_ename,_sal,_deptno);
end loop l2;
close c2;
open c3;
l3:LOOP
fetch c3 into _empno,_ename,_sal,_deptno;
INSERT into emp30 values (_empno,_ename,_sal,_deptno);
end loop l3;
close c3;
end $
delimiter ;
