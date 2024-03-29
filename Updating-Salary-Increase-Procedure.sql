USE [EmploymentDb]
GO
/****** Object:  StoredProcedure [dbo].[Salary_Increase_10]    Script Date: 7/18/2019 3:15:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create a stored procedure that will update the salary field of a job. Let the user point to a job description and increase the salary by 10%
--To increase the salary by 10% Salary = Salary * 1.1
ALTER Procedure [dbo].[Salary_Increase_10]
	@Job nvarchar(30)
as
begin
	Update Job Set
		Salary = Salary * 1.1
	where Description = @Job;

End