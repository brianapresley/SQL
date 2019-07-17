-- To search for multiple row entries use IN function in Where clause 
Select firstname, lastname, description, salary
from Job
join Employee
 on JobId = Job.id
 -- Subselect to find all employees with first name Amy but only display last name
 Where Lastname in (
							Select Lastname from Employee where firstname = 'Amy'
						);