-- To add a column to classify results set 
-- Make Presidents and VPs Senior Exec Only
Select firstname, lastname, description, salary, 'Yes' as 'SR. EXEC'
from Job
join Employee
 on JobId = Job.id
Where Description = 'President' or Description = 'VP'
-- Add Union to join the results set
Union
-- To display everything else Change Yes to no and added Not to Where clause
Select firstname, lastname, description, salary, 'No' as 'SR. EXEC'
from Job
join Employee
 on JobId = Job.id
Where Not (Description = 'President' or Description = 'VP')
Order by Salary