Select firstname, lastname, description, salary
from Job
-- To display unmatched rows, use left join
left join Employee
 on JobId = Job.id
Where Description = 'Asst. Supervisor'
Order by Description
