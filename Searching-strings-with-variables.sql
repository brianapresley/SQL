-- To declare a variable as a string use nvarchar(max#characters) 
-- NVARCHAR will allow universal symbols to be input and allows for the largest variety of character input
-- Set is not always required when declaring a variable value. Can use = instead
-- To search for a partial string use LIKE clause instead of = in Where clause
-- % means 0 or more characters
-- _ (underscore) means exactly 1 charcter
-- To find a string that begins with A.. Where Description LIKE 'A%'
-- To find a string that has a second letter of S.. Where Description LIKE '_S%'
-- To find a string that has Director in the name.. Where Description LIKE '%Director%' 
Declare @Search nvarchar(50) = '___'

Select firstname, lastname, description, salary
from Job
join Employee
 on JobId = Job.id
 Where Firstname like @Search