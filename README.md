# Teacher-Student-Communication-Management-System
This is a PL-SQL project.

INTRODUCTION

This project is about University data management. It manages all the details of students, teachers, classes, courses, semester, prerequisites within the university. The reason behind developing the system is to help in managing all the information related to the university.
The management system, supports all the departments and maintain the information per department. The core information includes enrolling new student, managing teacher information, managing courses, routine, result etc.
Like, In AUST there are many departments having vast amount of data. To store all the data in a strategical way we have developed this system.
For CSE and EEE departments all the activities have been showed. You can do it for other departments in the same way.


HOW DISTRIBUTED DATABASE WORKS IN THIS SYSTEM

Distributed database management system is used in this project. Because, in a university there are different departments. One department does not need to know the data of other departments. So, to reduce complexity and to work on less data distributed database management system is used. By this, a department need not to run query on the whole university database.
The university database which is the global schema, is distributed over different department’s computers of a local network. Each department of the network has autonomous processing capability and can perform local applications. Each department can also execute global application which means access data of different department using communication subsystem.


FEATURES:

The system can keep track of all the students admission information of a specific semester. It also stores the final result of all the students. Any student can check their routine. They also can check the courses they have taken.
By giving a course ID, the number of students who have taken the course and their information can be found. It can update, delete and insert a student’s information.
It also can keep track of teachers information. The courses a teacher is assigned, schedule, salary etc all the data are stored in our system.


In 'Images' folder I have uploaded the ERD diagram and global, fragmentation and allocation schemas which might help to visualize the project. 
