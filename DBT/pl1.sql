/* cursor 
1. Read Only
2. Non-Scorllable
3. Asensitive / Insensitive

step 1. declare cursor
		open cursor
			fetch 
		close CURSOR


drop procedure if exists pro1;
delimiter $
CREATE procedure pro1(in _deptno int)
BEGIN
	declare flag bool default false;
	select DISTINCT true into flag  from emp where deptno = _deptno;
	if flag then
		select empno, ename, job, hiredate, sal, deptno from emp where deptno = _deptno;
	ELSE
		select "Employee Not found..";
	end if;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
CREATE procedure pro1(in _deptno int)
BEGIN
	select empno, ename, job, hiredate, sal, deptno from emp where deptno = _deptno;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
CREATE procedure pro1(x int)
BEGIN
	declare _empno, _sal, _deptno int;
	declare _ename, _job varchar(40);
	declare _hiredate date;
	
	declare c1 cursor for select empno, ename, job, hiredate, sal, deptno 
from emp;
	
	declare exit handler for 1329 select "No more recprds to fetch";
	declre 
	open c1;
		lbl:loop
			fetch c1 into _empno, _ename, _job, _hiredate,  _sal, _deptno;
			if _deptno = x then
				select _empno, _ename, _job, _hiredate,  _sal, _deptno;
			end if;
		end loop lbl;
	close c1;
end $
delimiter ;




drop procedure if exists pro1;
delimiter $
CREATE procedure pro1( x int)
BEGIN
	declare _empno, _sal, _deptno int;
	declare _ename, _job varchar(40);
	declare _hiredate date;
	
	declare c1 cursor for select empno, ename, job, hiredate, sal, deptno from emp where deptno = x;
	
	declare exit handler for 1329 select "No more recprds to fetch";
	
	open c1;
		lbl:loop
			fetch c1 into _empno, _ename, _job, _hiredate,  _sal, _deptno;
				select _empno, _ename, _job, _hiredate,  _sal, _deptno;
			end loop lbl;
	close c1;
end $
delimiter ;



drop PROCEDURE if exists pro1;
delimiter $
CREATE procedure pro1()
b1:BEGIN
	DECLARE _deptno int;
	DECLARE _dname, _loc varchar(30);
	declare c1 cursor for select deptno, dname, loc from dept;
	declare exit handler for 1329 select "Done";
	open c1;
		lbl:LOOP
			fetch c1 into _deptno, _dname, _loc;
			select _deptno, _dname, _loc;
			b2:BEGIN
				declare _empno,_sal, __deptno int;
				declare _ename, _job varchar(40);
				declare c2 cursor for select empno, ename, job, sal, deptno from emp where deptno = _deptno;
				declare exit handler for 1329 select "Done";
				open c2;
					lbl2:LOOP
						fetch c2 into _empno, _ename, _job, _sal, __deptno;
						select _empno, _ename, _job, _sal, __deptno;
					end loop lbl2;
				close c2;
			end b2;
		end loop lbl;
	close c1;
end b1$
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 after INSERT on dept for each ROW
BEGIN
	insert into d values(new.deptno, new.dname, new.loc, new.pwd, new.startedon);
end $
delimiter ;



 mysql> insert into dept values(51,'abc','baroda','ddd', '2023-04-04');


drop trigger if exists tr1;
delimiter $
create trigger tr1 after delete on dept for each ROW
BEGIN
	insert into d values(old.deptno, old.dname, old.loc, old.pwd, old.startedon);
end $
delimiter ;


drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on dept for each ROW
BEGIN
	declare x int;
	select max(deptno) + 1 into x from dept;
	set new.deptno = x;
end $
delimiter ;

 */



drop trigger if exists tr1;
delimiter $
create trigger tr1 before insert on dept for each ROW
BEGIN
	if dayname(curdate()) = 'Thursday' THEN
		SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Invalid Day, Record cannot be inserted';
	end if;
end $
delimiter ;



 /* mysql> insert into dept values(55,'abc','baroda','ddd', '2023-04-04'); */
































