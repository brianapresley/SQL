--Declaring the variable @Job and displaying current salary before running salary increase and displaying new value
Declare @Job nvarchar(30) = 'Director'

Select * from Job where Description = @Job --To display value before procedure

Exec Salary_Increase_10 'Director' --To run procedure on user input

Select * from Job where Description = @Job --To display value after procedure