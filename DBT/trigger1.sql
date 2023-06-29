drop trigger if exists tr1;
delimiter $
create trigger tr1 after delete on dept for each ROW
BEGIN
	insert into d values(old.deptno, old.dname, old.loc, old.pwd, old.startedon);
end $
delimiter ;