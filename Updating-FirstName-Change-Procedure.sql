USE [EmploymentDb]
GO
/****** Object:  StoredProcedure [dbo].[Search_First_Name]    Script Date: 7/18/2019 2:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create a stored procedure that doesnt include jobs for employees only. Let user put in parameter for first name.
ALTER Procedure [dbo].[Search_First_Name]
	@search nvarchar(30)

As
Begin
	select * from Employee where firstname like @search

End
GO
Exec Search_First_Name @search = 'Amy'
Go


