CREATE DATABASE TechWorldHRDB;


CREATE TABLE  TemporaryStaff (
	StaffID INT PRIMARY KEY,
	StaffName VARCHAR(50),
	HireDate DATE

);



CREATE TABLE Department (
	Department INT PRIMARY KEY,
	DepartmentName VARCHAR(50) not null unique,
	

);


CREATE TABLE Employee (
		EmployeeID INT PRIMARY KEY,
		FullName VARCHAR(50) not null unique,
		Email VARCHAR(50) unique,
		Salary DECIMAL(10,2),
		DepartmentID  INT

);

alter table Employee add phone VARCHAR(20);

DROP TABLE TemporaryStaff;

select * from department;

insert into department(Department,DepartmentName)values(1,'IT'),(2,'HR'),(3,'Finance');

EXEC sp_rename 'Department.Department', 'DepartmentID', 'COLUMN';

select * from employee;

insert into employee (EmployeeID,FullName,Email,Salary,DepartmentID,phone)
values(1,'Ahmad Ali' ,'ahmad@techworld.com' ,1200.00 ,1,'0791111111'),
(2,'Sara Hassan' ,'sara@techworld.com' ,950.00 ,2,'0792222222'),
(3,'Zaid Omar' ,'zaid@techworld.com' ,1500.00 ,1,'0793333333'),
(4,'Mona Khaled' ,'mona@techworld.com' ,800.00 ,3,'0794444444');



update employee set Salary =1350.00 WHERE EmployeeID = 1;

DELETE FROM employee WHERE EmployeeID=4;

SELECT * FROM Employee;

SELECT  FullName ,Salary FROM Employee;

SELECT SUM(Salary) AS TotalSalaries
FROM Employee;

SELECT avg(Salary) AS AverageSalary
FROM Employee;

SELECT
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS LowestSalary
FROM Employee;


SELECT count(*) AS TotalEmployees
FROM Employee;