USE [EmploymentDb]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Employee]    Script Date: 7/18/2019 12:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Creating a stored procedure to add data to an existing database

ALTER Procedure [dbo].[Insert_Employee]
	@firstname nvarchar(30),
	@lastname nvarchar(30),
	@job nvarchar(30)
As
Begin
	Declare @Jobid int;--

	Select @jobid = ID from job where Description = @job; --Displays the job id assigned to the job the user inputs
	--Select ID from Job where description = 'Director'
	--JobID 4
	--It then converts Director (Job) to 4 (JobID)
	Insert into Employee (Firstname, Lastname, JobId)
		Values (@firstname, @lastname, @jobid)	
End
GO
--User would not know JobId but should know Job name, so instead of asking them to enter Job Id, request Job name (@Job) instead
Exec Insert_Employee @firstname = 'John', @lastname = 'Doe', @Job = 'Director'
GO 