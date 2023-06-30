/* Looping statement*/
drop PROCEDURE if exists pro1;
delimiter $
create PROCEDURE pro1()
BEGIN

DECLARE x int;
set x:=0;
lbl:LOOP
SELECT "Anuj bhai Full beard";
set x:=x+1;
IF x>10 then 
leave lbl;
end IF;
end LOOP lbl;
end $
delimiter ; 



/* Addition of String*/
drop PROCEDURE if exists pro2;
delimiter $
create PROCEDURE  pro2(x int, y int)
BEGIN
set @z:=x+y;
end $
delimiter ;


/* Multplication of String*/
drop PROCEDURE if exists pro3;
delimiter $
create  PROCEDURE  pro3( x int,y int)
BEGIN
  set @z= x*y;
  SELECT @z;
end $
delimiter ;


/* Subtraction of String*/
drop PROCEDURE if exists pro4;
delimiter $
create PROCEDURE pro4( x int, y int)
BEGIN
set @z=x-y;
select @z;
end $
delimiter ;


/*Print input string*/
drop PROCEDURE if EXISTS pro5;
delimiter $
CREATE PROCEDURE pro5(in x VARCHAR(40))
BEGIN
DECLARE len int;
   /*variable by name of len and its size is the size of string*/

DECLARE y int DEFAULT 1;
set len= LENGTH(x);
l1:LOOP
SELECT SUBSTR(x,y,1) as output;
set len=len-1;
set y=y+1;
IF len=0 THEN
leave l1;
end IF;
end LOOP l1;
set len:=LENGTH(x);
/*for a between len k:LOOP
dbms_output.put_line('Value of a:' ||a);
end loop k;*/

end $
delimiter ;

/*To reverse a string*/
drop PROCEDURE if EXISTS pro6;
delimiter $
CREATE PROCEDURE pro6(in x VARCHAR(23))
BEGIN
DECLARE len INT DEFAULT LENGTH(x);
DECLARE str VARCHAR(34) default "";

l1:LOOP 
set str = concat(str, SUBSTR(x,len,1));
set len=len-1;
if len=0 THEN 
leave l1;
end if;
end loop l1;
SELECT str;
end $
delimiter ;


/* To separate number and character from a string 
find_in_set
Extract number*/
drop PROCEDURE if EXISTS pro7;
delimiter $
CREATE PROCEDURE pro7(in x VARCHAR(323))
BEGIN

DECLARE init int DEFAULT 1;
DECLARE str1 VARCHAR(34) default "";
DECLARE str2 VARCHAR(45) DEFAULT "";

l1:LOOP

if  find_in_set (substr(x,init,1),'0,1,2,3,4,5,6,7,8,9') THEN
set str1 = concat(str1,substr(x,init,1));
set init = init + 1;
ELSE
set str2 = concat(str2,substr(x,init,1));
set init = init + 1;
end if;
if init=length(x)+1 then 
leave l1;
end if;
end loop l1;
SELECT str1 as Number_string;
SELECT str2 as Character_string;
end $
delimiter ;

