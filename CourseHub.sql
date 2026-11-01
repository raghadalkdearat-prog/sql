create table Department(
DepartmentID int PRIMARY KEY,
DepartmentName VARCHAR(100) NOT NULL UNIQUE

);

select * from Department


create table Students(
StudentID int PRIMARY KEY,
FullName VARCHAR(100) UNIQUE,
Email VARCHAR(100) UNIQUE,
GPA DECIMAL(3,2),
DepartmentID int FOREIGN KEY references Department 

);



select * from Students


create table StudentProfiles(
ProfileID int primary key,
Addressp VARCHAR(200),
EmergencyPhone VARCHAR(20),
StudentID int UNIQUE FOREIGN KEY references Students 

);



select * from StudentProfiles


create table Courses(
CourseID int PRIMARY KEY,
CourseName VARCHAR(100) not null,
Credits int,
DepartmentID int FOREIGN KEY references Department 
);



select * from Courses



create table StudentCourses(
StudentID int FOREIGN KEY references Students,
CourseID int FOREIGN KEY references Courses,
EnrollmentDate date DEFAULT GETDATE(),
primary key (StudentID,CourseID)
);



select * from StudentCourses


alter table Students
add age int;


select * from Students


drop table TempInstructors;

insert into Department values (1, 'Computer Science'),(2, 'Software Engineering'),(3, 'Business Administration')


SELECT * FROM Department;


insert into students values (101, 'Ali Smadi','ali@coursehub.com',3.80,1,22),(102, 'Omar Ahmad','omar@coursehub.com',2.90,1,21),
(103, 'Laila Hassan','Laila@coursehub.com',3.50,2,23),(104, 'Tariq Zaid','Tariq@coursehub.com',2.10,3,20);



SELECT * FROM students;



INSERT INTO StudentProfiles
VALUES
(1, 'Amman, Jordan','0791111111',101),
(2, 'Irbid, Jordan','0792222222',102),
(3, 'Zarqa, Jordan', '0793333333',103);

SELECT * FROM StudentProfiles;



INSERT INTO Courses
(CourseID, CourseName, Credits, DepartmentID)
VALUES
(201, 'Database Systems', 3, 1),
(202, 'Web Development', 3, 1),
(203, 'Software Architecture', 3, 2);



SELECT * FROM Courses



INSERT INTO StudentCourses (StudentID, CourseID)
VALUES
(101, 201),
(101, 202),
(102, 201),
(103, 203);



SELECT * FROM StudentCourses


UPDATE Students
SET GPA = 2.50
WHERE StudentID = 104;

SELECT * FROM Students


DELETE FROM Students
WHERE StudentID = 104;



SELECT * FROM Students



SELECT Students.FullName,
       Students.GPA,
       Department.DepartmentName
FROM Students
INNER JOIN Department
ON Students.DepartmentID = Department.DepartmentID;





SELECT Department.DepartmentName,
       Students.FullName
FROM Department
LEFT JOIN Students
ON Department.DepartmentID = Students.DepartmentID;




SELECT Students.FullName,
       StudentProfiles.Addressp,
       StudentProfiles.EmergencyPhone
FROM Students
INNER JOIN StudentProfiles
ON Students.StudentID = StudentProfiles.StudentID;




SELECT Students.FullName,
       Courses.CourseName,
       StudentCourses.EnrollmentDate
FROM Students
INNER JOIN StudentCourses
ON Students.StudentID = StudentCourses.StudentID
INNER JOIN Courses
ON StudentCourses.CourseID = Courses.CourseID;






SELECT
    COUNT(*) AS TotalStudents,
    AVG(GPA) AS AverageGPA,
    MAX(GPA) AS HighestGPA,
    MIN(GPA) AS LowestGPA
FROM Students;






SELECT
    Department.DepartmentName,
    COUNT(Students.StudentID) AS TotalStudents,
    AVG(Students.GPA) AS AverageGPA
FROM Students
INNER JOIN Department
ON Students.DepartmentID = Department.DepartmentID
GROUP BY Department.DepartmentName;





SELECT
    Department.DepartmentName,
    AVG(Students.GPA) AS AverageGPA
FROM Students
INNER JOIN Department
ON Students.DepartmentID = Department.DepartmentID
GROUP BY Department.DepartmentName
HAVING AVG(Students.GPA) > 3.00;






select
Department.DepartmentName,
count(students.studentid)as tatalstudents
from Students inner join Department on Students.DepartmentID=Department.DepartmentID
where Students.GPA>=2.50
group by Department.DepartmentName
having count(Students.StudentID)>1







SELECT
    name AS IndexName,
    type_desc AS IndexType
FROM sys.indexes
WHERE object_id = OBJECT_ID('Students');




CREATE NONCLUSTERED INDEX IX_Students_Email
ON Students (Email);



SELECT
    name AS IndexName,
    type_desc AS IndexType
FROM sys.indexes
WHERE object_id = OBJECT_ID('Students');





SELECT FullName, GPA
FROM Students
WHERE GPA > (
    SELECT AVG(GPA)
    FROM Students
);









CREATE VIEW vw_StudentAcademicDetails AS
SELECT
    Students.StudentID,
    Students.FullName,
    Students.GPA,
    Department.DepartmentName
FROM Students
INNER JOIN Department
ON Students.DepartmentID = Department.DepartmentID;


SELECT * FROM vw_StudentAcademicDetails;







CREATE PROCEDURE sp_GetStudentsByDepartment
    @DeptID INT
AS
BEGIN
    SELECT StudentID, FullName, GPA
    FROM Students
    WHERE DepartmentID = @DeptID;
END;



EXEC sp_GetStudentsByDepartment @DeptID = 1;















