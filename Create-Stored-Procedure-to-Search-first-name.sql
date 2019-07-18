-- Create a stored procedure that doesnt include jobs for employees only. Let user put in parameter for first name.
Create Procedure Search_First_Name
	@search nvarchar(30) --Parameter

As
Begin
	select * from Employee where firstname like @search

End



