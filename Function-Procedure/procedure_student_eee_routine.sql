create or replace procedure get_student_routine
(inputID in varchar2, inputSemester in varchar2, inputYear in varchar2)
is


        
	var_day varchar2(20);
        var_startTime varchar2(20);
        var_endTime varchar2(20);
        var_courseID varchar2(20);
        var_roomNO varchar2(20);
        var_building varchar2(20);


        cursor time_cursor IS
        SELECT time_slot.day,time_slot.start_time,time_slot.end_time,section_eee.course_id,section_eee.building,section_eee.room_no
        FROM time_slot
        INNER JOIN section_eee@s_link ON section_eee.time_slot_id=time_slot.time_slot_id
        INNER JOIN takes1_eee@s_link ON section_eee.course_id=takes1_eee.course_id
        INNER JOIN student_eee@s_link ON student_eee.id=takes1_eee.id
        WHERE section_eee.year=inputYear
        AND section_eee.semester=inputSemester
        AND takes1_eee.id=inputID
        ORDER BY day;
  
       
	
        
begin
  
   open time_cursor;
   
   dbms_output.put_line('Course ID--Day--Start Time--End Time--Building--Room No');
   
   
     loop
	fetch time_cursor INTO var_day,var_startTime,var_endTime,var_courseID,var_building,var_roomNO;
    
        exit when time_cursor%notfound;
            
        dbms_output.put_line(var_courseID || '   ' || var_day || '  ' || var_startTime || '  ' || var_endTime || '  ' ||var_building ||'  '||    var_roomNO );
	
  end loop;
    
   close time_cursor;
   

end;
/
set serveroutput on;

declare
  inputID varchar2(10);
  inputSemester varchar2(10);
  inputYear varchar2(10);
begin
  inputID := '&StudentID';
  inputSemester := '&Semester'; 
  inputYear := '&Year';
  get_student_routine(inputID,inputSemester,inputYear);
  
end;
/

