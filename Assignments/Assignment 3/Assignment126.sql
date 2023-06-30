/*Create a LOGIN table (username, password, and email). Write a procedure (named addUser) to pass the username, password, and email-ID through the procedure and store the data in the LOGIN table.
*/
drop procedure if exists addUser;
delimiter $
create procedure addUser(username varchar(89), password varchar(58), emailid varchar(78))
BEGIN
insert into login values (username,password,emailid);
end $
delimiter ;
/*mysql> call adduser('Rohan','Rohon@123','rohan7i@outlook.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from login;
+----------+-----------+----------------------+
| username | password  | emailid              |
+----------+-----------+----------------------+
| rohit    | Rohit@123 | hisoka7i@hotmail.com |
| Rohan    | Rohon@123 | rohan7i@outlook.com  |
+----------+-----------+----------------------+
2 rows in set (0.00 sec)*/

/*
Create a LOG table having following columns (id (auto_increment), curr_date, curr_time, and message). Write a procedure (named checkUser) to pass the email-ID as an input, check whether passed email-ID is available in LOGIN table or not available. If the email-ID is available then display the username and his password. If the email-ID is not available then, insert (curr_date, curr_time, and message) in LOG table.
*/
drop procedure if exists checkUser;
delimiter $
create procedure checkUser(email varchar(40))
BEGIN
if email in (select emailid from login)
then
select username, password from login where email=emailid;
ELSE
insert into log values (default,curdate(), curtime(), "Did not find the email ID");
end if;
end $
delimiter ;
/*
mysql> select * from log;
+----+------------+-----------+---------------------------+
| id | curr_date  | curr_time | message                   |
+----+------------+-----------+---------------------------+
|  1 | 2023-04-23 | 15:43:17  | Did not find the email ID |
+----+------------+-----------+---------------------------+
1 row in set (0.00 sec)*/


/*	•	Write a procedure(named getQualification) that takes studentID as a parameter. If studentID is present in the student table, then print his student details along with STUDENT_QUALIFICATION details and if the studentID is not present display message “Student not found…” (Use: STUDENT, and STUDENT_QUALIFICATION tables)
*/

drop procedure if exists getQualification;
delimiter $
create procedure getQualification(studentID int)
BEGIN
if studentID in (select id from student)
then
select * from student where id=studentID;
select * from student_qualifications e where studentID=e.studentID;
else
select "Student not found...";
end if;
end $
delimiter ;
/*mysql> call getQualification(1);
+----+-----------+----------+------------+------------------------+
| ID | namefirst | namelast | DOB        | emailID                |
+----+-----------+----------+------------+------------------------+
|  1 | saleel    | bagde    | 1984-06-12 | saleel.bagde@gmail.com |
+----+-----------+----------+------------+------------------------+
1 row in set (0.00 sec)

+----+-----------+------+---------+---------------------+-------+------+
| ID | studentID | name | college | university          | marks | year |
+----+-----------+------+---------+---------------------+-------+------+
|  1 |         1 | 10   | Alabama | Stanford University | 67    | 2012 |
|  2 |         1 | 12   | Alaska  | Harvard University  | 74    | 2014 |
|  3 |         1 | BE   | Arizona | Harvard University  | 68    | 2018 |
+----+-----------+------+---------+---------------------+-------+------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call getQualification(1000);
+----------------------+
| Student not found... |
+----------------------+
| Student not found... |
+----------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)*/


/*	•	Write a procedure (named addStudent) that inserts a new student with his phone number and his address into the STUDENT, PHONE, and ADDRESS table.

Entry: student: namefirst,namelast,DOB, emailid
stuent_phone: studentid, number, isActive put 1
student_address: address
*/

drop procedure if exists addStudent;
delimiter $
create procedure addStudent(studentid int, namefirst varchar(90), namelast varchar(89),
  DOB date, emailid varchar(89), num varchar(45), address varchar(89))
begin
DECLARE len int default 0;
select max(id)+1 into len from student;
insert into student values (len,namefirst,namelast,DOB,emailID);
set studentid=len;
select max(id)+1 into len from student_phone;
insert into student_phone values (len, studentID, num, 1);
select max(id)+1 into len from student_address;
insert into student_address values (len, studentID, address);
end $
delimiter ;


/*	•	Write a procedure (named addQualification) that takes studentID, and qualification details as a parameter. If studentID is present in the STUDENT table, then insert the qualification in STUDENT_QUALIFICATION table and return a message “Record inserted” or else print ‘Student not found’. (hint: using OUT parameter) (Use: STUDENT, and STUDENT_QUALIFICATION tables)
*/

drop procedure if exists addQualification;
delimiter $
create procedure addQualification(studentid int, name varchar(89), college varchar(78), university varchar(77), marks varchar(67), year int)
BEGIN
DECLARE _id int default 0;
if studentID in (select id from student)
THEN
select max(id)+1 into _id from student_qualifications;
insert into student_qualifications values ( _id, studentID, name, college, university, marks, year);
else
select "Student not Found";
end if;
end $
delimiter ;
