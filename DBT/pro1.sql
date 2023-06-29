drop procedure if exists pro1;
delimiter $
create procedure pro1(x int,y int)
begin 
	select  x+y R1;
end $
delimiter ;
