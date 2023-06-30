
/*Declaring a cursor*/
drop PROCEDURE if EXISTS pro8;
delimiter $
create PROCEDURE pro8()
begin
DECLARE _repid, _custid, _prodid int DEFAULT 0;
DECLARE _custname, _prodname VARCHAR(78) DEFAULT "";
DECLARE _amount DOUBLE DEFAULT 0.00;


DECLARE c1 CURSOR for select repid,custid,custname,prodid,prodname,amount from sales;
DECLARE EXIT handler for 1329 SELECT "End of Table" as End;
open c1;
lbl:LOOP
FETCH c1 into _repid,_custid,_custname,_prodid,_prodname,_amount;
SELECT _repid,_custid,_custname,_prodid,_prodname,_amount;

end LOOP lbl;
CLOSE c1;
end $
delimiter ;

/*Declaring a trigger after Insert*/
drop TRIGGER if EXISTS tr1;
delimiter $
create TRIGGER tr1 after insert on dept for each ROW
BEGIN
insert into d values (new.deptno, new.dname, new.loc, new.pwd, new.startedon);
end $
delimiter ;

/*Declaring a trigger after delete*/
drop TRIGGER if EXISTS tr2;
delimiter $
create TRIGGER tr2 after delete on dept for each ROW
begin
INSERT into d2 values (old.deptno, old.dname, old.loc, old.pwd, old.startedon);
end $
delimiter ;


/*Declaring a trigger before insert*/
drop trigger if EXISTS tr3;
delimiter $
create TRIGGER tr3 BEFORE INSERT on dept for EACH ROW
BEGIN
if time(now())='13:26:00' THEN
signal SQLSTATE '42000' set message_text="Time UP";
end if;
end $
delimiter ;


/**/
drop trigger if EXISTS tr4;
DELIMITER $
create trigger tr4 after insert on dept for each ROW
begin

 insert into d3 values (new.deptno, new.dname, new.loc, new.pwd, new.startedon,  user(), time(now()));
 end $
 delimiter ;


