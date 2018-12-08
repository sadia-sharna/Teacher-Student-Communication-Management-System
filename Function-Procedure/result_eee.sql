create or replace procedure get_course_info
(inputID in varchar2, inputSemester in varchar2, inputYear in varchar2)
is

        var_courseID varchar2(20);
        var_grade varchar2(20);


        cursor time_cursor IS
        SELECT DISTINCT takes1_eee.course_id,takes1_eee.grade
        FROM takes1_eee@s_link,takes2_eee@s_link
        WHERE takes1_eee.course_id=takes2_eee.course_id
        AND takes2_eee.semester=inputSemester
        AND takes2_eee.year=inputYear
        AND takes1_eee.id=inputID
        ORDER BY takes1_eee.grade;
  
       
	
        
begin
  
   open time_cursor;
   
   dbms_output.put_line('Course ID--Grade');
   
   
     loop
	fetch time_cursor INTO var_courseID,var_grade;
    
        exit when time_cursor%notfound;
            
        dbms_output.put_line(var_courseID || '  ' || var_grade);
	
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
  
 
  get_course_info(inputID,inputSemester,inputYear);
  
end;
/

