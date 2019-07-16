--Subselect
--Select Firstname, Lastname, Description, Salary
--From Employee
--Join Job
	--on JobId = Job.Id

-- Find the average salary of all employees
-- Select avg(salary)
-- From Employee
-- Join Job
	-- on JobId = Job.Id

-- Create a list of employees whose salary is greater than the average salary of all employees
Select Firstname, Lastname, Description, Salary
From Employee
Join Job
	on JobId = Job.Id
where salary > (

					Select avg(salary) as 'Salary'
					From Employee
					Join Job
						on JobId = Job.Id
				)