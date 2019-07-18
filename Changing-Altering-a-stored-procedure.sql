--To change or update/alter a stored procedure 

Alter Procedure [dbo].[Employee_Job_List]
	@search nvarchar(30)
As
BEGIN
	Set @Search = concat('%', @search, '%');
    SELECT CONCAT(e.Lastname, ',', e.Firstname) as 'Name', 
        j.Description as 'Job', FORMAT(J.Salary, 'C') as Salary
    FROM Employee e
    JOIN Job j
        on j.Id = e.JobId
	Where e.Lastname like @search or e.Firstname like @search or j.Description like @search
ORDER BY Name;
end
Go
Exec Employee_Job_List 'man';
Go