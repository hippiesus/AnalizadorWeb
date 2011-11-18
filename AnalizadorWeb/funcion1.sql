create procedure funcion1 () is

begin
	cursor c1 is 
	select * from test;
	
	open c1;
	
	pack.pack2.funcion2();

end;
