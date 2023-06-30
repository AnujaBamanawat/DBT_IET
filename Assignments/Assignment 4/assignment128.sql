/*1.	Write a trigger (named insertStudent) that saves the message "Record inserted successfully" in LOG table as soon as you insert the record in insertStudent table.*/
drop TRIGGER if exits insertSudent1;
delimiter $
create trigger insertSudent1 after insert on insertStudent for each row
begin
insert into log(curr_date, curr_time, message) values(date(now()), time(now()), "Record SUCCESSFULLY inserted");
end $
delimiter ;
/*mysql> insert into insertstudent values('rohit',98,9939293);
Query OK, 1 row affected (0.02 sec)

mysql> select * from log;
+----+------------+-----------+------------------------------+
| id | curr_date  | curr_time | message                      |
+----+------------+-----------+------------------------------+
|  1 | NULL       | NULL      | User does not exist          |
|  2 | 2023-04-27 | 09:54:47  | User does not exist          |
|  3 | 2023-04-27 | 09:55:15  | User does not exist          |
|  4 | 2023-04-27 | 09:55:26  | User does not exist          |
|  5 | 2023-04-27 | 11:31:17  | Record SUCCESSFULLY inserted |
+----+------------+-----------+------------------------------+
5 rows in set (0.00 sec)*/

/*2.	Write a trigger (named insertDuplicate) on STUDENT table, that as when we INSERT a record in STUDENT table the same record should get duplicated (INSERTED) in STUDENT_LOG table. (Create STUDENT_LOG table, having the same structure as STUDENT table).*/

drop trigger if EXISTS insertDuplicate;
delimiter $
create trigger insertDuplicate after insert on student for each ROW
begin 
insert into student_log values (new.id,new.namefirst,new.namelast,new.dob,new.emailid);
end $
delimiter ;

/*mysql> insert into student values(98,'tomtom','tomtom',19/09/2009,'tomtom@gmail.com');
Query OK, 1 row affected (0.05 sec)

mysql> select * from student_log;
+----+-----------+----------+------------+------------------+
| ID | namefirst | namelast | DOB        | emailID          |
+----+-----------+----------+------------+------------------+
| 98 | tomtom    | tomtom   | 0000-00-00 | tomtom@gmail.com |
+----+-----------+----------+------------+------------------+
1 row in set (0.00 sec)*/


/*3.	Write a trigger on STUDENT table, that as soon as we UPDATE student name column data in STUDENT table, the update record should get inserted in STUDENT_LOG table.*/

drop trigger if EXISTS updateDuplicate;
delimiter $
create trigger updateDuplicate after update on student for each ROW
begin 
insert into student_log values (new.id,new.namefirst,new.namelast,new.dob,new.emailid);
end $
delimiter ;

/*mysql> update student set namelast='timtim' where namefirst='tomtom';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student_log;
+----+-----------+----------+------------+------------------+
| ID | namefirst | namelast | DOB        | emailID          |
+----+-----------+----------+------------+------------------+
| 98 | tomtom    | tomtom   | 0000-00-00 | tomtom@gmail.com |
| 98 | tomtom    | timtim   | 0000-00-00 | tomtom@gmail.com |
+----+-----------+----------+------------+------------------+
2 rows in set (0.00 sec)*/


/*4.	Write a trigger on STUDENT table, that as soon as we DELETE any record from STUDENT table, then that record should get inserted into STUDENT_LOG table.*/

drop trigger if EXISTS deleteDuplicate;
delimiter $
create trigger deleteDuplicate after delete on student for each ROW
begin 
insert into student_log values (old.id,old.namefirst,old.namelast,old.dob,old.emailid);
end $
delimiter ;

/*mysql> delete from student where id=29;
Query OK, 1 row affected (0.13 sec)

mysql> select * from student_log;
+----+-----------+----------+------------+------------------+
| ID | namefirst | namelast | DOB        | emailID          |
+----+-----------+----------+------------+------------------+
| 98 | tomtom    | tomtom   | 0000-00-00 | tomtom@gmail.com |
| 98 | tomtom    | timtim   | 0000-00-00 | tomtom@gmail.com |
| 29 | raj       | NULL     | NULL       | NULL             |
+----+-----------+----------+------------+------------------+
3 rows in set (0.00 sec)*/


/*5.	Write a trigger on STUDENT table, that if today is Sunday then, no record should get inserted in STUDENT table.*/

drop trigger if EXISTS tr3;
delimiter $
create TRIGGER tr3 BEFORE INSERT on student for EACH ROW
BEGIN
if dayname(now())='sunday' THEN
signal SQLSTATE '42000' set message_text='Wrong day to enter data';
end if;
end $
delimiter ;