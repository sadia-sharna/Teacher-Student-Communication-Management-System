create or replace procedure get_teacher_routine
(inputID in varchar2)
is


       
	var_day varchar2(20);
        var_startTime varchar2(20);
        var_endTime varchar2(20);
        var_courseID varchar2(20);
        var_roomNO varchar2(20);
        var_building varchar2(20);
        var_semester varchar2(20);
        var_year varchar2(20);

        cursor time_cursor IS
        SELECT  time_slot.day,time_slot.start_time,time_slot.end_time,section_eee.course_id,section_eee.building,section_eee.room_no,section_eee.semester,section_eee.year 
        FROM time_slot
        INNER JOIN section_eee@s_link ON section_eee.time_slot_id=time_slot.time_slot_id
        INNER JOIN teaches_eee@s_link ON section_eee.course_id=teaches_eee.course_id
        WHERE teaches_eee.id=inputID
        ORDER BY day;
  
    
	
        
begin
  
   open time_cursor;
 
   dbms_output.put_line('Course--Day--Start Time--End Time--Building--Room No--Semester--Year');
   
   
     loop
	fetch time_cursor INTO var_day,var_startTime,var_endTime,var_courseID,var_building,var_roomNO,var_semester,var_year;
        exit when time_cursor%notfound;
        dbms_output.put_line(var_courseID || '   ' || var_day || '  ' || var_startTime || '  ' || var_endTime || '  ' ||var_building ||'  '||     var_roomNO||' '||var_semester ||' '||var_year  );
	 
    end loop;
    
   close time_cursor;
  
end;
/
set serveroutput on;

declare
  inputID varchar2(10);
  
begin
  inputID := '&TeacherID';
 
 
  get_teacher_routine(inputID);
  
end;
/

