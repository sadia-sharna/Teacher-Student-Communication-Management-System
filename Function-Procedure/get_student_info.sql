create or replace function get_total_studentCount
	(inputCourseID in varchar2)
	return varchar2
	is
student_count number;

    begin
	SELECT count(id) INTO student_count FROM takes WHERE course_id=inputCourseID;
        return student_count;
end;
/


create or replace procedure proc_get_studentID
(inputCourseID in varchar2)
is


	var_studentID varchar2(20);
        var_studentName varchar2(20);
        var_studentDeptName varchar2(20);
     
        cursor student_cursor IS
        SELECT student.id,student.name,student.dept_name
        FROM student
        INNER JOIN takes ON takes.id=student.id
        WHERE takes.course_id=inputCourseID
        ORDER BY student.id;
  
begin
  
      open student_cursor;
      dbms_output.put_line('Student ID--Name--Department Name');
     loop
	fetch student_cursor INTO var_studentID,var_studentName,var_studentDeptName;
        dbms_output.put_line(var_studentID || '   ' ||var_studentName || '  ' ||var_studentDeptName);
        exit when student_cursor%notfound;
	
  end loop;
    
   close student_cursor;
  
end;
/

set serveroutput on;

declare
  inputCourseID varchar2(10);
  totalStudent number;
  
begin
  inputCourseID := '&CourseID';
  totalStudent :=get_total_studentCount(inputCourseID);
  dbms_output.put_line('Total Student in '||inputCourseID ||' are :' || totalStudent);
  proc_get_studentID(inputCourseID);
end;
/

