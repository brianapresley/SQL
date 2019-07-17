-- To add a new line to the Job database
Declare @Salary decimal(9,2) = 35000;
Declare @JobDescription nvarchar(50) = 'Asst. Foreman';

INSERT into Job
	(Salary, Description) values (@Salary, @JobDescription);