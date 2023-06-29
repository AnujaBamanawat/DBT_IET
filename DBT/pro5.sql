drop procedure if exists pro1;
delimiter $
CREATE procedure pro1( x int)
BEGIN
	declare _empno, _sal, _deptno int;
	declare _ename, _job varchar(40);
	declare _hiredate date;
	
	declare c1 cursor for select empno, ename, job, hiredate, sal, deptno from emp where deptno = x;
	
	/*declare exit handler for 1329 select "No more recprds to fetch";*/
	
	open c1;
		lbl:loop
			fetch c1 into _empno, _ename, _job, _hiredate,  _sal, _deptno;
				select _empno, _ename, _job, _hiredate,  _sal, _deptno;
			end loop lbl;
	close c1;
end $
delimiter ;