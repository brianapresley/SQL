-- Modifying a stored procedure from programmability folder
-- Searching for a number value using int
USE [EmploymentDb]
GO
/****** Object:  StoredProcedure [dbo].[Employees_By_Salary]    Script Date: 7/18/2019 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create a procedure that searches for salaries within a range

ALTER Procedure [dbo].[Employees_By_Salary]
	@lowsalary int,
	@highsalary int
as 
begin
	SELECT CONCAT(e.Lastname, ',', e.Firstname) as 'Name', 
			j.Description as 'Job', FORMAT(J.Salary, 'C') as Salary
		FROM Employee e
		JOIN Job j
			on j.Id = e.JobId
		Where salary >= @lowsalary and Salary <= @highsalary
ORDER BY Name;
End
-- To input search criteria and execute search. 
-- If using a range to search, search data must be put in same order  
GO
Exec Employees_By_Salary 100000, 130000;
GO