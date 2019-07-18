-- Creating a stored procedure to add data to an existing database

Create Procedure Insert_Employee
	@firstname nvarchar(30),
	@lastname nvarchar(30),
	@jobid int
As
Begin
	Insert into Employee (Firstname, Lastname, JobId)
		Values (@firstname, @lastname, @jobid)	
End