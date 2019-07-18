-- Join view Employee/Job showing salary
-- Sorting by salary and last name
Select Concat(Lastname,', ', Firstname) as 'Name', Description, Format(Salary, 'C') as 'Salary'
From Employee
Join Job
	on JobId = Job.Id
--Where Not ((Description = 'VP') or (Salary > 100000))
order by job.salary desc;
