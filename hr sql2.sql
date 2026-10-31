select Employee.FullName,Employee.Salary,Department.DepartmentName 
from Employee inner join Department on  Employee.DepartmentID=Department.DepartmentID

SELECT
    Department.DepartmentName,
    Employee.FullName
FROM Department
LEFT JOIN Employee
ON Department.DepartmentID = Employee.DepartmentID;

SELECT * FROM AccessCards

SELECT Employee.FullName,AccessCards.CardNumber
FROM Employee INNER JOIN AccessCards ON AccessCards.EmployeeID=Employee.EmployeeID


SELECT * FROM EmployeeProject

SELECT Employee.FullName, Project.ProjectName,EmployeeProject.AssignedDate
FROM EmployeeProject INNER JOIN Employee ON EmployeeProject.EmployeeID=Employee.EmployeeID
INNER JOIN Project ON EmployeeProject.ProjectID=Project.ProjectID


SELECT
    DepartmentID,
    SUM(Salary) AS TotalSalary,
    COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY DepartmentID;

SELECT * FROM Employee


SELECT
    DepartmentID,
    AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY DepartmentID
HAVING AVG(Salary) > 1000;


SELECT Employee.FullName
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);


CREATE VIEW vw_EmployeeDetails AS
SELECT Employee.FullName,Employee.phone,Employee.Email,Department.DepartmentName
FROM Employee INNER JOIN Department ON Employee.DepartmentID=Department.DepartmentID;

SELECT * FROM vw_EmployeeDetails



CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DeptID INT
AS
BEGIN
    SELECT *
    FROM Employee
    WHERE DepartmentID = @DeptID;
END;

EXEC sp_GetEmployeesByDepartment @DeptID = 1;



CREATE TABLE EmployeeAudit (
    AuditID INT PRIMARY KEY identity ,
    EmployeeID INT,
    Action1 VARCHAR(50),
    ActionDate DATETIME
);

DROP TABLE EmployeeAudit;

CREATE TRIGGER trg_EmployeeDelete
ON Employee
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeAudit
    (EmployeeID, Action1, ActionDate)
    SELECT EmployeeID, 'DELETE', GETDATE()
    FROM deleted;
END;

DELETE FROM AccessCards
WHERE EmployeeID = 1;

DELETE FROM EmployeeProject
WHERE EmployeeID = 1;

SELECT * FROM Employee;

delete from Employee where EmployeeID=1

SELECT * FROM EmployeeAudit;
