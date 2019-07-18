Declare @id int;
Declare @salary decimal(9,2);

--select id from job where description = 'Director'

--SET @id = 3;

select @id = id, @salary = salary from job where description = 'Director';

Select @id as 'ID', Format(@salary as 'Salary');