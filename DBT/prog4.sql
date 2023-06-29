drop PROCEDURE if exists pro4();
delimiter $
create procedure pro4(in _deptno int)
BEGIN
declare flag bool default false;
select DISTINCT true into flag from emp where deptno = _deptno;
if flag THEN
select ename,job,empno,hiredate,sal,deptno from emp where deptno = _deptno;
ELSE
select "employee not found..";
end if
end $
delimiter ;