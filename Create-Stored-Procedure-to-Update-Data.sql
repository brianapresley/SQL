--Create a stored procedure that will update the salary field of a job. Let the user point to a job description and increase the salary by 10%
--To increase the salary by 10% Salary = Salary * 1.1
Create Procedure Salary_Increase_10
	@Job nvarchar(30)
as
begin
	Update Job Set
		Salary = Salary * 1.1
	where Description = @Job;
end

