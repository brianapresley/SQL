-- Jobs grouped by description having sum salary <= 250k
Select Description, Count (*) as 'Count', Format(Sum(Salary), 'c') as 'Total Salary'
From Employee
Join Job
	on JobId = Job.Id
Group by Description
Having sum(salary) <= 250000
order by 'Total Salary' desc