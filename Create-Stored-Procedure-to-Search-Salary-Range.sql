--Create a procedure that searches for salaries within a range

Create Procedure Employees_By_Salary
	@search int
as 
begin
	SELECT CONCAT(e.Lastname, ',', e.Firstname) as 'Name', 
			j.Description as 'Job', FORMAT(J.Salary, 'C') as Salary
		FROM Employee e
		JOIN Job j
			on j.Id = e.JobId
		Where salary > @search
ORDER BY Name;
End