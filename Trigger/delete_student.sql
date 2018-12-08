CREATE OR REPLACE PROCEDURE delete_student(s_id IN VARCHAR2,s_dept IN VARCHAR2) 
IS
BEGIN
    DELETE FROM student WHERE ID=s_id;
       if s_dept ='CSE'
		then
		DELETE FROM student_cse@s_link WHERE ID=s_id;

	elsif s_dept ='EEE'
		then
		DELETE FROM student_eee@s_link WHERE ID=s_id;

	else
		DELETE FROM student_rest@s_link WHERE ID=s_id;

	end if;


END;
/
DECLARE
    s_id student.ID%TYPE;
    s_dept student.dept_name%TYPE;
   
BEGIN
   
            s_id := '&StudentID';
            s_dept := '&Department';
            delete_student(s_id,s_dept);
     
  
END;
/


commit;


