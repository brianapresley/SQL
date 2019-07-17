-- To add a variable to your query you must type Declare and an @ before variable name, followed by variable type ex. integer
Declare @LowSalary int; 
Declare @HighSalary int;

-- To set Variable values
Set @LowSalary = 90000;
Set @HighSalary = 120000;

Select firstname, lastname, description, salary, 'Yes' as 'SR. EXEC'
from Job
join Employee
 on JobId = Job.id
 Where Salary >= @LowSalary and salary < @HighSalary