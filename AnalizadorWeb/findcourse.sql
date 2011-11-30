CREATE OR REPLACE PROCEDURE findcourse
	(name_in IN varchar2)
IS
	cnumber number;
	
	CURSOR c1
	IS 
		SELECT	course_number
		from courses_tbl
		where course_name = name_in;

 BEGIN
 
 open c1;
 
 fetch c1 into cnumber;
 
 if(c1notfound) then
 	cnumber :=9999;
 end;
 
END;