-- To change all asst director jobs to Director
update employee set
JobId = (select id from job where description = 'Director')
where JobId = (Select id from Job where Description = 'Asst Director')

-- To determine how many employees are currently Directors to obtain Director Job ID
Select id, firstname, lastname, jobid
from Employee
where jobid = (select id from job where description = 'Asst Director')

-- To Delete Asst Director from Job Description
--select * from Job
delete from job
where ID = (select id from job where description = 'Asst Director')